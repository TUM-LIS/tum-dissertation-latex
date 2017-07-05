#!/usr/bin/env bash

if [ -f inc/TUM_Logo_blau_rgb_s ]
then
    mv inc/TUM_Logo_blau_rgb_s inc/TUM_Logo_blau_rgb_s.svg
fi

inkscape --export-pdf=inc/TUM.pdf --export-area-drawing inc/TUM_Logo_blau_rgb*

FAK=(inc/FAK_*)
inkscape --export-pdf=inc/FAK.pdf --export-area-drawing $FAK

# fak logo placement
case $FAK in
    *"_CH_"* )
	echo "Chemistry"
	place_file="fak_placement_chemistry.tex"
	;;

    *"_SP_"* )
	echo "Health"
	place_file="fak_placement_health.tex"
	;;

    *"_IN_"* )
	echo "Informatics"
	place_file="fak_placement_informatics.tex"
	;;

    *"_MW_"* )
	echo "Mechanical Engineering"
	place_file="fak_placement_mechanical.tex"
	;;

    *"_MED_"* )
	echo "Medicine"
	place_file="fak_placement_medicine.tex"
	;;

    *"_SOM_"* )
	echo "SOM"
	place_file="fak_placement_som.tex"
	;;

    * )
	echo "Default quadratic"
	place_file="fak_placement_quadratic.tex"
	;;
esac

cp "inc/fak_placement/"$place_file "inc/fak_placement.tex"
