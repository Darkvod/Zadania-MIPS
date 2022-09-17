# Program File: _NAND.asm 
# Author: xxx
# Cel podprogramu: podprogram zwraca wynik operacji NAND
.text
_NAND:
move $t0,$a0       
move $t1,$a1        # przeniesienie wartosci z argumentow wejsciowych do rejestrow tymczasowych
and $t3, $t0, $t1 
not $t4, $t3        # uzyte polecenia and i not - jedno po drugim daj� efekt uzycia polecenia nand(gdyby istnia�o)
move $v1,$t4        # przeniesienie wyniku do rejestru zwracaj�cego warto��
jr $ra              # powrot z podprogramu do programu glownego
