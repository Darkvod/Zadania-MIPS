# Program File: zadanie1.asm
# Author: xxx
# Cel programu: Program drukuje stringa korzystaj�c z mapowania pami�ci we/wy

.data
string: .asciiz "przykladowy tekst"

.text
main:
la $a0,string		# adres stringa do a0

jal print_string


print_string:
lb $t1,($a0)		# wczytanie znaku ze stringa	
jal putChar		# funkcja wyswietlajaca pojedynczy znak
addi $a0,$a0,1		# zwiekszenie wskaznika, aby odczytac kolejny element w kolejnej iteracji
bnez $t1,print_string	# dopoki nie wczytujemy zera to kolejne iteracje
jr $ra			# powrot do main

putChar:
li $t0, 0xffff0008 	# adres sterowania wyswietlaczem
print:
lw $t2,($t0)	# odczyt rejestru sterowania wyswietlaczem
andi $t2,$t2,1	# bit gotowosci
beqz $t2,print	# je�li t2=0 to kolejna iteracja, brak gotowosci do wyswietlenia
sw $t1,4($t0)	# wys�anie znaku do wy�wietlacza
jr $ra

