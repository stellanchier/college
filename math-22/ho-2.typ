#import "@preview/physica:0.9.8": dd, evaluated
#import "@preview/mannot:0.3.1": markhl

#set text(font: "New Computer Modern")

= Math 22 HO1

2026-01-30

=== 1.
(Lec 03 HOs. Exercises. I. 5)
$ integral dd(x)/(x^2 sqrt(x^2 - 16)) $

Let $x = 4 sec theta$, $dd(x) = 4 sec theta tan theta dd(theta)$. Then $sqrt(x^2 - 16) = 4 tan theta.$

$ integral dd(x)/(x^2 sqrt(x^2 - 16))
	=& integral (4 sec theta tan theta)/(16 sec^2 theta dot 4 tan theta) dd(theta) \
	=& 1/16 integral 1/(sec theta) dd(theta) \
	=& 1/16 integral cos theta dd(theta) \
	=& 1/16 sin theta $

Note that $sec theta = H/A = x/4$ and $tan theta = O/A = sqrt(x^2 - 16)/4$, and that $sin theta = O/H$.

$ integral dd(x)/(x^2 sqrt(x^2 - 16))
	=& 1/16 dot sqrt(x^2 - 16)/x \
	=& markhl(sqrt(x^2 - 16)/(16x) + C) $

#pagebreak()

=== 2.
(Lec 04 HOs. Exercises. II. 1)
$ integral_0^2 3/(4x^2 + 5x + 1) dd(x) $

Solve for the indefinite integral.
$ integral 3/(4x^2 + 5x + 1) dd(x)
	=& 3 integral 1/(4x^2 + 5x + 1) dd(x) $

Decomposing:
$ 1/(4x^2 + 5x + 1) =& 1/(4x^2 + 4x + x + 1) \
	=& 1/((4x + 1)(x + 1)) \
	=& A/(4x + 1) + B/(x + 1) $
$ 1 =& A(x + 1) + B(4x + 1) $

Substituting $x = -1$:
$ 1 = A(-1 + 1) + B(4(-1) + 1) = -3B $
$ B =& -1/3 $

Substituting $x = -1/4$:
$ 1 = A(-1/4 + 1) + B(4(-1/4) + 1) = 3/4 A $
$ A =& 4/3 $

$ integral 3/(4x^2 + 5x + 1) dd(x)
	=& 3 integral 4/(3(4x + 1)) dd(x) + 3 integral -1/(3(x + 1)) dd(x) \
	=& 4 integral 1/(4x + 1) dd(x) - integral 1/(x + 1) dd(x) \
	=& 4 dot 1/4 ln abs(4x + 1) - ln abs(x + 1) \
	=& ln abs(4x + 1) - ln abs(x + 1) $

Solve for the definite integral.
$ integral_0^2 3/(4x^2 + 5x + 1) dd(x)
	=& (ln abs(4x + 1) - ln abs(x + 1))_0^2 \
	=& ln abs(4(2) + 1) - ln abs(2 + 1) - ln abs(4(0) + 1) + ln abs(0 + 1) \
	=& ln abs(9) - ln abs(3) - ln abs(1) + ln abs(1) \
	=& 2 ln 3 - ln 3 \
	=& markhl(ln 3) $
