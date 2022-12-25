Music_Overworld:
	channel_count 4
	channel 1, Music_Overworld_Ch1
	channel 2, Music_Overworld_Ch2
	channel 3, Music_Overworld_Ch3
	channel 4, Music_Overworld_Ch4

Music_Overworld_Ch1: ; f71a0 (3d:71a0)
	speed 7
	duty_cycle 0
	;stereo_panning 1, 1
	;vibrato_type 9
	vibrato 25, 3, 3
	channel_volume 10
	fade_wave 7
	octave 3
	rest 3
	sound_call Branch_f72ba
	rest 3
.MainLoop
	sound_call Branch_f72ba
	duty_cycle 1
	fade_wave 8
	octave 3
	channel_volume 10
	note A_, 5
	channel_volume 3
	note A_, 1
	inc_octave
	channel_volume 10
	note C_, 5
	channel_volume 3
	note C_, 1
	channel_volume 10
	note F_, 3
	speed 1
	note E_, 11
	channel_volume 3
	note E_, 10
	channel_volume 10
	speed 7
	note G_, 3
	speed 1
	note F_, 11
	channel_volume 3
	note F_, 10
	speed 7
	channel_volume 10
	note C_, 12
	channel_volume 3
	note C_, 2
	duty_cycle 0
	channel_volume 9
	fade_wave 7
	octave 3
	note E_, 4
	note E_, 3
	note E_, 3
	duty_cycle 1
	channel_volume 10
	fade_wave 8
	sound_call Branch_f72fb
	note C_, 6
	channel_volume 3
	note C_, 6
	channel_volume 10
	note C_, 3
	note D_, 3
	note E_, 3
	note G_, 6
	channel_volume 3
	note G_, 3
	channel_volume 10
	note F_, 4
	channel_volume 3
	note F_, 2
	channel_volume 10
	note C_, 3
	dec_octave
	note A_, 6
	note A#, 9
	channel_volume 3
	note A#, 6
	channel_volume 10
	note A#, 3
	inc_octave
	note D_, 3
	note F_, 3
	note A_, 3
	channel_volume 3
	note A_, 6
	channel_volume 10
	note G_, 3
	channel_volume 3
	note G_, 3
	channel_volume 10
	note E_, 3
	note D_, 3
	channel_volume 3
	note D_, 3
	channel_volume 10
	note E_, 2
	channel_volume 3
	note E_, 1
	channel_volume 10
	fade_wave 8
	note C_, 9
	channel_volume 3
	note C_, 3
	channel_volume 10
	dec_octave
	note A_, 3
	inc_octave
	speed 1
	note C_, 11
	channel_volume 4
	note C_, 10
	speed 7
	channel_volume 10
	note G_, 3
	speed 1
	note F_, 11
	channel_volume 4
	note F_, 10
	speed 7
	channel_volume 10
	note C_, 12
	channel_volume 3
	note C_, 6
	duty_cycle 2
	fade_wave 8
	channel_volume 6
	octave 4
	note G_, 1
	;tie
	note E_, 1
	;tie
	note C_, 1
	;tie
	dec_octave
	note G_, 1
	;tie
	note E_, 1
	;tie
	note C_, 1
	duty_cycle 1
	channel_volume 10
	fade_wave 8
	sound_call Branch_f72fb
	note C_, 6
	channel_volume 3
	note C_, 6
	channel_volume 10
	note C_, 3
	note D_, 3
	note E_, 3
	note F_, 9
	channel_volume 3
	note F_, 12
	channel_volume 10
	note F_, 2
	note G_, 1
	note A_, 1
	channel_volume 3
	note A_, 2
	channel_volume 10
	note A_, 12
	channel_volume 3
	note A_, 3
	channel_volume 10
	note D_, 3
	note A_, 3
	note A#, 9
	channel_volume 3
	note A#, 6
	channel_volume 10
	note A_, 5
	channel_volume 3
	note A_, 1
	channel_volume 10
	note G_, 5
	channel_volume 3
	note G_, 1
	channel_volume 9
	note F_, 8
	;tie
	note F_, 8
	;tie
	note F_, 8
	;tie
	note F_, 8
	;tie
	note F_, 8
	;tie
	note F_, 8
	channel_volume 3
	note F_, 3
	duty_cycle 0
	channel_volume 10
	fade_wave 7
	sound_loop 0, .MainLoop

