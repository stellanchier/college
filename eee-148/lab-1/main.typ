#import "@preview/charged-ieee:0.1.4": ieee
#import "@preview/unify:0.7.1": qty

#show: ieee.with(
	title: [EEE 148 Lab Report 1],
	abstract: none,
	authors: (
	(
		name: "Nile Jocson",
		department: [Electrical and Electronics Engineering Institute],
		organization: [University of the Philippines Diliman],
		location: [Quezon City, Philippines],
		email: "nile.xavier.jocson@eee.upd.edu.ph"
	),
	),
	index-terms: (),
	bibliography: none,
	figure-supplement: [Fig.],
)

= Practice Exercises
== <1.1>
Plots of the inputs and outputs of the four diode circuits are shown in
@a1.1.c1, @a1.1.c2, @a1.1.c3 and @a1.1.c4.

#figure(
	image("ltspice/plot-1.1.1.png"),
	caption: [
		Plot of the input and output for Circuit 1.
	]
) <a1.1.c1>

#figure(
	image("ltspice/plot-1.1.2.png"),
	caption: [
		Plot of the input and output for Circuit 2.
	]
) <a1.1.c2>

#figure(
	image("ltspice/plot-1.1.3.png"),
	caption: [
		Plot of the input and output for Circuit 3.
	]
) <a1.1.c3>

#figure(
	image("ltspice/plot-1.1.4.png"),
	caption: [
		Plot of the input and output for Circuit 4.
	]
) <a1.1.c4>

a. Measuring the negative peak of the output in @a1.1.c1, the forward voltage of the 1N4148 diode is #qty(653, "mV").

b. The period of the input is $1/#qty(1, "kHz") = #qty(1, "ms")$, which means
that five full-cycles is #qty(5, "ms") long.

==
Based on the plots from @1.1, the function of each circuit are as follows:

a. Circuit 1 is a shunt negative clipper,

b. Circuit 2 is a series negative clipper,

c. Circuit 3 is a positive clamper, and

d. Circuit 4 is a peak voltage detector.

==
a. The capacitance used in order to get the required cutoff frequency is around
#qty(60, "nF"). This can be found by finding the capacitance needed to have a
peak output voltage of $1/sqrt(2) V_"in,max"$ with $f = #qty(2.65, "kHz")$ and
$R = #qty(1, "kO")$. This is reinforced by using the equation for cutoff
frequency as shown in @a1.3.rceq.

$ f_c = 1/(2 pi R C) <=> C = 1/(2 pi R f_c) approx #qty(60, "nF") $ <a1.3.rceq>

#figure(
	image("ltspice/plot-1.3.rc.png"),
	caption: [
		Plot of the input and output of the RC circuit, with
		capacitance stepped from #qty(10, "nF") to #qty(100, "nF") in
		#qty(10, "nF") increments. $f = #qty(2.65, "kHz")$ and
		$R = #qty(1, "kO")$.
	]
) <a1.3.rc>

b. Because the output leads the input, the RC circuit is a high-pass filter.
This is also confirmed by the bode plot in @a1.3.rcb, which shows the
attenuation of amplitude for frequencies lower than #qty(2.65, "kHz").

#figure(
	image("ltspice/plot-1.3.rcb.png"),
	caption: [
		Bode plot of the output voltage of the RC circuit. $R = #qty(1, "kO")$
		and $C = #qty(60, "nF")$.
	]
) <a1.3.rcb>

c. The inductance used in order to get the required cutoff frequency is around
#qty(70, "mH"). This can be found in the same way as was done with the RC
circuit, but with $f = #qty(227, "Hz")$ and $R = #qty(100, "O")$. The same
result can be found using the equation for cutoff frequency as shown in
@a1.3.rleq.

$ f_c = R/(2 pi L) <=> L = R/(2 pi f_c) approx #qty(70, "mH") $ <a1.3.rleq>

#figure(
	image("ltspice/plot-1.3.rl.png"),
	caption: [
		Plot of the input and output of the RL circuit, with
		inductance stepped from #qty(10, "mH") to #qty(100, "mH") in
		#qty(10, "nF") increments. $f = #qty(227, "Hz")$ and
		$R = #qty(100, "O")$.
	]
) <a1.3.rl>

d. Because the input leads the output, the RL circuit is a low-pass filter.
This is also confirmed by the bode plot in @a1.3.rlb, which shows the
attenuation of amplitude for frequencies above #qty(227, "Hz").

#figure(
	image("ltspice/plot-1.3.rlb.png"),
	caption: [
		Bode plot of the output voltage of the RC circuit. $R = #qty(100, "O")$
		and $L = #qty(70, "mH")$.
	]
) <a1.3.rlb>

e. For the configurations of the RL and RC circuits given, the usage of an
inductor or capacitor turns the circuit into a low-pass or high-pass filter
respectively. In the low-pass RL filter, the inductor acts as a short in low
frequencies, and an open in high frequencies. The reverse is true for the
high-pass RC circuit.
