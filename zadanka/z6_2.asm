# Program File: zadanie2.asm
# Author: xxx
# Cel programu: wykonanie instrukcji podanych w zadaniu 2.

.text
main:

li $s1,0x12345678
li $s2,0xffff9a00

and $s3,$s1,$s2 	# $s3 = 0x12341200
or $s4,$s1,$s2  	# $s4 = 0xffffde78
xor $s5,$s1,$s2		# $s5 = 0xedcbcc78
nor $s6,$s1,$s2		# $s6 = 0x00002187

li $v0,10
syscall
