Music_DuelTheme3:
	channel_count 4
	channel 1, Music_DuelTheme3_Ch1
	channel 2, Music_DuelTheme3_Ch2
	channel 3, Music_DuelTheme3_Ch3
	channel 4, Music_DuelTheme3_Ch4

Music_DuelTheme3_Ch1: ; f63a1 (3d:63a1)
	speed 11
	;stereo_panning 1, 1
	;vibrato_type 8
	vibrato 20, 3, 3
	fade_wave 8
.MainLoop
	octave 2
	duty_cycle 0
.Loop1
	;rept 4
	channel_volume 9
	note F#, 2
	rest 1
	;---
	channel_volume 9
	note F#, 2
	rest 1
	;---
	channel_volume 9
	note F#, 2
	rest 1
	;---
	channel_volume 9
	note F#, 2
	rest 1
	;endr
	channel_volume 9
	note E_, 2
	channel_volume 9
	note F_, 2
	sound_loop 4, .Loop1
.Loop2
	sound_call Branch_f67b2
	sound_loop 4, .Loop2
	duty_cycle 1
	channel_volume 10
.Loop3
	octave 3
	note C#, 1
	note F#, 1
	speed 1
	note G#, 5
	channel_volume 3
	note G#, 6
	sound_call Branch_f65a7
	octave 3
	note D_, 1
	note F#, 1
	speed 1
	note B_, 5
	channel_volume 3
	note B_, 6
	sound_call Branch_f65a7
	sound_loop 2, .Loop3
	duty_cycle 0
	channel_volume 10
	dec_octave
	rest 2
	speed 1
	note E_, 5
	channel_volume 2
	note E_, 6
	sound_call Branch_f65cf
	note F#, 5
	channel_volume 2
	note F#, 6
	speed 11
	rest 1
	dec_octave
	duty_cycle 0
	channel_volume 10
	speed 1
	note E_, 5
	channel_volume 2
	note E_, 6
	sound_call Branch_f65cf
	speed 11
	duty_cycle 1
	channel_volume 10
.Loop4
	octave 3
	note C#, 1
	note F#, 1
	speed 1
	note G#, 5
	channel_volume 3
	note G#, 6
	sound_call Branch_f65a7
	octave 3
	note D_, 1
	note F#, 1
	speed 1
	note B_, 5
	channel_volume 3
	note B_, 6
	channel_volume 10
	sound_call Branch_f65a7
	sound_loop 2, .Loop4
	vibrato 10, 3, 3
	duty_cycle 0
.Loop5
	octave 2
	rest 4
	channel_volume 9
	note F#, 2
	channel_volume 2
	note F#, 2
	rest 2
	channel_volume 9
	note E_, 2
	channel_volume 2
	note E_, 4
	channel_volume 9
	note D#, 2
	channel_volume 2
	note D#, 4
	channel_volume 9
	note D_, 2
	note C#, 2
	sound_loop 2, .Loop5
	vibrato 20, 3, 3
	duty_cycle 2
	fade_wave 6
.Loop6
	sound_call Branch_f661d
	sound_loop 4, .Loop6
	octave 4
	channel_volume 7
	note C#, 5
	channel_volume 2
	note C#, 6
	channel_volume 7
	note F#, 5
	channel_volume 2
	note F#, 6
.Loop7
	sound_call Branch_f661d
	sound_loop 3, .Loop7
	octave 4
	channel_volume 7
	note C#, 5
	channel_volume 2
	note C#, 6
	channel_volume 7
	note F#, 5
	channel_volume 2
	note F#, 6
	inc_octave
	channel_volume 7
	note C#, 5
	channel_volume 2
	note C#, 6
	dec_octave
	channel_volume 7
	note F#, 5
	channel_volume 2
	note F#, 6
	dec_octave
	speed 11
	duty_cycle 1
	channel_volume 9
	fade_wave 8
	note D_, 2
	note C#, 2
	dec_octave
	note F#, 3
	inc_octave
	speed 1
	note D_, 3
	note D#, 2
	note E_, 3
	note F_, 3
	speed 11
	note F#, 4
	dec_octave
	note G#, 3
	inc_octave
	speed 1
	note E_, 3
	note F_, 2
	note F#, 3
	note G_, 3
	speed 11
	note G#, 4
	duty_cycle 0
	octave 2
