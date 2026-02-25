#import "@preview/charged-ieee:0.1.4": ieee

#import "@preview/physica:0.9.8": dd
#import "@preview/unify:0.7.1": num, qty, qtyrange
#import "@preview/zap:0.5.0"

#show: ieee.with(
	title: "Ramp Generator Circuits",
	abstract: [
		This paper details the construction and analysis of discrete transistor-based inverter and ramp generator circuits. Using 2N3904 transistors and standard resistor-capacitor (RC) circuits, the charging and discharging behaviors of capacitors were observed to understand continuous ramp waveform generation. An oscilloscope was utilized to measure the amplitude, period, and slope of the resulting waveforms across various input frequencies (500 Hz to 2 kHz) and varying supply voltages. Results indicate that the common emitter inverter successfully inverts the input signal while limiting the maximum output voltage swing to the provided supply voltage. Furthermore, testing demonstrated that modifying specific resistance and capacitance values directly controlled the slope of the ramp generator's output. Overall, the experiment successfully demonstrated how altering component values and duty cycles dictates the behavior of these transistor-based timing circuits.
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
		name: "Florentino S. Cruz III",
		department: "Electrical and Electronics Engineering Institute",
		organization: "University of the Philippines Diliman",
		location: "Quezon City, Philippines",
		email: "florentino.iii.cruz@eee.upd.edu.ph"
	),
	),
	index-terms: ("Ramp generators", "inverters", "RC circuits"),
	bibliography: bibliography("refs.yaml"),
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
Ramp generators are circuits that produce a voltage that increases or decreases
linearly with time. This type of waveform is widely used in timing circuits,
signal sweeps, and analog-to-digital conversion devices, where a steady and
predictable change in voltage is required @sdrg. The accuracy of the ramp,
especially its slope and amplitude, directly affects the performance of these
systems.

One common way to generate a ramp signal is by charging and discharging a
capacitor through a resistor. Since the voltage across a capacitor changes over
time, controlling the resistance and capacitance values allows us to control
the slope of a waveform @etrc. In discrete transistor circuits, switching
action is often used together with an RC network to repeatedly charge and
discharge the capacitor, forming a continuous ramp or triangular waveform
@lt555.

In this activity, a transistor-based ramp generator was constructed and tested.
The objective was to observe how the capacitor charges and discharges, and how
this behavior produces a ramp output. An oscilloscope was used to determine the
amplitude, period, and slope of the ramp waveform. Different input frequencies
and component values were also tested to see how they affect the shape and
timing of the ramp.

The main goal of this activity is to relate the theoretical RC time con


= Methodology
== Materials
@t:mats shows the list of materials and their quantities used for the lab
activity.

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
transistor's behavior is controlled by the resistors $R_"B1"$ and $R_"C1"$, and
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

When the input signal $V_"in"$ is applied, it alternates between high and low
voltage levels. During the high phase of $V_"in"$, the transistor allows
current to pass through the collector to the emitter, and the output voltage
$V_"out"$ becomes low (near #qty(0, "V")). During the low phase of $V_"in"$,
the transistor is turned off, and $V_"out"$ rises to the supply voltage
$V_"CC"$. Thus, the inverter circuit produces an output that is the inverse of
the input signal, with the output high when the input is low and vice versa.

#figure(
	image("assets/inv-plot.jpg"),
	caption: [
		Plot of $V_"in"$ and $V_"out"$ of the inverter circuit with
		$V_"CC" = #qty(10, "V")$DC.
	]
) <p:inv.plot>



= Ramp Generator
== (6)
A plot of the input and output signals of the ramp generator circuit is shown
in @p:rg.plot.

== (7) <s:tcc>
Assuming that the transistor is in cut-off when $V_"in"$ is low, we have an RC
circuit from $V_"CC"$ to $V_"in"$ through $R_"C1"$, $C_1$, and $R_"B1"$. The
time constant of this is:

