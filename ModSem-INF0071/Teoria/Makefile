all: pdf

DEFAULTS := metadata.yaml -d dispense.yaml
OPTIONS := --template eisvogel --citeproc --listings --number-sections
FILENAME := ModSem

pdf:
	pandoc *.md $(DEFAULTS) $(OPTIONS) -o $(FILENAME).pdf
