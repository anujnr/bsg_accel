#include <assert.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

int main() {
  uint64_t *x;
  uint64_t *buff;
  uint64_t z;

// Guarantee that the middle of the buffer would end up on an unused page
  buff = (uint64_t*)malloc(3 * 512 * sizeof(uint64_t)); 
  x    = (uint64_t*)&buff[3 * 512 / 2];
//  printf("x = %d\n", *x); //Always success if rocket touches pages by reading x

//Accel reads from memory address x. Depending of version of pk, 2 cases: 
//1. With lazy allocation x reads random value. Later x will get intended value which will cause test failure
//2. Without lazy allocation x reads expected value which loops back out
  asm volatile ("custom0 x0, %0, 2, 2" : : "r"(x));

//Rocket reads value from accel into z 
  asm volatile ("custom0 %0, x0, 2, 1" : "=r"(z)); 

  printf("z = %d\n",z); //Value
  printf("x = %d\n", *x); //Expected value

//If intended value is same as actual, it means rocket did NOT do lazy allocation
  assert(z == *x);
  printf("Success!\n");
}

