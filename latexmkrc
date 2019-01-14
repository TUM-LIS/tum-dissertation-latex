# compiler options
$pdflatex = 'TEXINPUTS="./inc//:" pdflatex -interaction=batchmode -shell-escape -synctex=1 %O %S';
$pdf_mode = 1;
$bibtex_use = 1;

# glossary and acronyms using the 'glossaries' package
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
  if ( $silent ) {
    system "makeglossaries -q '$_[0]'";
  }
  else {
    system "makeglossaries '$_[0]'";
  };
}

# svg figure conversion using inkscape
add_cus_dep('svg', 'pdf', 0, 'run_svgtopdf');

sub run_svgtopdf {
  system("inkscape --without-gui --export-area-drawing --export-pdf=$_[0].pdf $_[0].svg")
}

# clean up support for glossary and acronym files
push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
$clean_ext .= ' %R.ist %R.xdy synctex.gz';
