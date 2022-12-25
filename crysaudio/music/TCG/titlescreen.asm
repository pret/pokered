Music_TCGTitleScreen:
	channel_count 4
	channel 1, Music_TCGTitleScreen_Ch1
	channel 2, Music_TCGTitleScreen_Ch2
	channel 3, Music_TCGTitleScreen_Ch3
	channel 4, Music_TCGTitleScreen_Ch4

Music_TCGTitleScreen_Ch1: ; f5052 (3d:5052)
	speed 7
	duty_cycle 0
	;stereo_panning 1, 1
	;vibrato_type 1
	vibrato 20, 3, 3
	channel_volume 10
	fade_wave 8
	octave 3
	note G_, 1
	channel_volume 3
	note G_, 1
	rest 1
	channel_volume 10
	fade_wave 6
	note F_, 1
	fade_wave 8
	note E_, 3
	channel_volume 3
	note E_, 1
	channel_volume 10
	note G_, 3
	channel_volume 3
	note G_, 1
	inc_octave
	channel_volume 10
	note D_, 5
	channel_volume 3
	note D_, 1
	channel_volume 13
	fade_wave 6
	note C_, 2
	dec_octave
	fade_wave 8
	note G_, 10
	channel_volume 3
	note G_, 2
	channel_volume 13
	note E_, 1
	channel_volume 3
	note E_, 1
	rest 1
	channel_volume 10
	fade_wave 6
	note G_, 1
	fade_wave 8
	note G_, 5
	channel_volume 3
	note G_, 1
	channel_volume 10
	fade_wave 6
	note F_, 2
	fade_wave 8
	note F_, 2
	speed 1
	note E_, 5
	;tie
	note F_, 4
	;tie
	note E_, 5
	speed 7
	note D_, 1
	channel_volume 3
	note D_, 1
	channel_volume 10
	note C_, 1
	channel_volume 3
	note C_, 1
	channel_volume 10
	fade_wave 8
	note D_, 11
	channel_volume 3
	note D_, 1
	channel_volume 13
	note G_, 1
	channel_volume 3
	note G_, 1
	rest 1
	channel_volume 10
	fade_wave 6
	note F_, 1
	fade_wave 8
	note E_, 3
	channel_volume 3
	note E_, 1
	channel_volume 10
	note G_, 3
	channel_volume 3
	note G_, 1
	inc_octave
	channel_volume 10
	note D_, 5
	channel_volume 3
	note D_, 1
	channel_volume 13
	fade_wave 6
	note E_, 2
	dec_octave
	fade_wave 8
	note G_, 8
	channel_volume 3
	note G_, 2
	channel_volume 13
	note E_, 2
	note F_, 2
	note G_, 2
	note G#, 3
	channel_volume 3
	note G#, 1
	channel_volume 13
	inc_octave
	note C_, 3
	channel_volume 3
	note C_, 1
	channel_volume 10
	note D_, 5
	channel_volume 3
	note D_, 1
	channel_volume 13
	fade_wave 6
	note C_, 2
	fade_wave 8
	note G_, 9
	channel_volume 3
	note G_, 1
	channel_volume 13
	note F_, 2
	note C_, 2
	note D_, 2
