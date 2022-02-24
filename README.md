# `mdx`

Command line tool to extract source code from a Markdown file and replace the
code blocks by links to the generated SVG-images. The Markdown is read from
standard in, and the transformed Markdown file is written to standard output.
The files are generated in a special folder (defaulting to `img`).

Command line options can specify the name of the output folder (`--out-dir=...`)
and the code languages that should be extracted (`--extract=..:..`). The default
languages that are extracted are `graphviz`, `svg`, and `plantuml`. Multiple
languages can be separated by colons. Another argument `--extension=` specifies
the extension that is added to the link names in the transcoded Markdown
output. The default extension is `.svg`. Only `--help` is allowed as another
option.

`cmake` is used for building this small tool in C++17. The program itself is
written using [https://github.com/itmm/md-patcher](md-patcher). This tool is
used to extract the source code from the Markdown files.

# Detailed Design

The `main` function first parses the command line.

Then it processes the standard input line by line. If a matching code block
starts, a unique filename will be generated (consisting of a sequence number
and the code language as an extension). Each language has its own sequence
number (to reduce rebuilding, if the order of different languages are changed).
The `lazy-writer` library is used for writing the files to avoid regeneration
unless the file's content changed.


