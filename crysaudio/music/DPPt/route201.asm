Music_Route201::
	dbw $80, Music_Route201_Ch1
	dbw $01, Music_Route201_Ch2
	dbw $02, Music_Route201_Ch3

Music_Route201_Ch1:
	tempo $A4
	volume $77
	notetype $C, $A2
	dutycycle 1
	octave 2
	note __, 4
	octave 3
	note E_, 2
	octave 2
	note G_, 6
	octave 3
	note F_, 2
	octave 2
	note A_, 6
Music_Route201_Ch1_loop:
	octave 3
	note G_, 2
	octave 2
	note B_, 6
	octave 3
	note F_, 2
	octave 2
	note A_, 6
	octave 3
	note E_, 2
	octave 2
	note G_, 6
	octave 3
	note E_, 2
	octave 2
	note G_, 6
	octave 3
	note F_, 2
	octave 2
	note A_, 6
	octave 3
	note E_, 2
	octave 2
	note G_, 4
	note A_, 2
	octave 3
	note F_, 2
	octave 2
	note A_, 4
	note G_, 2
	octave 3
	note E_, 2
	octave 2
	note G_, 4
	note A_, 2
	octave 3
	note F_, 2
	note F#, 4
	octave 2
	note G_, 2
	octave 3
	note A_, 2
	note G_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note E_, 2
	note C_, 2
	note E_, 2
	note C_, 2
	note G_, 2
	octave 2
	note G_, 2
	note A_, 2
	note B_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note E_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note C_, 2
	note E_, 2
	note C_, 2
	note E_, 2
	note C_, 2
	octave 2
	note B_, 2
	note G_, 2
	note A_, 2
	note B_, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note E_, 2
	note C_, 2
	note C_, 6
	note E_, 6
	note D_, 4
	note C_, 2
	note D_, 2
	note C_, 2
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	octave 2
	note E_, 4
	octave 3
	note C_, 2
	note C_, 6
	note E_, 6
	note D_, 4
	note C_, 2
	octave 2
	note C_, 2
	octave 3
	note C_, 2
	octave 2
	note F_, 2
	note C_, 2
	note F_, 2
	note G_, 2
	note B_, 2
	octave 3
	note C_, 4
	note E_, 2
	octave 2
	note G_, 6
	octave 3
	note F_, 2
	octave 2
	note A_, 6
	loopchannel 0, Music_Route201_Ch1_loop

Music_Route201_Ch2:
	notetype $C, $B1
	octave 4
	note __, 16
Music_Route201_Ch2_loop:
	notetype $C, $B1
	dutycycle 2
	octave 4
	note __, 15
	notetype $6, $B1
	note E_, 1
	note F_, 1
	note G_, 4
	note F_, 4
	note E_, 4
	note F_, 4
	note E_, 4
	note C_, 4
	octave 3
	note G_, 8
	note A_, 4
	note G_, 4
	note A_, 4
	note B_, 4
	octave 4
	note C_, 4
	note G_, 10
	note F_, 1
	note G_, 1
	note A_, 4
	note G_, 4
	note A_, 4
	note B_, 4
	octave 5
	note C_, 4
	octave 4
	note G_, 12
	note F_, 4
	note E_, 4
	note D_, 4
	note C_, 4
	note A_, 8
	note G_, 2
	octave 3
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 8
	note C_, 8
	note C_, 8
	note C_, 8
	note G_, 4
	note F_, 4
	note E_, 4
	note D_, 4
	note E_, 4
	note C_, 4
	octave 2
	note G_, 4
	octave 3
	note D_, 4
	note C_, 8
	note C_, 8
	note C_, 8
	note C_, 8
	octave 2
	note G_, 4
	octave 3
	note D_, 4
	note E_, 4
	note D_, 8
	note C_, 10
	intensity $98
	dutycycle 0
	vibrato $00, $15
	octave 4
	note E_, 1
	note F_, 1
	note G_, 12
	octave 5
	note C_, 12
	octave 4
	note B_, 8
	note A_, 4
	note G_, 4
	note E_, 4
	note D_, 4
	note E_, 4
	note C_, 8
	note A_, 4
	note G_, 12
	octave 5
	note C_, 12
	octave 4
	note B_, 8
	note A_, 4
	note G_, 4
	note E_, 4
	note C_, 8
	octave 3
	note G_, 4
	octave 4
	note D_, 4
	note C_, 16
	intensity $A3
	note C_, 4
	note __, 16
	loopchannel 0, Music_Route201_Ch2_loop

Music_Route201_Ch3:
	notetype $C, $10
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 5
	note C_, 1
	note __, 1
	note C_, 1
	note __, 5
Music_Route201_Ch3_loop:
	note C_, 1
	note __, 1
	note C_, 1
	note __, 5
	note C_, 1
	note __, 1
	note C_, 1
	note __, 5
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 5
	note E_, 1
	note __, 1
	note E_, 1
	note __, 5
	note F_, 1
	note __, 1
	note F_, 1
	note __, 5
	note C_, 1
	note __, 1
	note C_, 1
	note __, 5
	note F_, 1
	note __, 1
	note F_, 1
	note __, 5
	note C_, 1
	note __, 1
	note C_, 1
	note __, 5
	note F_, 1
	note __, 1
	note F_, 1
	note __, 5
	note G_, 1
	note __, 1
	note G_, 1
	note __, 5
	note F_, 1
	note __, 3
	note F_, 1
	note __, 3
	note C_, 1
	note __, 3
	note C_, 1
	note __, 3
	note G_, 1
	note __, 5
	note G_, 1
	note __, 1
	note C_, 1
	note __, 5
	note C_, 1
	note __, 1
	note F_, 1
	note __, 3
	note F_, 1
	note __, 3
	note C_, 1
	note __, 3
	note C_, 1
	note __, 3
	note G_, 1
	note __, 5
	note G_, 1
	note __, 1
	note C_, 1
	note __, 5
	note C_, 1
	note __, 1
	note F_, 5
	note __, 1
	note F_, 2
	note G_, 1
	note __, 1
	note G_, 3
	note __, 1
	note G_, 2
	note E_, 5
	note __, 1
	note E_, 2
	note C_, 1
	note __, 1
	note C_, 4
	note E_, 2
	note F_, 5
	note __, 1
	note F_, 2
	note C_, 1
	note __, 1
	note C_, 3
	note __, 1
	note C_, 2
	note F_, 5
	note __, 1
	note F_, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	note C_, 1
	note __, 5
	note C_, 1
	note __, 1
	note C_, 1
	note __, 5
	loopchannel 0, Music_Route201_Ch3_loop
