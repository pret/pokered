Music_HallOfHonor:
	channel_count 3
	channel 1, Music_HallOfHonor_Ch1
	channel 2, Music_HallOfHonor_Ch2
	channel 3, Music_HallOfHonor_Ch3

Music_HallOfHonor_Ch1:
	speed 7
	stereo_panning TRUE, TRUE
	duty_cycle 2
.Loop1:
	sound_call Branch_fb016
	sound_loop 4, .Loop1
.MainLoop:
.Loop2:
	sound_call Branch_fb016
	sound_loop 8, .Loop2
	octave 4
	volume_envelope 5, 5
	note C_, 1
	volume_envelope 2, 7
	note C_, 1
	sound_call Branch_fb044
.Loop3:
	volume_envelope 5, 5
	note C_, 1
	volume_envelope 2, 7
	note G_, 1
	sound_call Branch_fb044
	sound_loop 23, .Loop3
	sound_loop 0, .MainLoop

Branch_fb016:
	octave 4
	volume_envelope 6, 5
	note C_, 1
	volume_envelope 2, 7
	note C_, 1
	volume_envelope 6, 5
	note F_, 1
	volume_envelope 2, 7
	note F_, 1
	volume_envelope 6, 5
	note G_, 1
	volume_envelope 2, 7
	note G_, 1
	volume_envelope 6, 5
	note F_, 1
	volume_envelope 2, 7
	note F_, 1
	inc_octave
	volume_envelope 6, 5
	note C_, 1
	volume_envelope 2, 7
	note C_, 1
	dec_octave
	volume_envelope 6, 5
	note F_, 1
	volume_envelope 2, 7
	note F_, 1
	volume_envelope 6, 5
	note G_, 1
	volume_envelope 2, 7
	note G_, 1
	sound_ret

Branch_fb044:
	octave 4
	volume_envelope 5, 5
	note F_, 1
	volume_envelope 2, 7
	note C_, 1
	volume_envelope 5, 5
	note G_, 1
	volume_envelope 2, 7
	note F_, 1
	volume_envelope 5, 5
	note F_, 1
	volume_envelope 2, 7
	note G_, 1
	inc_octave
	volume_envelope 5, 5
	note C_, 1
	dec_octave
	volume_envelope 2, 7
	note F_, 1
	volume_envelope 5, 5
	note F_, 1
	inc_octave
	volume_envelope 2, 7
	note C_, 1
	dec_octave
	volume_envelope 5, 5
	note G_, 1
	volume_envelope 2, 7
	note F_, 1
	sound_ret

Music_HallOfHonor_Ch2:
	speed 7
	stereo_panning TRUE, TRUE
	duty_cycle 2
	rest 2
	speed 1
	rest 4
	speed 7
	volume_envelope 1, 7
.Loop1:
	sound_call Branch_fb1ec_Ch2
	sound_loop 3, .Loop1
	octave 4
	note C_, 1
	rest 1
	note F_, 1
	rest 1
	note G_, 1
	rest 1
	note F_, 1
	rest 1
	inc_octave
	note C_, 1
	rest 1
	dec_octave
	note F_, 1
	speed 1
	rest 3
	speed 7
.MainLoop:
	octave 1
	duty_cycle 1
.Loop2:
	sound_call Branch_fb0bb
	octave 1
	volume_envelope 6, -5
	note E_, 14
	volume_envelope 13, 8
	note E_, 14
	sound_loop 3, .Loop2
	sound_call Branch_fb0bb
	octave 1
	volume_envelope 6, -5
	note G_, 14
	volume_envelope 13, 8
	note G_, 14
	sound_loop 0, .MainLoop

Branch_fb0bb:
	octave 1
	volume_envelope 6, -5
	note F_, 14
	volume_envelope 13, 8
	note F_, 14
	volume_envelope 6, -5
	note E_, 14
	volume_envelope 13, 8
	note E_, 14
	volume_envelope 6, -5
	note D_, 14
	volume_envelope 13, 8
	note D_, 14
	sound_ret

Branch_fb1ec_Ch2:
	octave 5
	note C_, 1
	rest 1
	note F_, 1
	rest 1
	note G_, 1
	rest 1
	note F_, 1
	rest 1
	inc_octave
	note C_, 1
	rest 1
	dec_octave
	note F_, 1
	rest 1
	note G_, 1
	rest 1
	sound_ret

Music_HallOfHonor_Ch3:
	speed 7
	channel_volume 2
	stereo_panning TRUE, TRUE
	fade_wave 12
	vibrato 35, 2, 4
	rest 3
	channel_volume 3
.Loop1:
	rest 14
	sound_loop 4, .Loop1
.MainLoop:
	octave 6
.Loop2:
	sound_call Branch_fb1ec
	sound_loop 7, .Loop2
	note C_, 1
	rest 1
	note F_, 1
	rest 1
	note G_, 1
	rest 1
	note F_, 1
	rest 1
	inc_octave
	note C_, 1
	rest 1
	dec_octave
	note F_, 1
	channel_volume 1
	octave 5
	speed 1
	note B_, 3
	inc_octave
	note C_, 4
	speed 7
	note C_, 15
	note C_, 8
	dec_octave
	note B_, 2
	note A_, 2
	note G_, 6
	note C_, 10
	note C_, 12
	speed 1
	note B_, 3
	inc_octave
	note C_, 4
	speed 7
	note C_, 15
	note C_, 6
	dec_octave
	note B_, 2
	inc_octave
	note C_, 2
	note D_, 2
	dec_octave
	speed 1
	note F#, 3
	note G_, 4
	speed 7
	note G_, 15
	note G_, 6
	note G_, 2
	note A_, 2
	note B_, 2
	speed 1
	note B_, 3
	inc_octave
	note C_, 4
	speed 7
	note C_, 15
	note C_, 8
	dec_octave
	note B_, 2
	note A_, 2
	note G_, 6
	speed 1
	note B_, 3
	inc_octave
	note C_, 4
	speed 7
	note C_, 9
	note C_, 6
	dec_octave
	note G_, 2
	inc_octave
	note C_, 2
	note E_, 2
	speed 1
	note E_, 3
	note F_, 4
	speed 7
	note F_, 1
	note E_, 2
	note C_, 2
	note C_, 10
	note C_, 10
	note E_, 2
	speed 1
	note E_, 3
	note F_, 4
	speed 7
	note F_, 1
	note E_, 2
	note C_, 2
	note C_, 10
	note C_, 12
	speed 1
	note F#, 3
	note G_, 4
	speed 7
	note G_, 15
	note G_, 8
	note F_, 2
	note E_, 2
	note F_, 2
	note E_, 2
	note C_, 2
	dec_octave
	note G_, 10
	note G_, 10
	note E_, 2
	note F_, 2
	inc_octave
	note C_, 2
	note C_, 12
	note C_, 10
	dec_octave
	note E_, 2
	note F_, 2
	inc_octave
	note C_, 2
	note C_, 12
	note C_, 12
	rest 3
	channel_volume 3
	sound_loop 0, .MainLoop

Branch_fb1ec:
	octave 5
	note C_, 1
	rest 1
	note F_, 1
	rest 1
	note G_, 1
	rest 1
	note F_, 1
	rest 1
	inc_octave
	note C_, 1
	rest 1
	dec_octave
	note F_, 1
	rest 1
	note G_, 1
	rest 1
	sound_ret
