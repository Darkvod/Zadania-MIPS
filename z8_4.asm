# Program File: zadanie4.asm
# Author: xxx
# Cel programu: Uzytkownik definuje 10 elementowa tablice a program liczy sume jej elementow

.data
array: .space 40 # miejsce na 10 liczb calkowitych
prompt1: .asciiz "Podaj liczbe, nr podawanej liczby: "

.text
main:
la $t1,array	# zaladowanie adresu tablicy do rejestru $t1
li $t4,1 	# zerowanie iteratora

jal do_while    # skok do petli while ktora wczytuje elementy tablicy

li $t4,1 	# zerowanie iteratora

jal suma	# skok do p�tli wykonuj�cej sum� podanych elementow

li $v0, 1
move $a0, $t6	# wypisanie sumy
syscall

li $v0,10	# zakonczenie programu
syscall

do_while:
li $v0, 4       
la $a0, prompt1  	   # wypisanie prompt1: 
syscall  
li $v0,1
move $a0,$t4		   # wypis numeru iteracji
syscall


li $v0, 11             # Wydrukowanie znaku spacji dla czytelno�ci wprowadzania
li $a0, 32             # Za�adowanie do a0 warto�ci 32, w ASCII to spacja
syscall 

li $v0,5		   # odczytanie wprowadzanego elementu
syscall

move $t5,$v0
sw $t5,($t1)		   # zapis inta do tablicy

addi $t1,$t1,4		   # inkrementacja adresu tablicy
addi $t4,$t4,1		   # inkrementacja licznika

beq $t4,11,back		# sprawdzenie ilosc iteracji, jesli 10 to wyjscie z p�tli
j do_while		# skok do kolejnej iteracji

suma:
add $t1, $t1, -4       # dekrementacja adresu w $t1 o 4 - wartosci zapisywane s� co 4 bajty

lw $t5, 0($t1)         # odczytanie  warto�ci zapisanej w tablicy Macierz_A w miejscu ktore wskazuje t1 i zapisanie jej do t5

add $t6, $t6, $t5      # sumowanie warto�ci odczytanych w poprzednich dw�ch instrukcjach
             
addi $t4, $t4, 1       # inkrementacja iteratora p�tli

beq $t4, 11, back	   # je�li wykonano 10 iteracji to wracamy do main

j suma                 # skok do kolejnej iteracji

back:
jr $ra	# powrot do funkcji wywolujacej
