Music_MatchDraw:
	channel_count 3
	channel 1, Music_MatchDraw_Ch1
	channel 2, Music_MatchDraw_Ch2
	channel 3, Music_MatchDraw_Ch3

Music_MatchDraw_Ch1:
	speed 3
	stereo_panning TRUE, TRUE
;	cutoff 8
	octave 4
	duty_cycle 1
	volume_envelope 11, 0
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
	volume_envelope 2, 7
	note B_, 2
	volume_envelope 11, 0
	note F#, 4
	note G_, 2
	volume_envelope 2, 7
	note G_, 2
	volume_envelope 11, 0
	note C_, 2
	volume_envelope 2, 7
	note C_, 4
	inc_octave
	volume_envelope 11, 0
	note E_, 1
	note G_, 1
	inc_octave
	note C_, 2
	volume_envelope 2, 7
	note C_, 2
	sound_ret


Music_MatchDraw_Ch2:
	speed 3
	stereo_panning TRUE, TRUE
;	cutoff 8
	octave 3
	duty_cycle 1
	volume_envelope 11, 0
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
	volume_envelope 2, 7
	note F#, 2
	volume_envelope 11, 0
	note C#, 4
	note D_, 2
	volume_envelope 2, 7
	note D_, 2
	dec_octave
	volume_envelope 11, 0
	note G_, 2
	volume_envelope 2, 7
	note G_, 6
	inc_octave
	inc_octave
	volume_envelope 11, 0
	note E_, 2
	volume_envelope 2, 7
	note E_, 2
	sound_ret


Music_MatchDraw_Ch3:
	speed 6
	stereo_panning TRUE, TRUE
	fade_wave 11
	channel_volume 1
;	cutoff 8
;	echo 0
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
