# LaTeX template for TUM dissertations

A Latex template for TUM dissertations/PhD theses that aims to satisfy the new [2016 corporate design guidelines of the TUM](https://portal.mytum.de/corporatedesign/index_html).

Made by Andre Richter with help from Michael Vonbun, Christian Herber and Stefan Wallentowitz.

## Getting started

- Install the latest texlive, latexmk and inkscape (needed for logo cropping)
  - Ubuntu 16.04: `sudo apt-get install texlive texlive-latex-extra latexmk inkscape`
- To circumvent copyright problems, logos must be downloaded and cropped manually.
  - Login at https://portal.mytum.de/corporatedesign/index_html/vorlagen/index_Logos
  - Download the **SVG version** of the blue TUM logo and save it to `inc/`.
  - Download the **SVG version** of your faculty's logo and save it to `inc/`.
  - Execute `crop_place_logos.sh`

## Compatibility

The TUM design guidelines lack explicit statements about how to place non-quadratic faculty logos. Each faculty logo has at least a partial circle. Most likely, the logo must be centered to the center of the logo's partial circle, and scale the diameter of the partial circle to 10mm. At least this is what we can derive from looking at page 16 of the [style guide](https://portal.mytum.de/corporatedesign/regeln/index_styleguide/styleguide/Manual_CD_2016_v1).

### Logo support

At the moment, all quadratic logos are supported. These are:

- [x] Architecture
- [x] Civil, Geo and Environmental Engineering
- [x] Electrical and Computer Engineering
- [x] Mathematics
- [x] Physics
- [x] TUM School of Education
- [x] TUM School of Governance

Status of support for non quadratic logos:

- [ ] TUM School of Life Sciences Weihenstephan
- [x] Chemistry
- [x] Informatics
- [x] Mechanical Engineering
- [x] TUM School of Medicine
- [ ] Sport and Health Sciences
- [ ] TUM School of Management

Patches for missing logos are welcome! Turn on the `layouttitlepage` option in `dissertation.tex` to get a helper box for the faculty logo placement.


## Usage

### Build using the Makefile:
- `make`
- `make clean`

### Misc
- Use `\captionabove{}` instead of `\caption{}` if you place a caption above a figure
- Easy usage of TUM CI colors is provided by the tumcolors package. See `doc/tumcolor.pdf` for instructions

## TODOs

- [ ] Error handling in `crop_place_logos.sh` (missing binaries, files not found, etc.)
- [ ] Windows support?

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
- Support for non-quadratic faculty logos

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
