#line 14 "mdx.md"
#include <cstdlib>
#line 57
#include <iostream>
#line 90
#include <sstream>
#line 15
#include <map>
#include <string>
#line 93
#include "lazy-write/lazy-write.h"
#line 17

#line 60
static inline void print_help() {
	std::cout << "HELP TO-DO\n";
}

#line 6
int main(int argc, const char *argv[]) {
	// handle args
#line 20
	std::map<std::string, int> supported {
		{"graphviz", 0}, {"plantuml", 0}, {"svg", 0}
	};
	std::string dir { "img" };
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
		} else {
			print_help();
			std::exit(EXIT_SUCCESS);
		}
	}
#line 8
	// process input
#line 76
	std::string line;
	while (std::getline(std::cin, line)) {
		if (line.substr(0, 3) == "```") {
			// handle code
#line 96
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
			std::cout << "![](" << oss.str() << ".svg)\n";
#line 80
		} else {
			std::cout << line << "\n";
		}
	}
#line 9
}
