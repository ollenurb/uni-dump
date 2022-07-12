all: pdf

pdf:
	pandoc *.md metadata.yaml -s -d dispense.yaml --toc --template eisvogel -o MetNum.pdf --listings

epub:
	pandoc *.md metadata.yaml -s -d dispense.yaml --toc -o MetNum.epub --listings
