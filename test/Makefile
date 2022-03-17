all: maketest dotest

maketest:
	bash make.sh
	$(SED) -i *.test

dotest:
	bash test.sh

clean:
	-rm *.test
