# Program File: zadanie5.asm
# Author: xxx
# Cel programu: Program kopiuje zawartosc pliku wejsciowego do pliku wyjsciowego 

.data
plik1: .space 50
plik2: .space 50
bufor: .space 1000
prompt1: .asciiz "Specify input filename,(np. input.txt) "
prompt2: .asciiz "Specify output filename,(np. output.txt) "
prompt3: .asciiz "Blad otwarcia pliku"


.text
main:
li $v0, 4       
la $a0, prompt1  	   # wypisanie prompt1: 
syscall

li $v0,8		   # odczytanie stringa // nazwy pliku wejsciowego
la $a0, plik1		   
li $a1,49 	  	   # limit znakow
syscall


# petla usuwajaca 0x0000000a na koncu stringa podanego przez uzytkownika, przy komentowaniu tej petli wyjasnienie dlaczego powstala
li $t0, 0       	# zerowanie iteratora
li $t1, 49              # ile itracji
jal usunsyf	 	# skok do funkcji usuwaj�cej 0x0000000a dla pliku1

li $v0, 4       
la $a0, prompt2  	   # wypisanie prompt1: 
syscall

li $v0, 8		   # odczytanie stringa // nazwy pliku wyjsciowego
la $a0, plik2
li $a1,49
syscall


li $t0, 0       # zerowanie iteratora
li $t1, 49      # ile itracji
jal usunsyf_    # skok do funkcji usuwaj�cej 0x0000000a dla pliku2

# Otwieranie pliku wejsciowego
li   $v0, 13       # system call dla otwarcia pliku
la   $a0, plik1    # nazwa pliku wejsciowego
li   $a1, 0        # jesli a0 = 0 to plik jest tylko od odczytu
syscall            
move $s6, $v0      # zapis deskryptora

slti $t0,$v0,0		#sprawdzenie czy jest blad otwarcia
beq $t0,1,blad

# Odczyt z pliku
li   $v0, 14       # system call dla czytania z pliku
move $a0, $s6      # przeniesienie deskryptora do a0
la   $a1, bufor    # ladowanie adresu bufora ktory bedzie przechowywal zawartosc pliku wejsciowwego
li   $a2, 1000     # maksymalna ilosc znakow do przeczytania
syscall            

# Zamkniecie pliku
li   $v0, 16       # system call dla zamkniecia pliku
move $a0, $s6      # przeniesienie deskryptora do a0
syscall            

# Otwieranie pliku wyjsciowego
li   $v0, 13       # system call dla otwarcia pliku
la   $a0, plik2      # nazwa pliku wyjsciowego
li   $a1, 1        # jesli a0 = 1 to plik jest tylko do zapisu z utworzeniem pliku
syscall            
move $s6, $v0      # przeniesienie deskryptora do s6

# Zapis do pliku
li   $v0, 15       # system call do zapisu w pliku
move $a0, $s6      # przeniesienie deskryptora do a0
la   $a1, bufor    # ladowanie adresu bufora ktory przechowuje zawartosc pliku wejsciowego
li   $a2, 100      # liczba znakow do zapisu
syscall     
       
# Zamkniecie pliku
li   $v0, 16       # system call dla zamkniecia pliku
move $a0, $s6      # przeniesienie deskryptora do a0
syscall            


li $v0,10 	   # koniec programu
syscall

.text
blad:
li $v0, 55       
la $a0, prompt3  	   # powiadomienie o bledzie 
syscall
li $v0,10	# koniec programu
syscall

# Problem by� taki, �e w zadaniu jest napisane, �e nazwy program�w musz� by� podawane przez u�ytkownika 
# program dzia�a� gdy zadeklarowa�em nazwy plikow wewn�trz programu, ale nie dzia�a� gdy podawa�em je jako u�ytkownik.
# Przy pracy w trybie krokowym zauwa�y�em, �e w momencie gdy podaj� String  w pami�ci zapisywany jest on z ko�c�wk�
# 0x0000000a, kt�ra (prawdopodobnie) w jaki� spos�b oznacza dla pami�ci koniec tego stringa(<- tego zdania nie jestem pewien), 
# ale jednoczenie uniemo�liwia dzia�anie programu z zamys�em �e podaje nazwy pliku jako String w trakcie dzia�ania programu,  
# dlatego zastanowi�em si� jak utworzy� funkcj�, kt�ra usuwa�aby t� warto�� 0x0000000a - rezultat wida� ni�ej.

usunsyf:    
beq $t0, $t1, powrot    # jesli ilosc iteracji = maksymalna ilosc znakow to powrot
lb $t3, plik1($t0)      # wczytanie bajtu (chara)
bne $t3, 0x0000000a, iteracja # jesli nie jest rowny 0x0a to kolejna iteracja
sb $zero, plik1($t0)    # jesli trafimy na 0x0000000a to wpisujemy tu 0
iteracja:
addi $t0, $t0, 1   # zwiekszenie iteratora o 1 (bo chary zajmuj� 1 bajt)
j usunsyf
powrot:
jr $ra

# ta sama p�tla co wy�ej tylko dla pliku2
usunsyf_:
beq $t0, $t1, powrot_
lb $t3, plik2($t0)
bne $t3, 0x0a, iteracja_
sb $zero, plik2($t0)
iteracja_:
addi $t0, $t0, 1
j usunsyf_
powrot_:
jr $ra

