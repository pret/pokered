Music_CardPop:
	channel_count 4
	channel 1, Music_CardPop_Ch1
	channel 2, Music_CardPop_Ch2
	channel 3, Music_CardPop_Ch3
	channel 4, Music_CardPop_Ch4

Music_CardPop_Ch1: ; f703a (3d:703a)
	speed 4
	;stereo_panning 1, 1
	fade_wave 8
	duty_cycle 2
	channel_volume 9
.MainLoop
.Loop1
	rest 16
	sound_loop 7, .Loop1
	rest 14
.Loop2
	octave 5
	fade_wave 8
	note F#, 1
	note G_, 1
	fade_wave 6
	note F#, 1
	channel_volume 3
	note F#, 1
	channel_volume 9
	note D_, 1
	channel_volume 3
	note F#, 1
	dec_octave
	channel_volume 9
	note A_, 1
	inc_octave
	channel_volume 3
	note D_, 1
	dec_octave
	channel_volume 9
	note G_, 1
	channel_volume 3
	note A_, 1
	channel_volume 9
	note F#, 1
	channel_volume 3
	note G_, 1
	channel_volume 9
	note D_, 1
	channel_volume 3
	note G_, 1
	dec_octave
	channel_volume 9
	note A_, 1
	channel_volume 3
	inc_octave
	note D_, 1
	dec_octave
	channel_volume 9
	note G_, 1
	channel_volume 3
	note A_, 1
	channel_volume 9
	note F#, 1
	channel_volume 3
	note G_, 1
	rest 1
	note F#, 1
	rest 12
	rest 16
	rest 14
	octave 5
	channel_volume 9
	fade_wave 8
	note E_, 1
	note F_, 1
	fade_wave 6
	note E_, 1
	channel_volume 3
	note E_, 1
	channel_volume 9
	note C_, 1
	channel_volume 3
	note E_, 1
	dec_octave
	channel_volume 9
	note G_, 1
	inc_octave
	channel_volume 3
	note C_, 1
	dec_octave
	channel_volume 9
	note F_, 1
	channel_volume 3
	note G_, 1
	channel_volume 9
	note E_, 1
	channel_volume 3
	note F_, 1
	channel_volume 9
	note C_, 1
	channel_volume 3
	note E_, 1
	dec_octave
	channel_volume 9
	note G_, 1
	channel_volume 3
	inc_octave
	note C_, 1
	dec_octave
	channel_volume 9
	note F_, 1
	channel_volume 3
	note G_, 1
	channel_volume 9
	note E_, 1
	channel_volume 3
	note F_, 1
	rest 1
	note E_, 1
	rest 12
	rest 16
	channel_volume 9
	rest 14
	sound_loop 2, .Loop2
	rest 2
	sound_loop 0, .MainLoop


Music_CardPop_Ch2: ; f70df (3d:70df)
	speed 4
	;stereo_panning 1, 1
	fade_wave 8
	duty_cycle 2
	channel_volume 6
	fade_wave 3
.Loop1
	octave 2
	note A_, 2
	inc_octave
	note A_, 2
	inc_octave
	note A_, 2
	dec_octave
	note A_, 2
	inc_octave
	inc_octave
	note A_, 2
	dec_octave
	note A_, 2
	dec_octave
	note A_, 2
	inc_octave
	inc_octave
	note A_, 2
	dec_octave
	dec_octave
	note A_, 2
	dec_octave
	note A_, 2
	inc_octave
	note A_, 2
	inc_octave
	note A_, 2
	inc_octave
	note A_, 2
	dec_octave
	note A_, 2
	dec_octave
	note A_, 2
	inc_octave
	inc_octave
	note A_, 2
	sound_loop 2, .Loop1
.Loop2
	octave 2
	note G_, 2
	inc_octave
	note G_, 2
	inc_octave
	note G_, 2
	dec_octave
	note G_, 2
	inc_octave
	inc_octave
	note G_, 2
	dec_octave
	note G_, 2
	dec_octave
	note G_, 2
	inc_octave
	inc_octave
	note G_, 2
	dec_octave
	dec_octave
	note G_, 2
	dec_octave
	note G_, 2
	inc_octave
	note G_, 2
	inc_octave
	note G_, 2
	inc_octave
	note G_, 2
	dec_octave
	note G_, 2
	dec_octave
	note G_, 2
	inc_octave
	inc_octave
	note G_, 2
	sound_loop 2, .Loop2
	sound_loop 0, Music_CardPop_Ch2


Music_CardPop_Ch3: ; f713a (3d:713a)
	speed 4
	fade_wave 11
	;stereo_panning 1, 1
	channel_volume 1
	;echo 0
	;cutoff 8
	sound_call Branch_f715b
	note C_, 2
	note C#, 2
	sound_call Branch_f715b
	note D_, 2
	note C#, 2
	sound_call Branch_f716c
	note D_, 2
	note C#, 2
	sound_call Branch_f716c
	note C_, 2
	note C#, 2
	sound_loop 0, Music_CardPop_Ch3

Branch_f715b:
	octave 2
	note D_, 2
	rest 2
	note D_, 4
	inc_octave
	note D_, 2
	dec_octave
	note D_, 2
	rest 2
	note F#, 2
	rest 2
	note G_, 2
	rest 2
	note G#, 2
	rest 2
	note A_, 2
	sound_ret

Branch_f716c:
	octave 2
	note C_, 2
	rest 2
	note C_, 4
	inc_octave
	note C_, 2
	dec_octave
	note C_, 2
	rest 2
	note E_, 2
	rest 2
	note F_, 2
	rest 2
	note F#, 2
	rest 2
	note G_, 2
	sound_ret


Music_CardPop_Ch4: ; f717d (3d:717d)
	toggle_noise 6
.MainLoop
	drum_speed 4
	octave 1
.Loop1
	sound_call Branch_f7196
	drum_note 5, 4
	drum_note 2, 2
	drum_note 4, 2
	drum_note 5, 2
	drum_note 2, 2
	sound_loop 11, .Loop1
	sound_call Branch_f7196
	drum_note 5, 2
	drum_note 3, 1
	drum_note 3, 1
.Loop2
	drum_note 2, 2
	sound_loop 4, .Loop2
	sound_loop 0, .MainLoop

Branch_f7196:
	drum_note 1, 2
	drum_note 4, 2
	drum_note 5, 4
	drum_note 2, 2
	drum_note 4, 2
	drum_note 5, 2
	drum_note 2, 2
	drum_note 1, 2
	drum_note 2, 2
	sound_ret
; 0xf71a0
