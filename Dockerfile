FROM ubuntu:latest
MAINTAINER Andre Richter <andre.o.richter@gmail.com>

RUN apt-get update -q && \
    apt-get install -y build-essential && \
    apt-get install -y texlive && \
    apt-get install -y --no-install-recommends texlive-latex-extra texlive-science && \
    apt-get install -y latexmk && \
    apt-get install -y inkscape

VOLUME ["/diss"]

WORKDIR /diss

