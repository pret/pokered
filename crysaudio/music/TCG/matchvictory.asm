Music_MatchVictory:
	channel_count 3
	channel 1, Music_MatchVictory_Ch1
	channel 2, Music_MatchVictory_Ch2
	channel 3, Music_MatchVictory_Ch3

Music_MatchVictory_Ch1:
	stereo_panning TRUE, TRUE
;	vibrato_type 1
	vibrato 20, 3, 3
;	cutoff 8
	octave 3
	duty_cycle 0
	volume_envelope 11, 0
	speed 1
	note A_, 15
;	tie
	note A_, 9
	volume_envelope 2, 7
	note A_, 5
	volume_envelope 11, 0
	note A_, 7
	volume_envelope 2, 7
	note A_, 3
	volume_envelope 11, 0
	note F_, 7
	volume_envelope 2, 7
	note F_, 3
	volume_envelope 11, 0
	note A_, 7
	volume_envelope 2, 7
	note A_, 2
	volume_envelope 11, 0
	note B_, 11
	volume_envelope 2, 7
	note B_, 10
	inc_octave
	volume_envelope 11, 0
	note C_, 10
	volume_envelope 2, 7
	note C_, 11
	volume_envelope 11, 0
	note D_, 10
	volume_envelope 2, 7
	note D_, 10
	volume_envelope 11, 0
	note C#, 8
	volume_envelope 2, 7
	note C#, 13
	volume_envelope 11, 0
	note D_, 5
	volume_envelope 2, 7
	note D_, 6
	volume_envelope 11, 0
	speed 8
	note E_, 12
	volume_envelope 2, 7
	note E_, 4
	sound_ret


Music_MatchVictory_Ch2:
	stereo_panning TRUE, TRUE
;	vibrato_type 1
	vibrato 20, 3, 3
;	cutoff 8
	octave 3
	duty_cycle 0
	volume_envelope 11, 0
	speed 1
	note F_, 5
	volume_envelope 2, 7
	note F_, 5
	dec_octave
	volume_envelope 11, 0
	note A_, 5
	inc_octave
	note C_, 5
	note F_, 5
	volume_envelope 2, 7
	note F_, 4
	volume_envelope 11, 0
	note C_, 7
	volume_envelope 2, 7
	note C_, 3
	dec_octave
	volume_envelope 11, 0
	note A_, 7
	volume_envelope 2, 7
	note A_, 3
	inc_octave
	volume_envelope 11, 0
	note C_, 7
	volume_envelope 2, 7
	note C_, 2
	volume_envelope 11, 0
	note G_, 11
	volume_envelope 2, 7
	note G_, 10
	volume_envelope 11, 0
	note A_, 10
	volume_envelope 2, 7
	note A_, 11
	volume_envelope 11, 0
	note B_, 10
	volume_envelope 2, 7
	note B_, 10
	volume_envelope 11, 0
	note A_, 8
	volume_envelope 2, 7
	note A_, 13
	volume_envelope 11, 0
	note B_, 5
	volume_envelope 2, 7
	note B_, 6
	inc_octave
	volume_envelope 11, 0
	speed 8
	note C#, 12
	volume_envelope 2, 7
	note C#, 4
	sound_ret


Music_MatchVictory_Ch3:
	stereo_panning TRUE, TRUE
	fade_wave 11
	channel_volume 1
;	cutoff 8
;	echo 0
	octave 2
	speed 1
	note F_, 15
;	tie
	note F_, 9
	rest 5
	note F_, 7
	rest 3
	note F_, 7
	rest 3
	note F_, 7
	rest 2
	note G_, 11
	rest 10
	note G_, 11
	rest 10
	note G_, 10
	rest 10
	note A_, 8
	rest 13
	note E_, 5
	rest 6
	speed 8
	note A_, 12
	sound_ret
