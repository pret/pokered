Music_NuggetBridge:
	dbw $c0, Music_NuggetBridge_Ch1
	dbw $01, Music_NuggetBridge_Ch2
	dbw $02, Music_NuggetBridge_Ch3
	dbw $03, Music_NuggetBridge_Ch4

Music_NuggetBridge_Ch1:
	tempo $A8
	volume $77
	dutycycle 1
	notetype $C, $B5
;Channel1_Bar1:
	octave 2
	note G#, 6
	note G#, 1
	note B_, 1
	note A_, 4
	note F#, 2
	octave 3
	note C#, 2
;Channel1_Bar2:
Music_NuggetBridge_Loop1:
	octave 2
	note B_, 3
	note G#, 1
	note A_, 6
	dutycycle 2
	note A_, 1
	note G#, 1
	note F#, 4
;Channel1_Bar3:
	dutycycle 1
	note G#, 6
	note G#, 1
	note B_, 1
	note A_, 4
	note F#, 2
	octave 3
	note C#, 2
;Channel1_Bar4:
	octave 2
	note B_, 3
	note G#, 1
	octave 3
	note E_, 6
	dutycycle 2
	octave 2
	note B_, 1
	octave 3
	note C#, 1
	note D_, 4
;Channel1_Bar5:
	note A_, 2
	note E_, 2
	octave 2
	note A_, 4
	octave 3
	note G#, 2
	note E_, 2
	octave 2
	note G#, 4
;Channel1_Bar6:
	octave 3
	note F#, 2
	note C#, 2
	octave 2
	note F#, 4
	octave 3
	note E_, 2
	note C#, 2
	note D#, 2
	note C#, 2
;Channel1_Bar7:
	octave 2
	note F#, 2
	note F#, 1
	note G#, 1
	note A_, 6
	note F#, 2
	octave 3
	note D_, 4
;Channel1_Bar8:
	note E_, 3
	octave 2
	note A_, 1
	note G#, 6
	note E_, 2
	note A_, 2
	note G#, 2
;Channel1_Bar9:
	intensity $B2
	note B_, 2
	note B_, 1
	octave 3
	note C#, 1
	note D_, 2
	note D_, 1
	note E_, 1
	note F#, 2
	note D_, 2
	note A_, 4
;Channel1_Bar10:
	note G#, 3
	note F#, 1
	note E_, 6
	intensity $B1
	octave 2
	note E_, 1
	note F#, 1
	note G#, 2
	note F#, 1
	note E_, 1
;Channel1_Bar11:
	intensity $B2
	note B_, 2
	note B_, 1
	octave 3
	note C#, 1
	note D_, 2
	note D_, 1
	note E_, 1
	note F#, 2
	note D_, 2
	note A_, 4
;Channel1_Bar12:
	note G#, 3
	note F#, 1
	note E_, 6
	intensity $B1
	octave 2
	note G#, 1
	note A_, 1
	note B_, 2
	note A_, 1
	note G#, 1
;Channel1_Bar13:
	intensity $B2
	note B_, 2
	note B_, 1
	octave 3
	note C#, 1
	note D_, 2
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 1
	note G#, 1
	note A_, 4
;Channel1_Bar14:
	octave 2
	note B_, 2
	note B_, 1
	octave 3
	note C#, 1
	note D#, 2
	note D#, 1
	note E_, 1
	note F#, 2
	note F#, 1
	note G#, 1
	intensity $B5
	note A_, 4
;Channel1_Bar15:
	dutycycle 1
	note G#, 6
	octave 2
	note G#, 1
	note B_, 1
	note A_, 4
	note F#, 2
	octave 3
	note C#, 2
;Channel1_Bar16:
	loopchannel 0, Music_NuggetBridge_Loop1

Music_NuggetBridge_Ch2:
	dutycycle 1
	notetype $C, $C5
;Channel2_Bar1:
	octave 3
	note E_, 6
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	note F#, 6
	note A_, 2
;Channel2_Bar2:
Music_NuggetBridge_Loop2:
	note G#, 3
	note E_, 1
	note F#, 12
;Channel2_Bar3:
	note E_, 6
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	note F#, 6
	note A_, 2
;Channel2_Bar4:
	note G#, 3
	note E_, 1
	note B_, 12
;Channel2_Bar5:
	dutycycle 0
	octave 4
	note C#, 6
	octave 3
	note B_, 1
	note A_, 1
	note B_, 6
	note A_, 1
	note G#, 1
