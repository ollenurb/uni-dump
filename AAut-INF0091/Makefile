all: pdf

DEFAULTS := metadata.yaml -d dispense.yaml
OPTIONS := --template eisvogel --citeproc --listings --number-sections
FILENAME := AAUT

pdf:
	pandoc *.md $(DEFAULTS) $(OPTIONS) -o $(FILENAME).pdf