$ tau = R C = C(R_"B1" + R_"C1") = #qty(27, "us") $

In order for the positive ramp to have a shallower slope, $tau$ simply needs to
be made larger. Any of the three components $R_"C1"$, $C_1$, and $R_"B1"$ may
be increased in order for this to happen. In our case, $R_"C1"$ was increased
from #qty(1, "kO") to #qty(3.5, "kO"), and $C_1$ was increased from
#qty(1, "nF") to #qty(2, "nF") to get the #qty(20, "kV/s") slope that was
needed.

A plot of the input and output signals of the modified ramp generator circuit
is shown in @p:rg.m.plot.

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
	caption: [Period and Voltages vs. Frequency for the Ramp Generator]
) <t:rg.freq>

== (9)
In order to calculate the positive and negative slopes, we use the following
equations:

$ m_"pos" = (V_"ramp, max" - V_"ramp, min")/T_"pos" $
$ m_"neg" = (V_"ramp, min" - V_"ramp, max")/T_"neg" $

The positive and negative slopes for the different $V_"in"$ frequencies are
shown in @t:rg.slope.

#figure(
	table(
		columns: 3,
		table.header[Frequency][$m_"pos"$][$m_"neg"$],
		qty(500, "Hz"), qty(20.08, "kV/s"), qty(-252.53, "kV/s"),
		qty(1, "kHz") , qty(20.16, "kV/s"), qty(-287.36, "kV/s"),
		qty(2, "kHz") , qty(20.97, "kV/s"), qty(-260.00, "kV/s"),
	),
	caption: [Slopes vs. Frequency for the Ramp Generator]
) <t:rg.slope>

#figure(
	image("assets/rg-plot.jpg"),
	caption: [Plot of $V_"in"$ and $V_"out"$ of the ramp generator circuit.]
) <p:rg.plot>

#figure(
	image("assets/rg-modified-plot.jpg"),
	caption: [Plot of $V_"in"$ and $V_"out"$ of the modified ramp generator circuit.]
) <p:rg.m.plot>

#figure(
	image("assets/cb-plot.jpg"),
	caption: [Plot of $V_"in"$ and $V_"out"$ of the combined circuit.]
) <p:cb.plot>

#figure(
	image("assets/cb-modified-plot.jpg"),
	caption: [Plot of $V_"in"$ and $V_"out"$ of the modified combined circuit.]
) <p:cb.m.plot>

== (11)
A plot of the input and output signals of the combined circuit is shown
in @p:cb.plot.

Using the same logic as in @s:tcc, the slope was made shallower by again
increasing the values of $R_"C1"$ and $C_1$. The new values are
$R_"C1" = #qty(2.5, "kO")$ and $C_1 = #qty(2, "nF")$.

Some various measurements of the combined circuit for different frequencies of
$V_"in"$ is shown in @t:cb.freq.

#figure(
	table(
		columns: 4,
		table.header[Frequency][#qty(500, "Hz")][#qty(1, "kHz")][#qty(2, "kHz")],
		$V_"ramp, max"$, qty(10, "V")  , qty(10, "V")  , qty(5, "V"),
		$V_"ramp, min"$, qty(0, "V")   , qty(0, "V")   , qty(0, "V"),
		$T_"pos"$      , qty(500, "us"), qty(500, "us"), qty(250, "us"),
		$T_"neg"$      , qty(43, "us") , qty(40, "us") , qty(22.8, "us"),
		[Total Period] , qty(2, "ms")  , qty(1, "ms")  , qty(0.5, "ms")
	),
	caption: [Period and Voltages vs. Frequency for the Combined Circuit]
) <t:cb.freq>

A plot of the input and output signals of the modified combined circuit is
shown in @p:cb.m.plot.

== (12)
The positive and negative slopes for the different $V_"in"$ frequencies are
shown in @t:cb.slope.

