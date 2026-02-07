#import "@preview/charged-ieee:0.1.4": ieee

#import "@preview/unify:0.7.1": num, qty
#import "@preview/zap:0.5.0"

#show: ieee.with(
	title: "EEE 148 Lab Report 2",
	abstract: [
		This report characterizes the performance of Sallen-Key topology in
		both low-pass and narrowband (band-pass) filter configurations. By
		analyzing magnitude responses through both simulation and hardware
		implementation, the filters' gain and cutoff frequencies were
		determined.
	],
	authors: (
	(
		name: "Carl Angelo P. Gil",
		department: "Electrical and Electronics Engineering Institute",
		organization: "University of the Philippines Diliman",
		location: "Quezon City, Philippines",
		email: "carl.angelo.gil@eee.upd.edu.ph"
	),
	(
		name: "Nile Xavier O. Jocson",
		department: "Electrical and Electronics Engineering Institute",
		organization: "University of the Philippines Diliman",
		location: "Quezon City, Philippines",
		email: "nile.xavier.jocson@eee.upd.edu.ph"
	)
	),
	index-terms: ("Sallen-Key", "low-pass", "narrowband", "frequency response"),
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
The Sallen-Key Topology is one of the most widely used active filter designs
due to its ability to generate a second-order response with a single
operational amplifier. By using a specific combination of resistors and
capacitors around an op-amp, the circuit can be configured as a low-pass filter
to allow DC and low frequencies while blocking higher ones, or as a high-pass
filter to achieve the opposite effect. To characterize these filters, gain in
decibels is calculated and plotted on a semi-logarithmic scale.



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
		"Power Supply"                        , num(1),
		"Signal Generator"                    , num(1),
		"Oscilloscope"                        , num(1),
		"Multimeter"                          , num(1),
		"Breadboard"                          , num(1),
		"Jumper Wires"                        , "as needed",
		"LM741 Op-Amp"                        , num(1),
		[#qty(10, "nF") Capacitor], num(1),
		[#qty(20, "nF") Capacitor], num(1),
		[#qty(33, "nF") Capacitor], num(2),
		[#qty(7.5, "kO") Resistor], num(4),
		[#qty(33, "kO") Resistor] , num(2),
		[#qty(270, "O") Resistor] , num(1),
		[#qty(510, "O") Resistor] , num(1)
	),
	caption: "List of Materials"
) <t:mats>

== Low-Pass Filter
The low-pass filter was built on a breadboard using the specifications shown in
@i:lpf.

#figure(
	image("assets/lpf.png"),
	caption: "Specifications of the Sallen-Key low-pass filter."
) <i:lpf>

== Narrowband Filter
The narrowband filter was also built on a breadboard using the specifications
shown in @i:nbf.

#figure(
	image("assets/nbf.png"),
	caption: "Specifications of the Sallen-Key narrowband filter."
) <i:nbf>



= Sallen-Key Low-Pass Filter
== Actual Values of the Components (1)
@t:avlpf shows the actual values of the components used for the Sallen-Key
low-pass filter.

#figure(
	table(
		columns: 2,
		table.header[Component][Actual value],
		$R_1$, qty(7.4196, "kO"),
		$R_2$, qty(7.5374, "kO"),
		$R_3$, qty(7.5298, "kO"),
		$R_4$, qty(7.617, "kO"),
		$C_1$, qty(30.1, "nF"),
		$C_2$, qty(11.38, "nF")
	),
	caption: "Actual Values of the Low-Pass Filter Components"
) <t:avlpf>

== Output and Gain at DC (3)
The output settles at around #qty(6, "V")DC when a #qty(6, "V")DC input is
applied. The capacitors function as open circuits due to their extremely high
impedance at DC. As a result, the circuit reduces into a resistive unity-gain
op-amp configuration, causing the DC gain to be equal to one, as shown in
@f:glpf.

$ G = 20log(V_"out"/V_"in") = #qty(0, "dB") $ <f:glpf>

== Output and Gain at AC (5)
@t:oglpf shows the output and gain of the low-pass filter on an #qty(8, "V")pp
sine wave with varying frequencies. Note that the output sine wave of the
circuit started showing 'spikes' at around #qty(1.5, "kHz"). At
#qty(10, "kHz"), the spiking became so prominent that it started being measured
as the peak of the wave, causing the $V_"out,pp"$ for that frequency to be
higher than the $V_"out,pp"$ for #qty(8, "kHz").

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

== Cutoff Frequency (6)
The signal amplitude dropped to $#qty(8, "V")/sqrt(2) approx #qty(5.656, "V")$
at around #qty(1.28, "kHz"), making this the cutoff frequency for this particular
circuit. The oscilloscope plot of the low-pass filter is shown in @i:cflpf.

#figure(
	image("assets/cutoff.png"),
	caption: "Oscilloscope plot of the low-pass filter at its cutoff frequency. The configuration of the signal generator is also shown."
) <i:cflpf>

== Actual vs. Theoretical Cutoff Frequency (7)
The actual cutoff frequency of the low-pass filter does not match the
theoretical cutoff frequency of #qty(1.5, "kHz"). This is most likely due to
the actual values of the components, which do not perfectly match the ideal
values in the given specification. The formula for the cutoff frequency of a
second-order low pass filter also confirms this, as shown in @f:clpf.

$ f_c = 1/(2pi sqrt(R_1 R_2 C_1 C_2)) approx #qty(1.28, "kHz") $ <f:clpf>



= Sallen-Key Narrowband Filter
== Actual Values of the Components (1)
@t:avnbf shows the actual values of the components used for the Sallen-Key
narrowband filter.

#figure(
	table(
		columns: 2,
		table.header[Component][Actual value],
		$R_1$  , qty(7.420, "kO"),
		$R_2$  , qty(500.1, "kO"),
		$R_3$  , qty(270.0, "O"),
		$R_f_1$, qty(32.030, "kO"),
		$R_f_2$, qty(33.083, "kO"),
		$C_1$  , qty(42.0, "nF"),
		$C_2$  , qty(40.6, "nF")
	),
	caption: "Actual Values of the Narrowband Filter Components"
) <t:avnbf>

