
all: pdf

riassuntino:
		pandoc Riassuntino.md -o Riassuntino.pdf

# pdf:
# 	pandoc *.md metadata.yaml -s -d dispense.yaml -V geometry:a4paper -o MetNum.pdf --listings

# pdf:
# 	pandoc *.md metadata.yaml -s -d dispense.yaml --template sdiehl  -o MetNum.pdf --listings

pdf:
	pandoc *.md metadata.yaml -s -d dispense.yaml --toc --template eisvogel  -o MetNum.pdf --listings

epub:
		pandoc *.md metadata.yaml -s -o MetNum.epub --listings
