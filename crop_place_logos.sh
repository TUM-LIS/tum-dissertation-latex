#!/usr/bin/env bash

inkscape --export-pdf=inc/TUM.pdf --export-area-drawing inc/TUM_Logo_blau_rgb_s*

FAK=(inc/FAK_*.svg)
inkscape --export-pdf=inc/FAK.pdf --export-area-drawing $FAK

# fak logo placement
case $FAK in
    *"_IN_"* )
	echo "Informatics"
	place_file="fak_placement_informatics.tex"
	;;

    * )
	echo "Default quadratic"
	place_file="fak_placement_quadratic.tex"
	;;
esac

cp "inc/fak_placement/"$place_file "inc/fak_placement.tex"
