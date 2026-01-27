#include <cstdlib>
#include <iostream>

int main()
{
	int number {};
	std::cout << "Enter a single-digit number: ";
	std::cin >> number;

	if (std::cin.fail())
	{
		std::cout << "Your input is not a number.";
		return EXIT_FAILURE;
	}

	if (number < -9 || number > 9)
	{
		std::cout << "Your number is not a single digit.";
		return EXIT_FAILURE;
	}

	if (number % 2 == 0)
	{
		std::cout << number << " is even." << '\n';
	}
	else
	{
		std::cout << number << " is odd." << '\n';
	}
}
