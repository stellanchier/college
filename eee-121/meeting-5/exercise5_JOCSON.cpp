// 2024-00045
// exercise5_JOCSON

#include <cmath>
#include <iostream>



template<typename T>
class Vector2
{
public:
	Vector2(T const x, T const y); // (b)

	void display() const; // (c)
	double magnitude() const; // (d)
	T dot(Vector2 const &other) const; // (f)

	Vector2 operator+(Vector2 const &other) const; // (g)
	Vector2 operator-(Vector2 const &other) const; // (h)
	Vector2 operator*(int const scalar) const; // (i)

private: // (a)
	T m_x;
	T m_y;
};

template<typename T> // (b)
Vector2<T>::Vector2(T const x, T const y) :
	m_x { x },
	m_y { y }
{}

template<typename T> // (c)
void Vector2<T>::display() const
{
	std::cout << '<' << m_x << ", " << m_y << '>';
}

template<typename T> // (d)
double Vector2<T>::magnitude() const
{
	return std::sqrt(m_x * m_x + m_y * m_y);
}

template<typename T> // (f)
T Vector2<T>::dot(Vector2<T> const &other) const
{
	return m_x * other.m_x + m_y * other.m_y;
}

template<typename T> // (g)
Vector2<T> Vector2<T>::operator+(Vector2<T> const &other) const
{
	return Vector2<T>(m_x + other.m_x, m_y + other.m_y);
}

template<typename T> // (h)
Vector2<T> Vector2<T>::operator-(Vector2<T> const &other) const
{
	return Vector2<T>(m_x - other.m_x, m_y - other.m_y);
}

template<typename T> // (i)
Vector2<T> Vector2<T>::operator*(int const scalar) const
{
	return Vector2<T>(m_x * scalar, m_y * scalar);
}



int main() // (e)
{
	Vector2<int> a(1, 1);
	Vector2<int> b(2, 3);
	int scalar = 2;

	std::cout << "a = ";
	a.display();
	std::cout << '\n';

	std::cout << "b = ";
	b.display();
	std::cout << '\n';

	std::cout << '\n';

	std::cout << "||a|| = " << a.magnitude() << '\n';
	std::cout << "a . b = " << a.dot(b) << '\n';

	std::cout << '\n';

	std::cout << "a + b = ";
	(a + b).display();
	std::cout << '\n';

	std::cout << "a - b = ";
	(a - b).display();
	std::cout << '\n';

	std:: cout << "a * " << scalar << " = ";
	(a * scalar).display();
	std::cout << '\n';
}