;Channel2_Bar6:
	note A_, 6
	note G#, 1
	note F#, 1
	note G#, 4
	dutycycle 2
	note F#, 2
	note E_, 2
;Channel2_Bar7:
	note D_, 2
	note D_, 1
	note E_, 1
	note F#, 8
	note A_, 4
;Channel2_Bar8:
	note G#, 3
	note F#, 1
	note E_, 8
	dutycycle 1
	note F#, 2
	note E_, 2
;Channel2_Bar9:
	note D_, 2
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 1
	note G#, 1
	note A_, 4
	octave 4
	note C#, 4
;Channel2_Bar10:
	octave 3
	note B_, 3
	note A_, 1
	note G#, 12
;Channel2_Bar11:
	dutycycle 0
	note D_, 2
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 1
	note G#, 1
	note A_, 4
	octave 4
	note C#, 4
;Channel2_Bar12:
	octave 3
	note B_, 3
	note A_, 1
	note G#, 12
;Channel2_Bar13:
	dutycycle 2
	note D_, 2
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 1
	note G#, 1
	note A_, 2
	note A_, 1
	note B_, 1
	octave 4
	note C#, 4
;Channel2_Bar14:
	octave 3
	note D#, 2
	note D#, 1
	note E_, 1
	note F#, 2
	note F#, 1
	note G#, 1
	note A_, 2
	note B_, 1
	octave 4
	note C#, 1
	notetype 6, $C5
	note D#, 4
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	note C#, 1
	note D#, 1
;Channel2_Bar15:
	notetype $C, $C5
	dutycycle 1
	note E_, 6
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	note F#, 6
	note A_, 2
;Channel2_Bar16:
	loopchannel 0, Music_NuggetBridge_Loop2

Music_NuggetBridge_Ch3:
	notetype $C, $15
;Channel3_Bar1:
	octave 2
	note E_, 4
	note __, 8
	note D_, 4
;Channel3_Bar2:
Music_NuggetBridge_Loop3:
	note E_, 1
	note __, 11
	octave 1
	note B_, 4
;Channel3_Bar3:
	octave 2
	note E_, 4
	note __, 8
	note D_, 4
;Channel3_Bar4:
	note E_, 1
	note __, 11
	note G#, 4
;Channel3_Bar5:
	notetype 4, $24
	octave 3
	note A_, 2
	octave 5
	note C#, 2
	note E_, 2
	note A_, 2
	octave 6
	note C#, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note C#, 2
	octave 5
	note A_, 2
	note E_, 2
	note C#, 2
	octave 3
	note G#, 2
	octave 4
	note B_, 2
	octave 5
	note E_, 2
	note G#, 2
	note B_, 2
	octave 6
	note E_, 2
	note G#, 2
	note E_, 2
	octave 5
	note B_, 2
	note G#, 2
	note E_, 2
	octave 4
	note B_, 2
;Channel3_Bar6:
	octave 3
	note F#, 2
	octave 4
	note A_, 2
	octave 5
	note C#, 2
	note F#, 2
	note A_, 2
	octave 6
	note C#, 2
	note F#, 2
	note C#, 2
	octave 5
	note A_, 2
	note F#, 2
	note C#, 2
	octave 4
	note A_, 2
	octave 3
	note C#, 2
	octave 4
	note E_, 2
	note G#, 2
	octave 5
	note C#, 2
	note E_, 2
	note G#, 2
	octave 6
	note C#, 3
	note __, 9
	notetype $C, $15
	callchannel Music_NuggetBridge_Bar7
	callchannel Music_NuggetBridge_Bar7
	callchannel Music_NuggetBridge_Bar7
	callchannel Music_NuggetBridge_Bar7
	callchannel Music_NuggetBridge_Bar8
	callchannel Music_NuggetBridge_Bar8
	callchannel Music_NuggetBridge_Bar8
	callchannel Music_NuggetBridge_Bar8
	callchannel Music_NuggetBridge_Bar9
	callchannel Music_NuggetBridge_Bar9
	callchannel Music_NuggetBridge_Bar9
	callchannel Music_NuggetBridge_Bar9
	callchannel Music_NuggetBridge_Bar10
	callchannel Music_NuggetBridge_Bar10
	callchannel Music_NuggetBridge_Bar10
	callchannel Music_NuggetBridge_Bar10
	callchannel Music_NuggetBridge_Bar11
	callchannel Music_NuggetBridge_Bar11
	callchannel Music_NuggetBridge_Bar11
	callchannel Music_NuggetBridge_Bar11
	callchannel Music_NuggetBridge_Bar12
	callchannel Music_NuggetBridge_Bar12
	callchannel Music_NuggetBridge_Bar12
	callchannel Music_NuggetBridge_Bar12
