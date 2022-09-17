# Program File: Zad1.asm
# Author: xxx
# Cel programu: Program prosi o podanie litery a nast�pnie 
# zamienia j� na wielk� lub ma�� liter�, w zale�no�ci co poda� u�ytkownik

.data
str1: .asciiz "Wprowadz znak: \t"
str2: .asciiz "\n po zmianie: "
.globl main
.text
main:
	li $v0 ,4
	la $a0, str1
	syscall
	
	
	addi $s1, $0, 0x5B # ponizej tej wartosci sa male litery
	
	li $v0, 12 #  odczytanie znaku
	syscall
	move $s2, $v0 #przeniesienie znaku
	
	slt $s3, $s2, $s1 #sprawdzenie czy wpisany znak jest malej litery 
	beq $s3, $0, nawielkie
	
	
	
	li $v0 ,4
	la $a0, str2 #po zmianie
	syscall
	
	addi $s4, $s2, 0x20 #zwiekszenie o 0x20, czyli zmiana z duzej litery na mala
	
	li $v0, 11
	add $a0,$0,$s4
	syscall
	
	li $v0, 10
	syscall
	
nawielkie:
	li $v0 ,4
	la $a0, str2 #po zmianie
	syscall
	
	subi $s4, $s2, 0x20 #zmniejszenie o 0x20, czyli zmiana z malej litery na duza
	
	li $v0, 11
	add $a0,$0,$s4
	syscall
	
	li $v0, 10
	syscall
