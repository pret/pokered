Music_MatchLoss:
	channel_count 3
	channel 1, Music_MatchLoss_Ch1
	channel 2, Music_MatchLoss_Ch2
	channel 3, Music_MatchLoss_Ch3

Music_MatchLoss_Ch1:
	stereo_panning TRUE, TRUE
;	vibrato_type 1
	vibrato 20, 3, 3
;	cutoff 8
	octave 4
	duty_cycle 2
	volume_envelope 11, 0
	speed 1
	note E_, 3
	note F_, 2
;	tie
	speed 5
	note F_, 3
	note C_, 1
	volume_envelope 3, 7
	note C_, 3
	dec_octave
	volume_envelope 10, 0
	note A#, 1
	volume_envelope 3, 7
	note A#, 3
	inc_octave
	speed 1
	volume_envelope 10, 0
	note D_, 3
	note D#, 2
;	tie
	note D#, 16
	dec_octave
	note A#, 6
	volume_envelope 3, 7
	note A#, 16
	volume_envelope 10, 0
	note G#, 6
	volume_envelope 3, 7
	note G#, 16
	inc_octave
	volume_envelope 10, 0
	note C_, 3
	note C#, 8
;	tie
	note C#, 12
	dec_octave
	speed 6
	note G#, 1
	volume_envelope 3, 7
	note G#, 3
	volume_envelope 10, 0
	note F#, 1
	speed 7
	volume_envelope 3, 7
	note F#, 3
	speed 1
	volume_envelope 10, 0
	note B_, 5
	inc_octave
	note C_, 4
;	tie
	speed 9
	note C_, 11
	volume_envelope 3, 7
	note C_, 2
	sound_ret


Music_MatchLoss_Ch2:
	stereo_panning TRUE, TRUE
;	vibrato_type 5
	vibrato 20, 3, 3
;	cutoff 8
	octave 3
	duty_cycle 2
	volume_envelope 9, 0
	speed 9
	rest 9
	speed 11
	rest 5
	speed 1
	rest 8
	speed 9
	rest 6
	note G_, 6
;	tie
	note G_, 6
	volume_envelope 3, 7
	note G_, 2
	sound_ret


Music_MatchLoss_Ch3:
	stereo_panning TRUE, TRUE
	fade_wave 11
	channel_volume 1
;	cutoff 8
;	echo 64
	octave 2
	speed 5
	note A#, 4
	inc_octave
;	cutoff 4
	note F_, 4
	note A#, 4
	dec_octave
;	cutoff 8
	speed 7
	note G#, 3
	inc_octave
;	cutoff 4
	speed 2
	note D#, 11
	note G#, 11
	dec_octave
;	cutoff 8
	speed 1
	note F#, 11
;	tie
	note F#, 12
	inc_octave
;	cutoff 4
	speed 12
	note C#, 2
	speed 2
	note F#, 13
	dec_octave
	speed 9
;	cutoff 8
	note F_, 12
	sound_ret
