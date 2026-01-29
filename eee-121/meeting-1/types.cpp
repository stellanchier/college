#include <iostream>

int main()
{
	std::cout
		<< "Sizes of C++ primitive types\n\n"
		<< "Type\t| "   << "Size (in bytes)\n"
		<< "-------------------------\n"
		<< "bool\t| "   << sizeof(bool)   << '\n'
		<< "short\t| "  << sizeof(short)  << '\n'
		<< "int\t| "    << sizeof(int)    << '\n'
		<< "long\t| "   << sizeof(long)   << '\n'
		<< "float\t| "  << sizeof(float)  << '\n'
		<< "double\t| " << sizeof(double) << '\n'
		<< "char\t| "   << sizeof(char)   << '\n';
}
