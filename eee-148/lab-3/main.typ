#import "@preview/charged-ieee:0.1.4": ieee

#import "@preview/unify:0.7.1": num, qty
#import "@preview/zap:0.5.0"

#show: ieee.with(
	title: "EEE 148 Lab Report 3",
	abstract: [
		This report focuses on the LM741 operational amplifier to characterize,
		build, and compare a comparator and a Schmitt trigger circuit, and to
		understand both of their working principles. Some shortcomings of the
		LM741 are also identified.
	],
	authors: (
	(
		name: "Nile Xavier O. Jocson",
		department: "Electrical and Electronics Engineering Institute",
		organization: "University of the Philippines Diliman",
		location: "Quezon City, Philippines",
		email: "nile.xavier.jocson@eee.upd.edu.ph"
	),
	(
		name: "Glen Xander O. Lacuin",
		department: "Electrical and Electronics Engineering Institute",
		organization: "University of the Philippines Diliman",
		location: "Quezon City, Philippines",
		email: "glen.xander.lacuin@eee.upd.edu.ph"
	),
	),
	index-terms: ("Comparator", "Schmitt trigger", "LM741", "hysteresis", "operational amplifiers"),
	bibliography: none,
	figure-supplement: "Fig.",
)

#set table(
	align: left,
	inset: (x: 8pt, y: 4pt),
	stroke: (x, y) => if y <= 1 { (top: 0.5pt) },
	fill: (x, y) => if y > 0 and calc.rem(y, 2) == 0  { rgb("#efefef") },
)



= Introduction
Todo



= Methodology
== Materials
@t:mats shows the materials and their quantities used for the lab activity.

#figure(
	table(
		columns: 2,
		table.header[Item][Quantity],
		[Power Supply]            , num(1),
		[Signal Generator]        , num(1),
		[Oscilloscope]            , num(1),
		[Breadboard]              , num(1),
		[Jumper Wires]            , "as needed",
		[LM741 Op-Amp]            , num(1),
		[#qty(1, "kO") Resistor]  , num(2),
		[#qty(5.6, "kO") Resistor], num(1),
	),
	caption: [List of Materials]
) <t:mats>



= Comparator
== (3)
@i:c1.o and @i:c1.s show the oscilloscope output and an annotated sketch of
the output of the first comparator circuit.

#figure(
	image("assets/circuit1-oscilloscope.png"),
	caption: [Oscilloscope output of the first comparator circuit.]
) <i:c1.o>

#figure(
	image("assets/circuit1-sketch.png"),
	caption: [Annotated sketch of the output of the first comparator circuit.]
) <i:c1.s>

== (4)
From @i:c1.s, $max(V_"out") = #qty(3.64, "V")$ and
$min(V_"out") = #qty(-5.08, "V")$.

== (5)
$V_"out"$ rises to its maximum starts to rise to its maximum when
$V_"in" = #qty(1.2, "V")$, and starts to fall to its minimum when
$V_"in" = #qty(960, "mV")$.

== (6)
With $V_s$ increased to #qty(1.5, "V"), $V_"out"$ now starts to rise to its
maximum when $V_"in" = #qty(1.64, "V")$, and starts to fall to its minimum when
$V_"in" = #qty(1.36, "V")$.

== (7)
A comparator simply compares the voltages on its non-inverting and inverting
inputs, and outputs the positive supply voltage if $V_+ > V_-$, or the
negative supply voltage if $V_+ < V_-$. If $V_+ = V_-$, the output is
undefined. In Circuit 1, $V_"in"$ on the non-inverting input is being compared
to $V_s$ on the inverting input. The ideal behavior of this circuit is shown in
@f:c1.b.

$ V_"out" = cases(
	V_(s+) "if"& V_"in" > V_s,
	V_(s-) "if"& V_"in" < V_s
) $ <f:c1.b>

== (9)
@i:c2.o and @i:c2.s show the oscilloscope output and a sketch of the output of
the second comparator circuit.

#figure(
	image("assets/circuit2-oscilloscope.png"),
	caption: [Oscilloscope output of the second comparator circuit.]
) <i:c2.o>

#figure(
	image("assets/circuit2-sketch.png"),
	caption: [Sketch of the output of the second comparator circuit.]
) <i:c2.s>

== (10)
As $V_"in"$ is now connected to the inverting input of the op-amp, the behavior
is simply the inverted behavior of Circuit 1. Note however, that the overall
behavior of the op-amp itself is unchanged; only the order of the inputs were
changed. The ideal behavior is shown in @f:c2.b.

