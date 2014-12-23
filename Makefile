SOURCES=$(shell echo *.tex) thesis.cls

thesis.pdf: $(SOURCES)
	latexmk --pdf --pdflatex=lualatex thesis.tex

clean:
	- rm *.aux thesis.{b{bl,cf,lg},fdb_latexmk,fls,i{dx,lg,nd},log,nlo,out,run.xml,toc}

dist-clean: clean
	- rm thesis.pdf
