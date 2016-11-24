PAPER = dissertation
TEX   = $(wildcard *.tex)
BIB   = $(wildcard *.bib)
INC   = TEXINPUTS="./inc//:"

.PHONY: text all clean

all: text

text: $(TEX) $(BIB)
	$(INC) pdflatex -shell-escape -synctex=1 -interaction=nonstopmode $(PAPER)
	bibtex $(PAPER)
	makeglossaries $(PAPER)
	$(INC) pdflatex -shell-escape -synctex=1 -interaction=nonstopmode $(PAPER)
	$(INC) pdflatex -shell-escape -synctex=1 -interaction=nonstopmode $(PAPER)

clean:
	rm -f	*.acn\
		*.acr\
		*.alg\
		*.aux\
		*.bib.bak\
		*.blg\
		*.glg\
		*.glo\
		*.gls\
		*.gz\
		*.ist\
		*.lof\
		*.log\
		*.lot\
		*.out\
		*.toc\
	 	*.bbl\
