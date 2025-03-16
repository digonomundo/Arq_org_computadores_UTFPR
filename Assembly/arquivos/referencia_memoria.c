#include <stdio.h>

int main(int argc, void** argv) {
  int A[10];
  int i=0;
  while (i++<10)
    printf("%p\n", &A[i]);
}