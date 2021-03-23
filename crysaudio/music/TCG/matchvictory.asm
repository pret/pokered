Music_MatchVictory:
	channel_count 3
	channel 1, Music_MatchVictory_Ch1
	channel 2, Music_MatchVictory_Ch2
	channel 3, Music_MatchVictory_Ch3

Music_MatchVictory_Ch1: ; f7b61 (3d:7b61)
	;stereo_panning 1, 1
	;vibrato_type 1
	vibrato 20, 3, 3
	notetype2 8
	octave 3
	duty_cycle 0
	notetype1 11
	notetype0 1
	note A_, 15
	;tie
	note A_, 9
	notetype1 2
	note A_, 5
	notetype1 11
	note A_, 7
	notetype1 2
	note A_, 3
	notetype1 11
	note F_, 7
	notetype1 2
	note F_, 3
	notetype1 11
	note A_, 7
	notetype1 2
	note A_, 2
	notetype1 11
	note B_, 11
	notetype1 2
	note B_, 10
	inc_octave
	notetype1 11
	note C_, 10
	notetype1 2
	note C_, 11
	notetype1 11
	note D_, 10
	notetype1 2
	note D_, 10
	notetype1 11
	note C#, 8
	notetype1 2
	note C#, 13
	notetype1 11
	note D_, 5
	notetype1 2
	note D_, 6
	notetype1 11
	notetype0 8
	note E_, 12
	notetype1 2
	note E_, 4
	sound_ret


Music_MatchVictory_Ch2: ; f7bb0 (3d:7bb0)
	;stereo_panning 1, 1
	;vibrato_type 1
	vibrato 20, 3, 3
	notetype2 8
	octave 3
	duty_cycle 0
	notetype1 11
	notetype0 1
	note F_, 5
	notetype1 2
	note F_, 5
	dec_octave
	notetype1 11
	note A_, 5
	inc_octave
	note C_, 5
	note F_, 5
	notetype1 2
	note F_, 4
	notetype1 11
	note C_, 7
	notetype1 2
	note C_, 3
	dec_octave
	notetype1 11
	note A_, 7
	notetype1 2
	note A_, 3
	inc_octave
	notetype1 11
	note C_, 7
	notetype1 2
	note C_, 2
	notetype1 11
	note G_, 11
	notetype1 2
	note G_, 10
	notetype1 11
	note A_, 10
	notetype1 2
	note A_, 11
	notetype1 11
	note B_, 10
	notetype1 2
	note B_, 10
	notetype1 11
	note A_, 8
	notetype1 2
	note A_, 13
	notetype1 11
	note B_, 5
	notetype1 2
	note B_, 6
	inc_octave
	notetype1 11
	notetype0 8
	note C#, 12
	notetype1 2
	note C#, 4
	sound_ret


Music_MatchVictory_Ch3: ; f7c09 (3d:7c09)
	;stereo_panning 1, 1
	notetype2 11
	notetype1 1
	;cutoff 8
	;echo 0
	octave 2
	notetype0 1
	note F_, 15
	;tie
	note F_, 9
	rest 5
	note F_, 7
	rest 3
	note F_, 7
	rest 3
	note F_, 7
	rest 2
	note G_, 11
	rest 10
	note G_, 11
	rest 10
	note G_, 10
	rest 10
	note A_, 8
	rest 13
	note E_, 5
	rest 6
	notetype0 8
	note A_, 12
	sound_ret
; 0xf7c2e
