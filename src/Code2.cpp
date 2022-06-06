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