Branch_f72ba:
	octave 3
	note F_, 3
	note F_, 2
	note A_, 1
	inc_octave
	channel_volume 10
	fade_wave 4
	note C_, 1
	rest 1
	dec_octave
	channel_volume 9
	fade_wave 7
	note A#, 3
	note A#, 1
	inc_octave
	channel_volume 10
	fade_wave 4
	note D_, 1
	rest 2
	dec_octave
	channel_volume 9
	fade_wave 7
	note G_, 3
	note A#, 3
	rest 3
	note A_, 3
	note A_, 2
	inc_octave
	note C_, 1
	channel_volume 10
	fade_wave 4
	note C_, 1
	rest 1
	dec_octave
	channel_volume 9
	fade_wave 7
	note A#, 3
	note A#, 1
	inc_octave
	channel_volume 10
	fade_wave 4
	note D_, 1
	rest 2
	channel_volume 9
	fade_wave 7
	note C_, 3
	dec_octave
	note A#, 3
	sound_ret

Branch_f72fb:
	octave 4
	channel_volume 10
	note D_, 5
	channel_volume 3
	note D_, 1
	channel_volume 10
	note F_, 5
	channel_volume 3
	note F_, 1
	channel_volume 10
	note A_, 3
	speed 1
	note G_, 11
	channel_volume 3
	note G_, 10
	speed 7
	inc_octave
	channel_volume 10
	note C_, 3
	dec_octave
	speed 1
	note A#, 11
	channel_volume 3
	note A#, 10
	speed 7
	channel_volume 10
	note C#, 12
	channel_volume 3
	note C#, 6
	channel_volume 10
	note D#, 3
	speed 1
	note C#, 11
	channel_volume 3
	note C#, 10
	channel_volume 10
	speed 7
	sound_ret


Music_Overworld_Ch2: ; f7334 (3d:7334)
	speed 7
	duty_cycle 0
	;stereo_panning 1, 1
	;vibrato_type 9
	vibrato 30, 3, 3
	fade_wave 7
	octave 3
	sound_call Branch_f7535
