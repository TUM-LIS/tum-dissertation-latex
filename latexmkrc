# sources / example rcfiles
# https://www.ctan.org/tex-archive/support/latexmk/example_rcfiles

# compiler options
$pdflatex = 'TEXINPUTS="./inc//:" pdflatex -interaction=batchmode -shell-escape -synctex=1 %O %S';
$pdf_mode = 1;
$bibtex_use = 1;

# glossary and acronyms using the 'glossaries' package
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');
sub run_makeglossaries {
    my ($base_name, $path) = fileparse( $_[0] );
    pushd $path;
    if ( $silent ) {
        my $return = system "makeglossaries -q $base_name";
    } else {
        my $return = system "makeglossaries $base_name";
    };
    popd;
    return $return;
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