.Loop8
	;rept 4
	channel_volume 9
	note F#, 1
	channel_volume 3
	note F#, 1
	rest 1
	;---
	channel_volume 9
	note F#, 1
	channel_volume 3
	note F#, 1
	rest 1
	;---
	channel_volume 9
	note F#, 1
	channel_volume 3
	note F#, 1
	rest 1
	;---
	channel_volume 9
	note F#, 1
	channel_volume 3
	note F#, 1
	rest 1
	;endr
	channel_volume 9
	note F#, 1
	channel_volume 3
	note F#, 1
	channel_volume 9
	note F#, 1
	channel_volume 3
	note F#, 1
	;rept 4
	channel_volume 9
	note G_, 1
	channel_volume 3
	note G_, 1
	rest 1
	;---
	channel_volume 9
	note G_, 1
	channel_volume 3
	note G_, 1
	rest 1
	;---
	channel_volume 9
	note G_, 1
	channel_volume 3
	note G_, 1
	rest 1
	;---
	channel_volume 9
	note G_, 1
	channel_volume 3
	note G_, 1
	rest 1
	;endr
	channel_volume 9
	note A_, 1
	channel_volume 3
	note A_, 1
	channel_volume 9
	note G_, 1
	channel_volume 3
	note G_, 1
	sound_loop 2, .Loop8
	duty_cycle 1
	channel_volume 10
	octave 3
	note C#, 1
	note F#, 1
	speed 1
	note G#, 5
	channel_volume 3
	note G#, 6
	sound_call Branch_f65a7
	octave 3
	note C#, 1
	note F#, 1
	speed 1
	note G#, 5
	channel_volume 3
	note G#, 6
	inc_octave
	channel_volume 10
	speed 11
	note C#, 9
	channel_volume 3
	note C#, 2
	dec_octave
	channel_volume 10
	note B_, 1
	inc_octave
	note C#, 1
	note F#, 1
	note C#, 1
	dec_octave
	speed 1
	note B_, 5
	channel_volume 3
	note B_, 6
	speed 11
	channel_volume 10
	note F#, 9
	channel_volume 3
	note F#, 4
	channel_volume 10
	note G#, 1
	note A_, 1
	speed 1
	note G#, 5
	channel_volume 3
	note G#, 6
	channel_volume 10
	speed 11
	note B_, 8
	channel_volume 3
	note B_, 1
	channel_volume 10
	note A_, 2
	note B_, 1
	;tie
	speed 1
	note B_, 5
	channel_volume 3
	note B_, 6
	speed 11
	inc_octave
	channel_volume 10
	note C#, 1
	note D_, 1
	speed 1
	note C#, 5
	channel_volume 3
	note C#, 6
	channel_volume 10
	speed 11
	note E_, 10
	channel_volume 3
	note E_, 1
	channel_volume 10
	note D_, 1
	speed 1
	note C#, 8
	channel_volume 3
	note C#, 3
	dec_octave
	channel_volume 10
	speed 11
	note B_, 1
	inc_octave
	note C#, 1
	dec_octave
	speed 1
	note B_, 5
	channel_volume 3
	note B_, 6
	speed 11
	channel_volume 10
	note E_, 10
	channel_volume 3
	note E_, 3
	channel_volume 2
	note A_, 3
	channel_volume 6
	note A_, 5
	inc_octave
	channel_volume 4
	note E_, 3
	channel_volume 8
	note E_, 3
	channel_volume 10
	note E_, 2
	duty_cycle 1
.Loop9
	;rept 4
	channel_volume 9
	note G#, 1
	channel_volume 3
	note G#, 1
	rest 1
	;---
	channel_volume 9
	note G#, 1
	channel_volume 3
	note G#, 1
	rest 1
	;---
	channel_volume 9
	note G#, 1
	channel_volume 3
	note G#, 1
	rest 1
	;---
	channel_volume 9
	note G#, 1
	channel_volume 3
	note G#, 1
	rest 1
	;endr
	channel_volume 9
	note G#, 1
	channel_volume 3
	note G#, 1
	channel_volume 9
	note G#, 1
	channel_volume 3
	note G#, 1
	;rept 4
	channel_volume 9
	note A_, 1
	channel_volume 3
	note A_, 1
	rest 1
	;---
	channel_volume 9
	note A_, 1
	channel_volume 3
	note A_, 1
	rest 1
	;---
	channel_volume 9
	note A_, 1
	channel_volume 3
	note A_, 1
	rest 1
	;---
	channel_volume 9
	note A_, 1
	channel_volume 3
	note A_, 1
	rest 1
	;endr
	channel_volume 9
	note A_, 1
	channel_volume 3
	note A_, 1
	channel_volume 9
	note A_, 1
	channel_volume 3
	note A_, 1
	sound_loop 4, .Loop9
	sound_loop 0, .MainLoop

Branch_f65a7:
	speed 11
	octave 4
	channel_volume 10
	note C#, 5
	;tie
	note C#, 4
	channel_volume 3
	note C#, 2
	dec_octave
	channel_volume 10
	note B_, 1
	inc_octave
	note C#, 1
	note F#, 1
	note C#, 1
	dec_octave
	speed 1
	note B_, 5
	channel_volume 3
	note B_, 6
	speed 11
	channel_volume 10
	inc_octave
	note C#, 5
	;tie
	note C#, 4
	channel_volume 3
	note C#, 4
	channel_volume 10
	sound_ret

