WIKI_OUTDIR := out
WIKI_SOURCES := $(wildcard ./*.md) # file1.md file2.md ... filen.md
WIKI_OUTPUT := $(patsubst ./%.md, $(WIKI_OUTDIR)/%.html, $(WIKI_SOURCES))
WIKI_DEFAULTS := --mathjax -d wiki.yaml --citeproc

all: wiki

$(WIKI_OUTDIR)/%.html: ./%.md
	pandoc -o $@ $(WIKI_DEFAULTS) $^

wiki: ${WIKI_OUTPUT}

clean:
	rm $(WIKI_OUTDIR)/*.html
