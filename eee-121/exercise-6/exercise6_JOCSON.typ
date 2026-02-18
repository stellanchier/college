#import "@preview/lovelace:0.3.0": *
#import "@preview/mannot:0.3.1": markhl
#import "@preview/unify:0.7.1": qty
#import "@preview/zero:0.6.1": num, set-num

#set text(font: "New Computer Modern")

#set-num(digits: 2, exponent: "eng")

= EEE 121 Exercise 6

2026-02-19

== 1.
In increasing order of growth rate:
+ $2$
+ $log_3 n$
+ $log_2 n$
+ $20n$
+ $n^(2/3)$
+ $4n^2$
+ $3^n$
+ $n!$



== 2.
=== a.

=== b.

=== c.



== 3.
=== a.
For linear time:

$ T_(n)(500) = #qty(0.5, "ms") (500/100) = markhl(#qty(2.5, "ms")) $

=== b.
For log-linear time:

$ T_(n log n)(500) = #qty(0.5, "ms") ((500 log 500)/(100 log 100)) approx markhl(#qty(3.37, "ms")) $

=== c.
For quadratic time:

$ T_(n^2)(500) = #qty(0.5, "ms") (500^2/100^2) = markhl(#qty(12.5, "ms")) $

=== d.
For cubic time:

$ T_(n^3)(500) = #qty(0.5, "ms") (500^3/100^3) = markhl(#qty(62.5, "ms")) $



== 4.
=== a.
For linear time:

$
	1 =& 0.005 (n/100) \
	200 =& n/100 \
	markhl(n =& 20000)
$

=== b.
For log-linear time:

$
	1 =& 0.005 ((n log n)/(100 log 100)) \
	1 =& (n log n)/(20000 log 100) \
	20000 log 100 =& n log n \
	markhl(n approx& 10000)
$

=== c.
For quadratic time:

$
	1 =& 0.005 (n^2/100^2) \
	200 =& n^2/10000 \
	2000000 =& n^2 \
	markhl(n approx& 1414)
$

=== d.
For cubic time:

$
	1 =& 0.005 (n^3/100^3) \
	200 =& n^3/1000000 \
	200000000 =& n^3 \
	markhl(n approx& 584)
$



== 5.
=== a.
Say $N = 10001$:

$ T_A (10001) = 150N log N approx #num(19.933e6) $
$ T_B (10001) = N^2 approx #num(100.020e6) $

$T_B (10001) < T_A (10001)$, and since $150N log N$ grows slower
than $N^2$, $T_B (N) < T_A (N)$ for all $N > 10000$. Therefore, program B has
a better guarantee for this constraint.

=== b.
Say $N = 99$:

$ T_A (99) = 150N log N approx #num(98.445e3) $
$ T_B (99) = N^2 approx #num(9.801e3) $

$T_A (99) < T_B (99)$, and since $T_B$ has a factor of $150N$ and
$log_2 N >= 1$ for all $N >= 2$, we have that $T_A (N) < T_B (N)$ for all
$N in [2, 100]$. Therefore, program A has a better guarantee for this
constraint.

=== c.
Since we only know the worst-case complexities, the faster program on average
cannot be determined.

=== d.
Indeed, it is possible, since $T_B (N) = N^2$ is just a worst-case. Consider
the following:

$ T_B (N) = cases(
	0   &"if" N = 0,
	N^2 &"if" N in [2, 100],
	N   &"if" N > 100
) $

The worst-case is still $N^2$, but it would now be consistently faster than
program A for all inputs.



== 6.