Branch_f65cf:
	octave 3
.Loop10
	speed 11
	rest 2
	speed 1
	channel_volume 10
	note E_, 5
	channel_volume 2
	note E_, 6
	sound_loop 3, .Loop10
	duty_cycle 2
	channel_volume 8
	note D_, 5
	note G_, 6
	note B_, 5
	inc_octave
	note D_, 6
	dec_octave
	note G_, 5
	note B_, 6
	inc_octave
	note D_, 5
	note G_, 6
	note F#, 5
	channel_volume 2
	note F#, 6
	duty_cycle 0
	channel_volume 10
	speed 11
	rest 1
	dec_octave
	speed 1
	note E_, 5
	channel_volume 2
	note E_, 6
.Loop11
	speed 11
	rest 2
	speed 1
	channel_volume 10
	note E_, 5
	channel_volume 2
	note E_, 6
	sound_loop 3, .Loop11
	dec_octave
	duty_cycle 2
	channel_volume 8
	note B_, 5
	inc_octave
	note E_, 6
	note G_, 5
	note B_, 6
	note E_, 5
	note G_, 6
	note B_, 5
	inc_octave
	note E_, 6
	sound_ret

Branch_f661d:
	octave 4
	speed 1
	channel_volume 7
	note C#, 5
	channel_volume 2
	note C#, 6
	channel_volume 7
	note F#, 5
	channel_volume 2
	note F#, 6
	inc_octave
	channel_volume 7
	note C#, 5
	channel_volume 2
	note C#, 6
	dec_octave
	channel_volume 7
	note F#, 5
	channel_volume 2
	note F#, 6
	inc_octave
	channel_volume 7
	note C#, 5
	channel_volume 2
	note C#, 6
	dec_octave
	channel_volume 7
	note F#, 5
	channel_volume 2
	note F#, 6
	sound_ret


Music_DuelTheme3_Ch2: ; f6649 (3d:6649)
	speed 11
	;stereo_panning 1, 1
	;vibrato_type 8
	vibrato 20, 3, 3
	fade_wave 8
.MainLoop
	octave 2
	duty_cycle 0
	;frequency_offset 3
.Loop1
	;rept 4
	channel_volume 8
	note F#, 2
	rest 1
	;---
	channel_volume 8
	note F#, 2
	rest 1
	;---
	channel_volume 8
	note F#, 2
	rest 1
	;---
	channel_volume 8
	note F#, 2
	rest 1
	;endr
	channel_volume 8
	note E_, 2
	channel_volume 8
	note F_, 2
	sound_loop 4, .Loop1
	;frequency_offset 0
	octave 3
.Loop2
	rest 6
	channel_volume 10
	note E_, 1
	channel_volume 2
	note E_, 1
	rest 8
	sound_loop 4, .Loop2
.Loop3
	;rept 2
	sound_call Branch_f67b2
	;---
	sound_call Branch_f67b2
	;endr
	;rept 2
	sound_call Branch_f680a
	;---
	sound_call Branch_f680a
	;endr
	sound_loop 2, .Loop3
	octave 2
	channel_volume 10
	speed 11
	rest 1
	speed 1
	note C#, 5
	channel_volume 2
	note C#, 6
	channel_volume 10
	note A_, 5
	channel_volume 2
	note A_, 6
	sound_call Branch_f6866
	octave 4
	note C#, 5
	channel_volume 2
	note C#, 6
	dec_octave
	dec_octave
	duty_cycle 0
	channel_volume 10
	note C#, 5
	channel_volume 2
	note C#, 6
	channel_volume 10
	note A_, 5
	channel_volume 2
	note A_, 6
	sound_call Branch_f6866
	duty_cycle 0
	channel_volume 9
.Loop4
	;rept 2
	sound_call Branch_f67b2
	;---
	sound_call Branch_f67b2
	;endr
	;rept 2
	sound_call Branch_f680a
	;---
	sound_call Branch_f680a
	;endr
	sound_loop 2, .Loop4
	vibrato 10, 3, 3
