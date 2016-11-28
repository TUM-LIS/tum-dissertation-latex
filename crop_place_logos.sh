#!/usr/bin/env bash

inkscape --export-pdf=inc/TUM.pdf --export-area-drawing inc/TUM_Logo_blau_rgb_s*

FAK=(inc/FAK_*.svg)
inkscape --export-pdf=inc/FAK.pdf --export-area-drawing $FAK

# fak logo placement
case $FAK in
    *"_CH_"* )
	echo "Chemistry"
	place_file="fak_placement_chemistry.tex"
	;;

    *"_IN_"* )
	echo "Informatics"
	place_file="fak_placement_informatics.tex"
	;;

    *"_MW_"* )
	echo "Mechanical Engineering"
	place_file="fak_placement_mechanical.tex"
	;;

    * )
	echo "Default quadratic"
	place_file="fak_placement_quadratic.tex"
	;;
esac

cp "inc/fak_placement/"$place_file "inc/fak_placement.tex"
