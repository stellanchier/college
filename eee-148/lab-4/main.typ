#import "@preview/charged-ieee:0.1.4": ieee

#import "@preview/unify:0.7.1": num, qty, qtyrange
#import "@preview/zap:0.5.0"

#show: ieee.with(
	title: "EEE 148 Lab Report 4",
	abstract: [

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
		name: "Florentino Cruz III",
		department: "Electrical and Electronics Engineering Institute",
		organization: "University of the Philippines Diliman",
		location: "Quezon City, Philippines",
		email: "@eee.upd.edu.ph"
	),
	),
	index-terms: ("",),
	bibliography: none,
	figure-supplement: "Fig.",
)

#set table(
	align: left,
	inset: (x: 8pt, y: 4pt),
	stroke: (x, y) => if y <= 1 { (top: 0.5pt) },
	fill: (x, y) => if y > 0 and calc.rem(y, 2) == 0  { rgb("#efefef") },
)

#let qty = qty.with(per: "\/")



= Introduction



= Methodology
== Materials
@t:mats shows the materials and their quantities used for the lab activity.

#figure(
	table(
		columns: 4,
		stroke: (x, y) => {
			if y <= 1 { (top: 0.5pt) }
			if x == 1 { (right: 0.5pt) }
		},
		table.header[Item][Quantity][Item][Quantity],
		[Power Supply]            , num(1),
		[Signal Generator]        , num(1),
		[Oscilloscope]            , num(1),
		[Breadboard]              , num(1),
		[Jumper Wires]            , "as needed",
		[2N3904 Transistor]       , num(2),
		[#qty(1, "kO") Resistor]  , num(2),
		[#qty(10, "kO") Resistor] , num(2),
		[#qty(1, "nF") Capacitor] , num(1),
		[#qty(10, "nF") Capacitor], num(2),
		[#qty(33, "nF") Capacitor], num(2),
	),
	caption: [List of Materials]
) <t:mats>



= Inverter
== (2)
The amplitude of the output signal of the inverter circuit for different values
of $V_"CC"$ is shown in @t:inv.vcc. A plot of the input and output signals is
shown in @p:inv.plot.

== (3)
In an inverter circuit, the output voltage swing is limited by the supply
voltage $V_"CC"$. When $V_"CC"$ is reduced, the maximum high output decreases
accordingly, so the peak-to-peak voltage of the output waveform scales with
$V_"CC"$. For example, if $V_"CC" = #qty(10, "V")$, the output can swing nearly
#qtyrange(0, 10, "V"). Similarly, reducing $V_"CC"$ to #qty(8, "V"),
#qty(6, "V"), or #qty(4, "V") limits the swing to approximately
#qtyrange(0, 8, "V"), #qtyrange(0, 6, "V"), and #qtyrange(0, 4, "V")
respectively. This occurs because the inverter circuit's transistor can only
drive the output within the supply rails.

== (4)
The circuit in question is an inverter, which is a basic digital logic circuit
that inverts the input signal. In this case, the input signal $V_"in"$ is a
#qtyrange(0, 10, "V") square wave at a frequency of #qty(1, "kHz"). The
inverter circuit is built around a transistor, which acts as a switch. The
transistor's behavior is controlled by the resistors $R_"b1"$ and $R_"c1"$, and
the supply voltage $V_"CC"$.

#figure(
	table(
		columns: 2,
		table.header[$V_"CC"$][$V_"out"$],
		[#qty(10, "V")DC], [#qty(10, "V")pp],
		[#qty( 8, "V")DC], [#qty( 8, "V")pp],
		[#qty( 6, "V")DC], [#qty( 6, "V")pp],
		[#qty( 4, "V")DC], [#qty( 4, "V")pp],
	),
	caption: [$V_"out"$ vs. $V_"CC"$ for the Inverter Circuit]
) <t:inv.vcc>

#figure(
	image("assets/inv-plot.jpg"),
	caption: [
		Plot of $V_"in"$ and $V_"out"$ of the inverter circuit with
		$V_"CC" = #qty(10, "V")$DC.
	]
) <p:inv.plot>

When the input signal $V_"in"$ is applied, it alternates between high and low
voltage levels. During the high phase of $V_"in"$, the transistor allows
current to pass through the collector to the emitter, and the output voltage
$V_"out"$ becomes low (near #qty(0, "V")). During the low phase of $V_"in"$,
the transistor is turned off, and $V_"out"$ rises to the supply voltage
$V_"CC"$. Thus, the inverter circuit produces an output that is the inverse of
the input signal, with the output high when the input is low and vice versa.



= Ramp Generator
== (6)
A plot of the input and output signals of the ramp generator circuit is shown
in @p:rg.plot.

#figure(
	image("assets/rg-plot.jpg"),
	caption: [Plot of $V_"in"$ and $V_"out"$ of the ramp generator circuit.]
) <p:rg.plot>

== (7)

== (8)
Some various measurements of the ramp generator circuit for different
frequencies of $V_"in"$ is shown in @t:rg.freq.

#figure(
	table(
		columns: 4,
		table.header[Frequency][#qty(500, "Hz")][#qty(1, "kHz")][#qty(2, "kHz")],
		$V_"ramp, max"$, qty(10, "V")   , qty(10, "V")   , qty(5.2, "V"),
		$V_"ramp, min"$, qty(0, "V")    , qty(0, "V")    , qty(0, "V"),
		$T_"pos"$      , qty(498, "us") , qty(496, "us") , qty(248, "us"),
		$T_"neg"$      , qty(39.6, "us"), qty(34.8, "us"), qty(20, "us"),
		[Total Period] , qty(2, "ms")   , qty(1, "ms")   , qty(0.5, "ms")
	),
	caption: [Various Measurements vs. Frequency for the Ramp Generator]
) <t:rg.freq>

== (9)
In order to calculate the positive and negative slopes, we use the following
equations:

$ m_"pos" = (V_"ramp, max" - V_"ramp, min")/T_"pos" $
$ m_"neg" = (V_"ramp, max" - V_"ramp, min")/T_"neg" $

The positive and negative slopes for the different $V_"in"$ frequencies are
shown in @t:rg.slope

#figure(
	table(
		columns: 3,
		table.header[Frequency][$m_"pos"$][$m_"neg"$],
		qty(500, "Hz"), qty(20.08, "kV/s"), qty(252.53, "kV/s"),
		qty(1, "kHz") , qty(20.16, "kV/s"), qty(287.36, "kV/s"),
		qty(2, "kHz") , qty(20.97, "kV/s"), qty(260.00, "kV/s"),
	),
	caption: [Positive and Negative Slopes vs. Frequency for the Ramp Generator]
) <t:rg.slope>
