SOURCES=$(shell echo *.tex perverse-coherent/*.tex d-mod/*.tex) thesis.cls

thesis.pdf: $(SOURCES)
	latexmk --pdf --pdflatex=lualatex thesis.tex

official: thesis-official.pdf

thesis-official.pdf: $(SOURCES)
	latexmk --pdf --pdflatex=lualatex thesis-official.tex

clean:
	- rm *.aux thesis.{b{bl,cf,lg},fdb_latexmk,fls,i{dx,lg,nd},log,nlo,out,run.xml,toc}

dist-clean: clean
	- rm thesis.pdf
