
.PHONY: usun
.SUFFIXES: .cpp .o .a .so

.cpp.o:
	g++ -c $<
.o:
	g++ -o $@ $^

Code2: Code2.o libpole.a libobjetosc.so
Code2.o: Code2.cpp libpole.h libobjetosc.h
pole.o: pole.cpp
objetosc.o: objetosc.cpp
libpole.a: pole.o
	ar rs $@ $<
libobjetosc.so: objetosc.o
	g++ -shared -o $@ $<
usun:
	rm -f Code2 *.o *.a *.so
