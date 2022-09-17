# Program File: zadanie2-3.asm
# Author: xxx
# Cel programu: Program prosi o podanie elementow tablicy, a nastepnie je wypisuje.
		# program uzywa oddzielnych funkcji do wczytania i wypisania elementow.


.data
prompt: .asciiz "Podaj n:"
wartosci: .asciiz "\nPodaj wartosci do wpisania w tablice, nr wartosci: "

.text
main:

li $v0,4
la $a0,prompt
syscall

li $v0,5
syscall

move $a1,$v0		# przeniesienie 'n'
move $a0,$sp		# adres tablicy (na stosie) do a0

jal wczytaj

move $a0,$sp


jal print

li $v0,10		# koniec programu
syscall

wczytaj:
	# na podstawie podanego 'n', wyliczenie ile miejsca potrzeba na stosie
mul $t2,$a1,4		# t2 = n_int * 4 bajty
add $t2,$t2,4		# dodatkowe 1 miejsce na $ra
sub $a0,$a0,$t2		# przygotowanie stosu
move $sp,$a0

move $t0,$a0		# przeniesienie adresu tablicy
sw $ra,0($sp)		# zapis adresu powrotnego

li $t4,0		# licznik

jal read

lw $ra, 0($sp)		# odczyt adresu powrotnego
jr $ra			# powrot do callera

read:
li $v0, 4       
la $a0, wartosci  	   # wypisanie prompt1: 
syscall  
li $v0,1
move $a0,$t4		   # wypis numeru iteracji
syscall

li $a0, 32             # Za�adowanie do a0 warto�ci 32, w ASCII to spacja
li $v0, 11             # Wydrukowanie znaku spacji dla czytelno�ci wprowadzania
syscall 

li $v0,5		   # odczytanie elementu macierzy
syscall

move $t5,$v0
addi $t0,$t0,4		   # inkrementacja adresu tablicy
sw $t5,($t0)	           # zapis inta do stosu


addi $t4,$t4,1		   # inkrementacja licznika

beq $t4,$a1,back	  # warunek wyjscia z petli
j read


#-------------------------------# Zad 3

print:

li $t4,0 		# iterator

mul $t2,$a1,4		# t2 = n_int * 4 bajty
add $t2,$t2,4		# dodatkowe 1 miejsce na $ra
sub $sp,$sp,$t2		# przygotowanie stosu

sw $ra,0($sp)

move $t0,$a0
jal wypisz

lw $ra, 0($sp)
jr $ra

wypisz:
beq $t4, $a1, back 	   # warunek wyjscia z petli

addi $t0, $t0, 4       # inkrementacja adresu w $t2 o 4 - adres inkrementuje si� o 4 bajty, czyli do kolejnej warto�ci
lw $t5,($t0)		# odczytanie inta 

li $v0,1		# wypisanie liczby z tablicy
move $a0,$t5
syscall

li $a0, 32             # Za�adowanie do a0 warto�ci 32, w ASCII to spacja
li $v0, 11             # Wydrukowanie znaku spacji dla czytelno�ci wprowadzania
syscall 


addi $t4, $t4, 1       # inkrementacja iteratora p�tli

j wypisz		# kolejna iteracja


back:
jr $ra
