# Program File: zadanie4.asm
# Author: xxx
# Cel programu: Sprawdzenie zawarto�ci rejestr�w


.text
li $s0,6
li $s1,0
teq $s1,$0
div $s0,$s0,$s1

li $v0,10
syscall
