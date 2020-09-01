#include <stdio.h>
#include <stdint.h>
 #define GETMASK(index, size) (((1 << (size)) - 1) << (index))
 #define READFROM(data, index, size) (((data) & GETMASK((index), (size))) >> (index))


int main() {
int32_t b = 0xffe00293;
int32_t a = READFROM(b, 31, 1);
printf("%d", a);
}
