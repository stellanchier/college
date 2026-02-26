// 2024-00045
// exercise8_JOCSON

#include <iostream>
#include <string>



void countdown(int const n)
{
	if (n <= 0) { return; }

	if (n == 1)
	{
		std::cout << "1";
		return;
	}

	std::cout << n;

	countdown(n - 1);

	std::cout << n;
}

void reverse(std::string const &str)
{
	if (str.length() == 0) { return; }

	std::cout << str.back();

	reverse(str.substr(0, str.length() - 1));
}

int sum(int const n)
{
	if (n <= 9) { return n; }

	return n % 10 + sum(n / 10);
}



int main()
{
	int n;
	std::cout << "A. Input N: ";
	std::cin >> n;
	countdown(n);
	std::cout << "\n\n";

	std::string str;
	std::cout << "B. Input a string: ";
	std::cin >> str;
	reverse(str);
	std::cout << "\n\n";

	int m;
	std::cout << "C. Input a number: ";
	std::cin >> m;
	std::cout << sum(m);
	std::cout << "\n\n";
}
