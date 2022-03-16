SEP1 := \`
SEP2 := \'
PREF :=

all:
#	@echo SEP1[$(SEP1)]
#	@echo SEP2[$(SEP2)]
	@sed -E "s/([[:alpha:]][[:alnum:]_]+)/$(PREF)\1/g" util.m4


