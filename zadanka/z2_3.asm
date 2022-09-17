# Program File: lab2 p3.asm
# Author: xxx
# Program losuje inta z przedzia�u 0-99 a nast�pnie go wypisuje
.text
main:
	li $v0, 42  # 42 to kod systemowy do generowania losowego inta
	li $a1, 100 # $a1 to maksymalny zakres
	syscall     

	li $v0, 1   # 1 to kod systemowy do wypisania inta
	syscall     
	# koniec programu
	li $v0, 10
	syscall
