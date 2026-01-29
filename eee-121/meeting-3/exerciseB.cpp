#include <cstring>
#include <iomanip>
#include <iostream>

void reverse_string(char *const str)
{
	auto len = std::strlen(str);

	for (std::size_t i = 0; i < len / 2; ++i)
	{
		auto temp = str[i];
		str[i] = str[len - 1 - i];
		str[len - 1 - i] = temp;
	}
}

int main()
{
	char word[16] = "";

	std::cout << "Enter a word (15 characters max): ";
	std::cin >> std::setw(15) >> word;

	std::cout << "Your word: " << word << '\n';
	reverse_string(word);
	std::cout << "Reversed: " << word << '\n';
}
