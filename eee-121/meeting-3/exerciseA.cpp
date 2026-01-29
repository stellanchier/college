#include <iostream>

int *create_array(int const size)
{
	return new int[size];
}

int main()
{
	auto student_number = "202400045";

	auto array = create_array(9);
	for (int i = 0; i < 9; ++i)
	{
		array[i] = student_number[i] - '0';
	}

	std::cout << "My student number: ";
	for (int i = 0; i < 9; ++i)
	{
		std::cout << array[i];
	}
	std::cout << '\n';

	delete[] array;
}