.Loop5
	channel_volume 10
	fade_wave 6
	note F#, 1
	note F#, 1
	fade_wave 8
	speed 1
	note F#, 5
	channel_volume 2
	note F#, 6
	channel_volume 10
	fade_wave 6
	speed 11
	note F#, 1
	inc_octave
	channel_volume 9
	fade_wave 8
	note C#, 2
	dec_octave
	channel_volume 10
	fade_wave 6
	note F#, 1
	note F#, 1
	speed 1
	fade_wave 8
	note F#, 5
	channel_volume 2
	note F#, 6
	channel_volume 10
	fade_wave 6
	speed 11
	note F#, 1
	channel_volume 9
	fade_wave 8
	note B_, 2
	channel_volume 10
	fade_wave 6
	note F#, 1
	note F#, 1
	fade_wave 8
	speed 1
	note F#, 5
	channel_volume 2
	note F#, 6
	channel_volume 10
	fade_wave 6
	speed 11
	note F#, 1
	channel_volume 9
	fade_wave 8
	note B_, 2
	channel_volume 10
	fade_wave 6
	note F#, 1
	note F#, 1
	speed 1
	fade_wave 8
	note F#, 5
	channel_volume 2
	note F#, 6
	channel_volume 10
	fade_wave 6
	speed 11
	note F#, 1
	fade_wave 8
	channel_volume 9
	note A_, 2
	note G#, 2
	sound_loop 4, .Loop5
	vibrato 20, 3, 3
	note D_, 3
	speed 1
	note A#, 3
	note B_, 2
	inc_octave
	note C_, 3
	note C#, 3
	speed 11
	note D_, 4
	dec_octave
	note E_, 3
	inc_octave
	speed 1
	note C_, 3
	note C#, 2
	note D_, 3
	note D#, 3
	speed 11
	note E_, 4
	octave 3
.Loop6
	;rept 4
	channel_volume 9
	note C#, 1
	channel_volume 3
	note C#, 1
	rest 1
	;---
	channel_volume 9
	note C#, 1
	channel_volume 3
	note C#, 1
	rest 1
	;---
	channel_volume 9
	note C#, 1
	channel_volume 3
	note C#, 1
	rest 1
	;---
	channel_volume 9
	note C#, 1
	channel_volume 3
	note C#, 1
	rest 1
	;endr
	channel_volume 9
	note C#, 1
	channel_volume 3
	note C#, 1
	channel_volume 9
	note C#, 1
	channel_volume 3
	note C#, 1
	;rept 4
	channel_volume 9
	note D_, 1
	channel_volume 3
	note D_, 1
	rest 1
	;---
	channel_volume 9
	note D_, 1
	channel_volume 3
	note D_, 1
	rest 1
	;---
	channel_volume 9
	note D_, 1
	channel_volume 3
	note D_, 1
	rest 1
	;---
	channel_volume 9
	note D_, 1
	channel_volume 3
	note D_, 1
	rest 1
	;endr
	channel_volume 9
	note E_, 1
	channel_volume 3
	note E_, 1
	channel_volume 9
	note D_, 1
	channel_volume 3
	note D_, 1
	sound_loop 6, .Loop6
	duty_cycle 1
	inc_octave
.Loop7
	;rept 4
	channel_volume 8
	note E_, 1
	channel_volume 3
	note E_, 1
	rest 1
	;---
	channel_volume 8
	note E_, 1
	channel_volume 3
	note E_, 1
	rest 1
	;---
	channel_volume 8
	note E_, 1
	channel_volume 3
	note E_, 1
	rest 1
	;---
	channel_volume 8
	note E_, 1
	channel_volume 3
	note E_, 1
	rest 1
	;endr
	channel_volume 8
	note E_, 1
	channel_volume 3
	note E_, 1
	channel_volume 8
	note E_, 1
	channel_volume 3
	note E_, 1
	;rept 4
	channel_volume 8
	note D_, 1
	channel_volume 3
	note D_, 1
	rest 1
	;---
	channel_volume 8
	note D_, 1
	channel_volume 3
	note D_, 1
	rest 1
	;---
	channel_volume 8
	note D_, 1
	channel_volume 3
	note D_, 1
	rest 1
	;---
	channel_volume 8
	note D_, 1
	channel_volume 3
	note D_, 1
	rest 1
	;endr
	channel_volume 8
	note D_, 1
	channel_volume 3
	note D_, 1
	channel_volume 8
	note D_, 1
	channel_volume 3
	note D_, 1
	sound_loop 4, .Loop7
	sound_loop 0, .MainLoop

Branch_f67b2:
	octave 2
	channel_volume 10
	speed 11
	rest 1
	speed 1
	note F#, 5
	channel_volume 2
	note F#, 6
	channel_volume 10
	note A_, 5
	channel_volume 2
	note A_, 6
	channel_volume 10
	note F#, 5
	channel_volume 2
	note F#, 6
	channel_volume 10
	speed 11
	rest 1
	speed 1
	note F#, 5
	channel_volume 3
	note F#, 6
	inc_octave
	channel_volume 10
	speed 11
	note C_, 1
	dec_octave
	speed 1
	note B_, 5
	channel_volume 2
	note B_, 6
	speed 11
	rest 1
	speed 1
	channel_volume 10
	note A_, 5
	channel_volume 2
	note A_, 6
	speed 11
	rest 1
	speed 1
	channel_volume 10
	note B_, 5
	channel_volume 2
	note B_, 6
	channel_volume 10
	note A_, 4
	note B_, 4
	note A_, 3
	note F#, 5
	channel_volume 2
	note F#, 6
	speed 11
	channel_volume 9
	note E_, 1
	channel_volume 10
	note F_, 1
	sound_ret

