Music_MatchDraw:
	channel_count 3
	channel 1, Music_MatchDraw_Ch1
	channel 2, Music_MatchDraw_Ch2
	channel 3, Music_MatchDraw_Ch3

Music_MatchDraw_Ch1: ; f7cdf (3d:7cdf)
	notetype0 3
	;stereo_panning 1, 1
	notetype2 8
	octave 4
	duty_cycle 1
	notetype1 11
	note C_, 4
	dec_octave
	note B_, 2
	note A#, 2
	note A_, 2
	note G#, 2
	note G_, 2
	note F#, 2
	note F_, 4
	note E_, 2
	note D#, 2
	note D_, 2
	note C#, 2
	note C_, 2
	dec_octave
	note B_, 2
	note A#, 4
	note B_, 2
	notetype1 2
	note B_, 2
	notetype1 11
	note F#, 4
	note G_, 2
	notetype1 2
	note G_, 2
	notetype1 11
	note C_, 2
	notetype1 2
	note C_, 4
	inc_octave
	notetype1 11
	note E_, 1
	note G_, 1
	inc_octave
	note C_, 2
	notetype1 2
	note C_, 2
	sound_ret


Music_MatchDraw_Ch2: ; f7d17 (3d:7d17)
	notetype0 3
	;stereo_panning 1, 1
	notetype2 8
	octave 3
	duty_cycle 1
	notetype1 11
	rest 16
	note C_, 4
	dec_octave
	note B_, 2
	note A#, 2
	note A_, 2
	note G#, 2
	note G_, 2
	note F#, 2
	note F_, 4
	note F#, 2
	notetype1 2
	note F#, 2
	notetype1 11
	note C#, 4
	note D_, 2
	notetype1 2
	note D_, 2
	dec_octave
	notetype1 11
	note G_, 2
	notetype1 2
	note G_, 6
	inc_octave
	inc_octave
	notetype1 11
	note E_, 2
	notetype1 2
	note E_, 2
	sound_ret


Music_MatchDraw_Ch3: ; f7d47 (3d:7d47)
	notetype0 6
	;stereo_panning 1, 1
	notetype2 11
	notetype1 1
	;cutoff 8
	;echo 0
	octave 2
	rest 16
	note G_, 2
	note F#, 1
	rest 1
	note D#, 2
	note C#, 1
	rest 1
	note C_, 1
	rest 3
	inc_octave
	note C_, 1
	sound_ret
; 0xf7d60
