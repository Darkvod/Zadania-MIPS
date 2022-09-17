# Program File: zadanie1.asm
# Author: xxx
# Cel programu: Program prosi o podanie 1 liczby a nastepnie 
# wypisuje ile bitow potrzeba do jej zapisania w systemie binarnym

.text
main:
li $v0,4              
la $a0, prompt1      
syscall				# prosba o podanie pierwszej liczby

li $v0,5              
syscall
move $t0,$v0			# odczytanie liczby i przeniesienie jej do t0
beqz $t0,exit			# je�li podano liczb� 0 to wypisuje 0 i wychodzimy z programu


li $t1,0			#przygotowanie licznika petli
.text
while:				# petla do while
li $s0,2			# deklaracja porownarki

sllv $s0,$s0,$t1		# 2^n

li $s1,1			# zaladowanie liczby uzywanej do przeniesienia
srlv $s2,$s0,$s1		# 2^(n-1)
sub $s5,$s0,$s2			# 2^n - 2^(n-1)

sge $s3,$t0,$s5			# a >= (l - (pow(2, i - 1))) // a=podana liczba, l=2^n

slt $s4,$t0,$s0			# a < l

addi $t1,$t1,1      		# inkrementacja licznika
		
beq $s3,$s4,wyjscie_z_petli	# (a >= (l - (pow(2, i - 1))) && a < l ), gdy spe�nione wychodze z petli

j while				# skok do kolejnej iteracji

.text
wyjscie_z_petli:

li $v0,4
la $a0, wynik			
syscall
move $a0,$t1			# na podstawie ilosc iteracji okreslam ile bitow potrzeba do zapisania liczby
li $v0,1			# wypisanie wyniku
syscall

li $v0,10
syscall				# zakonczenie programu


exit:
li $v0,1			# wypisanie wyniku w przypadku gdy podana liczba = 0
li $a0,0
syscall
li $v0,10
syscall				# zakonczenie programu

.data
prompt1:.asciiz   "Wprowadz liczbe: \n"
wynik:.asciiz   "Liczba bitow potrzebna do zapisania podanej liczby to: \n"