.MainLoop
	sound_call Branch_f7535
	channel_volume 9
	fade_wave 7
	rest 3
	note C_, 5
	note C_, 3
	channel_volume 9
	fade_wave 4
	inc_octave
	note F_, 1
	rest 2
	dec_octave
	channel_volume 9
	fade_wave 7
	note C_, 4
	note C_, 3
	note C_, 3
	rest 3
	note C_, 5
	note C_, 3
	channel_volume 9
	fade_wave 4
	inc_octave
	note G_, 1
	rest 2
	dec_octave
	channel_volume 9
	fade_wave 7
	note D_, 4
	note D_, 3
	note C_, 3
	rest 3
	dec_octave
	note A#, 5
	inc_octave
	note D_, 3
	channel_volume 9
	fade_wave 4
	inc_octave
	note F_, 1
	rest 2
	dec_octave
	channel_volume 9
	fade_wave 7
	note C_, 4
	note C_, 3
	dec_octave
	note A#, 3
	rest 3
	note A#, 5
	inc_octave
	note C#, 3
	channel_volume 9
	fade_wave 4
	inc_octave
	note F_, 1
	rest 2
	dec_octave
	channel_volume 9
	fade_wave 7
	note C#, 4
	dec_octave
	note F_, 3
	note A#, 3
	rest 3
	inc_octave
	note C_, 3
	note E_, 2
	note C_, 3
	channel_volume 9
	fade_wave 4
	inc_octave
	note G_, 1
	fade_wave 7
	channel_volume 6
	fade_wave 8
	octave 3
	note E_, 3
	note F_, 3
	note G_, 3
	fade_wave 7
	note A#, 6
	channel_volume 9
	fade_wave 7
	octave 3
	note D_, 3
	channel_volume 6
	fade_wave 8
	octave 3
	note A_, 3
	channel_volume 9
	fade_wave 7
	octave 2
	note A_, 2
	inc_octave
	inc_octave
	channel_volume 9
	fade_wave 4
	note F_, 1
	dec_octave
	rest 2
	channel_volume 9
	fade_wave 7
	note D_, 4
	note D_, 3
	dec_octave
	note A_, 3
	rest 3
	note A#, 3
	inc_octave
	note D_, 2
	dec_octave
	note A#, 3
	channel_volume 9
	fade_wave 4
	inc_octave
	inc_octave
	note F_, 1
	rest 2
	dec_octave
	dec_octave
	channel_volume 9
	fade_wave 7
	note A#, 4
	note A#, 3
	note A#, 3
	rest 3
	note A#, 3
	inc_octave
	note D_, 2
	dec_octave
	note A#, 3
	channel_volume 9
	fade_wave 4
	inc_octave
	note A_, 1
	rest 2
	dec_octave
	channel_volume 9
	fade_wave 7
	note A#, 6
	inc_octave
	note D_, 1
	dec_octave
	note A#, 3
	rest 3
	inc_octave
	note C_, 5
	note C_, 3
	channel_volume 9
	fade_wave 4
	inc_octave
	note F_, 1
	rest 2
	channel_volume 9
	fade_wave 7
	dec_octave
	note C_, 4
	note C_, 3
	note C_, 3
	rest 3
	note C_, 5
	note C_, 3
	channel_volume 9
	fade_wave 4
	inc_octave
	note G_, 1
	rest 2
	dec_octave
	channel_volume 9
	fade_wave 7
	note D_, 4
	duty_cycle 2
	channel_volume 6
	fade_wave 8
	octave 4
	note C_, 1
	;tie
	dec_octave
	note G_, 1
	;tie
	note E_, 1
	;tie
	note C_, 1
	;tie
	dec_octave
	note G_, 1
	;tie
	note E_, 1
	duty_cycle 0
	channel_volume 9
	fade_wave 7
	octave 2
	rest 3
	note A#, 5
	inc_octave
	note D_, 3
	channel_volume 9
	fade_wave 4
	inc_octave
	note F_, 1
	rest 2
	dec_octave
	channel_volume 9
	fade_wave 7
	note C_, 4
	note C_, 3
	dec_octave
	note A#, 3
	rest 3
	note A#, 5
	inc_octave
	note C#, 3
	channel_volume 9
	fade_wave 4
	inc_octave
	note F_, 1
	rest 2
	dec_octave
	channel_volume 9
	fade_wave 7
	note C#, 4
	note C#, 3
	note C#, 3
	rest 3
	note C_, 3
	dec_octave
	note A_, 2
	inc_octave
	note C_, 3
	channel_volume 9
	fade_wave 4
	inc_octave
	note G_, 1
	rest 2
	dec_octave
	channel_volume 9
	fade_wave 7
	note C_, 4
	note E_, 3
	note C_, 3
	rest 3
	note D_, 6
	dec_octave
	note B_, 2
	inc_octave
	inc_octave
	channel_volume 9
	fade_wave 4
	note F_, 1
	rest 2
	dec_octave
	channel_volume 9
	fade_wave 7
	note D_, 4
	channel_volume 6
	fade_wave 8
	octave 4
	note D_, 2
	note E_, 1
	note F_, 1
	channel_volume 2
	note F_, 2
	channel_volume 6
	note F_, 11
	channel_volume 9
	fade_wave 7
	octave 4
	channel_volume 9
	fade_wave 4
	note F_, 1
	rest 2
	dec_octave
	dec_octave
	channel_volume 9
	fade_wave 7
	note A#, 1
	channel_volume 6
	fade_wave 8
	octave 3
	note A#, 3
	inc_octave
	note F_, 3
	note G_, 9
	channel_volume 9
	fade_wave 7
	octave 3
	note D_, 2
	dec_octave
	note A#, 3
	inc_octave
	inc_octave
	channel_volume 9
	fade_wave 4
	note F_, 1
	fade_wave 8
	channel_volume 6
	octave 4
	note C_, 5
	channel_volume 2
	note C_, 1
	dec_octave
	channel_volume 9
	note A#, 5
	channel_volume 2
	note A#, 1
	channel_volume 9
	fade_wave 7
	octave 3
	rest 3
	note F_, 3
	note C_, 2
	note F_, 1
	channel_volume 9
	fade_wave 4
	inc_octave
	note F_, 1
	rest 1
	dec_octave
	channel_volume 9
	fade_wave 7
	note G_, 3
	note G_, 3
	speed 1
	channel_volume 9
	fade_wave 8
	inc_octave
	note F_, 4
	note C_, 3
	speed 7
	dec_octave
	channel_volume 9
	fade_wave 7
	note E_, 3
	note G_, 2
	inc_octave
	channel_volume 9
	fade_wave 4
	note F_, 1
	channel_volume 9
	fade_wave 7
	dec_octave
	rest 3
	note A_, 3
	note F_, 2
	note A_, 1
	inc_octave
	channel_volume 9
	fade_wave 4
	note F_, 1
	rest 1
	dec_octave
	channel_volume 9
	fade_wave 7
	note G_, 3
	note G_, 3
	speed 1
	channel_volume 9
	fade_wave 8
	inc_octave
	note F_, 4
	note C_, 3
	dec_octave
	speed 7
	channel_volume 9
	fade_wave 7
	note A_, 3
	note G_, 2
	inc_octave
	channel_volume 9
	fade_wave 4
	note F_, 1
	sound_loop 0, .MainLoop

