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
