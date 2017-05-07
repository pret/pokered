Music_CinnabarGSC: ; f5127
	dbw $40, Music_CinnabarGSC_Ch1
	dbw $01, Music_CinnabarGSC_Ch2

Music_CinnabarGSC_Ch1:
	tempo	 $118
	volume $77
	dutycycle 1
	notetype $C, $B6
;Channel1_Bar1:
Music_CinnabarGSC_Loop1:
	note __, 4
	octave 3
	note D_, 4
	note E_, 6
	note C#, 2
;Channel1_Bar2:
	note D_, 4
	note B_, 4
	octave 4
	note C_, 6
	octave 3
	note A_, 2
;Channel1_Bar3:
	note B_, 4
	note G_, 4
	note F#, 4
	note E_, 2
	note F#, 2
;Channel1_Bar4:
	note G_, 8
	note F#, 4
	note E_, 4
;Channel1_Bar5:
	note D_, 4
	note E_, 4
	note F#, 6
	note A_, 2
;Channel1_Bar6:
	note G_, 4
	note B_, 4
	octave 4
	note C_, 6
	octave 3
	note A_, 2
;Channel1_Bar7:
	note B_, 4
	note G_, 4
	note F#, 3
	note E_, 1
	note F#, 2
	note A_, 2
;Channel1_Bar8:
	note G_, 4
	octave 4
	note D_, 1
	note E_, 1
	note D_, 4
	note D_, 1
	note E_, 1
	note D_, 4
;Channel1_Bar9:
	octave 3
	note B_, 6
	note G_, 2
	note E_, 8
;Channel1_Bar10:
	octave 4
	note C_, 6
	octave 3
	note A_, 2
	note F#, 8
;Channel1_Bar11:
	octave 4
	note F#, 6
	note D_, 2
	octave 3
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
;Channel1_Bar12:
	note G_, 8
	note F#, 4
	note E_, 4
;Channel1_Bar13:
	loopchannel 0, Music_CinnabarGSC_Loop1

Music_CinnabarGSC_Ch2:
	dutycycle 1
	notetype $C, $C6
;Channel2_Bar1:
Music_CinnabarGSC_Loop2:
	octave 3
	note G_, 6
	note A_, 1
	note B_, 1
	octave 4
	note C_, 6
	note D_, 1
	note E_, 1
;Channel2_Bar2:
	note D_, 4
	note G_, 4
	note A_, 6
	note G_, 1
	note F#, 1
;Channel2_Bar3:
	note E_, 4
	note D_, 4
	note C_, 3
	octave 3
	note B_, 1
	octave 4
	note C_, 2
	note E_, 2
;Channel2_Bar4:
	note D_, 4
	octave 3
	note B_, 8
	note A_, 4
;Channel2_Bar5:
	note G_, 6
	note A_, 1
	note B_, 1
	octave 4
	note C_, 6
	note D_, 1
	note E_, 1
;Channel2_Bar6:
	note D_, 4
	note G_, 4
	note A_, 6
	note G_, 1
	note F#, 1
;Channel2_Bar7:
	note E_, 4
	note D_, 4
	note C_, 3
	octave 3
	note B_, 1
	octave 4
	note C_, 2
	note D_, 1
	note E_, 1
;Channel2_Bar8:
	note D_, 4
	octave 3
	note A_, 4
	note G_, 4
	note F#, 4
;Channel2_Bar9:
	octave 4
	note D_, 6
	octave 3
	note B_, 2
	note G_, 8
;Channel2_Bar10:
	octave 4
	note E_, 6
	note C_, 2
	octave 3
	note A_, 8
;Channel2_Bar11:
	octave 4
	note A_, 6
	note F#, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
;Channel2_Bar12:
	note B_, 4
	octave 4
	note D_, 4
	octave 3
	note B_, 2
	note A_, 6
;Channel2_Bar13:
	loopchannel 0, Music_CinnabarGSC_Loop2