Branch_f7535:
	octave 3
	channel_volume 9
	fade_wave 7
	rest 3
	note C_, 3
	note C_, 2
	note F_, 1
	channel_volume 9
	fade_wave 4
	inc_octave
	note F_, 1
	rest 1
	dec_octave
	channel_volume 9
	fade_wave 7
	note G_, 3
	note G_, 1
	channel_volume 9
	fade_wave 4
	inc_octave
	note F_, 1
	rest 1
	dec_octave
	fade_wave 8
	speed 1
	inc_octave
	note F_, 4
	note C_, 3
	speed 7
	channel_volume 9
	fade_wave 7
	dec_octave
	note E_, 3
	note G_, 2
	channel_volume 9
	fade_wave 4
	inc_octave
	note F_, 1
	dec_octave
	rest 3
	channel_volume 9
	fade_wave 8
	note F_, 3
	note F_, 2
	note A_, 1
	channel_volume 9
	fade_wave 4
	inc_octave
	note F_, 1
	rest 1
	dec_octave
	channel_volume 9
	fade_wave 7
	note G_, 3
	note G_, 1
	channel_volume 9
	fade_wave 4
	inc_octave
	note F_, 1
	rest 1
	dec_octave
	fade_wave 8
	speed 1
	inc_octave
	note F_, 4
	note C_, 3
	speed 7
	channel_volume 9
	fade_wave 7
	dec_octave
	note A_, 3
	note G_, 2
	channel_volume 9
	fade_wave 4
	inc_octave
	note F_, 1
	dec_octave
	sound_ret


Music_Overworld_Ch3: ; f75a1 (3d:75a1)
	speed 7
	;stereo_panning 1, 1
	channel_volume 1
	fade_wave 11
	;echo 64
	;cutoff 7
	octave 2
	sound_call Branch_f77f8
	note F_, 2
	inc_octave
	note C_, 1
