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
		name: "Glen Xander Lacuin",
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

== (4)
From the plot above, $max(V_"out") = #qty(3.64, "V")$ and
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

== (4)

== (5)

== (6)
$V_"out"$ goes high when $V_"in" = #qty(-2.08, "V")$, and goes low when
$V_"in" = #qty(1.76, "V")$.

== (7)

== (8)

== (9)

== (10)
