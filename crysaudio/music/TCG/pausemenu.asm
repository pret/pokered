Music_PauseMenu:
	channel_count 4
	channel 1, Music_PauseMenu_Ch1
	channel 2, Music_PauseMenu_Ch2
	channel 3, Music_PauseMenu_Ch3
	channel 4, Music_PauseMenu_Ch4

Music_PauseMenu_Ch2: ; f6bb7 (3d:6bb7)
	speed 7
	;stereo_panning 1, 1
	fade_wave 8
	duty_cycle 2
.MainLoop
	channel_volume 7
.Loop1
	rest 16
	sound_loop 4, .Loop1
	speed 1
	octave 6
	note C_, 4
	dec_octave
	rest 3
	note B_, 4
	inc_octave
	channel_volume 3
	note C_, 3
	dec_octave
	channel_volume 7
	note G_, 4
	channel_volume 3
	note B_, 3
	channel_volume 7
	note D_, 4
	channel_volume 3
	note G_, 3
	sound_call Branch_f6c24
	sound_call Branch_f6c60
	channel_volume 7
	octave 6
	note C_, 4
	dec_octave
	channel_volume 3
	note E_, 3
	channel_volume 7
	note B_, 4
	inc_octave
	channel_volume 3
	note C_, 3
	dec_octave
	channel_volume 7
	note G_, 4
	channel_volume 3
	note B_, 3
	channel_volume 7
	note D_, 4
	channel_volume 3
	note G_, 3
	sound_call Branch_f6c24
	sound_call Branch_f6c60
	octave 6
	channel_volume 6
	note C_, 4
	dec_octave
	channel_volume 3
	note E_, 3
	sound_call Branch_f6ce9
	sound_call Branch_f6c80
.Loop2
	octave 6
	fade_wave 4
	note C_, 1
	sound_call Branch_f6ce9
	sound_call Branch_f6c80
	sound_loop 3, .Loop2
	fade_wave 8
	sound_loop 0, .MainLoop

Branch_f6c24:
.Loop3
	octave 6
	channel_volume 7
	note C_, 4
	dec_octave
	channel_volume 3
	note D_, 3
	channel_volume 7
	note B_, 4
	inc_octave
	channel_volume 3
	note C_, 3
	dec_octave
	channel_volume 7
	note G_, 4
	channel_volume 3
	note B_, 3
	channel_volume 7
	note D_, 4
	channel_volume 3
	note G_, 3
	sound_loop 3, .Loop3
	inc_octave
	channel_volume 7
	note C_, 4
	dec_octave
	channel_volume 3
	note D_, 3
	channel_volume 7
	note B_, 4
	inc_octave
	channel_volume 3
	note C_, 3
	dec_octave
	channel_volume 7
	note G_, 4
	channel_volume 3
	note B_, 3
	channel_volume 7
	note E_, 4
	channel_volume 3
	note G_, 3
	sound_ret

Branch_f6c60:
.Loop4
	octave 6
	channel_volume 7
	note C_, 4
	dec_octave
	channel_volume 3
	note E_, 3
	channel_volume 7
	note B_, 4
	inc_octave
	channel_volume 3
	note C_, 3
	dec_octave
	channel_volume 7
	note G_, 4
	channel_volume 3
	note B_, 3
	channel_volume 7
	note E_, 4
	channel_volume 3
	note G_, 3
	sound_loop 3, .Loop4
	sound_ret

Branch_f6c80:
	octave 6
	fade_wave 4
	note C_, 1
	octave 3
	channel_volume 7
	fade_wave 8
	speed 1
	note C_, 4
	channel_volume 2
	note C_, 3
	channel_volume 6
	speed 7
	octave 5
	fade_wave 4
	note G_, 1
	note E_, 1
	octave 3
	fade_wave 8
	channel_volume 7
	speed 1
	note E_, 4
	channel_volume 2
	note E_, 3
	speed 7
	channel_volume 6
	octave 5
	fade_wave 4
	note B_, 1
	note G_, 1
	dec_octave
	channel_volume 7
	fade_wave 8
	speed 1
	note C_, 4
	channel_volume 2
	note C_, 3
	channel_volume 6
	speed 7
	octave 6
	fade_wave 4
	note C_, 1
	octave 3
	fade_wave 8
	channel_volume 7
	speed 1
	note C_, 4
	channel_volume 2
	note C_, 3
	speed 7
	octave 5
	channel_volume 6
	fade_wave 4
	note G_, 1
	note E_, 1
	channel_volume 7
	octave 3
	fade_wave 8
	speed 1
	note E_, 4
	channel_volume 2
	note E_, 3
	speed 7
	channel_volume 6
	octave 5
	fade_wave 4
	note B_, 1
	note G_, 1
	note E_, 1
	sound_ret

