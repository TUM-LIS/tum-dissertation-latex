FROM ubuntu:16.04
MAINTAINER Andre Richter <andre.richter@tum.de>

ARG DEBIAN_FRONTEND=noninteractive
ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE                                          \
      org.label-schema.vcs-url="https://github.com/TUM-LIS/tum-dissertation-latex.git" \
      org.label-schema.vcs-ref=$VCS_REF                                                \
      org.label-schema.schema-version="1.1"

RUN set -x;                                       \
    apt-get update -q -y;                         \
    apt-get install -q -y --no-install-recommends \
        build-essential                           \
        texlive                                   \
        texlive-generic-extra                     \
        texlive-lang-german                       \
        texlive-latex-extra                       \
        texlive-science                           \
        latexmk                                   \
        inkscape                                  \
        ;                                         \
    apt-get autoremove -q -y;                     \
    apt-get clean -q -y;                          \
    rm -rf /var/lib/apt/lists/*
