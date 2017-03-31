FROM ubuntu:16.04
MAINTAINER Andre Richter <andre.richter@tum.de>

ARG DEBIAN_FRONTEND=noninteractive

RUN set -x                                           \
    && apt-get update -q -y                          \
    && apt-get install -q -y --no-install-recommends \
        build-essential                              \
        texlive                                      \
        texlive-latex-extra                          \
        texlive-science                              \
        latexmk                                      \
        inkscape                                     \
    && apt-get autoremove -q -y                      \
    && apt-get clean -q -y                           \
    && rm -rf /var/lib/apt/lists/*

VOLUME ["/diss"]

WORKDIR /diss
