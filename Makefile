DISS     = dissertation.tex

TEX      = latexmk
TEXFLAGS = -recorder -pdf
TEXCLEAN = -bibtex -c

.PHONY: main clean

main: $(DISS)
	$(TEX) $(TEXFLAGS) $(DISS)

clean:
	$(TEX) $(TEXCLEAN)
