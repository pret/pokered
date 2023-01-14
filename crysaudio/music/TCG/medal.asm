Music_Medal:
	channel_count 3
	channel 1, Music_Medal_Ch1
	channel 2, Music_Medal_Ch2
	channel 3, Music_Medal_Ch3

Music_Medal_Ch1:
	stereo_panning TRUE, TRUE
;	vibrato_type 1
	vibrato 20, 3, 3
;	cutoff 8
	octave 2
	duty_cycle 1
	volume_envelope 10, 0
	speed 1
	note E_, 5
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 5
	note A_, 5
	inc_octave
	note C#, 5
	dec_octave
	dec_octave
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 5
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 5
	speed 15
	note A_, 2
;	tie
	speed 1
	note A_, 10
	volume_envelope 3, 7
	note A_, 5
	volume_envelope 10, 0
;	cutoff 7
	note A_, 5
	note A_, 5
	note A_, 5
;	cutoff 8
	note A_, 15
	volume_envelope 3, 7
	note A_, 5
	volume_envelope 10, 0
	note A_, 16
	volume_envelope 3, 7
	note A_, 5
	volume_envelope 10, 0
	note A_, 16
	volume_envelope 3, 7
	note A_, 6
	volume_envelope 10, 0
	speed 9
	note A_, 5
;	tie
	note A_, 8
;	tie
	speed 1
	note A_, 2
	volume_envelope 3, 7
	note A_, 16
	sound_ret


Music_Medal_Ch2:
	stereo_panning TRUE, TRUE
;	vibrato_type 1
	vibrato 20, 3, 3
;	cutoff 8
	octave 1
	duty_cycle 0
	volume_envelope 9, 0
	speed 1
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 5
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 5
	dec_octave
	note C#, 5
	note E_, 5
	note A_, 5
	inc_octave
	note C#, 5
	note E_, 5
	note A_, 5
	inc_octave
	speed 15
	note C_, 2
;	tie
	speed 1
	note C_, 10
	volume_envelope 2, 7
	note C_, 5
	volume_envelope 10, 0
;	cutoff 7
	note C_, 5
	note C_, 5
	note C_, 5
;	cutoff 8
	note D_, 15
	volume_envelope 3, 7
	note D_, 5
	volume_envelope 9, 0
	note D_, 16
	volume_envelope 2, 7
	note D_, 5
	volume_envelope 9, 0
	note D_, 16
	volume_envelope 3, 7
	note D_, 6
	volume_envelope 9, 0
	speed 9
	note C#, 5
;	tie
	note C#, 8
;	tie
	speed 1
	note C#, 2
	volume_envelope 2, 7
	note C#, 16
	sound_ret


Music_Medal_Ch3:
	stereo_panning TRUE, TRUE
	fade_wave 11
	channel_volume 1
;	cutoff 8
;	echo 0
	octave 2
	speed 1
	speed 15
	rest 4
	note F_, 2
;	tie
	speed 1
	note F_, 10
	rest 5
;	cutoff 7
	note F_, 5
	note F_, 5
	note F_, 5
;	cutoff 8
	note A#, 15
	rest 5
	note A#, 16
	rest 5
	note A#, 16
	rest 6
	speed 9
	note A_, 13
;	tie
	speed 1
	note A_, 2
	sound_ret