.Loop1
	note E_, 10
	channel_volume 3
	note E_, 2
	channel_volume 10
	note E_, 1
	channel_volume 3
	note E_, 1
	rest 1
	channel_volume 10
	fade_wave 6
	note E_, 1
	fade_wave 8
	sound_loop 2, .Loop1
	note E_, 12
	channel_volume 3
	note E_, 2
	channel_volume 10
	note D_, 1
	note C_, 1
	note D_, 1
	channel_volume 3
	note D_, 1
	rest 1
	channel_volume 10
	fade_wave 6
	note G_, 1
	fade_wave 8
	note G_, 8
	channel_volume 3
	note G_, 2
	channel_volume 10
	speed 1
	fade_wave 7
	note G_, 5
	note G_, 4
	note G_, 5
	fade_wave 8
	speed 7
	note G_, 9
	channel_volume 3
	note G_, 1
	channel_volume 10
	note F_, 2
	note C_, 2
	note D_, 2
	note E_, 10
	channel_volume 3
	note E_, 2
	channel_volume 10
	note C_, 1
	channel_volume 3
	note C_, 1
	rest 1
	fade_wave 6
	channel_volume 10
	note E_, 1
	fade_wave 8
	note E_, 6
	channel_volume 3
	note E_, 2
	channel_volume 10
	note D_, 3
	channel_volume 3
	note D_, 1
	channel_volume 10
	note C_, 3
	channel_volume 3
	note C_, 1
	channel_volume 10
	note C_, 6
	channel_volume 3
	note C_, 2
	dec_octave
	channel_volume 10
	note B_, 5
	channel_volume 3
	note B_, 2
	channel_volume 10
	inc_octave
	fade_wave 6
	note C_, 1
	fade_wave 8
	note C_, 8
	;tie
	note C_, 8
	;tie
	note C_, 8
	channel_volume 3
	note C_, 8
	sound_ret


Music_TCGTitleScreen_Ch2: ; f5193 (3d:5193)
	speed 7
	duty_cycle 0
	;stereo_panning 1, 1
	;vibrato_type 1
	vibrato 20, 3, 3
	channel_volume 8
	fade_wave 8
	octave 2
	note B_, 1
	channel_volume 2
	note B_, 1
	rest 1
	inc_octave
	channel_volume 8
	fade_wave 6
	note D_, 1
	fade_wave 8
	note C_, 3
	channel_volume 2
	note C_, 1
	channel_volume 8
	note E_, 3
	rest 1
	note G_, 5
	rest 1
	fade_wave 6
	note G_, 2
	fade_wave 8
	note E_, 10
	rest 2
	note C_, 1
	rest 2
	fade_wave 6
	note E_, 1
	fade_wave 8
	note F_, 5
	rest 1
	fade_wave 6
	note C_, 2
	fade_wave 7
	note C_, 2
	fade_wave 8
	note C_, 2
	dec_octave
	note G_, 1
	rest 1
	note E_, 1
	rest 1
	note F_, 4
	note A_, 1
	rest 2
	inc_octave
	fade_wave 6
	note C_, 1
	dec_octave
	fade_wave 8
	note B_, 3
	rest 1
	note B_, 1
	rest 2
	inc_octave
	fade_wave 6
	note D_, 1
	fade_wave 8
	note C_, 3
	channel_volume 2
	note C_, 1
	channel_volume 8
	note E_, 3
	rest 1
	note G_, 5
	rest 1
	fade_wave 6
	note G_, 2
	fade_wave 8
	note E_, 8
	rest 2
	note C_, 2
	note D_, 2
	note E_, 2
	note F_, 3
	rest 1
	note G#, 3
	rest 1
	note G#, 5
	rest 1
	fade_wave 6
	note F_, 2
	fade_wave 8
	note G#, 9
	rest 1
	note G#, 2
	note F_, 2
	note G#, 2
	inc_octave
	note C_, 10
	rest 2
	dec_octave
	note A_, 1
	channel_volume 2
	note A_, 1
	rest 1
	channel_volume 8
	inc_octave
	fade_wave 6
	note C_, 1
	fade_wave 8
	dec_octave
	note B_, 10
	rest 2
	note G_, 1
	channel_volume 2
	note G_, 1
	rest 1
	channel_volume 8
	fade_wave 6
	note B_, 1
	fade_wave 8
	note A_, 12
	channel_volume 2
	note A_, 2
	channel_volume 8
	note B_, 1
	note A_, 1
	note B_, 1
	channel_volume 2
	note B_, 1
	rest 1
	channel_volume 8
	inc_octave
	fade_wave 6
	note D_, 1
	fade_wave 8
	note D_, 8
	rest 2
	speed 1
	fade_wave 7
	note D_, 5
	note D_, 4
	note D_, 5
	speed 7
	fade_wave 8
	note C_, 9
	rest 1
	note C_, 2
	dec_octave
	fade_wave 7
	note G#, 2
	fade_wave 8
	note G#, 2
	note G_, 10
	rest 2
	note G_, 1
	rest 2
	fade_wave 6
	note G_, 1
	fade_wave 8
	note A_, 6
	rest 2
	note F#, 3
	rest 1
	note A_, 3
	rest 1
	note F_, 6
	rest 2
	note F_, 5
	rest 2
	fade_wave 6
	note F_, 1
	fade_wave 8
	note F_, 7
	rest 1
	speed 1
	fade_wave 8
	note F_, 14
	rest 5
	note D_, 13
	rest 5
	note F_, 14
	rest 5
	speed 7
	note E_, 8
	channel_volume 2
	note E_, 8
	sound_ret


