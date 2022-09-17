# Program File: _MULT10.asm 
# Author: xxx
# Cel podprogramu: mnozenie podanego argumentu * 10
.text
_MULT10:
move $t0,$a0     # przeniesienie argumentu do rejestru tymczasowego
sll $t1,$t0,1    # przesuyniecie logiczne w lewo o 2, defacto mnozenie *2
sll $t2,$t0,3    # przesuyniecie logiczne w lewo o 2, defacto mnozenie *8
add $t3,$t1,$t2  # dodanie 2 poprzednich obliczen, bo n*10 = n*8 + n*2
move $v1,$t3     # przeniesienie wyniku do rejestru zwracajacego wartosc
jr $ra           # powrot do programu glownego
