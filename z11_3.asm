# Program File: zadanie3.asm
# Author: xxx
# Cel programu: Nauka obs�ugi wyj�tk�w

.text
li $s0,6
li $s1,0
teq $s1,$0
div $s0,$s0,$s1

lb $t1,5($0)

break

li $v0,10
syscall	

# Os�uga wyj�tku zaczyna si� tutaj
.ktext 0x80000180

move $k0, $at           # $k0 = $at
la $k1, _regs           # $k1 = adres _regs
sw $k0, 0($k1)          # zapisz $at
sw $v0, 4($k1)          # zapisz $v0
sw $a0, 8($k1)          # zapisz $a0
la $a0, _msg1           # $a0 = adres _msg1
li $v0, 4               # $v0 = us�uga 4
syscall                 # Print _msg1
mfc0 $a0, $14           # $a0 = EPC
li $v0, 34              # $v0 = us�uga 34
syscall                 # print EPC szesnastkowo
la $a0, _msg2           # $a0 = adres _msg2
li $v0, 4               # $v0 = us�uga 4
syscall                 # Print _msg2
mfc0 $a0, $13           # $a0 = przyczyna
srl $a0, $a0, 2         # przesun w prawo o 2 bity
andi $a0, $a0, 31       # $a0 = kod wyj�tku
li $v0, 1               # $v0 = us�uga 1
syscall                 # Print kod wyj�tku
la $a0, _msg3           # $a0 = adres _msg3
li $v0, 4               # $v0 = us�uga 4
syscall                 # Print _msg3
la $k1, _regs           # $k1 = adres  _regs
lw $at, 0($k1)          # odtw�rz $at
lw $v0, 4($k1)          # odtw�rz $v0
lw $a0, 8($k1)          # odtw�rz $a0
mtc0 $zero, $8          # wyczy�� vaddr
mfc0 $k0, $14           # $k0 = EPC
addiu $k0, $k0, 4       # Zwi�ksz $k0 o 4
mtc0 $k0, $14           # EPC = wska� nastepn� instrukcj�
eret                    # powr�t z wyj�tku: PC = EPC
                        # j�dro danych jest zapisany tutaj
.kdata
_msg1: .asciiz "\n Wyjatek spowodowany instrukcja spod adresu: "
_msg2: .asciiz "\nKod wyjatku = "
_msg3: .asciiz "\n Zignoruj i kontynuuj program ...\n"
_regs: .word 0:3        # Miejsce do rezerwowania rejestrow