#figure(
	table(
		columns: 3,
		table.header[Frequency][$m_"pos"$][$m_"neg"$],
		qty(500, "Hz"), qty(20, "kV/s"), qty(-232.56, "kV/s"),
		qty(1, "kHz") , qty(20, "kV/s"), qty(-250, "kV/s"),
		qty(2, "kHz") , qty(20, "kV/s"), qty(-219.3, "kV/s"),
	),
	caption: [Slopes vs. Frequency for the Combined Circuit]
) <t:cb.slope>

== (13)
The output was simply inverted. In the previous circuit, the positive ramp is
generated when $V_"in"$ is low, while the opposite is true here.

== (14)
The positive and negative slopes of the output is largely unchanged when
varying the duty cycle from #qtyrange(20, 50, "%"). Because of this, when the
duty cycle is below #qty(50, "%"), the ramp does not reach the intended maximum
voltage of #qty(10, "V"). When the duty cycle is above #qty(50, "%"), the ramp
stays at the maximum voltage when it reaches it, then rapidly goes to
#qty(0, "V") when the negative half-cycle of $V_"in"$ starts.

== (15)
The slope of the positive ramp needed can be calculated using the formula
below:

$ m_"pos" = (V_"ramp, max" - V_"ramp, min")/(D T_"total") $

Using this formula, the slope needed for a #qty(20, "%") and a #qty(80, "%")
duty cycle square wave are #qty(50, "kV/s") and #qty(12.5, "kV/s")
respectively. Setting $R_"B1" = #qty(10, "kO")$ and $C_1 = #qty(2, "nF")$, we
can solve for the $R_"C1"$ needed for a particular slope using the capacitor
current flow formula:

$
	I =& C dd(V)/dd(t) \
	m_"pos" =& I/C \
	m_"pos" =& V/(R C) \
	m_"pos" =& V_"CC"/(C_1(R_"B1" + R_"C1")) \
	R_"C1" =& V_"CC"/(m_"pos" C_1) - R_"B1"
$

Now, we can solve for the $R_"C1"$ needed for the square waves with different
duty cycles:

$ R_("C1," 20%) =& #qty(10, "V")/(#qty(50, "kV/s") dot #qty(2, "nF")) - #qty(10, "kO") = #qty(90, "kO") $
$ R_("C1," 80%) =& #qty(10, "V")/(#qty(12.5, "kV/s") dot #qty(2, "nF")) - #qty(10, "kO") = #qty(390, "kO") $

Note that the downside of this formula is that it does not account for the fact
that the transistor is in forward-active mode while the capacitor is charging.
This can be seen by calculating the $R_"C1"$ for a duty cycle of #qty(50, "%").
Note that the slope needed for this is #qty(20, "kV/s"):

$ R_("C1," 50%) =& #qty(10, "V")/(#qty(20, "kV/s") dot #qty(2, "nF")) - #qty(10, "kO") = #qty(240, "kO") $

This resistor value is two orders of magnitude higher than the #qty(3.5, "kO")
used in @s:tcc.



= Conclusion
This paper explored the experimentation and analysis of inverters, ramp
generators, and combined systems of the two in theory and in the real world.

In conclusion, a 2N3904-based common emitter inverter simply inverts the input
signal, while changing the voltage swing from #qty(0, "V") to its supply
voltage.

The 2N3904 ramp generator takes a bit of fiddling to find the needed values for
a specific duty cycle or frequency, and is only really compatible with that
specific value and no other, as its slope is constant no matter what the duty
cycle or frequency of the input is. It works perfectly however, for that one
specific duty cycle or frequency.

The downsides of regular circuit analysis is also seen in the divergence of
resistor values in theory (using the formula from circuit analysis), and in
practice. One may need to use small-signal analysis in order to find a good
formula for the component values needed for a particular slope of a ramp
generator.

This concludes our exploration on BJT inverters and ramp generators.
