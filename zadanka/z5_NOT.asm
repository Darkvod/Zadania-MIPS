# Program File: _NOT.asm 
# Author: xxx
# Cel podprogramu: podprogram zwraca wynik operacji NOT
.text
_NOT:
move $t0,$a0   # przeniesienie wartosci z argumentow wejsciowych do rejestrow tymczasowych
not $t1, $t0   # uzycie polecenia not - otrzymanie wyniku
move $v1,$t1   # przeniesienie wyniku do rejestru zwracaj�cego warto��
jr $ra         # powrot z podprogramu do programu glownego
