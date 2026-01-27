#include <iostream>

int sum_proper_divisors(int n)
{
	int sum = 0;

	for (int i = 1; i < n; ++i)
	{
		if (n % i == 0)
		{
			sum += i;
		}
	}

	return sum;
}

bool is_perfect_number(int n)
{
	if (n <= 0)
	{
		return false;
	}

	return sum_proper_divisors(n) == n;
}

int main()
{
	int sum = 0;

	for (int i = 0; i < 10000; ++i)
	{
		if (is_perfect_number(i))
		{
			sum += i;
		}
	}

	std::cout << "Sum of all perfect numbers below 10000: " << sum << '\n';
}
