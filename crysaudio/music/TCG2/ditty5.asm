Music_Ditty5:
	channel_count 2
	channel 1, Music_Ditty5_Ch1
	channel 2, Music_Ditty5_Ch2

Music_Ditty5_Ch2:
;	preset 2
	volume_envelope 9, 0
	duty_cycle 3
	vibrato 28, 3, 3
	speed 1
	stereo_panning TRUE, TRUE
	octave 3
	note G_, 2
	note B_, 3
	inc_octave
	note D_, 3
	note G_, 3
	dec_octave
	note B_, 2
	inc_octave
	note D_, 3
	note G_, 3
	note B_, 3
	note D_, 2
	note G_, 3
	note B_, 3
	inc_octave
	note D_, 3
	dec_octave
	note G_, 2
	note B_, 3
	inc_octave
	note D_, 3
	note G_, 3
;	musicef -4
	note G_, 3
	sound_ret


Music_Ditty5_Ch1:
;	preset 2
	volume_envelope 9, 0
	duty_cycle 3
	vibrato 28, 3, 3
	speed 1
	stereo_panning TRUE, TRUE
;	musicef -2
	octave 2
	note B_, 2
	inc_octave
	note D_, 3
	note G_, 3
	dec_octave
	note B_, 3
	inc_octave
	note D_, 2
	note G_, 3
	note B_, 3
	note D_, 3
	note G_, 2
	note B_, 3
	inc_octave
	note D_, 3
	dec_octave
	note G_, 3
	note B_, 2
	inc_octave
	note D_, 3
	note G_, 3
	note B_, 3
;	musicef -4
	note B_, 3
	sound_ret
