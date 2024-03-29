export
include .env

DIR_TEST := $(shell readlink -f $(DIR_TEST))
DIR_LIB := $(shell readlink -f $(DIR_LIB))
DIR_LIB_DEF := $(shell readlink -f $(DIR_LIB_DEF))
DIR_LAMBDA := c-lambda

SEP1 := \`
SEP2 := \'
#PREF :=

ifeq ($(origin PREF), undefined)
M4 := m4
else
M4 := m4 --prefix-builtins
endif

# TODO sed separator
SED := sed -E \
	-e "s/([[:alpha:]_][[:alnum:]_]*)/$(PREF)\1/g" \
	-e "s/\`/$(SEP1)/g" \
	-e "s/'/$(SEP2)/g"

all: clean lib test

debug:
	@echo mak SEP1[$(SEP1)]
	@echo mak SEP2[$(SEP2)]
	@echo mak PREF[$(PREF)]
	@echo env SEP1[$${SEP1}]
	@echo env SEP2[$${SEP2}]
	@echo env PREF[$${PREF}]
	@echo mak DIR_TEST=[$(DIR_TEST)]
	@echo mak DIR_LIB=[$(DIR_LIB)]
	@echo mak DIR_LIB_DEF=[$(DIR_LIB_DEF)]
	@echo env DIR_TEST=[$$DIR_TEST]
	@echo env DIR_LIB=[$$DIR_LIB]
	@echo env DIR_LIB_DEF=[$$DIR_LIB_DEF]
	@echo mak sed[$(SED)]
	@echo env sed[$$SED]
	@echo
	@echo default util
	@cat $(DIR_LIB_DEF)/util.m4
	@echo
	@echo gen util
	@$(SED) $(DIR_LIB_DEF)/util.m4
	@echo
	@echo statement
	$(SED) $(DIR_LIB_DEF)/util.m4 >/dev/null

.PHONY: lib
lib:
	$(SED) $(DIR_LIB_DEF)/util.m4 > $(DIR_LIB)/util.m4
	$(SED) $(DIR_LIB_DEF)/xml.m4 > $(DIR_LIB)/xml.m4
	$(SED) -e 's/m4_(static|__LAMDEF__)/\1/g' $(DIR_LIB_DEF)/c-lambda.m4 > $(DIR_LIB)/c-lambda.m4

.PHONY: test
test:
	cd $(DIR_TEST) && make

clean:
	-@rm $(DIR_LIB)/*.m4
	cd $(DIR_TEST) && make clean
	cd $(DIR_LAMBDA) && make clean