Branch_f6ce9:
	octave 2
	speed 1
	fade_wave 8
	channel_volume 7
	note B_, 4
	channel_volume 2
	note B_, 3
	speed 7
	channel_volume 6
	octave 5
	fade_wave 4
	note G_, 1
	note D_, 1
	octave 3
	channel_volume 7
	fade_wave 8
	speed 1
	note D_, 4
	channel_volume 2
	note D_, 3
	speed 7
	channel_volume 6
	octave 5
	fade_wave 4
	note B_, 1
	note G_, 1
	channel_volume 7
	octave 3
	fade_wave 8
	speed 1
	note B_, 4
	channel_volume 2
	note B_, 3
	channel_volume 6
	speed 7
	octave 6
	fade_wave 4
	note C_, 1
	channel_volume 7
	octave 2
	fade_wave 8
	speed 1
	note B_, 4
	channel_volume 2
	note B_, 3
	speed 7
	channel_volume 6
	octave 5
	fade_wave 4
	note G_, 1
	note D_, 1
	channel_volume 7
	octave 3
	fade_wave 8
	speed 1
	note D_, 4
	channel_volume 2
	note D_, 3
	speed 7
	channel_volume 6
	octave 5
	fade_wave 4
	note B_, 1
	note G_, 1
	note D_, 1
	sound_ret


Music_PauseMenu_Ch1: ; f6d4e (3d:6d4e)
	speed 7
	;stereo_panning 1, 1
	fade_wave 8
	duty_cycle 2
.MainLoop
	channel_volume 8
.Loop1
	rest 16
	sound_loop 7, .Loop1
	octave 5
	rest 8
	speed 1
.Loop2
	note B_, 4
	note G_, 3
	note E_, 4
	note C_, 3
	dec_octave
	sound_loop 4, .Loop2
	speed 7
.Loop3
	octave 1
	channel_volume 13
	note G_, 1
	octave 3
	channel_volume 7
	speed 1
	note D_, 4
	channel_volume 2
	note D_, 3
	channel_volume 13
	speed 7
	octave 1
	fade_wave 6
	note G_, 1
	fade_wave 4
	note G_, 1
	octave 3
	fade_wave 8
	channel_volume 7
	speed 1
	note F#, 4
	channel_volume 2
	note F#, 3
	dec_octave
	channel_volume 13
	speed 7
	note D_, 1
	note G_, 1
	octave 4
	channel_volume 7
	speed 1
	note F#, 4
	channel_volume 2
	note F#, 3
	speed 7
	octave 1
	channel_volume 13
	fade_wave 8
	note G_, 1
	octave 3
	channel_volume 7
	speed 1
	note D_, 4
	channel_volume 2
	note D_, 3
	speed 7
	channel_volume 13
	octave 1
	fade_wave 6
	note G_, 1
	fade_wave 4
	note G_, 1
	octave 3
	fade_wave 8
	speed 1
	note F#, 4
	channel_volume 2
	note F#, 3
	speed 7
	octave 1
	channel_volume 13
	note B_, 1
	inc_octave
	note C_, 1
	note C#, 1
	dec_octave
	note D_, 1
	octave 3
	channel_volume 7
	speed 1
	note E_, 4
	channel_volume 2
	note E_, 3
	channel_volume 13
	speed 7
	octave 1
	fade_wave 6
	note D_, 1
	fade_wave 4
	note D_, 1
	octave 3
	fade_wave 8
	speed 1
	note G_, 4
	channel_volume 2
	note G_, 3
	speed 7
	dec_octave
	channel_volume 13
	note C_, 1
	note D_, 1
	octave 4
	channel_volume 7
	speed 1
	note G_, 4
	channel_volume 2
	note G_, 3
	speed 7
	octave 1
	channel_volume 13
	fade_wave 8
	note D_, 1
	octave 3
	channel_volume 7
	speed 1
	note E_, 4
	channel_volume 2
	note E_, 3
	speed 7
	channel_volume 13
	fade_wave 6
	octave 1
	note D_, 1
	fade_wave 4
	note D_, 1
	octave 3
	fade_wave 8
	speed 1
	note G_, 4
	channel_volume 2
	note G_, 3
	speed 7
	octave 1
	channel_volume 13
	note C_, 1
	note C#, 1
	inc_octave
	note D_, 1
	sound_loop 4, .Loop3
	sound_loop 0, .MainLoop


Music_PauseMenu_Ch3: ; f6e2d (3d:6e2d)
	speed 1
	fade_wave 13
	;stereo_panning 1, 1
	channel_volume 2
	;echo 96
	;cutoff 4
	octave 5
	note G_, 7
	;cutoff 8
	note F#, 4
	channel_volume 3
	note G_, 3
	channel_volume 2
	note D_, 4
	channel_volume 3
	note F#, 3
	dec_octave
	channel_volume 2
	note B_, 4
	inc_octave
	channel_volume 3
	note D_, 3
.MainLoop
	octave 5
