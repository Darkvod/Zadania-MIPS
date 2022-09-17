# Program File: _NOT.asm
# Author: xxx
# Cel podprogramu: podprogram zwraca wynik operacji NOR
.text
_NOR:
move $t0,$a0   
move $t1,$a1        # przeniesienie wartosci z argumentow wejsciowych do rejestrow tymczasowych
nor $t3, $t0, $t1   # uzycie polecenia nor - otrzymanie wyniku
move $v1,$t3        # przeniesienie wyniku do rejestru zwracaj�cego warto��
jr $ra              # powrot z podprogramu do programu glownego
