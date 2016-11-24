# LaTeX template for TUM dissertations

A Latex template for TUM dissertations/PhD theses that aims to satisfy the new [2016 corporate design guidelines of the TUM](https://portal.mytum.de/corporatedesign/index_html).

Made by Andre Richter with help from Michael Vonbun, Christian Herber and Stefan Wallentowitz.

## Getting started

- Install the latest texlive and inkscape (needed for logo cropping)
  - Ubuntu 16.04: `sudo apt-get install texlive texlive-latex-extra inkscape`
- To circumvent copyright problems, logos must be downloaded and cropped manually.
  - Login at https://portal.mytum.de/corporatedesign/index_html/vorlagen/index_Logos
  - Download the **SVG version** of the blue TUM logo, save it to `inc/` and rename it to `TUM.svg`
  - Download the **SVG version** of your faculty's logo, save it to `inc/` and rename it to `FAK.svg`
  - Execute `crop-logos.sh`

## Compatibility

At the moment, typesetting of faculty logos only works correctly with logos that are 100% quadratic.

The TUM design guidelines lack explicit statements of what to do with non-quadratic logos. Most likely, they must be centered to the center of each logo's hinted circle, and scale the diameter of the hinted circle to 10mm. Support for non-quadratic logos must be added in the future (patches welcome!).

### Logo support

Some of the logos are closer to being quadratic than others (e.g. informatics, chemistry), so that typesetting may be acceptable. However, the following list indicates only the 100% quadratic logos.

- [x] Architecture
- [ ] TUM School of Life Sciences Weihenstephan
- [ ] Chemistry
- [x] Civil, Geo and Environmental Engineering
- [x] Electrical and Computer Engineering
- [ ] Informatics
- [x] Mathematics
- [ ] Mechanical Engineering
- [ ] TUM School of Medicine
- [x] Physics
- [ ] Sport and Health Sciences
- [x] TUM School of Education
- [x] TUM School of Governance
- [ ] TUM School of Management

## Usage

### Build using the Makefile:
- `make`
- `make clean`

### Build using Latexmk:
`latexmkrc` configures building glossaries / acronyms and cleanup

### Misc
- Use `\captionabove{}` instead of `\caption{}` if you place a caption above a figure
- Easy usage of TUM CI colors is provided by the tumcolors package. See `doc/tumcolor.pdf` for instructions

## Contributions

Andre Richter - <andre.richter@tum.de>
- Makefile
- Title page design
- Plot cycle list
- Figures, tables, acronyms in table of contents
- Added a customized bibliography style based on [unsrturl.bst](http://ctan.mackichan.com/biblio/bibtex/contrib/urlbst/unsrturl.bst) that abbreviates first names
- Appendix support
- TUM color syntax highlighting for source code listings
- Siunitx styles

Michael Vonbun - <michael.vonbun@tum.de>
- tumcolors package
- Various cls file tweaks
- Latexmk support
- Sans serif title page option

Christian Herber - <christian.herber@tum.de>
- Barchart cycle list with pattern styles
- Table of contents in pdf index hack

Stefan Wallentowitz - <stefan.wallentowitz@tum.de>
- Prevent orphans and widows

## License

![Creative Commons License](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

See [license file](LICENSE.md) for details.
