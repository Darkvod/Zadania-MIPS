# Program File: _MULT4.asm 
# Author: xxx
# Cel podprogramu: mnozenie podanego argumentu * 4
.text
_MULT4:
move $t0,$a0   # przeniesienie argumentu do rejestru tymczasowego
sll $t1,$t0,2  # przesuyniecie logiczne w lewo o 2, defacto mnozenie *4
move $v1,$t1   # przeniesienie wyniku do rejestru zwracajacego wartosc
jr $ra         # powrot do programu glownego