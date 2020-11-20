PACKAGES := scrcook
STYFILES := $(addsuffix .sty,$(PACKAGES))
PDFFILES := $(addsuffix .pdf,$(PACKAGES))

all: $(STYFILES) $(PDFFILES)

%: %.sty %.pdf

%.sty: %.ins %.dtx
	tex $<

%.pdf: %.dtx %.sty
	pdflatex $<

%.gls: %.glo
	makeindex -s gglo.ist -o $@ $<

%.ind: %.idx
	makeindex -s gind.ist -o $@ $<

clean:
	rm -rf *.pdf *.sty *.glo *.idx *.ind *.gls

.PHONY: all clean
