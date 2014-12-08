thesis.pdf: thesis.tex
	latexmk --pdf --pdflatex=lualatex thesis.tex
