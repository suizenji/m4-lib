.PRECIOUS: %.c

all: clean lambda.out
	./lambda.out

%.out: %.c
	$(CC) $< -o $@

%.c:
	m4 $@.m4 > $@

clean:
	-rm *.c *.out
