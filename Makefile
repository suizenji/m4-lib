DIR_TEST := lib-test
DIR_LIB := lib

SEP1 := \`
SEP2 := \'
PREF :=

SED := sed -E "s/([[:alpha:]][[:alnum:]_]+)/$(PREF)\1/g"

all:
#	@echo SEP1[$(SEP1)]
#	@echo SEP2[$(SEP2)]

# gen m4_ prefix ilb
gen:
	$(SED) $(DIR_LIB)/util.m4 > util.m4

test:
	cd $(DIR_TEST) && make

clean:
	-rm *.m4
	cd $(DIR_TEST) && make clean
