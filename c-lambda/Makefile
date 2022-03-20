.PRECIOUS: %.c

all: clean lambda.out
	./lambda.out

%.out: %.c
	$(CC) $< -o $@

%.c:
	m4 $@.m4 > $@

# for parent
test: clean maketest check.out
	./check.out && echo OK || echo NG

maketest:
	bash make.sh > check.c.m4

clean:
	-@rm *.c *.out check.c.m4
