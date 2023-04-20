Music_Ditty2:
	channel_count 3
	channel 1, Music_Ditty2_Ch1
	channel 2, Music_Ditty2_Ch2
	channel 3, Music_Ditty2_Ch3

Music_Ditty2_Ch2:
;	preset 2
	volume_envelope 9, 0
	duty_cycle 3
	vibrato 28, 3, 3
	speed 1
	stereo_panning TRUE, TRUE
	octave 2
	note B_, 5
	note D_, 4
	note F_, 4
	note G#, 4
	note B_, 4
	inc_octave
	note D_, 4
	note F_, 5
	dec_octave
	note G#, 4
	note B_, 4
	inc_octave
	note D_, 4
	note F_, 4
	note G#, 4
	note B_, 5
	note D_, 4
	note F_, 4
	note G#, 4
	note B_, 4
	inc_octave
	note D_, 4
	note F_, 5
	dec_octave
	note F_, 4
	note G#, 4
	note B_, 4
	inc_octave
	note D_, 4
	note F_, 4
	note G_, 4
	note G#, 3
	note G_, 3
	note G#, 3
	note G_, 3
	note G#, 3
	note G_, 3
	note G#, 3
	note G_, 4
	note G#, 3
	note G_, 3
	note G#, 3
	note G_, 3
	note G#, 3
	note G_, 3
	note G#, 3
	note G_, 3
	note G#, 3
;	musicef -2
	note G_, 4
	note G#, 3
	note G_, 3
	note G#, 3
;	musicef -2
	note G_, 3
	note G#, 3
	note G_, 3
;	musicef -1
	note G#, 3
	note G_, 4
	note G#, 3
	sound_ret


Music_Ditty2_Ch1:
;	preset 2
	volume_envelope 9, 0
	duty_cycle 3
	vibrato 28, 3, 3
	speed 1
	stereo_panning TRUE, TRUE
	octave 2
	note F_, 4
	dec_octave
	note G#, 4
	note B_, 4
	inc_octave
	note D_, 4
	note F_, 4
	note G#, 4
	note B_, 4
	note D_, 4
	note F_, 4
	note G#, 4
	note B_, 4
	inc_octave
	note D_, 4
	note F_, 4
	dec_octave
	note G#, 4
	note B_, 4
	inc_octave
	note D_, 4
	note F_, 4
	note G#, 4
	note B_, 4
	dec_octave
	note B_, 4
	inc_octave
	note D_, 4
	note F_, 4
	note G#, 4
	note A_, 4
	note B_, 4
	inc_octave
	note C_, 3
	dec_octave
	note B_, 3
	inc_octave
	note C_, 3
	dec_octave
	note B_, 3
	inc_octave
	note C_, 3
	dec_octave
	note B_, 3
	inc_octave
	note C_, 3
	dec_octave
	note B_, 4
	inc_octave
	note C_, 3
	dec_octave
	note B_, 3
	inc_octave
	note C_, 3
	dec_octave
	note B_, 3
	inc_octave
	note C_, 3
	dec_octave
	note B_, 3
	inc_octave
	note C_, 3
	dec_octave
	note B_, 3
	inc_octave
	note C_, 3
	dec_octave
;	musicef -2
	note B_, 4
	inc_octave
	note C_, 3
	dec_octave
	note B_, 3
;	musicef -2
	inc_octave
	note C_, 3
	dec_octave
	note B_, 3
	inc_octave
	note C_, 3
	dec_octave
;	musicef -1
	note B_, 3
	inc_octave
	note C_, 3
	dec_octave
	note B_, 4
	inc_octave
	note C_, 3
	sound_ret


Music_Ditty2_Ch3:
	fade_wave 14
	speed 1
;	echo 128
	stereo_panning TRUE, TRUE
;	cutoff 7
	channel_volume 1
	octave 2
	note G_, 5
	channel_volume 2
	note G_, 4
	note G_, 4
	note G_, 4
	note G_, 4
	note G_, 4
	note G_, 5
	note G_, 4
	note G_, 4
	note G_, 4
	note G_, 4
	note G_, 4
	channel_volume 3
	note G_, 5
	note G_, 4
	note G_, 4
	note G_, 4
	note G_, 4
	note G_, 4
	channel_volume 3
	note G_, 5
	note G_, 4
	note G_, 4
	channel_volume 3
	note G_, 4
	channel_volume 2
	note G_, 4
	note G_, 4
	channel_volume 1
	note G_, 5
	note G_, 4
	note G_, 4
;	musicf1 64
	note G_, 4
	note G_, 4
	note G_, 4
	channel_volume 2
	note G_, 5
	note G_, 4
	note G_, 4
	note G_, 4
	note G_, 4
	note G_, 4
	channel_volume 3
	note G_, 5
	note G_, 4
	note G_, 4
	note G_, 4
	note G_, 4
	note G_, 4
	sound_ret
