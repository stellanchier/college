#import "@preview/charged-ieee:0.1.4": ieee
#import "@preview/unify:0.7.1": num, qty

#show: ieee.with(
	title: "EEE 148 Lab Report 2",
	abstract: none,
	authors: (
	(
		name: "Nile Xavier O. Jocson",
		department: [Electrical and Electronics Engineering Institute],
		organization: [University of the Philippines Diliman],
		location: [Quezon City, Philippines],
		email: "nile.xavier.jocson@eee.upd.edu.ph"
	),
	(
		name: "Carl Angelo P. Gil",
		department: [Electrical and Electronics Engineering Institute],
		organization: [University of the Philippines Diliman],
		location: [Quezon City, Philippines],
		email: "cal.angelo.gil@eee.upd.edu.ph"
	),
	),
	index-terms: (),
	bibliography: none,
	figure-supplement: "Fig.",
)

#set table(
	align: left,
	inset: (x: 8pt, y: 4pt),
	stroke: (x, y) => if y <= 1 { (top: 0.5pt) },
	fill: (x, y) => if y > 0 and calc.rem(y, 2) == 0  { rgb("#efefef") },
)

= Low-Pass Filter
== (1)
@t:avlpf shows the actual values of the components used for the Sallen-Key
low-pass filter.

#figure(
	table(
		columns: 2,
		table.header[Component][Actual value],
		"R1", qty(7.4196, "kO"),
		"R2", qty(7.5374, "kO"),
		"R3", qty(7.5298, "kO"),
		"R4", qty(7.617, "kO"),
		"C1", qty(30.1, "nF"),
		"C2", qty(11.38, "nF")
	),
	caption: "Actual Values of the Low-Pass Filter Circuit"
) <t:avlpf>

== (3)
The output settles at around #qty(6, "V")DC when a #qty(6, "V")DC input is
applied. The capacitors function as open circuits does to their extremely high
impedance at DC. As a result, the circuit reduces into a resistive unity-gain
op-amp configuration, causing the DC gain to be equal to one, as shown in
@f:glpf.

$ G = 20log(V_"out"/V_"in") = 20log(#qty(6, "V")/#qty(6, "V")) = 0 $ <f:glpf>

== (5)
@t:oglpf shows the output and gain of the low-pass filter on an #qty(8, "V")pp
sine wave with varying frequencies. Note that the output sine wave of the
circuit started showing 'spikes' at around #qty(1.5, "kHz"). At
#qty(10, "kHz"), the spiking became so prominent that it started being measured
as the peak of the wave, causing the $V_"out,pp"$ for that frequency to be
higher than the previous one.

#figure(
	table(
		columns: 3,
		table.header[Frequency][$V_"out,pp"$][Gain (dB)],
		qty(200, "Hz") , qty(8, "V")   , num(0),
		qty(400, "Hz") , qty(8, "V")   , num(0),
		qty(600, "Hz") , qty(8, "V")   , num(0),
		qty(800, "Hz") , qty(7.76, "V"), num(-0.2645),
		qty(1, "kHz")  , qty(7.04, "V"), num(-1.1103),
		qty(1.5, "kHz"), qty(4.72, "V"), num(-4.5829),
		qty(1.6, "kHz"), qty(4.40, "V"), num(-5.1927),
		qty(2, "kHz")  , qty(3.04, "V"), num(-8.4043),
		qty(3, "kHz")  , qty(1.52, "V"), num(-14.4249),
		qty(4, "kHz")  , qty(896, "mV"), num(-19.0156),
		qty(8, "kHz")  , qty(344, "mV"), num(-27.3306),
		qty(10, "kHz") , qty(432, "mV"), num(-25.3521),
	),
	caption: "Output and Gain of the Low-Pass Filter Circuit"
) <t:oglpf>

== (6)
The signal amplitude dropped to $#qty(8, "V")/sqrt(2) approx #qty(5.656, "V")$
at around #qty(1.28, "kHz"), making this the cutoff frequency for this particular
circuit.

== (7)
The actual cutoff frequency of the low-pass filter does not match the
theoretical cutoff frequency of #qty(1.5, "kHz"). This is most likely due to
the actual values of the components, which do not perfectly match the ideal
values in the given specification.
