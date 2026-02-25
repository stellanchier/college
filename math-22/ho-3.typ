#import "@preview/physica:0.9.8": dd, evaluated
#import "@preview/mannot:0.3.1": markhl

#set text(font: "New Computer Modern")

= Math 22 HO3

2026-02-26

=== 1.
(Lec 06 HOs. Exercises. III. 2)

Determine whether the sequence is increasing, decreasing, or neither.

$ {5^n/n!}_(n = 1)^(+oo) $

Let $a_n = 5^n/n!$. $a_n$ is positive for all $n >= 1$ because $5^n$ and $n!$
are both positive for all $n >= 1$. We then have:

$ a_(n + 1)/a_n = 5^(n + 1)/(n + 1)! dot n!/5^n = 5/(n + 1) $

Since $a_(n + 1)/a_n <= 1$ for all $n >= 4$, the sequence ultimately decreases.

#align(right, $qed$)

=== 2.
(Lec 07 HOs. Exercises. I. 15)

Determine whether the series converges or diverges.

$ sum_(n = 1)^(+oo) root(n, 2) $

Let $a_n = root(n, 2)$. We have:

$ lim_(n -> +oo) a_n = lim_(n -> +oo) root(n, 2) = lim_(n -> +oo) 2^(1/n) = 2^0 = 1 $

By the Divergence Test, because $lim_(n -> +oo) a_n != 0$,
$sum_(n = 1)^(+oo) a_n$ is divergent.

#align(right, $qed$)
