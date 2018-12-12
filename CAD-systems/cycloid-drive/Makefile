TARGET = main.pdf
OPTIONS = -output-directory=build -halt-on-error -file-line-error

.PHONY = all clean view

all = $(TARGET)
$(TARGET): main.tex
	pdflatex $(OPTIONS) $<

clean:
	rm -rf build/*

view:
	evince build/$(TARGET)