$ V_"out" = cases(
	V_(s+) "if"& V_"in" < V_s,
	V_(s-) "if"& V_"in" > V_s
) $ <f:c2.b>

== (11)
Circuit 1 is a non-inverting comparator while Circuit 2 is an inverting
comparator.



= Schmitt Trigger

== (3)
@i:c3.o and @i:c3.s show the oscilloscope output and a sketch of the output of
the first Schmitt trigger circuit.

#figure(
	image("assets/circuit3-oscilloscope.png"),
	caption: [Oscilloscope output of the first Schmitt Trigger circuit.]
) <i:c3.o>

#figure(
	image("assets/circuit3-sketch.png"),
	caption: [Sketch of the output of the first Schmitt Trigger circuit.]
) <i:c3.s>

== (4)
From @i:c3.s, $max(V_"out") = #qty(3.68, "V")$,
$min(V_"out") = #qty(-4.32, "V")$, $max(V_"th") = #qty(1.76, "V")$, and
$min(V_"th") = #qty(-2.16, "V")$.

== (5)
By voltage division, we have:

$ V_"th" = V_"out" (R_2/(R_1 + R_2)) $ <f:c3.th>

$V_"th"$ is simply $V_"out"$ multiplied by a factor dependent on the given
resistors.

== (6)
$V_"out"$ goes high when $V_"in" = #qty(-2.08, "V")$, and goes low when
$V_"in" = #qty(1.76, "V")$.

== (7)
Using @f:c3.th and assuming that $V_"out" = V_(s+)$, we can derive the high
threshold of the Schmitt trigger:

$ V_"th" = V_"HT" = V_(s+) (R_2/(R_1 + R_2)) $

Similarly, we can also derive the low threshold of the Schmitt trigger by
assuming that $V_"out" = V_(s-)$:

$ V_"th" = V_"LT" = V_(s-) (R_2/(R_1 + R_2)) $

At its core, the Schmitt trigger is simply a comparator circuit with positive
feedback, enabling hysteresis. Note that this particular Schmitt trigger
inverts its output as the input is fed through the inverting input of the
op-amp. The behavior of this circuit is shown in @f:c3.il if
$V_"out" = V_(s-)$ initially.

$ V_"out" = cases(
	V_(s+) "if"& V_"in" < V_"LT",
	V_(s-) "if"& V_"in" > V_"LT"
) $ <f:c3.il>

Conversely, if $V_"out" = V_(s+)$, the behavior is as follows in @f:c3.ih.

$ V_"out" = cases(
	V_(s-) "if"& V_"in" > V_"HT",
	V_(s+) "if"& V_"in" < V_"HT"
) $ <f:c3.ih>

Simply put, $V_"out"$ stays the same if $V_"in"$ does not pass $V_"LT"$ if
$V_"out"$ is low, or does not pass $V_"HT"$ if $V_"out"$ is high. Otherwise,
$V_"out"$ toggles from low to high or vice-versa.

== (8)
@i:c3.h shows the hysteresis curve of the first Schmitt trigger circuit.

#figure(
	image("assets/circuit3-hysteresis.png"),
	caption: [Hysteresis curve of the first Schmitt trigger circuit.]
) <i:c3.h>

The hysteresis voltage can then be calculated as shown in @f:c3.h.

$ V_H = V_"HT" - V_"LT" = #qty(3.92, "V") $ <f:c3.h>

== (9)
@i:c4.h shows the hysteresis curve of the second Schmitt trigger circuit, with
a #qty(1, "V") source added below $R_2$.

#figure(
	image("assets/circuit4-hysteresis.png"),
	caption: [Hysteresis curve of the second Schmitt trigger circuit.]
) <i:c4.h>

We have that $V_H = #qty(3.84, "V")$, which is almost the same as before. The
only thing that changed is the positive offsetting of $V_"LT"$ and $V_"HT"$.


== (10)
@i:c5.o and @i:c5.s show the oscilloscope output and a sketch of the output of
the third Schmitt trigger circuit.

#figure(
	image("assets/circuit5-oscilloscope.png"),
	caption: [Oscilloscope output of the third Schmitt Trigger circuit.]
) <i:c5.o>

#figure(
	image("assets/circuit5-sketch.png"),
	caption: [Sketch of the output of the third Schmitt Trigger circuit.]
) <i:c5.s>

By changing $R_2$ into a #qty(5.6, "kO") resistor, both $V_"LT"$ and $V_"HT"$
were changed, and $V_H$ is now smaller. The output voltage swing is unchanged.
