// 2024-00045
// exercise6_JOCSON

#include <algorithm>
#include <array>
#include <iostream>
#include <random>



template<typename T, std::size_t N>
std::size_t find(std::array<std::array<T, N>, N> const &matrix, T const x)
{
	std::size_t row = 0;
	std::size_t col = 0;

	for (; row < N - 1; ++row)
	{
		if (matrix[row + 1][0] > x)
		{
			break;
		}
	}

	if (row == N) { return N * N; }

	for (; col < N; ++col)
	{
		if (matrix[row][col] == x)
		{
			break;
		}
	}

	if (col == N) { return N * N; }

	return row * N + col;
}



int main()
{
	std::array<int, 100> numbers {};

	auto seed = std::random_device()();
	std::iota(numbers.begin(), numbers.end(), 0);
	std::shuffle(numbers.begin(), numbers.end(), std::mt19937(seed));
	std::sort(numbers.begin(), numbers.begin() + 16);

	std::array<std::array<int, 4>, 4> matrix {};
	for (std::size_t i = 0; i < 4; ++i)
	{
		for (std::size_t j = 0; j < 4; ++j)
		{
			matrix[i][j] = numbers[i * 4 + j];
		}
	}

	std::cout << "The 4x4 matrix:\n";
	for (auto const &row: matrix)
	{
		for (auto const x: row)
		{
			std::cout << x << '\t';
		}
		std::cout << '\n';
	}
	std::cout << '\n';

	int x;
	std::cout << "What value would you like to find: ";
	std::cin >> x;

	auto index = find(matrix, x);
	if (index == 16)
	{
		std::cout << x << " is not in the matrix.\n";
	}
	else
	{
		std::cout << "Flattened index of " << x << ": " << index << '\n';
	}
}