.MainLoop
	sound_call Branch_f77f8
	note F_, 3
	sound_call Branch_f7826
	octave 2
	;cutoff 8
	note F_, 1
	note A#, 2
	rest 1
	octave 4
	;cutoff 3
	note C#, 2
	dec_octave
	;cutoff 8
	note F_, 1
	note A#, 1
	rest 1
	inc_octave
	;cutoff 3
	note F_, 2
	rest 1
	inc_octave
	note C#, 1
	octave 2
	;cutoff 8
	note A#, 1
	rest 1
	octave 4
	;cutoff 7
	note G_, 1
	octave 2
	;cutoff 8
	note A#, 1
	rest 1
	note F_, 1
	inc_octave
	;cutoff 3
	note A#, 2
	dec_octave
	;cutoff 8
	note A#, 1
	octave 4
	;cutoff 3
	note C#, 2
	octave 2
	;cutoff 8
	note F_, 1
	note A_, 2
	rest 1
	octave 4
	;cutoff 3
	note E_, 2
	octave 2
	;cutoff 8
	note A_, 1
	octave 4
	;cutoff 3
	note G_, 2
	;cutoff 7
	note E_, 1
	;cutoff 8
	dec_octave
	note E_, 1
	rest 1
	inc_octave
	inc_octave
	;cutoff 3
	note E_, 1
	octave 2
	;cutoff 8
	note A_, 1
	rest 1
	inc_octave
	note A_, 1
	rest 2
	dec_octave
	note A_, 1
	inc_octave
	note A_, 1
	note E_, 1
	note C_, 1
	dec_octave
	note A_, 1
	rest 1
	inc_octave
	note A_, 1
	dec_octave
	note D_, 2
	rest 1
	octave 4
	;cutoff 3
	note F_, 2
	octave 2
	;cutoff 8
	note A_, 1
	inc_octave
	note D_, 2
	dec_octave
	note A_, 1
	octave 4
	;cutoff 3
	note D_, 2
	inc_octave
	note C_, 1
	octave 2
	;cutoff 8
	note D_, 2
	octave 4
	;cutoff 3
	note F_, 2
	rest 1
	octave 2
	;cutoff 8
	note A_, 1
	octave 4
	;cutoff 3
	note F_, 2
	octave 2
	;cutoff 8
	note D_, 1
	octave 4
	;cutoff 3
	note D_, 2
	;cutoff 8
	octave 2
	note A_, 1
	note G_, 2
	rest 1
	octave 4
	;cutoff 3
	note D_, 2
	octave 2
	;cutoff 8
	note G_, 1
	octave 4
	;cutoff 3
	note F_, 2
	;cutoff 7
	note D_, 1
	dec_octave
	;cutoff 8
	note D_, 1
	rest 1
	;cutoff 3
	inc_octave
	note A#, 1
	octave 2
	;cutoff 8
	note G_, 1
	rest 1
	octave 4
	;cutoff 3
	note D_, 2
	rest 1
	dec_octave
	;cutoff 8
	note D_, 1
	inc_octave
	;cutoff 3
	note F_, 2
	octave 2
	;cutoff 8
	note G_, 1
	octave 4
	;cutoff 3
	note D_, 2
	;cutoff 8
	dec_octave
	note D_, 1
	note C_, 2
	rest 1
	inc_octave
	;cutoff 3
	note D_, 2
	octave 2
	;cutoff 8
	note G_, 1
	octave 4
	;cutoff 3
	note F_, 2
	;cutoff 7
	note D_, 1
	octave 2
	;cutoff 8
	note C_, 1
	rest 1
	octave 4
	;cutoff 3
	note F_, 1
	dec_octave
	;cutoff 8
	note C_, 1
	rest 1
	inc_octave
	;cutoff 3
	note D_, 2
	rest 1
	octave 2
	;cutoff 8
	note E_, 1
	inc_octave
	note C_, 1
	rest 1
	inc_octave
	;cutoff 7
	note F_, 1
	;cutoff 3
	note E_, 2
	;cutoff 8
	octave 2
	note E_, 1
	sound_call Branch_f7826
	;cutoff 8
	octave 3
	note C_, 1
	note C#, 2
	rest 1
	inc_octave
	;cutoff 3
	note C#, 2
	octave 2
	;cutoff 8
	note G#, 1
	inc_octave
	note C#, 1
	rest 1
	inc_octave
	;cutoff 3
	note F_, 2
	rest 1
	inc_octave
	note C#, 1
	octave 3
	;cutoff 8
	note C#, 1
	rest 1
	inc_octave
	note G_, 1
	dec_octave
	;cutoff 8
	note C#, 1
	rest 1
	dec_octave
	note G#, 1
	octave 4
	;cutoff 3
	note G_, 2
	dec_octave
	;cutoff 8
	note C#, 1
	inc_octave
	;cutoff 3
	note F_, 2
	octave 2
	;cutoff 8
	note G#, 1
	inc_octave
	note C_, 2
	rest 1
	inc_octave
	;cutoff 3
	note E_, 2
	dec_octave
	;cutoff 8
	note G_, 1
	inc_octave
	;cutoff 3
	note C_, 2
	;cutoff 7
	note E_, 1
	dec_octave
	;cutoff 8
	note E_, 1
	rest 1
	octave 5
	;cutoff 3
	note E_, 1
	octave 3
	;cutoff 8
	note C_, 1
	rest 1
	inc_octave
	;cutoff 3
	note E_, 2
	rest 1
	octave 2
	;cutoff 8
	note G_, 1
	octave 4
	;cutoff 3
	note G_, 2
	dec_octave
	;cutoff 8
	note C_, 1
	inc_octave
	;cutoff 3
	note E_, 2
	octave 2
	;cutoff 8
	note G_, 1
	note B_, 2
	rest 1
	octave 4
	;cutoff 3
	note F_, 2
	dec_octave
	;cutoff 8
	note F_, 1
	note B_, 2
	note F_, 1
	inc_octave
	;cutoff 3
	note D_, 2
	inc_octave
	note D_, 1
	octave 2
	;cutoff 8
	note B_, 2
	octave 4
	;cutoff 3
	note F_, 2
	rest 1
	dec_octave
	;cutoff 8
	note F_, 1
	note B_, 2
	note F_, 1
	dec_octave
	note B_, 2
	rest 1
	note A#, 2
	rest 1
	octave 4
	;cutoff 3
	note D_, 2
	dec_octave
	;cutoff 8
	note F_, 1
	note A#, 2
	note F_, 1
	inc_octave
	;cutoff 3
	note F_, 2
	inc_octave
	note D_, 1
	octave 2
	;cutoff 8
	note A#, 1
	rest 1
	octave 4
	;cutoff 7
	note D_, 1
	octave 2
	;cutoff 8
	note A#, 1
	rest 2
	note A#, 2
	inc_octave
	note F_, 1
	note A#, 1
	rest 2
	note C_, 2
	rest 1
	inc_octave
	;cutoff 3
	note D_, 2
	octave 2
	;cutoff 8
	note G_, 1
	octave 4
	;cutoff 3
	note F_, 2
	;cutoff 7
	note D_, 1
	octave 2
	;cutoff 8
	note C_, 1
	rest 1
	octave 5
	;cutoff 3
	note D_, 1
	octave 3
	;cutoff 8
	note C_, 1
	rest 1
	inc_octave
	;cutoff 3
	note D_, 2
	rest 1
	octave 2
	;cutoff 8
	note E_, 1
	inc_octave
	note C_, 1
	dec_octave
	note G_, 1
	note E_, 1
	note C_, 1
	rest 1
	note E_, 1
	note F_, 3
	octave 4
	;cutoff 3
	note A_, 2
	dec_octave
	;cutoff 8
	note C_, 1
	inc_octave
	;cutoff 5
	note F_, 2
	note A_, 1
	inc_octave
	note C_, 1
	dec_octave
	rest 1
	note A#, 2
	rest 1
	note A#, 1
	inc_octave
	note D_, 1
	dec_octave
	rest 2
	note G_, 2
	dec_octave
	;cutoff 8
	note C_, 1
	inc_octave
	;cutoff 5
	note A#, 2
	inc_octave
	note C_, 1
	octave 2
	;cutoff 8
	note F_, 3
	octave 5
	;cutoff 3
	note C_, 2
	octave 3
	;cutoff 8
	note C_, 1
	inc_octave
	;cutoff 5
	note A_, 2
	inc_octave
	note C_, 1
	note C_, 1
	rest 1
	dec_octave
	note A#, 2
	rest 1
	note A#, 1
	inc_octave
	note D_, 1
	rest 2
	note C_, 2
	octave 3
	;cutoff 8
	note C_, 1
	inc_octave
	;cutoff 5
	note A#, 2
	dec_octave
	;cutoff 8
	note C_, 1
	sound_loop 0, .MainLoop