;Channel3_Bar13:
	notetype 6, $15
	octave 1
	note B_, 2
	note __, 16
	note __, 2
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 6
	note __, 2
;Channel3_Bar14:
	note B_, 2
	note __, 16
	note __, 2
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 6
	note __, 2
;Channel3_Bar15:
	notetype $C, $15
	octave 2
	note E_, 4
	note __, 8
	note D_, 4
;Channel3_Bar16:
	loopchannel 0, Music_NuggetBridge_Loop3

Music_NuggetBridge_Bar7:
	octave 2
	note D_, 1
	note __, 1
	intensity $24
	octave 5
	note A_, 1
	octave 4
	note D_, 1
	intensity $15
	endchannel 
Music_NuggetBridge_Bar8:
	octave 2
	note E_, 1
	note __, 1
	intensity $24
	octave 5
	note B_, 1
	octave 4
	note E_, 1
	intensity $15
	endchannel 
Music_NuggetBridge_Bar9:
	octave 1
	note B_, 1
	note __, 1
	intensity $24
	octave 6
	note D_, 1
	octave 4
	note F#, 1
	intensity $15
	endchannel 
Music_NuggetBridge_Bar10:
	octave 2
	note E_, 1
	note __, 1
	intensity $24
	octave 6
	note E_, 1
	octave 4
	note B_, 1
	intensity $15
	endchannel 
Music_NuggetBridge_Bar11:
	octave 1
	note B_, 1
	intensity $24
	octave 4
	note A_, 1
	octave 6
	note F#, 1
	octave 5
	note D_, 1
	intensity $15
	endchannel 
Music_NuggetBridge_Bar12:
	octave 2
	note E_, 1
	intensity $24
	octave 4
	note B_, 1
	octave 6
	note G#, 1
	octave 5
	note E_, 1
	intensity $15
	endchannel 

Music_NuggetBridge_Ch4:
	notetype 4
	togglenoise 0
;Channel4_Bar1:
	note A_, 16
	note __, 2
	note D_, 3
	note D_, 3
	note D_, 12
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
;Channel4_Bar2:
Music_NuggetBridge_Loop4:
	note D_, 16
	note __, 2
	note D_, 3
	note D_, 3
	note D_, 12
	note D_, 3
	note D_, 3
	note D_, 3
	note D_, 3
;Channel4_Bar3:
	note D_, 16
	note __, 2
	note D_, 3
	note D_, 3
	note D_, 12
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
;Channel4_Bar4:
	note D_, 16
	note __, 2
	note D_, 3
	note D_, 3
	note D_, 12
	note D_, 3
	note D_, 3
	note D_, 3
	note D_, 3
;Channel4_Bar5:
	note A_, 16
	note __, 16
	note __, 16
;Channel4_Bar6:
	note __, 16
	note __, 16
	note __, 16
;Channel4_Bar7:
	note D_, 12
	note D_, 12
	note D_, 12
	note D_, 6
	note D_, 3
	note D_, 3
;Channel4_Bar8:
	note D_, 12
	note D_, 12
	note D_, 12
	note D_, 6
	note D_, 2
	note D_, 2
	note D_, 2
;Channel4_Bar9:
	note D_, 12
	note D_, 12
	note D_, 12
	note D_, 6
	note D_, 3
	note D_, 3
;Channel4_Bar10:
	note D_, 12
	note D_, 12
	note D_, 12
	note D_, 6
	note D_, 2
	note D_, 2
	note D_, 2
;Channel4_Bar11:
	note D_, 12
	note D_, 12
	note D_, 12
	note D_, 6
	note D_, 3
	note D_, 3
;Channel4_Bar12:
	note D_, 12
	note D_, 12
	note D_, 6
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 3
	note D_, 3
	note D_, 3
	note D_, 3
;Channel4_Bar13:
	note D_, 16
	note __, 14
	note D_, 3
	note D_, 3
	note A_, 6
	note D_, 2
	note D_, 2
	note D_, 2
;Channel4_Bar14:
	note D_, 16
	note __, 14
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 3
	note D_, 3
	note D_, 3
	note D_, 3
;Channel4_Bar15:
	note A_, 16
	note __, 2
	note D_, 3
	note D_, 3
	note D_, 12
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
;Channel4_Bar16:
	loopchannel 0, Music_NuggetBridge_Loop4
