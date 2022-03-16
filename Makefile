SEP1 := \`
SEP2 := \'
PREF :=

TEST_DIR := lib-test

all:
#	@echo SEP1[$(SEP1)]
#	@echo SEP2[$(SEP2)]
	@sed -E "s/([[:alpha:]][[:alnum:]_]+)/$(PREF)\1/g" util.m4

test:
	cd $(TEST_DIR) && make test

clean:
	cd $(TEST_DIR) && make clean
