Music_BoosterPack:
	channel_count 3
	channel 1, Music_BoosterPack_Ch1
	channel 2, Music_BoosterPack_Ch2
	channel 3, Music_BoosterPack_Ch3

Music_BoosterPack_Ch1: ; f7d60 (3d:7d60)
	;stereo_panning 1, 1
	;vibrato_type 1
	vibrato 20, 3, 3
	fade_wave 8
	octave 4
	duty_cycle 1
	speed 1
	channel_volume 10
	note D#, 5
	channel_volume 3
	note D#, 1
	channel_volume 10
	note G_, 5
	channel_volume 3
	note G_, 1
	channel_volume 10
	note A#, 5
	channel_volume 3
	note A#, 2
	channel_volume 10
	note F_, 5
	channel_volume 3
	note F_, 1
	channel_volume 10
	note A_, 5
	channel_volume 3
	note A_, 1
	inc_octave
	channel_volume 10
	note C_, 5
	channel_volume 3
	note C_, 2
	dec_octave
	channel_volume 10
	note B_, 16
	;tie
	note B_, 16
	;tie
	note B_, 6
	channel_volume 3
	note B_, 9
	sound_ret


Music_BoosterPack_Ch2: ; f7d9e (3d:7d9e)
	;stereo_panning 1, 1
	;vibrato_type 1
	vibrato 20, 3, 3
	fade_wave 8
	octave 3
	duty_cycle 1
	speed 1
	channel_volume 9
	note A#, 5
	channel_volume 2
	note A#, 1
	inc_octave
	channel_volume 9
	note D#, 5
	channel_volume 2
	note D#, 1
	channel_volume 9
	note G_, 5
	channel_volume 2
	note G_, 2
	channel_volume 9
	note C_, 5
	channel_volume 2
	note C_, 1
	channel_volume 9
	note F_, 5
	channel_volume 2
	note F_, 1
	channel_volume 9
	note A_, 5
	channel_volume 2
	note A_, 2
	channel_volume 9
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 6
	channel_volume 2
	note G_, 9
	sound_ret


Music_BoosterPack_Ch3: ; f7ddb (3d:7ddb)
	;stereo_panning 1, 1
	fade_wave 11
	channel_volume 1
	;cutoff 8
	;echo 0
	octave 2
	speed 1
	note D#, 6
	note A#, 6
	inc_octave
	note D#, 7
	dec_octave
	note F_, 6
	inc_octave
	note C_, 6
	note F_, 7
	dec_octave
	note G_, 16
	;tie
	note G_, 16
	;tie
	note G_, 6
	sound_ret
; 0xf7df8