Music_TCGTitleScreen_Ch3: ; f5286 (3d:5286)
	speed 7
	fade_wave 14
	channel_volume 1
	;echo 0
	;stereo_panning 1, 1
	;cutoff 6
	octave 3
	rest 4
	sound_call Branch_f52f0
	note F_, 4
	note F_, 4
	note E_, 4
	note E_, 4
	note D_, 4
	note D_, 4
	note G_, 4
	note G_, 4
	inc_octave
	sound_call Branch_f52f0
.Loop1
	note F_, 4
	sound_loop 4, .Loop1
.Loop2
	note A#, 4
	sound_loop 4, .Loop2
.Loop3
	note A_, 2
	note A_, 2
	rest 2
	note A_, 1
	note A_, 1
	sound_loop 2, .Loop3
.Loop4
	note G_, 2
	note G_, 2
	rest 2
	note G_, 1
	note G_, 1
	sound_loop 2, .Loop4
.Loop5
	note F_, 2
	note F_, 2
	rest 2
	note F_, 1
	note F_, 1
	sound_loop 2, .Loop5
.Loop6
	note E_, 2
	note E_, 2
	rest 2
	note E_, 1
	note E_, 1
	sound_loop 2, .Loop6
.Loop7
	note G#, 4
	sound_loop 4, .Loop7
.Loop8
	note G_, 4
	sound_loop 4, .Loop8
.Loop9
	note F#, 4
	sound_loop 4, .Loop9
.Loop10
	note G_, 4
	sound_loop 4, .Loop10
	inc_octave
	note C_, 4
	note C_, 4
	speed 1
	note C_, 9
	;tie
	note C_, 10
	dec_octave
	note G_, 9
	;tie
	note G_, 9
	note G_, 9
	;tie
	note G_, 10
	speed 7
	;cutoff 8
	note C_, 8
	sound_ret

Branch_f52f0:
	note C_, 4
	note C_, 4
	dec_octave
	note B_, 4
	note B_, 4
	note A_, 4
	note A_, 4
	note G_, 4
	note G_, 4
	sound_ret


Music_TCGTitleScreen_Ch4: ; f52fa (3d:52fa)
	toggle_noise 6
	drum_speed 7
	octave 1
	rest 4
.Loop1
	sound_call Branch_f5312
	sound_loop 16, .Loop1
.Loop2
	sound_call Branch_f531e
	sound_loop 8, .Loop2
.Loop3
	sound_call Branch_f5312
	sound_loop 10, .Loop3
	drum_note 2, 8
	sound_ret

Branch_f5312:
	drum_speed 7
	drum_note 2, 2
	drum_note 3, 2
	drum_note 2, 2
	drum_speed 1
	drum_note 3, 4
	drum_note 3, 3
	drum_note 3, 4
	drum_note 3, 3
	sound_ret

Branch_f531e:
	drum_speed 7
	drum_note 2, 2
	drum_note 2, 2
	rest 2
	drum_speed 1
	drum_note 2, 4
	drum_note 3, 3
	drum_note 3, 4
	drum_note 3, 3
	sound_ret
; 0xf532a
