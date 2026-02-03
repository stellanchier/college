// 2024-00045
// exercise4_JOCSON

#include <cmath>
#include <iostream>



class Point
{
public:
	// Ctors
	Point(int const x, int const y); // (b)
	Point(); // (f)

	// Dtors
	~Point(); // (c)

	// Methods
	void display() const; // (d)
	float distance_from(Point const &other) const; // (h)

	// Getters (e)
	int get_x() const;
	int get_y() const;

	// Setters (g)
	void set_x(int const x);
	void set_y(int const y);

private:
	// Private members (a)
	int m_x;
	int m_y;
};



// Point member function definitions
Point::Point(int const x, int const y) : // (b)
	m_x { x },
	m_y { y }
{}

Point::Point() : // (f)
	m_x { 0 },
	m_y { 0 }
{}

Point::~Point() // (c)
{
	std::cout << "Coordinates of the point to be destructed: ";
	display();
	std::cout << '\n';
}

void Point::display() const // (d)
{
	std::cout << '(' << m_x << ", " << m_y << ')';
}

float Point::distance_from(Point const &other) const // (h)
{
	auto dx = other.m_x - this->m_x;
	auto dy = other.m_y - this->m_y;

	return std::sqrt(dx * dx + dy * dy);
}

// (e)
int Point::get_x() const { return m_x; }
int Point::get_y() const { return m_y; }

// (g)
void Point::set_x(int const x) { m_x = x; }
void Point::set_y(int const y) { m_y = y; }



int main() // (i)
{
	// Create two points
	Point a(9, 4);
	Point b(1, 2);

	// Display point a
	std::cout << "Point a = ";
	a.display();
	std::cout << '\n';

	// Display point b
	std::cout << "Point b = ";
	b.display();
	std::cout << '\n';

	// Get distance between points a & b then display
	auto distance = a.distance_from(b);
	std::cout << "The distance between points a & b is " << distance << '\n'; // (j)

	// Dtors called after main() has been run
}