Branch_f77f8:
	octave 2
	note F_, 3
	octave 4
	;cutoff 3
	note A_, 2
	dec_octave
	;cutoff 8
	note C_, 1
	note F_, 2
	note C_, 1
	rest 2
	note F_, 1
	rest 2
	note F_, 1
	rest 2
	note C_, 1
	note F_, 2
	note C_, 1
	dec_octave
	note F_, 2
	inc_octave
	note C_, 1
	dec_octave
	note F_, 3
	octave 5
	;cutoff 3
	note C_, 2
	octave 3
	;cutoff 8
	note C_, 1
	note F_, 2
	note C_, 1
	rest 2
	note F_, 1
	rest 2
	note F_, 1
	rest 2
	note C_, 1
	note F_, 2
	note C_, 1
	dec_octave
	sound_ret

Branch_f7826:
	octave 2
	note F_, 2
	rest 1
	octave 4
	;cutoff 3
	note F_, 2
	dec_octave
	;cutoff 8
	note C_, 1
	note F_, 1
	rest 1
	inc_octave
	;cutoff 3
	note F_, 2
	rest 1
	inc_octave
	note C_, 1
	octave 2
	;cutoff 8
	note F_, 1
	rest 1
	octave 4
	;cutoff 7
	note G_, 1
	octave 2
	;cutoff 8
	note F_, 1
	rest 1
	note C_, 1
	octave 4
	;cutoff 3
	note G_, 2
	octave 2
	;cutoff 8
	note F_, 1
	octave 4
	;cutoff 7
	note F_, 2
	octave 2
	;cutoff 8
	note G_, 1
	note A_, 2
	rest 1
	octave 4
	;cutoff 3
	note E_, 2
	dec_octave
	;cutoff 8
	note E_, 1
	note A_, 1
	rest 1
	inc_octave
	;cutoff 3
	note E_, 2
	rest 1
	inc_octave
	note C_, 1
	octave 2
	;cutoff 8
	note A_, 1
	rest 1
	octave 4
	;cutoff 7
	note E_, 1
	octave 2
	;cutoff 8
