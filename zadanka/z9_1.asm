# Program File: zadanie1.asm
# Author: xxx
# Cel programu: Program wykonujacy tre�� zadania 1.
.text
li $t0, -98765
li $t1, -54321

mult $t0, $t1

mfhi $s0
mflo $s1


li $t0, 98765
li $t1, 54321

multu $t0, $t1

mfhi $s2
mflo $s3

li $v0,10 
syscall
