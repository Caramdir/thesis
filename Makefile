SOURCES=$(shell echo *.tex)

thesis.pdf: $(SOURCES)
	latexmk --pdf --pdflatex=lualatex thesis.tex

clean:
	- rm *.aux thesis.{b{bl,cf,lg},fdb_latexmk,fls,i{dx,lg,nd},log,nlo,out,pdf,run.xml,toc}
