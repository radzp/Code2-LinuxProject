
.PHONY: usun
.SUFFIXES: .cpp .o .a .so

%.o: %.cpp
	g++ -c $<
libp%.a: p%.o
	ar rs $@ $<
libo%.so: o%.o
	g++ -shared -o $@ $<
%: %.o
	g++ -o $@ $^
	
Code2: Code2.o libpole.a libobjetosc.so
Code2.o: Code2.cpp libpole.h libobjetosc.h
pole.o: pole.cpp
objetosc.o: objetosc.cpp
libpole.a: pole.o
libobjetosc.so: objetosc.o
usun:
	rm -f Code2 *.o *.a *.so
