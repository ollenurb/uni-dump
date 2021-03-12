
all: pdf

dispense:
		pandoc *.md metadata.yaml -s -d dispense.yaml -o MetNum.pdf --listings

pdf:
		pandoc *.md metadata.yaml -s -o MetNum.pdf --template eisvogel --listings

epub:
		pandoc *.md metadata.yaml -s -o MetNum.epub --listings
