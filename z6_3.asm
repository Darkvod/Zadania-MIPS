# Program File: zadanie3.asm
# Author: xxx
# Cel programu: wykonanie instrukcji podanych w zadaniu 3.

.text
main:

li $s1,0x87654321

sll $s2,$s1,16		# $s2 = 0x43210000
srl $s3,$s1,8		# $s3 = 0x00876543
sra $s4,$s1,12		# $s4 = 0xfff87654

li $v0,10
syscall
