all: pdf

pdf:
		pandoc *.md metadata.yaml -d dispense.yaml -o ModSem.pdf
epub:
		pandoc *.md metadata.yaml -s -o ModSem.epub --listings
