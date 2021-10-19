WIKI_SRCDIR := wiki
WIKI_OUTDIR := out
WIKI_SOURCES := $(wildcard $(WIKI_SRCDIR)/*.md) # file1.md file2.md ... filen.md
WIKI_OUTPUT := $(patsubst $(WIKI_SRCDIR)/%.md, $(WIKI_OUTDIR)/%.html, $(WIKI_SOURCES))
WIKI_DEFAULTS := --mathjax -d wiki.yaml --citeproc

NOTES_DEFAULTS := metadata.yaml -d dispense.yaml
NOTES_OPTIONS := --template eisvogel --citeproc --listings --number-sections
NOTES_FILENAME := AAUT

all: notes

# Notes-based build rule
notes:
	pandoc *.md $(NOTES_DEFAULTS) $(NOTES_OPTIONS) -o $(NOTES_FILENAME).pdf

# Wiki-related build rule
$(WIKI_OUTDIR)/%.html: $(WIKI_SRCDIR)/%.md
	pandoc -o $@ $(WIKI_DEFAULTS) $^

wiki: ${WIKI_OUTPUT}
