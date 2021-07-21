all: pdf

DEFAULTS := metadata.yaml -d dispense.yaml
OPTIONS := --template eisvogel --citeproc --listings --number-sections
FILENAME :=MFN0951

pdf:
	pandoc *.md $(DEFAULTS) $(OPTIONS) -o $(FILENAME).pdf
