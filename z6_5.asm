# Program File: zadanie5.asm
# Author: xxx
# Cel programu: Program prosi o podanie liczby a nast�pnie zamienia jej bity w ka�dej parze i j� wypisuje

.text
main:
add $s1,$0,0xAAAAAAAA	# Stworzenie tzw. maski za pomoc� kt�rej b�d� wy�uskiwa� bity parzyste w ka�dej parze
add $s2,$0,0x55555555	# Stworzenie tzw. maski za pomoc� kt�rej b�d� wy�uskiwa� bity nieparzyste w ka�dej parze


li $v0,4
la $a0, prompt1		# wyswietlenie prompt1 - prosba o podanie liczby
syscall

li $v0,5 		# odczytanie liczby
syscall
move $t0,$v0		# przeniesienie podanej liczby do t0

and $t1,$t0,$s1		# wy�uskanie bit�w parzystych za pomoc� bramki and oraz "maski" 
srl $t2,$t1,1		# przeniesienie bitu parzystego na miejsce bitu nieparzystego

and $t3,$t0,$s2		# wy�uskanie bit�w nieparzystych za pomoc� bramki and oraz "maski" 
sll $t4,$t3,1		# przeniesienie bitu nieparzystego na miejsce bitu parzystego

or $s0,$t2,$t4		# po��czenie dw�ch liczb w jedn� 

li $v0,1
add $a0,$0,$s0
syscall			# wypisanie wyniku 

li $v0,10		#koniec
syscall

.data
prompt1: .asciiz "Podaj liczbe bez znaku: "
