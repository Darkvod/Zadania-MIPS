# Program File: lab2 p2.asm
# Author: xxx
# Program pyta jakie ciasto lubisz a nast�pnie wypisuje to co poda�e�.

.text
main:
	# Pytanie
	li $v0, 4
	la $a0, prompt
	syscall

	# Wczytanie stringa.
	li $v0, 8
	la $a0, input
	lw $a1, inputSize
	syscall
	# wypisanie wiec mowisz ze lubisz...
	li $v0, 4
	la $a0, output
	syscall
	# wypisanie ciasta
	li $v0, 4
	la $a0, input
	syscall
	
	# wypisanie wykrzyknika
	li $v0, 4
	la $a0, output1
	syscall
	
	# Exit the program
	li $v0, 10
	syscall

.data
	input: .space 20
	inputSize: .word 20
	prompt: .asciiz "Jakie jest twoje ulubione ciasto? "
	output: .asciiz "Wiec mowisz ze lubisz "
	output1: .asciiz "!"
