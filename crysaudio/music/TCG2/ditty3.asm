Music_Ditty3:
	channel_count 3
	channel 1, Music_Ditty3_Ch1
	channel 2, Music_Ditty3_Ch2
	channel 3, Music_Ditty3_Ch3

Music_Ditty3_Ch2:
;	preset 2
	volume_envelope 9, 0
	duty_cycle 3
	vibrato 28, 3, 3
	speed 1
	stereo_panning TRUE, TRUE
	octave 5
	note C_, 3
	dec_octave
;	musicf1 48
	note C_, 2
	note C_, 1
;	musicf1 0
	note G_, 3
	inc_octave
	note C_, 3
	note G_, 3
	inc_octave
;	musicf1 48
	note C_, 5
	note C_, 6
	sound_ret


Music_Ditty3_Ch1:
;	preset 2
	volume_envelope 9, 0
	duty_cycle 3
	vibrato 28, 3, 3
	speed 1
	stereo_panning TRUE, TRUE
;	musicef -3
	rest 1
	octave 5
	note C_, 3
	dec_octave
;	musicf1 48
	note C_, 2
	note C_, 1
;	musicf1 0
	note G_, 3
	inc_octave
	note C_, 3
	note G_, 3
	inc_octave
;	musicf1 48
	note C_, 5
	note C_, 6
	sound_ret


Music_Ditty3_Ch3:
	fade_wave 15
	load_wave 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 13, 12, 11, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	speed 1
	channel_volume 2
;	echo 128
	stereo_panning TRUE, TRUE
	speed 1
;	cutoff 7
	octave 5
	note G_, 3
	dec_octave
	note G_, 3
	note E_, 3
	inc_octave
	note C_, 3
	note E_, 3
	inc_octave
	note C_, 4
	channel_volume 3
	note C_, 4
	sound_ret
