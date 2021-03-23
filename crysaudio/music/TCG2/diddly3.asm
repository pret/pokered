Music_Diddly3:
	channel_count 3
	channel 1, Music_Diddly3_Ch1
	channel 2, Music_Diddly3_Ch2
	channel 3, Music_Diddly3_Ch3

Music_Diddly3_Ch2: ; 1ebe5d (7a:7e5d)
	notetype1 10
	;musicf0 2
	notetype0 1
	;musicdc 255
	octave 5
	note C_, 3
	dec_octave
	;musicf1 48
	note C_, 2
	note C_, 1
	;musicf1 0
	note G_, 3
	inc_octave
	note C_, 3
	note G_, 3
	inc_octave
	;musicf1 48
	note C_, 5
	note C_, 6
	sound_ret


Music_Diddly3_Ch1: ; 1ebe76 (7a:7e76)
	notetype1 10
	;musicf0 2
	notetype0 1
	;musicdc 255
	;musicef 253
	rest 1
	octave 5
	note C_, 3
	dec_octave
	;musicf1 48
	note C_, 2
	note C_, 1
	;musicf1 0
	note G_, 3
	inc_octave
	note C_, 3
	note G_, 3
	inc_octave
	;musicf1 48
	note C_, 5
	note C_, 6
	sound_ret


Music_Diddly3_Ch3: ; 1ebe92 (7a:7e92)
	notetype1 10
	;notetype2 15
	load_wave 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 13, 12, 11, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	notetype0 1
	notetype1 2
	;musice9 128
	;musicdc 255
	notetype0 1
	;musice8 7
	octave 5
	note G_, 3
	dec_octave
	note G_, 3
	note E_, 3
	inc_octave
	note C_, 3
	note E_, 3
	inc_octave
	note C_, 4
	notetype1 128
	note C_, 4
	sound_ret
; 0x1ebeae
