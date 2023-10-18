BUILDIR = build
CC = pdflatex

all: tex/main.tex buildir
	$(CC) -halt-on-error -output-directory=$(BUILDIR) $<

buildir:
	mkdir -p $(BUILDIR)

clean:
	rm -r $(BUILDIR)
