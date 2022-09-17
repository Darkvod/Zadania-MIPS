## Zadania z programowania procesora MIPS
Legenda do plików:
```
z2_2	Napisz program który pyta użytkownika o ulubione ciasto. Następnie wyświetla komunikat: „Wiec mowisz ze lubisz _______ !”. Gdzie w miejsce ”_____” wpisywana jest nazwa ciasta podana przez użytkownika. 
z2_3	Napisz program który wyświetla losowo liczbę w zakresie 1-100.
z2_4	Napisz program który otwiera dialogowe okienko i wczytuje wartość stringa. Następnie string pobrany przez użytkownika jest wyświetlany w nowym oknie.
z3_1 - z3_3 Przeanalizuj programy i popraw błędy
z4_1	Napisz program który będzie pytał użytkownika po podanie litery. Jeśli użytkownik poda małą literę to zmieni ją na dużą i odwrotnie.
z5_1 	Napisz podprogramy które przyjmują dwa argumenty wejściowe i zwracają w wynik następujących operacji: NOR, NAND, NOT.
z5_2 	Napisz podprogram, MULT4 który przez 4 podany parametr wejściowy wykorzystując operację przesunięcia logicznego i parametr dodawania.
z5_4	Ktoś zmodyfikował plik utils.asm, aby natychmiast wstawić podprogram PrintTab po podprogramie PrintNewLine, jak pokazano poniżej (zmiany są podświetlone na czerwono). Programista narzeka, że polecenia PrintTab nie można wywołać za pomocą „jal PrintTab ". Co jest nie tak i jak można to naprawić? Wyjaśnij problemy z kodem napisanym przez tego programistę. 
z6_1 	Napisz program, który poprosi użytkownika o wprowadzenie dwóch liczb całkowitych A i B, a następnie wyświetla wynik wyrażenia: A + 2B - 5
z6_2	Załóżmy, że $s1 = 0x12345678 i $s2 = 0xffff9a00. Określ zawartość rejestrów $s3 do $s6 po wykonaniu następujących instrukcji: 
z6_3	Załóżmy, że $s1 = 0x87654321. Określ zawartość rejestrów $s2 do $s4 po uruchomieniu następujących instrukcji... Napisz program do wykonania tych instrukcji i sprawdź zawartość rejestrów $s2 do $s4
z6_4	Napisz program, który prosi użytkownika o wprowadzenie znaku (małego lub dużego) i zmienia wielkość znaku z małego do dużego i z dużego do małego a następnie wyświetli znak. 
z6_5	Napisz program, który prosi użytkownika o wprowadzenie liczby bez znaku i odczytuje go. Następnie zamienia bity w pozycjach nieparzystych z pozycjami parzystymi i wyświetli wynik liczbę. Na przykład jeśli użytkownik wprowadza liczbę 9, która ma binarną reprezentację 1001, a następnie bit 0 jest zamieniany z bitem 1, a bit 2 jest zamieniany z bitem 3, co powoduje powstanie liczby binarnej 0110. Zatem program powinien wyświetlić 6
z7_1 	Napisz program, który prosi użytkownika o wprowadzenie liczby całkowitej, a następnie wyświetla liczbę znaków binarnych (0 i 1) do reprezentacji tej liczby całkowitej. Na przykład, jeśli użytkownik wpisze 9, program powinien wyświetlić 3 (8 bitów).
z7_2	Napisz program, który prosi użytkownika o wprowadzenie dwóch liczb całkowitych: n1,n2 i wypisuje sumę wszystkich liczby od n1 do n2. Na przykład, jeśli użytkownik wprowadzi n1 = 3 i n2 = 7, wówczas program powinna wyświetlać sumę jako 34.
z7_3	Napisz program, który prosi użytkownika o wprowadzenie liczby całkowitej, a następnie wyświetla w binarną reprezentację tej liczby całkowitej (dla 8 albo 4 bitów).
z8_4	Napisz program MIPS, który definiuje jednowymiarową tablicę 10 liczb całkowitych w obszarze statycznym w segmencie danych następnie prosi użytkownika o wprowadzenie wszystkich 10 elementów tablicy a następnie  oblicza i wyświetla ich sumę.
z8_5	Napisz program MIPS, który kopiuje wejściowy plik tekstowy do pliku wyjściowego. Nazwy plików wejściowego i wyjściowego są podawane przez użytkownika. Jeśli pliku wejściowego nie można otworzyć, wydrukuj komunikat o błędzie (znajdź odpowiednią usługę w syscall).
z8_6	Napisz program MIPS, który przydziela tablicę liczb całkowitych n × n na stercie, gdzie n jest podane przez użytkownika. Program powinien obliczyć i wydrukować wartość każdego elementu w następujący sposób:
	 for (i=0; i<n; i++)
		for (j=0; j<n; j++) {
			a[i][j] = i+j;
			if (i>0) a[i][j] = a[i][j] + a[i-1][j];
			if (j>0) a[i][j] = a[i][j] + a[i][j-1];
			print_int(a[i][j]);
			print_char(' ');
		}
	print_char('\n');
		}
z9_1 	Napisz program, do wykonania mnożeń liczb całkowitych
z9_2	Napisz program, do wykonania dzieleń liczb całkowitych. 
z9_3	Obliczanie silni: Korzystając z instrukcji mul, napisz program MIPS, który oblicza silnię liczby n wprowadzonej przez użytkownika i wyświetli wynik na ekranie. Uruchom swój kod i zapisz maksymalną 32-bitową wartość silni, którą można obliczyć bez błędów.
z9_4	Program string-to-integer przedstawiony w rozdziale 9.5 konwertuje ciąg cyfr dziesiętnych na    liczbę całkowitą bez znaku, przy użyciu kolejnych mnożeń przez 10 i dodawania. Możliwe jest również konwertowanie ciągu cyfr na dowolny system liczbowy, stosując kolejne mnożenia przez wartość podstawy systemu liczbowego i dodawania. Przepisz program string-to-integer, prosząc użytkownika o wprowadzenie systemu liczbowego pomiędzy 2 a 10 i wyświetlenie ciągu liczb w określonym systemie liczbowym. Na przykład, jeśli podstawa to 8, to ciąg może zawierać tylko znaki ósemkowe od „0” do „7”. Konwertuj ciąg znaków cyfr na liczbę całkowitą bez znaku i wyświetl wartość liczby całkowitej bez znaku. 
z10_1	Funkcja islower, pokazana na rysunku 10.1, sprawdza, czy znak ch jest małą literą, czy nie. Napisz główną funkcję programu, który czyta znak ch, wywołuje funkcję islower, a następnie drukuje komunikat wskazujący, czy ch jest małą literą, czy nie.	
z10_2-3	Napisz funkcję, która odczytuje tablicę n liczb całkowitych. Funkcja odczytana musi otrzymać dwa argumenty: $a0 = adres tablicy, a $a1 = liczba n elementów do odczytania. Napisz funkcję, która wypisze tablicę n liczb całkowitych. Funkcja print musi otrzymać dwa argumenty: $a0 = adres tablicy, a $a1 = liczba n elementów do wydrukowania.
z11_1	Tuż przed podzieleniem $s0 przez $s1 programista może chcieć sprawdzić, czy $s1 nie jest równy zero. Użyj teq $s1, $zero (pułapka, jeśli jest równe), aby spowodować wyjątek. Jaki jest adres instrukcji teq  w twoim programie? Jaka jest wartość rejestru cause, kodu wyjątku i epc, gdy wystąpił wyjątek?	
z11_2	Użyj lb $t1, 5 ($zero) aby spowodować wyjątek podczas próby załadowania bajtu z adresu 5. Jaki jest adres instrukcji lb w twoim programie? Jaka jest wartość rejestru cause, kod wyjątku, vaddr i epc, gdy wystąpi wyjątek? 
z11_3	Napisz kompletny program, który używa procedury obsługi wyjątków z rysunku 11.7 do generowania wielu wyjątków. Procedura obsługi wyjątku powinna zgłosić adres instrukcji, która spowodowała błąd, kod wyjątku i powinien wznowić program po obsłużeniu każdego wyjątku. Wstaw instrukcje, które powodują przepełnienie, nieprawidłowe adresy pamięci, instrukcje pułapki (trap) i przerwania (break).
z11_4	Zmodyfikuj moduł obsługi wyjątków z rysunku 11.7, aby wydrukować niepoprawny vaddr, gdy jest on spowodowany przez ładowanie, przechowywanie lub pobieranie instrukcji (kod wyjątku 4 lub 5). Przetestuj moduł obsługi wyjątków, pisząc ładuj i przechowuj instrukcje, które generują nieprawidłowe adresy pamięci.
z12_1	Używając mapowania pamięci Wej/Wyj i odpytywania, napisz funkcję print_string, która drukuje ciąg znaków na wyświetlaczu bez użycia jakiegokolwiek wywołania systemowego. Adres ciągu przekazywany jest do rejestru $a0 i ciąg musi być zakończony zerem. Przetestuj tę funkcję, wywołując ją z funkcji głównej. Pamiętaj, aby aktywować „Symulator klawiatury i wyświetlacza MMIO”.
z12_2   Korzystając z mapowani pamięci Wej/Wyj i odpytywania, napisz program, który odczytuje znaki bezpośrednio z klawiatury. Aby zademonstrować, jak wolne jest urządzenie klawiatury, wydrukuj naciśnięty znak i liczbę iteracji po wyjściu z pętli wait_keyboard. Powtórz wykonanie programu do momentu naciśnięcia znaku nowej linii. Pamiętaj, aby aktywować „Symulator klawiatury i wyświetlacza MMIO” i uruchomić symulator MARS z maksymalną prędkością.
```