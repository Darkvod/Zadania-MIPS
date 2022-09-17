# Program File: zadanie1.asm
# Author: xxx
# Cel programu: Program prosi o podanie znaku a nast�pnie stwierdza czy podany znak to mala/duza litera,
		# lub znak nie wystepujacy w alfabecie.

.data
prompt: .asciiz "Wpisz znak: "
male: .asciiz "\nMala litera"
duze: .asciiz "\nDuza litera"
nieznane: .asciiz "\nPodany znak nie wystepuje w alfabecie"

.text
main:

li $v0,4
la $a0,prompt		# prosba o podanie znaku
syscall

li $v0,12		# odczytanie znaku
syscall
move $a0,$v0		# przeniesienie znaku do v0

jal isLower		# skok do funkcji islower

li $v0, 10		# koniec programu
syscall

isLower:
addi $sp,$sp,-4		# przygotowanie miejsca na stosie
sw $ra,0($sp)		# zapis adresu powrotnego

sge $t1,$a0,65
sle $t2,$a0,90
and $t3,$t1,$t2
beq $t3,1,duzaLitera	# jesli znak to duza litera, to skok do etykiety duzaLitera

sge $t1,$a0,97
sle $t2,$a0,122
and $t3,$t1,$t2
beq $t3,1,malaLitera	# jesli znak to mala litera, to skok do etykiety malaLitera

j znak_nie_alfabetyczny	# jesli znak nie jest ani duza litera, ani mala to skok do etykiety znak_nie_alfabetyczny

malaLitera:
       la $a0,male      # ladowanie adresu do stringa 'male'
       j done

duzaLitera:
       la $a0,duze      # ladowanie adresu do stringa 'duze'
       j done
znak_nie_alfabetyczny:
       la $a0,nieznane	# ladowanie adresu do stringa 'nieznane'
       j done

done:
li $v0,4		# wyswietlenie komunikatu - duza/mala/nieznana litera 
syscall

lw $ra,0($sp)		# przywrocenie adresu powrotnego
addi $sp,$sp,4		# przywrocenie stosu
jr $ra			# powrot do callera
