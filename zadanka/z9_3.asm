# Program File: zadanie3.asm
# Author: xxx
# Cel programu: Program oblicza silni� podanej liczby.
.data
prompt1: .asciiz "Podaj liczbe: "

.text
main:
li $v0,4
la $a0, prompt1		# wyswietlenie pormpt1
syscall

li $v0,5
syscall
move $t0, $v0		# przeniesienie po odczytaniu liczby

li $t1,1

jal silnia		# skok do obliczania silni

li $v0,1
add $a0,$0,$t1		# wypisanie wyniku
syscall

li $v0,10 		# koniec programu
syscall

silnia:
mul $t1, $t1, $t0	# obliczanie kolejnych wartosci silni
addi $t0, $t0, -1 
bgtz $t0, silnia
jr $ra 
