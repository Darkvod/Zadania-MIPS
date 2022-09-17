# Program File: zadanie6.asm
# Author: xxx
# Cel programu: Program prosi o podanie n, nast�pnie dynamicznie alokuje pami�� na stercie dla n*n, 
# potem oblicza warto�ci p�tli podanych w tresci zadania

.data
prompt1: .asciiz "Podaj n: "
newline: .asciiz "\n"

.text
li $v0,4
la $a0,prompt1
syscall

li $v0,5
syscall
move $s0,$v0   		# przeniesienie podanej liczby do s0

mul $a0,$s0,$s0		# n*n (i*j)
sll $a0,$a0,2		# * 4, bo integer zajmuje 4 bajty

li $v0,9
syscall
move $s1,$v0		# adres pamieci przeniesiony do s1

li $t0,0	# iterator for1  // i


for1:

li $t1,0 # iterator for2  // j


	for2:
	mul $t2, $t0, $s0 # $t2 = i*n
 	add $t2, $t2, $t1 # $t2 = i*n + j
 	sll $t2, $t2, 2 # $t2 = (i*n + j) * 4
 	add $t2, $s1, $t2 # $t2 = &A[i][j] 
 	
 	add $t3,$t0,$t1   # i+j
 	sw $t3,0($t2)     # A[i][j]=i+j
 	
 	jal if
 	
 	li $v0,1
	lb $a0,0($t2)   # print a[i][j]
	syscall
 	
 	li $v0, 11      # Wydrukowanie znaku spacji 
	li $a0, 32      # Za�adowanie do a0 warto�ci 32, w ASCII to spacja
	syscall
 	
 	add $t1,$t1,1
	bne $t1,$s0,for2  # sprawdzenie warunku petli


li $v0,4
la $a0,newline     # newline
syscall


add $t0,$t0,1      # inkrementacja licznika
bne $t0,$s0,for1   # sprawdzenie warunku petli

exit:
li $v0,10          # wyjscie z programu
syscall	

if:
sgt $t4,$t0,0
beq $t4,0,if2      # i>0

add $t4,$t0,-1     # i-1
lw $t5,0($t2)      # A[i][j]

mul $t6, $t4, $s0  # $t6 = (i-1)*n
add $t6, $t6, $t1  # $t6 = i*n + j
sll $t6, $t6, 2    # $t6 = (i*n + j) * 4
add $t6, $s1, $t6  # $t6 = &A[i-1][j]
lw $s4,0($t6)      # odczytanie slowa zapisanego pod obliczonym adresem &A[i-1][j]
add $t5,$t5,$s4	   # a[i][j] = a[i][j] + a[i-1][j];
sw $t5,0($t2)      # zapis tego slowa
if2:
sgt $t4,$t1,0
beq $t4,0,back      # j>0 jesli nie to powrot
lw $t7,0($t2)	    # wczytanie a[i][j]
add $t8,$t1,-1      # j-1

mul $t6, $t0, $s0   # $t6 = i*n
add $t6, $t6, $t8   # $t6 = i*n + (j-1)
sll $t6, $t6, 2     # $t6 = (i*n + (j-1)) * 4
add $t6, $s1, $t6   # $t6 = &A[i][j-1]
lw $s3,0($t6)	    # odczytanie slowa zapisanego pod obliczonym adresem &A[i][j-1]
add $t7, $t7,$s3    # a[i][j] = a[i][j] + a[i][j-1];	
sw $t7,0($t2)       # zapis slowa
jr $ra			

back:
jr $ra	
