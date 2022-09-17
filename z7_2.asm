# Program File: zadanie2.asm
# Author: xxx
# Cel programu: Program prosi o podanie 2 liczb, a nastepnie oblicza sum� od n1 do n2. 

.text
main:
li $v0,4              
la $a0, prompt1      
syscall			# prosba o podanie pierwszej liczby

li $v0,5              
syscall
move $t0,$v0			# odczytanie liczby i przeniesienie jej do t0

li $v0,4              
la $a0, prompt2     		# prosba o podanie drugiej liczby 
syscall

li $v0,5              
syscall
move $t1, $v0			# odczytanie liczby i przeniesienie jej do t1

while:
sle $t2, $t0,$t1     		# warunek petli if(a<=b), instrukcja przypisuje 1 do rejestru t2 jesli warunek jest spelniony
				# jesli warunek nie jest spelniony przypisuje 0
beq $t2,$0, wyjscie_z_petli   	# jesli $t2 = 0 (co oznacza �e warunek p�tli przesta� byc spelniony) to wychodzimy z petli
add $s1,$s1,$t0      		# dodawanie sumy
addi $t0,$t0,1      		# zwiekszenie liczby ktora bedzie dodawana o 1, jednoczesnie zmiennej iteruj�cej 
j while				# skok do kolejnej iteracji

wyjscie_z_petli:
li $v0,4
la $a0, wynik			
syscall
move $a0,$s1
li $v0,1			# wypisanie wyniku
syscall

li $v0,10
syscall				# zakonczenie programu

.data
prompt1:.asciiz   "Wprowadz pierwsza liczbe(pierwsza liczba musi byc mniejsza od drugiej): \n"
prompt2:.asciiz   "Wprowadz druga liczbe: \n"
wynik:.asciiz   "Suma wszystkich kolejnych liczb od n1 do n2 to: \n"
