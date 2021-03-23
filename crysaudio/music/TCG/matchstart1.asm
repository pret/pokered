Music_MatchStart1:
	channel_count 1
	channel 1, Music_MatchStart1_Ch1

Music_MatchStart1_Ch1: ; f7919 (3d:7919)
	notetype0 1
	;stereo_panning 1, 1
	notetype2 8
.Loop1
	duty_cycle 2
	notetype1 15
	octave 3
	note C_, 1
	inc_octave
	note C_, 1
	dec_octave
	note G_, 1
	inc_octave
	note G_, 1
	octave 3
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	inc_octave
	note A_, 1
	octave 4
	duty_cycle 1
	note C_, 1
	inc_octave
	note C_, 1
	dec_octave
	note G_, 1
	inc_octave
	note G_, 1
	octave 4
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	inc_octave
	note A_, 1
	sound_loop 3, .Loop1
	octave 4
	notetype1 6
	note E_, 1
	inc_octave
	note E_, 1
	octave 4
	notetype1 2
	dec_octave
	note B_, 1
	inc_octave
	note B_, 1
	sound_ret
; 0xf7956