.Loop1
	channel_volume 2
	note G_, 4
	dec_octave
	channel_volume 3
	note B_, 3
	inc_octave
	channel_volume 2
	note F#, 4
	channel_volume 3
	note G_, 3
	channel_volume 2
	note D_, 4
	channel_volume 3
	note F#, 3
	dec_octave
	channel_volume 2
	note B_, 4
	inc_octave
	channel_volume 3
	note D_, 3
	sound_loop 3, .Loop1
	channel_volume 2
	note G_, 4
	dec_octave
	channel_volume 3
	note B_, 3
	inc_octave
	channel_volume 2
	note E_, 4
	channel_volume 3
	note G_, 3
	channel_volume 2
	note C_, 4
	channel_volume 3
	note E_, 3
	dec_octave
	channel_volume 2
	note A_, 4
	inc_octave
	channel_volume 3
	note C_, 3
.Loop2
	channel_volume 2
	note G_, 4
	dec_octave
	channel_volume 3
	note A_, 3
	inc_octave
	channel_volume 2
	note E_, 4
	channel_volume 3
	note G_, 3
	channel_volume 2
	note C_, 4
	channel_volume 3
	note E_, 3
	dec_octave
	channel_volume 2
	note A_, 4
	inc_octave
	channel_volume 3
	note C_, 3
	sound_loop 3, .Loop2
	channel_volume 2
	note G_, 4
	dec_octave
	channel_volume 3
	note A_, 3
	inc_octave
	channel_volume 2
	note F#, 4
	channel_volume 3
	note G_, 3
	channel_volume 2
	note D_, 4
	channel_volume 3
	note F#, 3
	dec_octave
	channel_volume 2
	note B_, 4
	inc_octave
	channel_volume 3
	note D_, 3
	sound_loop 0, .MainLoop


Music_PauseMenu_Ch4: ; f6ec8 (3d:6ec8)
	toggle_noise 6
	drum_speed 7
	octave 1
.MainLoop
.Loop1
	;rept 7
	drum_note 1, 1
	drum_note 4, 1
	drum_note 5, 2
	drum_note 2, 1
	drum_note 4, 1
	drum_note 5, 1
	drum_note 3, 1
	drum_note 1, 1
	drum_note 4, 1
	drum_note 5, 2
	drum_note 2, 1
	drum_note 4, 1
	drum_note 5, 1
	drum_note 2, 1
	;---
	drum_note 1, 1
	drum_note 4, 1
	drum_note 5, 2
	drum_note 2, 1
	drum_note 4, 1
	drum_note 5, 1
	drum_note 3, 1
	drum_note 1, 1
	drum_note 4, 1
	drum_note 5, 2
	drum_note 2, 1
	drum_note 4, 1
	drum_note 5, 1
	drum_note 2, 1
	;---
	drum_note 1, 1
	drum_note 4, 1
	drum_note 5, 2
	drum_note 2, 1
	drum_note 4, 1
	drum_note 5, 1
	drum_note 3, 1
	drum_note 1, 1
	drum_note 4, 1
	drum_note 5, 2
	drum_note 2, 1
	drum_note 4, 1
	drum_note 5, 1
	drum_note 2, 1
	;---
	drum_note 1, 1
	drum_note 4, 1
	drum_note 5, 2
	drum_note 2, 1
	drum_note 4, 1
	drum_note 5, 1
	drum_note 3, 1
	drum_note 1, 1
	drum_note 4, 1
	drum_note 5, 2
	drum_note 2, 1
	drum_note 4, 1
	drum_note 5, 1
	drum_note 2, 1
	;---
	drum_note 1, 1
	drum_note 4, 1
	drum_note 5, 2
	drum_note 2, 1
	drum_note 4, 1
	drum_note 5, 1
	drum_note 3, 1
	drum_note 1, 1
	drum_note 4, 1
	drum_note 5, 2
	drum_note 2, 1
	drum_note 4, 1
	drum_note 5, 1
	drum_note 2, 1
	;---
	drum_note 1, 1
	drum_note 4, 1
	drum_note 5, 2
	drum_note 2, 1
	drum_note 4, 1
	drum_note 5, 1
	drum_note 3, 1
	drum_note 1, 1
	drum_note 4, 1
	drum_note 5, 2
	drum_note 2, 1
	drum_note 4, 1
	drum_note 5, 1
	drum_note 2, 1
	;---
	drum_note 1, 1
	drum_note 4, 1
	drum_note 5, 2
	drum_note 2, 1
	drum_note 4, 1
	drum_note 5, 1
	drum_note 3, 1
	drum_note 1, 1
	drum_note 4, 1
	drum_note 5, 2
	drum_note 2, 1
	drum_note 4, 1
	drum_note 5, 1
	drum_note 2, 1
	;endr
	drum_note 1, 1
	drum_note 4, 1
	drum_note 5, 2
	drum_note 2, 1
	drum_note 4, 1
	drum_note 5, 1
	drum_speed 1
	drum_note 3, 4
	drum_note 3, 3
	drum_speed 7
	;rept 8
	drum_note 2, 1
	;---
	drum_note 2, 1
	;---
	drum_note 2, 1
	;---
	drum_note 2, 1
	;---
	drum_note 2, 1
	;---
	drum_note 2, 1
	;---
	drum_note 2, 1
	;---
	drum_note 2, 1
	;endr
	sound_loop 2, .Loop1
	sound_loop 0, .MainLoop
; 0xf6ef1
