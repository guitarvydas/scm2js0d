LIBSRC=0D/odin/std
ODIN_FLAGS ?= -debug -o:none
D2J=0d/das2json/das2json

run: scm2js0d scm2js0d.drawio.json transpile.drawio.json
	./scm2js0d prolog.scm main scm2js0d.drawio $(LIBSRC)/transpile.drawio

scm2js: scm2js0d.drawio.json
	odin build . $(ODIN_FLAGS)

scm2js0d.drawio.json: scm2js0d.drawio transpile.drawio.json
	$(D2J) scm2js0d.drawio

transpile.drawio.json: $(LIBSRC)/transpile.drawio
	$(D2J) $(LIBSRC)/transpile.drawio

clean:
	rm -rf scm2js scm2js0d.dSYM
	rm -rf *.json

