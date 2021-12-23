all: pdf

pdf:
		pandoc *.md metadata.yaml -d dispense.yaml --citeproc --toc --template eisvogel -o SCPD.pdf

# pdf:
# 		pandoc *.md --template eisvogel -d dispense.yaml --toc  -o SCPD.pdf
