#include string.h
#include stdlib.h
long x = -1L;

int main()
{
  long b = (x != -1L);

  if (b)
    abort();

  exit(0);
}

