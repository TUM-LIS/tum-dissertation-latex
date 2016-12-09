#!/usr/bin/env bash

convert -density 94 dissertation.pdf preview.png
convert -flatten preview-0.png preview.png
rm preview-*
