FROM ubuntu:latest
MAINTAINER Andre Richter <andre.richter@tum.de>

RUN apt-get update -q &&                       \
    apt-get install -y --no-install-recommends \
    build-essential                            \
    texlive                                    \
    texlive-latex-extra                        \
    texlive-science                            \
    latexmk                                    \
    inkscape

RUN apt-get clean autoclean

VOLUME ["/diss"]

WORKDIR /diss
