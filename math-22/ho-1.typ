#import "@preview/physica:0.9.8": dd, evaluated
#import "@preview/mannot:0.3.1": markhl

#set text(font: "New Computer Modern")

= Math 22 HO1

2026-01-23

=== 1.
(Lec 01 HOs. Exercises. 5)
$ integral_1^2 (x + 1) ln x dd(x) $

Solve for the indefinite integral. Use IBP with:
- $u = ln x$, $dd(v) = (x + 1) dd(x)$
- $dd(u) = 1/x dd(x)$, $v = x^2/2 + x$

$ integral (x + 1) ln x dd(x)
	=& ln x (x^2/2 + x) - integral (x^2/2 + x) 1/x dd(x) \
	=& ln x (x^2/2 + x) - integral (1/2 x + 1) dd(x) \
	=& ln x (x^2/2 + x) - 1/2 integral x dd(x) + integral dd(x) \
	=& ln x (x^2/2 + x) - 1/2 (x^2/2) + x \
	=& ln x (x^2/2 + x) - x^2/4 + x $

Solve for the definite integral.

$ integral_1^2 (x + 1) ln x dd(x)
	=& [ln x (x^2/2) + x - x^2/4 - x]_1^2 \
	=& [ln 2 (4/2 + 2) - 4/4 - 2] - [ln 1 (1/2 + 1) - 1/4 - 1] \
	=& (4 ln 2 - 3) - (-1/4 - 4/4) \
	=& 4 ln 2 - 12/4 + 5/4 \
	=& markhl(4 ln 2 - 7/4) $

#pagebreak()

=== 2.
(Lec 02 HOs. Exercises. I. 7)
$ integral (sec^6(ln x))/x dd(x) $

Substitute with $u = ln x$, $dd(u) = 1/x dd(x)$:

$ integral (sec^6(ln x))/x dd(x)
	=& integral sec^6 u dd(u) \
	=& integral sec^2 u sec^4 u dd(u) \
	=& integral sec^2 u (sec^2 u)^2 dd(u) \
	=& integral sec^2 u (1 + tan^2 u)^2 dd(u) $

Substitute with $v = tan u$, $dd(v) = sec^2 u dd(u)$:

$ integral (sec^6(ln x))/x dd(x)
	=& integral (1 + v^2)^2 dd(v) \
	=& integral (1 + 2v^2 + v^4) dd(v) \
	=& integral dd(v) + 2 integral v^2 dd(v) + integral v^4 dd(v) \
	=& v + 2/3 v^3 + v^5/5 \
	=& tan u + 2/3 tan^3 u + 1/5 tan^5 u \
	=& markhl(tan(ln x) + 2/3 tan^3(ln x) + 1/5 tan^5(ln x) + C) $
