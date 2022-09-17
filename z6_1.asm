# Program File: zadanie1.asm
# Author: xxx
# Cel programu: Program prosi o podanie 2 liczb, a nastepnie oblicza wyra�enie A + 2B - 5

.text
main:

li $v0,4
la $a0, prompt1		# wyswietlenie prompt1 - prosba o podanie liczby
syscall

li $v0,5 		# odczytanie liczby
syscall
move $t0,$v0		# przeniesienie podanej liczby do t0

li $v0,4
la $a0, prompt2		# wyswietlenie prompt2 - prosba o podanie drugiej liczby
syscall

li $v0,5 		# odczytanie drugiej liczby
syscall
move $t1,$v0		# przeniesienie podanej liczby do t1

sll $t2,$t1,1		# operacja mnozenia B * 2
add $t3,$t0,$t2		# operacja a + 2b
sub $s0,$t3,5		# operacja a + 2b - 5

li $v0,1
add $a0,$0,$s0
syscall			# wypisanie wyniku 

li $v0,10		#koniec
syscall

.data
prompt1: .asciiz "Podaj pierwsza liczbe: "
prompt2: .asciiz "Podaj druga liczbe: "