Branch_f680a:
	octave 2
	channel_volume 10
	speed 11
	rest 1
	speed 1
	note G_, 5
	channel_volume 2
	note G_, 6
	channel_volume 10
	note B_, 5
	channel_volume 2
	note B_, 6
	channel_volume 10
	note G_, 5
	channel_volume 2
	note G_, 6
	speed 11
	rest 1
	speed 1
	channel_volume 10
	note G_, 5
	channel_volume 2
	note G_, 6
	inc_octave
	channel_volume 10
	speed 11
	note C#, 1
	speed 1
	note C_, 5
	channel_volume 2
	note C_, 6
	channel_volume 10
	speed 11
	rest 1
	dec_octave
	speed 1
	note B_, 5
	channel_volume 2
	note B_, 6
	speed 11
	rest 1
	inc_octave
	speed 1
	channel_volume 10
	note C#, 5
	channel_volume 2
	note C#, 6
	dec_octave
	channel_volume 10
	note B_, 4
	inc_octave
	note C#, 4
	dec_octave
	note B_, 3
	note G_, 5
	channel_volume 2
	note G_, 6
	speed 11
	channel_volume 9
	note B_, 1
	channel_volume 10
	note G_, 1
	sound_ret

Branch_f6866:
	octave 2
.Loop8
	speed 11
	rest 1
	speed 1
	channel_volume 10
	note C#, 5
	channel_volume 2
	note C#, 6
	channel_volume 10
	note A_, 5
	channel_volume 2
	note A_, 6
	sound_loop 3, .Loop8
	duty_cycle 2
	channel_volume 7
	note B_, 5
	inc_octave
	note D_, 6
	note G_, 5
	note B_, 6
	note D_, 5
	note G_, 6
	note B_, 5
	inc_octave
	note D_, 6
	note C#, 5
	channel_volume 2
	note C#, 6
	dec_octave
	dec_octave
	duty_cycle 0
	channel_volume 10
	note C#, 5
	channel_volume 2
	note C#, 6
	channel_volume 10
	note A_, 5
	channel_volume 2
	note A_, 6
.Loop9
	speed 11
	rest 1
	speed 1
	channel_volume 10
	note C#, 5
	channel_volume 2
	note C#, 6
	channel_volume 10
	note A_, 5
	channel_volume 2
	note A_, 6
	sound_loop 3, .Loop9
	duty_cycle 2
	channel_volume 7
	note G_, 5
	note B_, 6
	inc_octave
	note E_, 5
	note G_, 6
	dec_octave
	note B_, 5
	inc_octave
	note E_, 6
	note G_, 5
	note B_, 6
	inc_octave
	sound_ret


Music_DuelTheme3_Ch3: ; f68c2 (3d:68c2)
	speed 11
	;stereo_panning 1, 1
	channel_volume 1
	fade_wave 11
	;echo 96
	;vibrato_type 8
	vibrato 0, 3, 3
	;cutoff 8
.MainLoop
	octave 2
.Loop1
	;rept 4
	;cutoff 4
	note F#, 2
	rest 1
	;---
	;cutoff 4
	note F#, 2
	rest 1
	;---
	;cutoff 4
	note F#, 2
	rest 1
	;---
	;cutoff 4
	note F#, 2
	rest 1
	;endr
	;cutoff 8
	note E_, 2
	note F_, 2
	sound_loop 4, .Loop1
.Loop2
	sound_call Branch_f6973
	sound_loop 4, .Loop2
.Loop3
	sound_call Branch_f6973
	sound_call Branch_f6992
	sound_loop 2, .Loop3
	octave 2
.Loop4
	;rept 4
	note F#, 1
	rest 2
	;---
	note F#, 1
	rest 2
	;---
	note F#, 1
	rest 2
	;---
	note F#, 1
	rest 2
	;endr
	note G_, 2
	note G_, 2
	;rept 4
	note F#, 1
	rest 2
	;---
	note F#, 1
	rest 2
	;---
	note F#, 1
	rest 2
	;---
	note F#, 1
	rest 2
	;endr
	note E_, 2
	note F_, 2
	sound_loop 2, .Loop4
.Loop5
	sound_call Branch_f6973
	sound_call Branch_f6992
	sound_loop 2, .Loop5
	vibrato 10, 3, 3
	octave 2
.Loop6
	sound_call Branch_f69f0
	speed 11
	octave 4
	;cutoff 8
	note D_, 2
	note C#, 2
	dec_octave
	dec_octave
	sound_loop 3, .Loop6
	sound_call Branch_f69f0
	octave 2
	;cutoff 8
	note F#, 2
	note E_, 2
	vibrato 0, 3, 3
	note D_, 3
	speed 1
	note A#, 3
	note B_, 2
	inc_octave
	note C_, 3
	note C#, 3
	speed 11
	note D_, 4
	dec_octave
	note E_, 3
	inc_octave
	speed 1
	note C_, 3
	note C#, 2
	note D_, 3
	note D#, 3
	speed 11
	note E_, 4
	dec_octave
