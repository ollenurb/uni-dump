all: pdf

pdf:
		pandoc *.md metadata.yaml -d dispense.yaml --citeproc --toc --template eisvogel --listings -o SCPD.pdf

# pdf:
# 		pandoc *.md --template eisvogel -d dispense.yaml --toc  -o SCPD.pdf
