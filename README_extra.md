____________________________________________________________________
			SZOSTY COMIT
____________________________________________________________________

Należy stworzyć katalogi, odpowiednio
bin - na plik Code2,
incl - na pliki nagłówkowe,
lib - na biblioteki,
src - na pliki źródłowe;
i przenieść pliki nagłówkowe i źródłowe do odpowiednich folderów.
Stworzeniem pozostałych plików w odpowiednich folderach zajmie sie plik makefile.
W razie błędu wynikającego z biblioteką dynamiczną należy (będać w katalogu lib) 
za pomocą terminala wpisać komende:
export LD_LIBRARY_PATH=(pwd)

Wywołanie pliku Code2 zastosować komendą (bedąc w katalogu z projektem):
./bin/Code2

//plik makefile
.PHONY: usun
.SUFFIXES: .cpp .o .a .so

vpath %.cpp ./src
vpath %.h ./incl
vpath %.a ./lib
vpath %.so ./lib

%2:
	g++ -o ./bin/$@ $^ -L ./lib
%2.o: %2.cpp
	g++ -c $< -L ./lib -I ./incl
%le.o: %le.cpp
	g++ -c $<
%sc.o: %sc.cpp
	g++ -fPIC -c $<
libp%.a: 
	ar rs ./lib/$@ $<
libo%.so: 
	g++ -shared -o ./lib/$@ $<

	
Code2: Code2.o libpole.a libobjetosc.so
Code2.o: Code2.cpp
pole.o: pole.cpp
objetosc.o: objetosc.cpp
libpole.a: pole.o
libobjetosc.so: objetosc.o
usun:
	rm -f ./bin/Code2 *.o ./lib/*.a ./lib/*.so
	
