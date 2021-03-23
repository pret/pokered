Music_HallOfHonor:
	channel_count 3
	channel 1, Music_HallOfHonor_Ch1
	channel 2, Music_HallOfHonor_Ch2
	channel 3, Music_HallOfHonor_Ch3

Music_HallOfHonor_Ch1: ; fafea (3e:6fea)
	notetype0 7
	;stereo_panning 1, 1
	notetype2 8
	duty_cycle 2
.Loop1
	sound_call Branch_fb016
	sound_loop 4, .Loop1
.MainLoop
.Loop2
	sound_call Branch_fb016
	sound_loop 8, .Loop2
	octave 4
	notetype1 5
	note C_, 1
	notetype1 2
	note C_, 1
	sound_call Branch_fb044
.Loop3
	notetype1 5
	note C_, 1
	notetype1 2
	note G_, 1
	sound_call Branch_fb044
	sound_loop 23, .Loop3
	sound_loop 0, .MainLoop

Branch_fb016:
	octave 4
	notetype1 6
	note C_, 1
	notetype1 2
	note C_, 1
	notetype1 6
	note F_, 1
	notetype1 2
	note F_, 1
	notetype1 6
	note G_, 1
	notetype1 2
	note G_, 1
	notetype1 6
	note F_, 1
	notetype1 2
	note F_, 1
	inc_octave
	notetype1 6
	note C_, 1
	notetype1 2
	note C_, 1
	dec_octave
	notetype1 6
	note F_, 1
	notetype1 2
	note F_, 1
	notetype1 6
	note G_, 1
	notetype1 2
	note G_, 1
	sound_ret

Branch_fb044:
	octave 4
	notetype1 5
	note F_, 1
	notetype1 2
	note C_, 1
	notetype1 5
	note G_, 1
	notetype1 2
	note F_, 1
	notetype1 5
	note F_, 1
	notetype1 2
	note G_, 1
	inc_octave
	notetype1 5
	note C_, 1
	dec_octave
	notetype1 2
	note F_, 1
	notetype1 5
	note F_, 1
	inc_octave
	notetype1 2
	note C_, 1
	dec_octave
	notetype1 5
	note G_, 1
	notetype1 2
	note F_, 1
	sound_ret


Music_HallOfHonor_Ch2: ; fb06e (3e:706e)
	notetype0 7
	;stereo_panning 1, 1
	notetype2 8
	duty_cycle 2
	;frequency_offset -1
	rest 2
	notetype0 1
	rest 4
	notetype0 7
	notetype1 1
.Loop1
	sound_call Branch_fb1ec
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
	notetype0 1
	rest 3
	notetype0 7
	;frequency_offset 0
.MainLoop
	octave 1
	duty_cycle 1
.Loop2
	sound_call Branch_fb0bb
	octave 1
	notetype1 7
	note E_, 5
	notetype1 13
	note E_, 11
	;tie
	note E_, 12
	sound_loop 3, .Loop2
	sound_call Branch_fb0bb
	octave 1
	notetype1 7
	note G_, 5
	notetype1 13
	note G_, 11
	;tie
	note G_, 12
	sound_loop 0, .MainLoop

Branch_fb0bb:
	octave 1
	notetype1 7
	note F_, 5
	notetype1 13
	note F_, 11
	;tie
	note F_, 12
	notetype1 7
	note E_, 5
	notetype1 13
	note E_, 11
	;tie
	note E_, 12
	notetype1 7
	note D_, 5
	notetype1 13
	note D_, 11
	;tie
	note D_, 12
	sound_ret


Music_HallOfHonor_Ch3: ; fb0d5 (3e:70d5)
	notetype0 7
	notetype1 2
	;stereo_panning 1, 1
	notetype2 12
	;vibrato_type 4
	vibrato 35, 2, 4
	;cutoff 6
	;echo 64
	rest 3
	notetype1 3
	;cutoff 8
	;frequency_offset -1
.Loop1
	rest 14
	sound_loop 4, .Loop1
.MainLoop
	octave 6
.Loop2
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
	notetype1 1
	;frequency_offset 0
	octave 5
	notetype0 1
	;cutoff 6
	note B_, 3
	inc_octave
	note C_, 4
	;tie
	notetype0 7
	note C_, 15
	;tie
	note C_, 8
	dec_octave
	;cutoff 8
	note B_, 2
	;cutoff 4
	note A_, 2
	;cutoff 6
	note G_, 6
	note C_, 10
	;tie
	note C_, 12
	notetype0 1
	;cutoff 8
	note B_, 3
	inc_octave
	;cutoff 6
	note C_, 4
	;tie
	notetype0 7
	note C_, 15
	;tie
	note C_, 6
	dec_octave
	;cutoff 8
	note B_, 2
	inc_octave
	note C_, 2
	;cutoff 4
	note D_, 2
	dec_octave
	notetype0 1
	;cutoff 8
	note F#, 3
	;cutoff 6
	note G_, 4
	;tie
	notetype0 7
	note G_, 15
	;tie
	note G_, 6
	;cutoff 8
	note G_, 2
	note A_, 2
	;cutoff 4
	note B_, 2
	notetype0 1
	;cutoff 8
	note B_, 3
	inc_octave
	note C_, 4
	;tie
	notetype0 7
	note C_, 15
	;tie
	note C_, 8
	dec_octave
	note B_, 2
	;cutoff 4
	note A_, 2
	;cutoff 6
	note G_, 6
	;cutoff 8
	notetype0 1
	note B_, 3
	inc_octave
	;cutoff 6
	note C_, 4
	;tie
	notetype0 7
	note C_, 9
	;tie
	note C_, 6
	dec_octave
	;cutoff 8
	note G_, 2
	inc_octave
	note C_, 2
	;cutoff 4
	note E_, 2
	notetype0 1
	;cutoff 8
	note E_, 3
	note F_, 4
	;tie
	notetype0 7
	note F_, 1
	note E_, 2
	;cutoff 4
	note C_, 2
	;cutoff 7
	note C_, 10
	;tie
	note C_, 10
	;cutoff 4
	note E_, 2
	notetype0 1
	;cutoff 8
	note E_, 3
	note F_, 4
	;tie
	notetype0 7
	note F_, 1
	note E_, 2
	;cutoff 4
	note C_, 2
	;cutoff 6
	note C_, 10
	;tie
	note C_, 12
	notetype0 1
	;cutoff 8
	note F#, 3
	;cutoff 7
	note G_, 4
	;tie
	notetype0 7
	note G_, 15
	;tie
	note G_, 8
	;cutoff 8
	note F_, 2
	;cutoff 4
	note E_, 2
	;cutoff 8
	note F_, 2
	;cutoff 4
	note E_, 2
	note C_, 2
	dec_octave
	;cutoff 7
	note G_, 10
	;tie
	note G_, 10
	;cutoff 8
	note E_, 2
	note F_, 2
	inc_octave
	;cutoff 4
	note C_, 2
	;cutoff 7
	note C_, 12
	;tie
	note C_, 10
	dec_octave
	;cutoff 8
	note E_, 2
	note F_, 2
	inc_octave
	;cutoff 4
	note C_, 2
	;cutoff 6
	note C_, 12
	;tie
	note C_, 12
	rest 3
	notetype1 3
	;frequency_offset -1
	;cutoff 8
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
; 0xfb1fe
