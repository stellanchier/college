#include <ios>
#include <iostream>
#include <limits>
#include <string>

template<typename T, typename Callable>
T input_predicate(std::string const &prompt, Callable predicate)
{
	T input {};
	while (true)
	{
		std::cout << prompt;
		std::cin >> input;

		if (std::cin.fail() || !predicate(input))
		{
			std::cout << "Invalid input.\n";
			std::cin.clear();
			std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
			continue;
		}

		break;
	}

	return input;
}

int main()
{
	auto number = input_predicate<int>("Enter a two-digit positive integer: ", [](auto const i) -> bool {
		return i >= 10 && i <= 99;
	});

	for (int i = 9; i < number; i += 9)
	{
		std::cout << i << '\n';
	}
}
