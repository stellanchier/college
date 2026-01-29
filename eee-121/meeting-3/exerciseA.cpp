#include <iostream>

int *create_array(int const size)
{
	return new int[size];
}

int main()
{
	int student_number[] = {2, 0, 2, 4, 0, 0, 0, 4, 5};

	auto *array = create_array(9);
	for (int i = 0; i < 9; ++i)
	{
		array[i] = student_number[i];
	}

	std::cout << "My student number: ";
	for (int i = 0; i < 9; ++i)
	{
		std::cout << array[i];
	}
	std::cout << '\n';

	delete[] array;
}
