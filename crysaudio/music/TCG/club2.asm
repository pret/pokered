Music_Club2:
	channel_count 3
	channel 1, Music_Club2_Ch1
	channel 2, Music_Club2_Ch2
	channel 3, Music_Club2_Ch3

Music_Club2_Ch1: ; fa077 (3e:6077)
	speed 6
	duty_cycle 2
	;stereo_panning 1, 1
	fade_wave 6
.MainLoop
	octave 4
.Loop1
	channel_volume 7
	note G_, 4
	note E_, 4
	note C_, 4
	channel_volume 7
	fade_wave 0
	note F#, 4
	;tie
	fade_wave 6
	note F#, 16
	channel_volume 7
	note G_, 4
	note A_, 4
	note B_, 4
	channel_volume 7
	fade_wave 0
	note F#, 4
	;tie
	fade_wave 6
	note F#, 16
	sound_loop 8, .Loop1
	channel_volume 7
	note G_, 4
	note D_, 4
	dec_octave
	note B_, 4
	inc_octave
	channel_volume 7
	fade_wave 0
	note B_, 4
	;tie
	fade_wave 6
	note B_, 16
	channel_volume 7
	note G_, 4
	note D_, 4
	note C_, 4
	channel_volume 7
	fade_wave 0
	note B_, 4
	;tie
	fade_wave 6
	note B_, 16
	dec_octave
	channel_volume 7
	note F#, 4
	dec_octave
	note D_, 4
	note F#, 4
	note A_, 4
	inc_octave
	note D_, 4
	note F#, 4
	note A_, 4
	inc_octave
	note D_, 4
	dec_octave
	note C_, 4
	dec_octave
	note C_, 4
	note E_, 4
	note G_, 4
	inc_octave
	note C_, 4
	note E_, 4
	note G_, 4
	inc_octave
	note C_, 4
	dec_octave
	note D_, 4
	dec_octave
	note D_, 4
	note F#, 4
	note A_, 4
	inc_octave
	note D_, 4
	note F#, 4
	note A_, 4
	note A_, 3
	;tie
	speed 1
	note A_, 3
	inc_octave
	channel_volume 7
	rest 4
	note D_, 5
	;tie
	speed 6
	fade_wave 0
	note D_, 15
	;tie
	fade_wave 6
	note D_, 16
	sound_loop 0, .MainLoop


Music_Club2_Ch2: ; fa0e3 (3e:60e3)
	speed 6
	duty_cycle 2
	;stereo_panning 1, 1
	fade_wave 6
.MainLoop
	octave 2
.Loop1
	channel_volume 7
	note C_, 4
	note G_, 4
	inc_octave
	note G_, 4
	inc_octave
	channel_volume 7
	fade_wave 0
	note D_, 4
	;tie
	fade_wave 6
	note D_, 16
	dec_octave
	dec_octave
	channel_volume 7
	note C_, 4
	note G_, 4
	inc_octave
	inc_octave
	note C_, 4
	channel_volume 7
	fade_wave 0
	note D_, 4
	;tie
	fade_wave 6
	note D_, 16
	dec_octave
	dec_octave
	sound_loop 8, .Loop1
	dec_octave
	channel_volume 7
	note B_, 4
	inc_octave
	note G_, 4
	inc_octave
	note G_, 4
	inc_octave
	channel_volume 7
	fade_wave 0
	note G_, 4
	;tie
	fade_wave 6
	note G_, 16
	dec_octave
	dec_octave
	dec_octave
	channel_volume 7
	note A_, 4
	inc_octave
	note A_, 4
	inc_octave
	note A_, 4
	inc_octave
	channel_volume 7
	fade_wave 0
	note C_, 4
	;tie
	fade_wave 6
	note C_, 16
	dec_octave
	dec_octave
	channel_volume 7
	note D_, 4
	octave 2
	note F#, 4
	note A_, 4
	inc_octave
	note D_, 4
	note F#, 4
	note A_, 4
	inc_octave
	note D_, 4
	note F#, 4
	note G_, 4
	dec_octave
	dec_octave
	note E_, 4
	note G_, 4
	inc_octave
	note C_, 4
	note E_, 4
	note G_, 4
	inc_octave
	note C_, 4
	note E_, 4
	note F#, 4
	dec_octave
	dec_octave
	note F#, 4
	note A_, 4
	inc_octave
	note D_, 4
	note F#, 4
	note A_, 4
	inc_octave
	note D_, 4
	note E_, 3
	;tie
	speed 1
	note E_, 3
	dec_octave
	channel_volume 7
	note A_, 8
	inc_octave
	channel_volume 7
	note F#, 7
	;tie
	speed 6
	fade_wave 0
	note F#, 14
	;tie
	fade_wave 6
	note F#, 16
	sound_loop 0, .MainLoop


Music_Club2_Ch3: ; fa164 (3e:6164)
	speed 6
	channel_volume 1
	;stereo_panning 1, 1
	fade_wave 10
	;vibrato_type 4
	vibrato 35, 3, 3
	;cutoff 6
	;echo 64
.MainLoop
	channel_volume 3
	;cutoff 8
	rest 2
	octave 5
	note G_, 4
	note E_, 4
	note C_, 4
	note F#, 2
	rest 2
	rest 16
	note G_, 4
	note A_, 4
	note B_, 4
	note F#, 2
	rest 2
	rest 14
	channel_volume 2
	;echo 96
	sound_call Branch_fa1cf
	octave 5
	;cutoff 8
	note G_, 8
	sound_call Branch_fa1cf
	;echo 64
	channel_volume 1
	octave 4
	;cutoff 8
	note G_, 8
	sound_call Branch_fa1f3
	octave 4
	note G_, 16
	;tie
	note G_, 12
	rest 16
	rest 8
	;cutoff 8
	note E_, 8
	sound_call Branch_fa1f3
	octave 4
	note G_, 16
	;tie
	note G_, 12
	;tie
	note G_, 16
	;tie
	note G_, 8
	rest 4
	;cutoff 8
	note A_, 2
	note G_, 2
	;cutoff 6
	note F#, 16
	;tie
	note F#, 12
	rest 4
	note F#, 1
	;tie
	note G_, 15
	;tie
	note G_, 12
	rest 4
	note G#, 1
	;tie
	note A_, 15
	;tie
	note A_, 16
	rest 16
	rest 16
	;echo 96
	sound_loop 0, .MainLoop

Branch_fa1cf:
	;cutoff 6
	octave 6
	note C#, 1
	;tie
	note D_, 15
	;tie
	note D_, 12
	;cutoff 8
	note C_, 2
	dec_octave
	note B_, 2
	;cutoff 6
	note G_, 16
	;tie
	note G_, 8
	rest 4
	;cutoff 8
	note E_, 4
	note B_, 4
	inc_octave
	note C_, 4
	dec_octave
	note B_, 4
	;cutoff 6
	note A_, 16
	;tie
	note A_, 8
	;tie
	note A_, 16
	rest 4
	sound_ret

Branch_fa1f3:
	octave 5
	note C#, 1
	;tie
	note D_, 15
	;tie
	note D_, 4
	note E_, 4
	dec_octave
	note B_, 4
	inc_octave
	note C_, 4
	;cutoff 6
	note D_, 16
	;tie
	note D_, 8
	rest 4
	;cutoff 8
	note C_, 2
	dec_octave
	note B_, 2
	inc_octave
	note C_, 2
	dec_octave
	note B_, 2
	;cutoff 6
	sound_ret
; 0xfa210
