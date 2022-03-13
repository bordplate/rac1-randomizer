#!/bin/bash
s() {
    powerpc64-linux-gnu-as -o $1.o -mregnames -mcell -be $1.s
    powerpc64-linux-gnu-ld --oformat=binary -o $1.bin $1.o
    rm $1.o
}

c() {
    powerpc64-linux-gnu-gcc -mcpu=cell -mbig -m32 -Wl,--oformat=binary,-Ttext=$2 -nostdlib -O2 -o $1.bin $1.c
}

s has_item	
s has_thruster_heli_pack

c infobot 4F8000
c unlock_planet 4f7704
c unlock_planet_message 4f7504
c unlock_item 4f9000
c trespasser_hydrodisplacer 4f6000