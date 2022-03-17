all: maketest dotest

maketest: regular
	bash make.sh

regular:
	for i in *.scenario; do $(SED) $$i > $${i%.*}.regular; done

dotest:
	bash test.sh

clean:
	-rm *.regular *.test
