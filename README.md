/*
____________________________________________________________________
			PIERWSZY COMIT
____________________________________________________________________
Inicjalizacja git: git init
Komendy do zmiany informacji o tożsamości autora projektu: 
git config --global user.email "you@example.com" 
git config --global user.name "Your Name"
____________________________________________________________________
			DRUGI COMIT
____________________________________________________________________
// plik zrodlowy pole.cpp
#include <iostream>

using namespace std;

int pole(int a){
	return a*a;
} 

// plik naglowkowy libpole.cpp
int pole(int a);
____________________________________________________________________
// plik zrodlowy objetosc.cpp
#include <iostream>

using namespace std;

int objetosc(int a)
{
	return a*a*a;
}

// plik naglowkowy libobjetosc.h
int objetosc(int a);
____________________________________________________________________
// plik zrodlowy Code2.cpp
#include "libpole.h"
#include "libobjetosc.h"
#include <iostream>

using namespace std;

int main() {
	int a;
	cout << "Podaj bok a, w celu obliczenia pola kwadratu o podanym boku,"
	     << " oraz objetosci szescianu o podanym boku"<<endl;
	cout << "a: ";
	cin >> a;
	cout << endl;
	cout << "Pole kwadratu: " << pole(a);
	cout << endl;
	cout << "Objetosc szescianu: " << objetosc(a);
	cout << endl;
	return 0;	
}
____________________________________________________________________
// podstawowy Makefile
Code2: Code2.o libpole.a libobjetosc.so
	g++ -g -Wall -o Code2 Code2.o libpole.a libobjetosc.so
Code2.o: Code2.cpp libpole.h libobjetosc.h
	g++ -c Code2.cpp
pole.o: pole.cpp
	g++ -c pole.cpp
objetosc.o: objetosc.cpp
	g++ -fPIC -c objetosc.cpp
libpole.a: pole.o
	ar rs libpole.a pole.o
libobjetosc.so: objetosc.o
	g++ -shared -o libobjetosc.so objetosc.o
usun:
	rm -f Code2 *.o *.a *.so
____________________________________________________________________
Komenda do kompilacji w terminalu: make
Komenda do usuniecia pliku Code2 w terminalu: make usun
Komenda do dodania powyzszych plikow do "poczekalni" lokalnego repozytorium: git add .
Komenda do zatwierdzenia zmian i dodania opisu rewizji: git commit -m "pierwszy comit"
Komenda potrzebna by plik Code2 znajdował dynamiczną biblioteke libobjetosc.so:
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/student/Code2/libobjetosc.so
*BEZ TEJ KOMENDY WYSKAKUJE BŁĄD "cannot open shared object file: No such file or directory"*
____________________________________________________________________
			TRZECI COMIT
____________________________________________________________________
//rozbudowa o zmienne automatyczne
Code2: Code2.o libpole.a libobjetosc.so
	g++ -g -Wall -o $@ $^
Code2.o: Code2.cpp libpole.h libobjetosc.h
	g++ -c $<
pole.o: pole.cpp
	g++ -c $<
objetosc.o: objetosc.cpp
	g++ -fPIC -c $<
libpole.a: pole.o
	ar rs $@ $<
libobjetosc.so: objetosc.o
	g++ -shared -o $@ $<
usun:
	rm -f Code2 *.o *.a *.so
____________________________________________________________________
Komendy jak w commit'cie drugim
*/

