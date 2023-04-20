Music_MatchStart1:
	channel_count 1
	channel 1, Music_MatchStart1_Ch1

Music_MatchStart1_Ch1:
	speed 1
	stereo_panning TRUE, TRUE
;	cutoff 8
.Loop1
	duty_cycle 2
	volume_envelope 15, 0
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
	volume_envelope 6, 0
	note E_, 1
	inc_octave
	note E_, 1
	octave 4
	volume_envelope 2, 0
	dec_octave
	note B_, 1
	inc_octave
	note B_, 1
	sound_ret
