all: maketest dotest

maketest:
	bash make.sh

dotest:
#	echo PREF=$(PREF)
	bash test.sh $(PREF)

clean:
	-rm *.test
