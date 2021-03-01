
all: pdf

pdf:
		pandoc *.md metadata.yaml -s -o MetNum.pdf --template eisvogel --listings

epub:
		pandoc *.md metadata.yaml -s -o MetNum.epub --listings