.Loop1
	note A_, 1
	rest 1
	note E_, 1
	sound_loop 2, .Loop1
	note A_, 2
	rest 1
	note A#, 2
	rest 1
	octave 4
	;cutoff 3
	note D_, 2
	dec_octave
	;cutoff 8
	note F_, 1
	note A#, 1
	rest 1
	inc_octave
	;cutoff 3
	note F_, 2
	rest 1
	inc_octave
	note D_, 1
	octave 2
	;cutoff 8
	note A#, 1
	rest 1
	octave 4
	;cutoff 7
	note D_, 1
	octave 2
	;cutoff 8
	note A#, 1
	rest 1
	note F_, 1
	octave 4
	;cutoff 3
	note D_, 2
	octave 2
	;cutoff 8
	note A#, 1
	octave 4
	;cutoff 3
	note D_, 2
	sound_ret


Music_Overworld_Ch4: ; f78af (3d:78af)
	toggle_noise 6
	drum_speed 7
	octave 1
	sound_call Branch_f78ee
	sound_call Branch_f78fb
.MainLoop
	sound_call Branch_f78ee
	drum_note 1, 3
	drum_note 4, 2
	drum_note 1, 1
	drum_note 2, 3
	drum_note 4, 2
	drum_note 5, 1
	drum_note 1, 2
	drum_note 4, 1
	drum_note 4, 3
	drum_note 2, 1
	drum_note 4, 1
	drum_note 4, 1
	drum_note 2, 3
.Loop1
	sound_call Branch_f78ee
	sound_call Branch_f78fb
	sound_loop 3, .Loop1
	sound_call Branch_f78ee
	sound_call Branch_f790a
.Loop2
	sound_call Branch_f78ee
	sound_call Branch_f78fb
	sound_loop 3, .Loop2
	sound_call Branch_f78ee
	sound_call Branch_f790a
	sound_call Branch_f78ee
	sound_call Branch_f78fb
	sound_loop 0, .MainLoop

Branch_f78ee:
	drum_note 1, 3
	drum_note 4, 2
	drum_note 1, 1
	drum_note 2, 3
	drum_note 4, 2
	drum_note 5, 1
	drum_note 1, 2
	drum_note 4, 1
	drum_note 4, 3
	drum_note 2, 3
	drum_note 4, 2
	drum_note 5, 1
	sound_ret

Branch_f78fb:
	drum_note 1, 3
	drum_note 4, 2
	drum_note 1, 1
	drum_note 2, 3
	drum_note 4, 2
	drum_note 5, 1
	drum_note 1, 2
	drum_note 4, 1
	drum_note 4, 3
	drum_note 2, 1
	drum_note 4, 1
	drum_note 4, 1
	drum_note 4, 2
	drum_note 5, 1
	sound_ret

Branch_f790a:
	drum_note 1, 3
	drum_note 4, 2
	drum_note 1, 1
	drum_note 2, 3
	drum_note 4, 2
	drum_note 5, 1
	drum_note 1, 2
	drum_note 4, 1
	drum_note 4, 3
	drum_note 2, 1
	drum_note 4, 1
	drum_note 4, 1
	drum_note 2, 2
	drum_note 2, 1
	sound_ret
; 0xf7919
