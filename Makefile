TEST_DIR := lib-test
LIB_DIR := lib

SEP1 := \`
SEP2 := \'
PREF :=

SED := sed -E "s/([[:alpha:]][[:alnum:]_]+)/$(PREF)\1/g"

all:
#	@echo SEP1[$(SEP1)]
#	@echo SEP2[$(SEP2)]

# gen m4_ prefix ilb
gen:
	$(SED) $(LIB_DIR)/util.m4 > util.m4

test:
	cd $(TEST_DIR) && make test

clean:
	-rm *.m4
	cd $(TEST_DIR) && make clean
