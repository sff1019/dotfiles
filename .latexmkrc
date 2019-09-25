#!/usr/bin/env perl
$bibtex           = 'pbibtex';
$dvipdf           = 'dvipdfmx %O -o %D %S';
# $latex            = 'platex -halt-on-error';
# $latex_silent     = 'platex -halt-on-error -interaction=batchmode';
$makeindex        = 'mendex %O -o %D %S';
$pdf_mode         = 3;
$pdflatex = 'pdflatex --shell-escape interaction=nonstopmode %O %S -file-line-error -synctex=1';
# $pdflatex = 'pdflatex --shell-escape %O %S';
# $pdflatex = 'xelatex --shell-escape %O %S';
