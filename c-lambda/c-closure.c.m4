dnl M4 C-Closure Draft Ver
include(util.m4)dnl
include(c-closure.m4)dnl
#include <stdio.h>
#include <malloc.h>

// __LAMDEF__

int main(void) {
    Cl *cl = _S(Cl, int i; int (*call)(struct Cl *, int););

    cl->i = 1;
    cl->call = _(int , Cl *cl, int j,
        return (cl->i += j);
    );

    printf("default = %d\n", cl->call(cl, 0));
    printf("plus 1 => %d\n", cl->call(cl, 1));
    printf("plus 1 => %d\n", cl->call(cl, 1));
    printf("plus 2 => %d\n", cl->call(cl, 2));

    free(cl);

    return 0;
}
