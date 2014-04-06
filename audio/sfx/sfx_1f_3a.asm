SFX_1f_3a_Ch1: ; 7e850 (1f:6850)
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


SFX_1f_3a_Ch2: ; 7e867 (1f:6867)
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


SFX_1f_3a_Ch3: ; 7e877 (1f:6877)
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
; 0x7e887