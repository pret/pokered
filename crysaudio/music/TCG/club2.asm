Music_Club2:
	channel_count 3
	channel 1, Music_Club2_Ch1
	channel 2, Music_Club2_Ch2
	channel 3, Music_Club2_Ch3

Music_Club2_Ch1:
	speed 6
	duty_cycle 2
	stereo_panning TRUE, TRUE
.MainLoop:
	octave 4
.Loop1:
	volume_envelope 7, 5
	note G_, 4
	note E_, 4
	note C_, 4
	volume_envelope 7, 7
	note F#, 16
	rest 4
	volume_envelope 7, 5
	note G_, 4
	note A_, 4
	note B_, 4
	volume_envelope 7, 7
	note F#, 16
	rest 4
	sound_loop 8, .Loop1
	volume_envelope 7, 5
	note G_, 4
	note D_, 4
	dec_octave
	note B_, 4
	inc_octave
	volume_envelope 7, 7
	note B_, 16
	rest 4
	volume_envelope 7, 5
	note G_, 4
	note D_, 4
	note C_, 4
	volume_envelope 7, 7
	note B_, 16
	rest 4
	dec_octave
	volume_envelope 7, 5
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
	speed 1
	note A_, 3
	inc_octave
	volume_envelope 7, 7
	rest 4
	note D_, 5
	speed 6
	note D_, 16
	rest 15
	sound_loop 0, .MainLoop

Music_Club2_Ch2:
	speed 6
	duty_cycle 2
	stereo_panning TRUE, TRUE
.MainLoop:
	octave 2
.Loop1:
	volume_envelope 7, 5
	note C_, 4
	note G_, 4
	inc_octave
	note G_, 4
	inc_octave
	volume_envelope 7, 7
	note D_, 16
	rest 4
	dec_octave
	dec_octave
	volume_envelope 7, 5
	note C_, 4
	note G_, 4
	inc_octave
	inc_octave
	note C_, 4
	volume_envelope 7, 7
	note D_, 16
	rest 4
	dec_octave
	dec_octave
	sound_loop 8, .Loop1
	dec_octave
	volume_envelope 7, 5
	note B_, 4
	inc_octave
	note G_, 4
	inc_octave
	note G_, 4
	inc_octave
	volume_envelope 7, 7
	note G_, 16
	rest 4
	dec_octave
	dec_octave
	dec_octave
	volume_envelope 7, 5
	note A_, 4
	inc_octave
	note A_, 4
	inc_octave
	note A_, 4
	inc_octave
	volume_envelope 7, 7
	note C_, 16
	rest 4
	dec_octave
	dec_octave
	volume_envelope 7, 5
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
	speed 1
	note E_, 3
	dec_octave
	volume_envelope 7, 4
	note A_, 8
	inc_octave
	volume_envelope 7, 7
	note F#, 7
	speed 6
	note F#, 15
	rest 15
	sound_loop 0, .MainLoop

Music_Club2_Ch3:
	speed 6
	channel_volume 1
	stereo_panning TRUE, TRUE
	fade_wave 10
	vibrato 35, 3, 3
.MainLoop:
	channel_volume 3
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
	sound_call Branch_fa1cf
	octave 5
	note G_, 8
	sound_call Branch_fa1cf
	channel_volume 1
	octave 4
	note G_, 8
	sound_call Branch_fa1f3
	octave 4
	note G_, 16
	note G_, 12
	rest 16
	rest 8
	note E_, 8
	sound_call Branch_fa1f3
	octave 4
	note G_, 16
	note G_, 12
	note G_, 16
	note G_, 8
	rest 4
	note A_, 2
	note G_, 2
	note F#, 16
	note F#, 12
	rest 4
	note F#, 1
	note G_, 15
	note G_, 12
	rest 4
	note G#, 1
	note A_, 15
	note A_, 16
	rest 16
	rest 16
	sound_loop 0, .MainLoop

Branch_fa1cf:
	octave 6
	note C#, 1
	note D_, 15
	note D_, 12
	note C_, 2
	dec_octave
	note B_, 2
	note G_, 16
	note G_, 8
	rest 4
	note E_, 4
	note B_, 4
	inc_octave
	note C_, 4
	dec_octave
	note B_, 4
	note A_, 16
	note A_, 8
	note A_, 16
	rest 4
	sound_ret

Branch_fa1f3:
	octave 5
	note C#, 1
	note D_, 15
	note D_, 4
	note E_, 4
	dec_octave
	note B_, 4
	inc_octave
	note C_, 4
	note D_, 16
	note D_, 8
	rest 4
	note C_, 2
	dec_octave
	note B_, 2
	inc_octave
	note C_, 2
	dec_octave
	note B_, 2
	sound_ret
