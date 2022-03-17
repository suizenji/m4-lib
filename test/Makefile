all: maketest dotest

maketest: regular
	bash make.sh

regular:
	for i in *.sce; do $(SED) $$i > $${i%.*}.reg; done

dotest:
	bash test.sh

clean:
	-rm *.reg *.test
