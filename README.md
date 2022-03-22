# My M4 Library
Generate library and put it on lib directory.

## Usage
ex)  
```
$ make
$ make SEP1=[ SEP2=]
$ make PREF=m4_
```

## C Lambda
```
$ cat c-lambda.c.m4
include(/path/to/util.m4)dnl
include(/path/to/lambda.m4)dnl
#include <stdio.h>

// __LAMDEF__

int main(void) {
    int (*l0)() = _(int , return 0;);
    char *l1 = _(char *, return "str";)`'();
    int l2l3 = _(int , int i, int j, return i * j;)`'(2, _(int , int k, return k;)`'(3));

    return 0;
}
$ m4 c-lambda.c.m4
#include <stdio.h>

// __LAMDEF__
static int lambda0();
static char *lambda1();
static int lambda2(int i,int j);
static int lambda3(int k);

int main(void) {
    int (*l0)() = lambda0;
    char *l1 = lambda1();
    int l2l3 = lambda2(2, lambda3(3));

    return 0;
}

static int lambda0() {return 0;}

static char *lambda1() {return "str";}

static int lambda2(int i,int j) {return i * j;}

static int lambda3(int k) {return k;}
```