.Loop7
	;rept 4
	note F#, 1
	rest 2
	;---
	note F#, 1
	rest 2
	;---
	note F#, 1
	rest 2
	;---
	note F#, 1
	rest 2
	;endr
	note F#, 2
	note F_, 2
	;rept 4
	note E_, 1
	rest 2
	;---
	note E_, 1
	rest 2
	;---
	note E_, 1
	rest 2
	;---
	note E_, 1
	rest 2
	;endr
	note E_, 2
	note F_, 2
	sound_loop 6, .Loop7
	;cutoff 7
.Loop8
	inc_octave
	;rept 4
	note F#, 1
	dec_octave
	note F#, 1
	note F#, 1
	inc_octave
	;---
	note F#, 1
	dec_octave
	note F#, 1
	note F#, 1
	inc_octave
	;---
	note F#, 1
	dec_octave
	note F#, 1
	note F#, 1
	inc_octave
	;---
	note F#, 1
	dec_octave
	note F#, 1
	note F#, 1
	inc_octave
	;endr
	note F#, 1
	dec_octave
	note F#, 1
	inc_octave
	note F#, 1
	dec_octave
	note F#, 1
	inc_octave
	;rept 4
	note E_, 1
	dec_octave
	note E_, 1
	note E_, 1
	inc_octave
	;---
	note E_, 1
	dec_octave
	note E_, 1
	note E_, 1
	inc_octave
	;---
	note E_, 1
	dec_octave
	note E_, 1
	note E_, 1
	inc_octave
	;---
	note E_, 1
	dec_octave
	note E_, 1
	note E_, 1
	inc_octave
	;endr
	note E_, 1
	dec_octave
	note E_, 1
	inc_octave
	note E_, 1
	dec_octave
	note E_, 1
	sound_loop 4, .Loop8
	;cutoff 8
	sound_loop 0, .MainLoop

Branch_f6973:
	octave 2
	note F#, 1
	rest 1
	inc_octave
	inc_octave
	;cutoff 4
	note E_, 1
	dec_octave
	dec_octave
	;cutoff 8
	note F#, 1
	rest 2
	note F#, 1
	rest 1
	rest 1
	note F#, 1
	rest 1
	inc_octave
	inc_octave
	;cutoff 4
	note E_, 1
	dec_octave
	dec_octave
	;cutoff 8
	note E_, 2
	note F_, 2
	sound_ret

Branch_f6992:
	octave 2
	;sound_call Branch_f6973
	note F#, 1
	rest 1
	inc_octave
	inc_octave
	;cutoff 4
	note E_, 1
	dec_octave
	dec_octave
	;cutoff 8
	note F#, 1
	rest 2
	note F#, 1
	rest 1
	rest 1
	note F#, 1
	rest 1
	inc_octave
	inc_octave
	;cutoff 4
	note E_, 1
	dec_octave
	dec_octave
	;cutoff 8
	note F#, 1
	rest 1
	note F#, 2
	note G_, 1
	rest 1
	inc_octave
	inc_octave
	;cutoff 4
	note F#, 1
	dec_octave
	dec_octave
	;cutoff 8
	note G_, 1
	rest 2
	note G_, 1
	rest 1
	rest 1
	note G_, 1
	rest 1
	inc_octave
	inc_octave
	;cutoff 4
	note F#, 1
	dec_octave
	dec_octave
	;cutoff 8
	note F_, 2
	note F#, 2
	note G_, 1
	rest 1
	inc_octave
	inc_octave
	;cutoff 4
	note F#, 1
	dec_octave
	dec_octave
	;cutoff 8
	note G_, 1
	rest 2
	note G_, 1
	rest 1
	rest 1
	note G_, 1
	rest 1
	inc_octave
	inc_octave
	;cutoff 4
	note F#, 1
	dec_octave
	dec_octave
	;cutoff 8
	note G_, 1
	rest 1
	note F_, 2
	sound_ret

Branch_f69f0:
	octave 2
	;cutoff 6
	note F#, 1
	inc_octave
	note C#, 1
	inc_octave
	;cutoff 4
	note C#, 1
	dec_octave
	dec_octave
	;cutoff 6
	note F#, 1
	inc_octave
	inc_octave
	;cutoff 8
	note F#, 2
	dec_octave
	dec_octave
	;cutoff 6
	note F#, 1
	inc_octave
	note C#, 1
	inc_octave
	;cutoff 4
	note C#, 1
	dec_octave
	dec_octave
	;cutoff 6
	note F#, 1
	inc_octave
	inc_octave
	;cutoff 8
	note E_, 2
	dec_octave
	dec_octave
	;cutoff 6
	note F#, 1
	inc_octave
	note C#, 1
	inc_octave
	;cutoff 4
	note C#, 1
	dec_octave
	dec_octave
	;cutoff 6
	note F#, 1
	inc_octave
	inc_octave
	;cutoff 8
	note D#, 2
	dec_octave
	dec_octave
	;cutoff 6
	note F#, 1
	inc_octave
	note C#, 1
	inc_octave
	;cutoff 4
	note C#, 1
	dec_octave
	dec_octave
	;cutoff 6
	note F#, 1
	sound_ret


