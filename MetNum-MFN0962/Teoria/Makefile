
all: pdf

riassuntino:
		pandoc Riassuntino.md -o Riassuntino.pdf

pdf:
	pandoc *.md metadata.yaml -s -d dispense.yaml -V geometry:a4paper -o MetNum.pdf --listings

# pdf:
# 		pandoc *.md metadata.yaml -s -o MetNum.pdf --template eisvogel --listings

epub:
		pandoc *.md metadata.yaml -s -o MetNum.epub --listings
