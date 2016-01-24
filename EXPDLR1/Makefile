all: Prohaupt.pdf
Prohaupt.pdf: Prohaupt.tex
	pdflatex Prohaupt.tex
	bibtex Prohaupt
	pdflatex Prohaupt.tex
	pdflatex Prohaupt.tex
	make clean
clean: 
	rm -f Prohaupt.aux
	rm -f Prohaupt.bbl
	rm -f Prohaupt.blg
	rm -f Prohaupt-blx.bib
	rm -f Prohaupt.log
	rm -f Prohaupt.out
	rm -f Prohaupt.run.xml
	rm -f Prohaupt.toc
