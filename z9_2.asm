# Program File: zadanie2.asm
# Author: xxx
# Cel programu: Program wykonujacy tre�� zadania 2.
.text
li $t0, -98765
li $t1, -54321

div $t0, $t1

mfhi $s0
mflo $s1


li $t0, 98765
li $t1, 54321

divu $t0, $t1

mfhi $s2
mflo $s3

li $v0,10 
syscall
