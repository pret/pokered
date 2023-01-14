Music_Ditty4:
	channel_count 3
	channel 1, Music_Ditty4_Ch1
	channel 2, Music_Ditty4_Ch2
	channel 3, Music_Ditty4_Ch3

Music_Ditty4_Ch2:
;	preset 0
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	speed 1
	stereo_panning TRUE, TRUE
	octave 3
;	musicf1 87
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


Music_Ditty4_Ch1:
;	preset 0
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	speed 1
	stereo_panning TRUE, TRUE
	octave 2
;	musicf1 87
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


Music_Ditty4_Ch3:
	fade_wave 14
	speed 1
	channel_volume 2
;	echo 128
	stereo_panning TRUE, TRUE
	speed 1
;	cutoff 1
	rest 6
	rest 5
	rest 6
	rest 5
	rest 6
;	musicf1 128
	octave 4
	note F_, 16
;	tie
	note F_, 6
	sound_ret
