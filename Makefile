all: pdf

pdf:
	pdflatex --shell-escape --enable-write-18 my_thesis
	pdflatex --shell-escape --enable-write-18 my_thesis
	bibtex my_thesis
	pdflatex --shell-escape --enable-write-18 my_thesis
	pdflatex --shell-escape --enable-write-18 my_thesis
	pdflatex --shell-escape --enable-write-18 my_thesis
	evince my_thesis.pdf &

clean:
	rm -f *.aux *.log *.bbl *.blg *.toc *.lof *.lot *.out *.mtc* *.maf *.ist *.xdy *.glo *.glsdefs
	rm -f head/*.aux head/*.log
	rm -f main/*.aux main/*.log
	rm -f tail/*.aux tail/*.log
