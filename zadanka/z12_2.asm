# Program File: zadanie2.asm
# Author: xxx
# Cel programu: Program odczytuje znak korzystaj�c z mapowania pami�ci we/wy

.text
main:

jal wait_keyboard

move $s2,$t2

move $t1,$v0


li $v0,1
move $a0,$s2
syscall

jal putChar

li $t1, 0 # Inicjalizacja wait_counter = 0
wait_keyboard:
	lui	$t0,0xffff	#ffff0000
waitloop:
lw	$t1,0($t0)	#sterowanie klaw
andi	$t1,$t1,0x0001
addi $t2,$t2,1
beq	$t1,$0,waitloop
lw	$v0,4($t0)	#dane
beq $v0,0xA,exit
jr $ra
			# powrot do main

putChar:
li $t0, 0xffff0008 	# adres sterowania wyswietlaczem
print:
lw $t2,($t0)	# odczyt rejestru sterowania wyswietlaczem
andi $t2,$t2,1	# bit gotowosci
beqz $t2,print	# je�li t2=0 to kolejna iteracja, brak gotowosci do wyswietlenia
sw $t1,4($t0)	# wys�anie znaku do wy�wietlacza
j main

exit:
li $v0,10
syscall
