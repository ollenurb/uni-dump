NOTES_DEFAULTS := metadata.yaml -d dispense.yaml
NOTES_OPTIONS := --template eisvogel --listings --number-sections
NOTES_FILENAME := AAUT

all: notes

# Notes-based build rule
notes:
	pandoc *.md $(NOTES_DEFAULTS) $(NOTES_OPTIONS) -o $(NOTES_FILENAME).pdf


epub:
	pandoc *.md $(NOTES_DEFAULTS) -o $(NOTES_FILENAME).epub

# Wiki-related build rule
$(WIKI_OUTDIR)/%.html: $(WIKI_SRCDIR)/%.md
	pandoc -o $@ $(WIKI_DEFAULTS) $^

wiki: ${WIKI_OUTPUT}
