Music_Medal:
	channel_count 3
	channel 1, Music_Medal_Ch1
	channel 2, Music_Medal_Ch2
	channel 3, Music_Medal_Ch3

Music_Medal_Ch1: ; f7df8 (3d:7df8)
	;stereo_panning 1, 1
	;vibrato_type 1
	vibrato 20, 3, 3
	notetype2 8
	octave 2
	duty_cycle 1
	notetype1 10
	notetype0 1
	note E_, 5
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 5
	note A_, 5
	inc_octave
	note C#, 5
	dec_octave
	dec_octave
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 5
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 5
	notetype0 15
	note A_, 2
	;tie
	notetype0 1
	note A_, 10
	notetype1 3
	note A_, 5
	notetype1 10
	notetype2 7
	note A_, 5
	note A_, 5
	note A_, 5
	notetype2 8
	note A_, 15
	notetype1 3
	note A_, 5
	notetype1 10
	note A_, 16
	notetype1 3
	note A_, 5
	notetype1 10
	note A_, 16
	notetype1 3
	note A_, 6
	notetype1 10
	notetype0 9
	note A_, 5
	;tie
	note A_, 8
	;tie
	notetype0 1
	note A_, 2
	notetype1 3
	note A_, 16
	sound_ret


Music_Medal_Ch2: ; f7e4b (3d:7e4b)
	;stereo_panning 1, 1
	;vibrato_type 1
	vibrato 20, 3, 3
	notetype2 8
	octave 1
	duty_cycle 0
	notetype1 9
	notetype0 1
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 5
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 5
	dec_octave
	note C#, 5
	note E_, 5
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 5
	note A_, 5
	inc_octave
	notetype0 15
	note C_, 2
	;tie
	notetype0 1
	note C_, 10
	notetype1 2
	note C_, 5
	notetype1 10
	notetype2 7
	note C_, 5
	note C_, 5
	note C_, 5
	notetype2 8
	note D_, 15
	notetype1 3
	note D_, 5
	notetype1 9
	note D_, 16
	notetype1 2
	note D_, 5
	notetype1 9
	note D_, 16
	notetype1 3
	note D_, 6
	notetype1 9
	notetype0 9
	note C#, 5
	;tie
	note C#, 8
	;tie
	notetype0 1
	note C#, 2
	notetype1 2
	note C#, 16
	sound_ret


Music_Medal_Ch3: ; f7e9d (3d:7e9d)
	;stereo_panning 1, 1
	notetype2 11
	notetype1 1
	;cutoff 8
	;echo 0
	octave 2
	notetype0 1
	notetype0 15
	rest 4
	note F_, 2
	;tie
	notetype0 1
	note F_, 10
	rest 5
	;cutoff 7
	note F_, 5
	note F_, 5
	note F_, 5
	;cutoff 8
	note A#, 15
	rest 5
	note A#, 16
	rest 5
	note A#, 16
	rest 6
	notetype0 9
	note A_, 13
	;tie
	notetype0 1
	note A_, 2
	sound_ret
; 0xf7ec8
