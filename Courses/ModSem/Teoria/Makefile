all: html

OPTIONS := --citeproc --listings --number-sections
FILENAME := ModSem
SOURCES_REPORT := $(wildcard [0-9]*.md) $(wildcard [1-9][0-9]*.md)
SOURCES_QUESTIONS := Domande.md

html:
	pandoc metadata.yaml $(SOURCES_REPORT) $(OPTIONS) --template wiki -o $(FILENAME).html

questions:
	pandoc $(SOURCES_QUESTIONS) -o Domande.pdf

clean:
	rm *.pdf *.html