Music_DuelTheme3_Ch4: ; f6a3f (3d:6a3f)
	toggle_noise 6
	drum_speed 11
.MainLoop
.Loop1
	;rept 4
	drum_note 5, 1
	drum_note 4, 1
	drum_note 4, 1
	;---
	drum_note 5, 1
	drum_note 4, 1
	drum_note 4, 1
	;---
	drum_note 5, 1
	drum_note 4, 1
	drum_note 4, 1
	;---
	drum_note 5, 1
	drum_note 4, 1
	drum_note 4, 1
	;endr
	drum_note 5, 1
	drum_note 4, 1
	drum_note 5, 1
	drum_note 4, 1
	sound_loop 2, .Loop1
.Loop2
	drum_note 2, 1
	drum_note 1, 1
	drum_note 1, 1
	sound_loop 4, .Loop2
	drum_note 2, 1
	drum_note 1, 1
	drum_note 2, 1
	drum_note 1, 1
.Loop3
	drum_note 2, 1
	drum_note 1, 1
	drum_note 1, 1
	sound_loop 4, .Loop3
	drum_note 2, 1
	drum_speed 1
	drum_note 4, 5
	drum_note 3, 6
	drum_speed 11
	drum_note 2, 1
	drum_note 2, 1
.Loop4
	sound_call Branch_f6b40
	sound_loop 3, .Loop4
	drum_note 1, 2
	drum_note 4, 1
	drum_note 1, 1
	drum_note 2, 2
	drum_note 4, 1
	drum_note 1, 1
	drum_note 4, 1
	drum_note 1, 1
	drum_note 5, 2
	drum_note 2, 1
	drum_speed 1
	drum_note 4, 5
	drum_note 3, 6
	drum_speed 11
	drum_note 2, 1
	drum_note 2, 1
.Loop5
	sound_call Branch_f6b40
	sound_loop 7, .Loop5
	drum_note 1, 2
	drum_note 4, 1
	drum_note 1, 1
	drum_note 2, 2
	drum_note 4, 1
	drum_note 1, 1
	drum_note 4, 1
	drum_note 1, 1
	drum_note 5, 2
	drum_note 2, 1
	drum_speed 1
	drum_note 4, 5
	drum_note 3, 6
	drum_speed 11
	drum_note 2, 1
	drum_note 2, 1
	sound_call Branch_f6b7e
	drum_speed 1
	drum_note 4, 5
	drum_note 3, 6
	drum_speed 11
	drum_note 2, 1
	drum_note 1, 1
	sound_call Branch_f6b7e
	drum_speed 1
	drum_note 4, 5
	drum_note 3, 6
	drum_speed 11
	drum_note 2, 2
.Loop6
	sound_call Branch_f6b40
	sound_loop 7, .Loop6
	drum_note 1, 2
	drum_note 4, 1
	drum_note 1, 1
	drum_note 2, 2
	drum_note 4, 1
	drum_note 1, 1
	drum_note 4, 1
	drum_note 1, 1
	drum_note 5, 2
	drum_note 2, 1
	drum_speed 1
	drum_note 4, 5
	drum_note 3, 6
	drum_note 2, 5
	drum_note 2, 6
	drum_note 2, 5
	drum_note 2, 6
	drum_speed 11
	sound_call Branch_f6b4d
	drum_note 4, 1
	drum_note 2, 1
	drum_note 1, 1
	sound_call Branch_f6b4d
	drum_speed 1
	drum_note 4, 5
	drum_note 3, 6
	drum_speed 11
	drum_note 2, 1
	drum_note 1, 1
	sound_call Branch_f6b4d
	drum_note 4, 1
	drum_note 2, 1
	drum_note 1, 1
	sound_call Branch_f6b4d
	drum_speed 1
	drum_note 4, 5
	drum_note 3, 6
	drum_speed 11
	drum_note 2, 2
	drum_note 6, 8
	rest 4
	drum_speed 1
	drum_note 3, 3
	drum_note 3, 2
	drum_note 2, 6
	drum_note 2, 5
	drum_note 2, 6
	drum_note 2, 5
	drum_note 2, 6
	drum_speed 11
	drum_note 2, 1
