# set your dissertation main file here
DISS     = dissertation.tex

# automatic main file detection
NUMMAINS = $(shell grep --files-with-matches --exclude="_*_.tex" \
	     '^\\documentclass' *.tex | wc -l)
ifeq ($(NUMMAINS), 1)
DISS     = $(shell grep --files-with-matches --exclude="_*_.tex" \
	     '^\\documentclass' *.tex)
else
$(warning *** Could not determine main LaTeX file, trying to use $(DISS))
$(warning *** - either delete all files containing '\documentclass')
$(warning *** - or specify your main file in the Makefile)
endif

TEX      = latexmk
TEXFLAGS = -recorder -pdf
TEXCLEAN = -bibtex -c

DOCKER   = docker run -it --rm -v $$(pwd):$$(pwd) -w $$(pwd) \
	   andrerichter/tum-dissertation-latex

.PHONY: docker clean crop pdf-local clean-local crop-local placeholder placeholder-local

docker: $(DISS)
	 $(DOCKER) make pdf-local

clean:
	$(DOCKER) make clean-local

crop:
	$(DOCKER) make crop-local

pdf-local: $(DISS)
	$(TEX) $(TEXFLAGS) $(DISS)

clean-local:
	$(TEX) $(TEXCLEAN)

crop-local:
	./crop_place_logos.sh

placeholder:
	$(DOCKER) make placeholder-local

placeholder-local:
	cp inc/placeholder_FAK.pdf inc/FAK.pdf
	cp inc/placeholder_TUM.pdf inc/TUM.pdf
	cp inc/fak_placement/fak_placement_quadratic.tex inc/fak_placement.tex
