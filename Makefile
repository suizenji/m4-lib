SEP1 := \`
SEP2 := \'
PREF := m4_

TEST_DIR := lib-test

all:
#	@echo SEP1[$(SEP1)]
#	@echo SEP2[$(SEP2)]

# gen m4_ prefix ilb
SED := sed -E "s/([[:alpha:]][[:alnum:]_]+)/$(PREF)\1/g"
fork:
	$(SED) util.m4 > $(PREF)util.m4

test:
	cd $(TEST_DIR) && make test

clean:
	cd $(TEST_DIR) && make clean