== Output and Gain at AC (2)
@t:ognbf shows the output and gain of the narrowband filter on an
#qty(8, "V")pp sine wave with varying frequencies.

#figure(
	table(
		columns: 3,
		table.header[Frequency][$V_"out,pp"$][Gain (dB)],
		qty(200, "Hz")  , qty(200, "mV"), num(-32.04),
		qty(500, "Hz")  , qty(560, "mV"), num(-23.09),
		qty(1, "kHz")   , qty(1.26, "V"), num(-16.05),
		qty(1.4, "kHz") , qty(2.18, "V"), num(-11.29),
		qty(1.6, "kHz") , qty(2.98, "V"), num(-8.577),
		qty(1.8, "kHz") , qty(4.32, "V"), num(-5.352),
		qty(2, "kHz")   , qty(5.84, "V"), num(-2.73),
		qty(2.2, "kHz") , qty(6.24, "V"), num(-2.158),
		qty(2.4, "kHz") , qty(5.24, "V"), num(-3.675),
		qty(2.6, "kHz") , qty(4.24, "V"), num(-5.5144),
		qty(2.8, "kHz") , qty(3.44, "V"), num(-7.330),
		qty(3, "kHz")   , qty(2.92, "V"), num(-8.754),
		qty(3.25, "kHz"), qty(2.44, "V"), num(-10.31),
		qty(3.5, "kHz") , qty(2.16, "V"), num(-11.37),
		qty(4, "kHz")   , qty(1.70, "V"), num(-13.452),
		qty(6, "kHz")   , qty(968, "mV"), num(-18.344),
		qty(8, "kHz")   , qty(712, "mV"), num(-21.0121),
		qty(10, "kHz")  , qty(576, "mV"), num(-22.8533),
	),
	caption: "Output and Gain of the Low-Pass Filter Circuit"
) <t:ognbf>

== Output and Gain at DC (3)
For a #qty(6, "V")DC input, the output of the narrowband filter is
approximately #qty(0, "V") (actual measured $V_"out" = #qty(80, "mV")$). This
happens because of the capacitors' extremely high impedance at DC, which makes
them act like open circuits. As a result, the DC component of the input signal
is blocked and cannot propagate to the op-amp input. Rather than actual signal
amplification, the small residual output voltage is caused by non-ideal op-amp
characteristics like input offset voltage and bias currents.

== Semilog Plot (4)
@i:mrnbf shows the semilog plot of the magnitude response of the narrowband
filter circuit.

#figure(
	image("assets/semilog.png"),
	caption: "Semilog plot of the magnitude response of the narrowband filter circuit."
) <i:mrnbf>

== Center and Cutoff Frequencies (5)
The center frequency of the narrowband filter has been found to be
#qty(2.15, "kHz"). The low and high cutoff frequencies are #qty(1.97, "kHz")
and #qty(2.32, "kHz") respectively. These values were found by sweeping the
frequency with increments of #qty(10, "Hz") above and below #qty(2.2, "kHz")\;
the cutoff frequencies were found by sweeping until a signal amplitude of
$#qty(8, "V")/sqrt(2) approx #qty(5.656, "V")$ was yielded. @i:cfnbf, @i:lcnbf,
and @i:hcnbf show the oscilloscope plots of the narrowband filter circuit at
its center, low cutoff, and high cutoff frequencies respectively.

#figure(
	image("assets/center-freq.png"),
	caption: "Oscilloscope plot of the narrowband filter circuit at its center frequency."
) <i:cfnbf>

#figure(
	image("assets/low-cutoff.png"),
	caption: "Oscilloscope plot of the narrowband filter circuit at its low cutoff frequency."
) <i:lcnbf>

#figure(
	image("assets/high-cutoff.png"),
	caption: "Oscilloscope plot of the narrowband filter circuit at its high cutoff frequency."
) <i:hcnbf>

== Bandwidth and Q-Factor (6)
The computations for the bandwidth and Q-factor of the narrowband filter are
shown in @f:bqnbf.1, @f:bqnbf.2, and @f:bqnbf.3.

$ "BW" = f_h - f_l = #qty(2.32, "kHz") - #qty(1.97, "kHz") = #qty(350, "Hz") $ <f:bqnbf.1>
$ f_0 = sqrt(f_l f_h) = sqrt(#qty(1.97, "kHz") dot #qty(2.32, "kHz")) = #qty(2.137, "kHz") $ <f:bqnbf.2>
$ Q = f_0/"BW" = #qty(2.137, "kHz")/#qty(350, "Hz") = 6.108 $ <f:bqnbf.3>

== Improving the Q-Factor (7)
In order to reduce the Q-factor of the narrowband filter, tha bandwidth must be
increased. This can be accomplished by lowering the circuit's feedback gain. In
particular, lowering the feedback resistor values or the overall loop gain
increases the system's damping. Increased damping results in a wider bandwidth
and consequently a lower Q-factor, while the center frequency remains
approximately unchanged since it is primarily determined by the capacitor
values.
