# Program File: lab2 p4.asm
# Author: xxx
# Program otwiera okno dialogowe do kt�rego mamy poda� stringa, a nast�pnie pokazuje tego stringa w drugim oknie dialogowym.

.text
main:   #wczytanko
	li 	$v0, 54
	la	$a0, message
	la	$a1, buffer		#wrzucenie stringa do bufora
	li	$a2, 51		#limit znak�w
	syscall
	
	#wypisanie
	li	$v0, 55
	la	$a0, buffer
	li	$a1, 1
	syscall
	
	# Exit the program
	li $v0, 10
	syscall

.data
message:	.asciiz 	"Podaj stringa mniejszego niz 50 znak�w:"
buffer:	.space 	51
