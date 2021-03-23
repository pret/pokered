Music_Diddly4:
	channel_count 3
	channel 1, Music_Diddly4_Ch1
	channel 2, Music_Diddly4_Ch2
	channel 3, Music_Diddly4_Ch3

Music_Diddly4_Ch2: ; 1ebeae (7a:7eae)
	notetype1 10
	;musicf0 0
	notetype0 1
	;musicdc 255
	octave 3
	;musicf1 87
	note C_, 4
	note C_, 2
	note A_, 4
	note A_, 2
	note F_, 4
	note F_, 2
	inc_octave
	note C_, 4
	note C_, 1
	dec_octave
	note A_, 4
	note A_, 2
	inc_octave
	note F_, 15
	note F_, 11
	sound_ret


Music_Diddly4_Ch1: ; 1ebec7 (7a:7ec7)
	notetype1 10
	;musicf0 0
	notetype0 1
	;musicdc 255
	octave 2
	;musicf1 87
	note A_, 4
	note A_, 2
	inc_octave
	note C_, 4
	note C_, 2
	dec_octave
	note A_, 4
	note A_, 2
	inc_octave
	note F_, 4
	note F_, 1
	note C_, 4
	note C_, 2
	note A_, 15
	note A_, 11
	sound_ret


Music_Diddly4_Ch3: ; 1ebee0 (7a:7ee0)
	notetype1 10
	notetype2 14
	notetype0 1
	notetype1 2
	;musice9 128
	;musicdc 255
	notetype0 1
	;musice8 1
	rest 6
	rest 5
	rest 6
	rest 5
	rest 6
	;musicf1 128
	octave 4
	note F_, 16
	;tie
	note F_, 6
	sound_ret
; 0x1ebefa
