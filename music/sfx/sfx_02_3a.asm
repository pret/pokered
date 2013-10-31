SFX_02_3a_Ch1: ; ad77 (2:6d77)
	executemusic
	tempo 1, 0
	stereopanning 119
	vibrato 6, 2, 6
	duty 2
	togglecall
	notetype 4, 11, 1
	octave 3
	note G#, 2
	note G#, 2
	note G#, 2
	notetype 12, 11, 3
	octave 4
	note E_, 4
	endchannel


SFX_02_3a_Ch2: ; ad8e (2:6d8e)
	executemusic
	vibrato 8, 2, 7
	duty 2
	notetype 4, 12, 1
	octave 4
	note E_, 2
	note E_, 2
	note E_, 2
	notetype 12, 12, 3
	note B_, 4
	endchannel


SFX_02_3a_Ch3: ; ad9e (2:6d9e)
	executemusic
	notetype 4, 1, 0
	octave 4
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	notetype 12, 1, 0
	octave 4
	note B_, 2
	rest 2
	endchannel
; 0xadae