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
