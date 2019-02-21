#!/bin/bash
num=0
for ((i=0; i < 150; i++))
do
num=$(od -An -N4 -i < /dev//urandom)
nums="$num $nums"
done
echo $nums >> numbers.txt

