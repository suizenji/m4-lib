DIR_TEST := lib-test
DIR_LIB := lib
DIR_LIB_DEF := lib-default

SEP1 := \`
SEP2 := \'
PREF :=

SED := sed -E "s/([[:alpha:]][[:alnum:]_]+)/$(PREF)\1/g"

all:
#	@echo SEP1[$(SEP1)]
#	@echo SEP2[$(SEP2)]

# gen m4_ prefix ilb
genlib:
	$(SED) $(DIR_LIB_DEF)/util.m4 > $(DIR_LIB)/util.m4
	$(SED) $(DIR_LIB_DEF)/xml.m4 > $(DIR_LIB)/xml.m4

test:
	cd $(DIR_TEST) && make

clean:
	-rm $(DIR_LIB)/*.m4
	cd $(DIR_TEST) && make clean
