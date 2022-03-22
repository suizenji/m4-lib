include(util.m4)dnl
include(c-lambda.m4)dnl
#include <stdio.h>

int calc(int (*)(int, int));

// __LAMDEF__

int ARGC = 0;
define(M4_I, 3)dnl

int main(int argc, char *argv[]) {
  ARGC = argc;

  puts("(argc+1) x M4_I");
  printf("%d x %s is ", ARGC, _(char *, return "M4_I";)`'());

  int result = calc(_(int , int i, int j, return i * j;));

  printf("%d\n", result);

  return 0;
}

int calc(int (*fn)(int i, int j)) {
  return (*fn)(ARGC, M4_I);
}