.Loop7
	sound_call Branch_f6b65
	drum_speed 1
	drum_note 1, 6
	sound_loop 7, .Loop7
	sound_call Branch_f6b65
	drum_speed 1
	drum_note 2, 6
.Loop8
	sound_call Branch_f6b65
	drum_speed 1
	drum_note 1, 6
	sound_loop 15, .Loop8
	drum_speed 11
	drum_note 1, 1
	drum_speed 1
	drum_note 4, 5
	drum_note 1, 6
	drum_speed 11
	drum_note 2, 1
	drum_speed 1
	drum_note 4, 5
	drum_note 5, 6
	drum_note 4, 5
	drum_note 3, 6
	drum_note 4, 5
	drum_note 1, 6
	drum_note 2, 5
	drum_note 2, 6
	drum_note 2, 5
	drum_note 2, 6
	sound_call Branch_f6b9a
	drum_note 1, 1
	drum_speed 1
	drum_note 4, 5
	drum_note 3, 6
	drum_note 2, 5
	drum_note 2, 6
	drum_note 2, 5
	drum_note 2, 6
	sound_call Branch_f6b9a
	drum_speed 1
	drum_note 1, 5
	drum_note 3, 6
	drum_note 2, 5
	drum_note 2, 6
	drum_note 2, 5
	drum_note 2, 6
	drum_note 2, 5
	drum_note 2, 6
	drum_speed 11
	sound_loop 0, .MainLoop

Branch_f6b40:
	drum_note 1, 2
	drum_note 4, 1
	drum_note 1, 1
	drum_note 2, 2
	drum_note 4, 1
	drum_note 1, 1
	drum_note 4, 1
	drum_note 1, 1
	drum_note 5, 2
	drum_note 2, 2
	drum_note 4, 1
	drum_note 2, 1
	sound_ret

Branch_f6b4d:
	drum_note 1, 1
	drum_note 2, 1
	drum_note 4, 1
	drum_note 1, 1
	drum_note 2, 1
	drum_note 5, 1
	drum_note 1, 1
	drum_note 2, 1
	drum_note 4, 1
	drum_note 1, 1
	drum_note 2, 1
	drum_note 5, 1
	drum_note 1, 1
	drum_note 2, 1
	drum_note 4, 1
	drum_note 1, 1
	drum_note 2, 1
	drum_note 5, 1
	drum_note 1, 1
	drum_note 2, 1
	drum_note 4, 1
	drum_note 1, 1
	drum_note 2, 1
	sound_ret

Branch_f6b65:
	drum_speed 11
	drum_note 1, 1
	drum_speed 1
	drum_note 4, 5
	drum_note 1, 6
	drum_speed 11
	drum_note 2, 1
	drum_speed 1
	drum_note 4, 5
	drum_note 5, 6
	drum_note 4, 5
	drum_note 3, 6
	drum_note 4, 5
	drum_note 1, 6
	drum_speed 11
	drum_note 2, 1
	drum_speed 1
	drum_note 4, 5
	sound_ret

Branch_f6b7e:
	drum_note 1, 2
	drum_note 4, 1
	drum_note 2, 1
	drum_note 4, 1
	drum_note 5, 1
	drum_note 2, 1
	drum_note 1, 1
	drum_note 2, 1
	drum_note 5, 1
	drum_note 1, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 1, 1
	drum_note 2, 1
	drum_note 1, 1
	drum_note 1, 2
	drum_note 4, 1
	drum_note 2, 1
	drum_note 4, 1
	drum_note 5, 1
	drum_note 2, 1
	drum_note 1, 1
	drum_note 2, 1
	drum_note 5, 1
	drum_note 1, 1
	drum_note 2, 1
	drum_note 2, 1
	sound_ret

Branch_f6b9a:
	drum_speed 11
.Loop9
	;rept 5
	drum_note 1, 1
	drum_speed 1
	drum_note 4, 5
	drum_note 3, 6
	drum_speed 11
	drum_note 2, 1
	;---
	drum_note 1, 1
	drum_speed 1
	drum_note 4, 5
	drum_note 3, 6
	drum_speed 11
	drum_note 2, 1
	;---
	drum_note 1, 1
	drum_speed 1
	drum_note 4, 5
	drum_note 3, 6
	drum_speed 11
	drum_note 2, 1
	;---
	drum_note 1, 1
	drum_speed 1
	drum_note 4, 5
	drum_note 3, 6
	drum_speed 11
	drum_note 2, 1
	;---
	drum_note 1, 1
	drum_speed 1
	drum_note 4, 5
	drum_note 3, 6
	drum_speed 11
	drum_note 2, 1
	;endr
	drum_note 1, 1
	sound_loop 3, .Loop9
.Loop10
	drum_note 1, 1
	drum_speed 1
	drum_note 4, 5
	drum_note 3, 6
	drum_speed 11
	drum_note 2, 1
	sound_loop 4, .Loop10
	sound_ret
; 0xf6bb7
