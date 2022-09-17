# Program File: zadanie3.asm
# Author: xxx
# Cel programu: Program prosi o podanie liczby a nast�pnie zwraca jej binarn� reprezentacje

.text
main:
li $v0, 4
la $a0, prompt1		# prosba o podanie liczby
syscall
li $v0, 5		# odczytanie liczby
syscall
move $a0, $v0		# przeniesienie liczby do $a0

jal binarnie		# skok do labela binarnie

li $v0, 11
li $a0, 10
syscall

li $v0,10		# koniec programu
syscall

binarnie:

add $t0, $zero, $a0 	# do t0 wstawiamy wynik
add $t1, $zero, $zero	# wyzerowanie t1 
addi $t3, $zero, 1	# wczytanie 1 do t3
sll $t3, $t3, 31 	# przesuniecie o 31
addi $t4, $zero, 32 	# wykorzystanie p�tli
loop:

and $t1, $t0, $t3 	# do  t1 wczytaj nasz wynik i przesu� o 31
beq $t1, $zero, print 	# je�li t1=0 wy�wietl warto�� 0

add $t1, $zero, $zero 	# czyszczenie t1 
addi $t1, $zero, 1 	# wypisanie int
j print


print: 
li $v0, 1
move $a0, $t1		# wyswietlenie wyniku
syscall

srl $t3, $t3, 1  	# przesniecie o 1 
addi $t4, $t4, -1 	# odjecie od $t4  jedynki, by zakonczyc petle
bne $t4, $zero, loop 	# jesli t4 nie rowna sie 0 wracamy do petli

jr $ra

.data
prompt1: .asciiz "Podaj swoja liczbe: "

