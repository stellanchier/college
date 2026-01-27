#include <ios>
#include <iostream>
#include <limits>

int main()
{
	int number = 0;

	while (true)
	{
		std::cout << "Enter a two-digit positive number: ";
		std::cin >> number;

		if (std::cin.fail() || number < 10 || number > 99)
		{
			std::cout << "Invalid input.\n";
			std::cin.clear();
			std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
			continue;
		}

		break;
	}

	for (int i = 9; i < number; i += 9)
	{
		std::cout << i << '\n';
	}
}
