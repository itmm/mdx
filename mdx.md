# Implementation of `mdx`

This file describes the contents of `mdx.cpp`. It consists of two parts:

```c++
int main(int argc, const char *argv[]) {
	// handle args
	// process input
}
```


```c++
#include <cstdlib>
#include <map>
#include <string>

int main(int argc, const char *argv[]) {
	// handle args
	std::map<std::string, int> supported {
		{"graphviz", 0}, {"plantuml", 0}, {"svg", 0}
	};
	std::string dir { "img" };
	std::string ext { ".svg" };
	for (int i { 1 }; i < argc; ++i) {
		std::string arg { argv[i] };
		if (arg.substr(0, 10) == "--out-dir=") {
			dir = arg.substr(10);
		} else if (arg.substr(0, 10) == "--extract=") {
			supported.clear();
			auto rest { arg.substr(10) };
			for (;;) {
				auto i { rest.find(':') };
				if (i == std::string::npos) {
					if (! rest.empty()) {
						supported.emplace(rest, 0);
					}
					break;
				}
				if (i > 0) {
					supported.emplace(rest.substr(0, i), 0);
				}
				rest = rest.substr(i + 1);
			}
		} else if (arg.substr(0, 12) == "--extension=") {
			ext = arg.substr(12);
		} else {
			print_help();
			std::exit(EXIT_SUCCESS);
		}
	}
	// ...
}
```

The following function prints the help message:

```c++
#include <cstdlib>
#include <iostream>
// ...

static inline void print_help() {
	std::cout << "usage: mdx [ --help ] [ --out-dir=<dir> ]\n"
		"\t[ --extract=<langs> ] [ --extension=<ext> ]\n\n"
		"Processes a Markdown file from standard input. The result\n"
		"is written to standard output. Code blocks with matching\n"
		"languages are extracted into individual files that are put\n"
		"in put the output directory. The resulting Markdown\n"
		"contains image links to these files.\n\n"
		"--out-dir=<dir>\n"
		"\tspecifies the output directory; default is 'img'\n\n"
		"--extract=<langs>\n"
		"\tspecifies the languages that will be extracted;\n"
		"\tmultiple languages can be separated by colon; default\n"
		"\tis 'graphviz:plantuml:svg'\n\n"
		"--extension=<ext>\n"
		"\textension to be added to the links in the processed\n"
		"\tMarkdown file; default is '.svg'\n";
}

// ...
```

All lines that are not code blocks, are simply copied:

```c++
// ...
#include <string>
// ...
int main(int argc, const char *argv[]) {
	// ...
	// process input
	std::string line;
	while (std::getline(std::cin, line)) {
		if (line.substr(0, 3) == "```") {
			// handle code
		} else {
			std::cout << line << "\n";
		}
	}
}
```

```c++
// ...
#include <iostream>
#include <sstream>
// ...
#include <string>
#include "lazy-write/lazy-write.h"
// ...
			// handle code
			auto lang { line.substr(3) };
			auto it { supported.find(lang) };
			if (it == supported.end()) {
				std::cout << line << "\n";
				for (;;) {
					if (! std::getline(std::cin, line)) {
						std::cerr << "EOF in Code\n";
						exit(EXIT_FAILURE);
					}
					std::cout << line << "\n";
					if (line == "```") { break; }
				}
				continue;
			}
			int idx = ++it->second;
			std::ostringstream oss;
			oss << dir;
			if (! dir.empty() && dir.back() != '/') {
				oss << '/';
			}
			oss << idx << '.' << lang;
			Lazy_Write out { oss.str() };
			for (;;) {
				if (! std::getline(std::cin, line)) {
					std::cerr << "EOF in Code\n";
					exit(EXIT_FAILURE);
				}
				if (line == "```") { break; }
				out << line << "\n";
			}
			std::cout << "![](" << oss.str() << ext << ")\n";
// ...
```

