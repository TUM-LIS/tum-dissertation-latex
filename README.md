# LaTeX template for TUM dissertations

An _unofficial_ Latex template for TUM dissertations/PhD theses that aims to satisfy the new [2016 corporate design guidelines of the TUM](https://portal.mytum.de/corporatedesign/index_html).

Made by Andre Richter with help from [his colleagues](#contributions).

For a preview of the cover, [click here](#cover-preview). For a full preview, see the [PDF](dissertation.pdf).

## Getting started

The following instructions should work with both Linux and macOS, because a Docker image is used that already provides the whole build environment.

1. First of all, logos are needed. To circumvent copyright problems, they must be downloaded and cropped manually.
  1. Login at https://portal.mytum.de/corporatedesign/index_html/vorlagen/index_Logos
  2. Download the **SVG version** of the blue TUM logo and save it to `inc/`
  3. Download the **SVG version** of your faculty's logo and save it to `inc/`
2. The easy way to go from here is to use the supplied Docker image for building the PDF, because it relieves you from all the dependency hassle. Find your install instructions or binaries for Docker here:
  - https://www.docker.com/products/overview#/install_the_platform
3. Once Docker is installed, logos must be cropped.
  1. Start a terminal/console and navigate where you saved the repository.
  2. Execute `make crop`
    - _This command will first pull the Docker image from remote, which will take a couple of minutes. Fortunately, this must only be done once._

If everything worked, your setup is complete now and you are good to go!

## Building the PDF

Inside a terminal, execute

- `make` to build the pdf.
- `make clean` to clean up temporary files.

## Troubleshooting

- If you get errors one the `make` commands, you can try to invoke them via sudo, e.g. `sudo make crop`

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


## Template Usage

- At the top of `dissertation.tex`, you'll find parameters for the titlepage, e.g. names, faculty name, dissertation title, etc.
- Use `\captionabove{}` instead of `\caption{}` if you place a caption above a figure.
- Easy usage of TUM CI colors is provided by the tumcolors package. See `doc/tumcolor.pdf` for instructions.

## TODOs

- [ ] Error handling in `crop_place_logos.sh` (missing binaries, files not found, etc.).
- [ ] Windows support?

## Building without Docker

Users who want to build without Docker most likely know what to do. Dependencies can be found inside `Dockerfile`.
The `Makefile` already has targets for building without docker, just make them default.

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

Andreas Oeldemann - <andreas.oeldemann@tum.de>
- Help with Docker support.

## License

![Creative Commons License](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

See [license file](LICENSE.md) for details.

## Cover Preview

<kbd>
![Cover Preview](/../preview/preview.png?raw=true "Cover Preview")
</kbd>
