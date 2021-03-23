Music_Diddly6:
	channel_count 4
	channel 1, Music_Diddly6_Ch1
	channel 2, Music_Diddly6_Ch2
	channel 3, Music_Diddly6_Ch3
	channel 4, Music_Diddly6_Ch4

Music_Diddly6_Ch2: ; 1f76dc (7d:76dc)
	notetype1 10
	;musicf0 34
	notetype0 1
	;musicdc 255
	;musicef 252
	octave 3
	note F_, 2
	;musicef 1
	note G_, 3
	;musicef 1
	note A_, 2
	;musicef 1
	note B_, 3
	inc_octave
	;musicef 1
	note C_, 2
	note D_, 3
	note E_, 2
	note F_, 3
	;musicf1 87
	note G_, 16
	;tie
	note G_, 14
	note G_, 11
	note A#, 16
	;tie
	note A#, 5
	note A#, 10
	note G_, 6
	note A#, 4
	note A_, 16
	;tie
	note A_, 14
	note A_, 11
	inc_octave
	note C_, 16
	;tie
	note C_, 14
	note C_, 11
	dec_octave
	note B_, 16
	;tie
	note B_, 16
	;tie
	note B_, 16
	;tie
	note B_, 13
	;tie
	note B_, 16
	;tie
	note B_, 16
	;tie
	note B_, 16
	;tie
	note B_, 16
	;tie
	note B_, 16
	;tie
	note B_, 16
	;tie
	note B_, 7
	;tie
	note B_, 16
	;tie
	note B_, 16
	;tie
	note B_, 16
	;tie
	note B_, 16
	;tie
	note B_, 16
	;tie
	note B_, 2
	notetype0 2
	note B_, 10
	sound_ret


Music_Diddly6_Ch1: ; 1f7731 (7d:7731)
	notetype1 10
	;musicf0 23
	notetype0 1
	;musicdc 255
	;musicef 252
	octave 3
	note C_, 2
	;musicef 1
	note D_, 3
	;musicef 1
	note E_, 2
	;musicef 1
	note F_, 3
	;musicef 1
	note G_, 2
	note A_, 3
	note B_, 2
	inc_octave
	note C_, 3
	dec_octave
	note G_, 6
	inc_octave
	note D#, 5
	dec_octave
	note A#, 5
	inc_octave
	note G_, 5
	dec_octave
	note G_, 5
	inc_octave
	note D#, 5
	dec_octave
	note A#, 5
	inc_octave
	note G_, 5
	dec_octave
	note G_, 6
	inc_octave
	note D#, 5
	dec_octave
	note A#, 5
	inc_octave
	note G_, 5
	dec_octave
	note G_, 5
	inc_octave
	note D#, 5
	dec_octave
	note A#, 5
	inc_octave
	note G_, 5
	dec_octave
	note A_, 6
	inc_octave
	note F_, 5
	note C_, 5
	note A_, 5
	dec_octave
	note A_, 5
	inc_octave
	note F_, 5
	note C_, 5
	note A_, 5
	dec_octave
	note A_, 6
	inc_octave
	note F_, 5
	note C_, 5
	note A_, 5
	dec_octave
	note A_, 5
	inc_octave
	note F_, 5
	note C_, 5
	note A_, 5
	octave 4
	;musicf0 34
	;musicef 253
	note D_, 6
	octave 4
	;musicf0 23
	note G_, 5
	note D_, 5
	note B_, 5
	dec_octave
	note G_, 5
	inc_octave
	note D_, 5
	dec_octave
	note D_, 5
	note B_, 5
	dec_octave
	note B_, 6
	inc_octave
	note G_, 5
	dec_octave
	note G_, 5
	inc_octave
	note D_, 5
	dec_octave
	note D_, 5
	note B_, 5
	note G_, 5
	inc_octave
	note D_, 5
	dec_octave
	note B_, 6
	inc_octave
	note G_, 5
	note D_, 5
	note B_, 5
	note G_, 5
	inc_octave
	note D_, 5
	dec_octave
	note B_, 5
	inc_octave
	note G_, 5
	note D_, 6
	note B_, 5
	note G_, 5
	inc_octave
	note D_, 5
	dec_octave
	note B_, 5
	note G_, 5
	note B_, 5
	inc_octave
	note D_, 5
	;musicf0 26
	;musicf1 87
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 2
	notetype0 2
	note G_, 10
	sound_ret


Music_Diddly6_Ch3: ; 1f77cf (7d:77cf)
	notetype1 10
	;notetype2 15
	load_wave 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 13, 12, 11, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	notetype1 1
	;musice9 96
	notetype0 1
	;musicdc 17
	rest 10
	rest 10
	octave 2
	;musice8 4
	note D#, 16
	;tie
	note D#, 16
	;tie
	note D#, 16
	;tie
	note D#, 16
	;tie
	note D#, 16
	;tie
	note D#, 2
	note D_, 16
	;tie
	note D_, 16
	;tie
	note D_, 16
	;tie
	note D_, 16
	;tie
	note D_, 16
	;tie
	note D_, 2
.Loop1
	;musice8 4
	notetype0 7
	note G_, 3
	notetype0 10
	note D_, 2
	sound_loop 4, .Loop1
	notetype0 1
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 2
	notetype0 2
	;musice8 1
	note G_, 10
	sound_ret


Music_Diddly6_Ch4: ; 1f7812 (7d:7812)
	toggle_noise 6
	octave 1
	drum_speed 1
	;musicdc 255
	rest 10
	rest 10
	;musicef 1
	drum_note 2, 6
	;musicef 254
.Loop1
	drum_note 3, 5
	sound_loop 7, .Loop1
.Loop2
	drum_note 3, 6
	rept 7
	drum_note 3, 5
	endr
	sound_loop 3, .Loop2
	;musicef 0
.Loop3
	drum_speed 7
	drum_note 2, 3
	drum_speed 10
	drum_note 2, 2
	sound_loop 4, .Loop3
	;musicef 2
	drum_speed 7
	drum_note 6, 12
	sound_ret
; 0x1f783b
