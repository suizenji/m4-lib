DIR_TEST := test
DIR_LIB := lib
DIR_LIB_DEF := lib-default

SEP1 := \`
SEP2 := \'
PREF :=

# TODO sed separator
SED := sed -E \
	-e "s/([[:alpha:]][[:alnum:]_]+)/$(PREF)\1/g" \
	-e "s/\`/$(SEP1)/g" \
	-e "s/'/$(SEP2)/g"

all: clean genlib test

debug:
	@echo SEP1[$(SEP1)]
	@echo SEP2[$(SEP2)]
	@echo PREF[$(PREF)]
#	@echo
#	@cat $(DIR_LIB_DEF)/util.m4
#	@echo
	$(SED) $(DIR_LIB_DEF)/util.m4

# gen m4_ prefix ilb
genlib:
	$(SED) $(DIR_LIB_DEF)/util.m4 > $(DIR_LIB)/util.m4
	$(SED) $(DIR_LIB_DEF)/xml.m4 > $(DIR_LIB)/xml.m4

.PHONY: test
test:
	cd $(DIR_TEST) && PREF=$(PREF) SEP1=$(SEP1) SEP2=$(SEP2) make

clean:
	-rm $(DIR_LIB)/*.m4
	cd $(DIR_TEST) && make clean
