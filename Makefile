.PHONY: imgs clean

test.md: src/test.md
	build/mdx <$^ | lazy-put $@
	$(MAKE) imgs

IMG_in = $(wildcard img/*.graphviz)
IMG_out = $(IMG_in:.graphviz=.graphviz.svg)

imgs: $(IMG_out)

%.graphviz.svg: %.graphviz
	dot -Tsvg $^ >$@

clean:
	rm -f test.md $(IMG_out)
