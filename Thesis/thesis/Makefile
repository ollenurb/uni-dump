.PHONY: main.pdf all clean clean-all

all: main.pdf

main.pdf: main.tex
	pdflatex -interaction=nonstopmode main
	makeindex main.nlo -s nomencl.ist -o main.nls
	makeindex main
	biber main
	pdflatex main
	makeglossaries main
	pdflatex main

clean:
	$(RM) -f main.aux
	$(RM) -f diss.run.xml
	$(RM)	-f main.bbl
	$(RM) -f main.bcf
	$(RM) -f main.blg
	$(RM) -f main.glg
	$(RM) -f main.glo
	$(RM) -f main.gls
	$(RM) -f main.idx
	$(RM) -f main.ilg
	$(RM) -f main.ind
	$(RM) -f main.lof
	$(RM) -f main.log
	$(RM) -f main.lot
	$(RM) -f main.mw
	$(RM) -f main.nlo
	$(RM) -f main.nls
	$(RM) -f main.run.xml
	$(RM) -f main.toc
	$(RM) -f main.xdy

clean-all: clean
	$(RM) -f diss.bbl

clean-purge: clean-all
	latexmk -C
