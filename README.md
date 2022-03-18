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
$ cat example.c.m4
include(util.m4)dnl
include(lambda.m4)dnl
#include <stdio.h>
// __LAMDEF__

int main() {
    printf("2 x 3 = %d\n", _(int , int i, int j, return i * j;)`'(2,3));

    return 0;
}

$ m4 example.c.m4
#include <stdio.h>
// __LAMDEF__
int lambda0(int i,int j);


int main() {
    printf("2 x 3 = %d\n", lambda0(2,3));

    return 0;
}
int lambda0(int i,int j) {return i * j;}
```
