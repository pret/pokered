Music_HereComesGR:
	channel_count 4
	channel 1, Music_HereComesGR_Ch1
	channel 2, Music_HereComesGR_Ch2
	channel 3, Music_HereComesGR_Ch3
	channel 4, Music_HereComesGR_Ch4

Music_HereComesGR_Ch2:
.MainLoop
	speed 1
	stereo_panning TRUE, TRUE
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	musicf1 55
	octave 2
	sound_call Branch_1ea5ed
	rest 10
	rest 11
	rest 10
	rest 16
	rest 16
	rest 10
	note C_, 6
;	tie
	note C#, 5
;	tie
	note D_, 10
	note F_, 16
;	tie
	note F_, 5
	sound_call Branch_1ea5ed
	rest 10
	rest 11
	rest 10
	note B_, 6
;	tie
	inc_octave
	note C_, 5
;	tie
	note C#, 16
;	tie
	note C#, 15
	note C_, 16
;	tie
	note C_, 16
;	tie
	dec_octave
	note B_, 5
;	tie
	note A#, 5
	octave 2
	sound_call Branch_1ea5ed
	rest 10
	rest 11
	rest 10
	rest 16
	rest 16
	rest 10
	note C_, 6
;	tie
	note C#, 5
;	tie
	note D_, 10
	note F_, 16
;	tie
	note F_, 5
	sound_call Branch_1ea5ed
	rest 10
	rest 11
	rest 10
	note G_, 11
	inc_octave
;	musicf2
	note G_, 5
	note G_, 5
;	musicf3
	note C#, 11
	note C_, 5
	note C#, 5
	note C_, 10
	dec_octave
	note A#, 10
	note F_, 11
	note G#, 10
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
	sound_call Branch_1ea5ed
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	octave 4
;	cutoff 4
;	musicf2
	note D_, 10
	note D_, 11
;	musicf3
	rest 10
	rest 11
;	musicef -4
	note C_, 10
;	musicef 4
;	musicf1 55
;	musicf3
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 1
;	cutoff 8
;	musicef -2
.Loop1
	note G_, 3
	rest 1
	note G_, 2
	rest 1
	sound_loop 3, .Loop1
;	musicef 2
	inc_octave
	note C#, 6
;	tie
	note D_, 5
;	tie
	note D_, 10
	note F_, 16
;	tie
	note F_, 5
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
	sound_call Branch_1ea5ed
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	octave 4
;	cutoff 4
;	musicf1 55
;	musicf2
	note D_, 10
	note D_, 11
;	musicf3
	rest 10
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
;	cutoff 8
	note B_, 6
;	tie
	inc_octave
	note C_, 5
;	tie
	note C#, 16
;	tie
	note C#, 15
	note C_, 16
;	tie
	note C_, 16
;	tie
	dec_octave
	note B_, 5
;	tie
	note A#, 5
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
	sound_call Branch_1ea5ed
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	octave 4
;	cutoff 4
;	musicf2
	note D_, 10
	note D_, 11
;	musicf3
	rest 10
	rest 11
;	musicef -4
	note C_, 10
;	musicef 4
;	musicf1 55
;	musicf3
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 1
;	cutoff 8
;	musicef -2
.Loop2
	note G_, 3
	rest 1
	note G_, 2
	rest 1
	sound_loop 3, .Loop2
;	musicef 2
	inc_octave
	note C#, 6
;	tie
	note D_, 5
;	tie
	note D_, 10
	note F_, 16
;	tie
	note F_, 5
	octave 2
;	musicf1 55
	sound_call Branch_1ea5ed
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
;	cutoff 4
;	cutoff 4
	octave 4
;	musicf2
	note G_, 10
	note G_, 11
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	cutoff 8
	octave 3
;	musicf2
	note G_, 10
	note G_, 11
;	musicf3
	note C_, 5
	note C#, 5
;	musicf2
	note D_, 6
	note D_, 5
	note F_, 5
	note F_, 5
;	musicf3
	note C_, 6
	note C#, 5
	note C_, 10
	sound_call Branch_1ea90c
	sound_call Branch_1ea66f
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
	sound_call Branch_1ea5ed
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	octave 4
;	musicf2
	note D_, 4
	note D_, 6
;	musicf3
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
;	cutoff 8
	note D_, 11
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	octave 3
;	cutoff 8
	note C#, 10
;	musicf2
	note D_, 6
	note D_, 5
	note F_, 5
	note F_, 5
;	musicf3
	note C_, 4
	note C#, 3
	note C_, 4
	dec_octave
;	musicf2
	note A#, 5
	note A#, 5
;	musicf3
	inc_octave
	note C_, 11
	dec_octave
	note A#, 3
	inc_octave
	note C_, 3
	dec_octave
	note A#, 4
	sound_call Branch_1ea90c
	sound_call Branch_1ea66f
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
	sound_call Branch_1ea5ed
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
;	musicf1 16
	octave 4
;	cutoff 6
;	musicf3
	note F_, 10
	rest 11
	note G_, 10
	rest 11
;	musicef 1
;	musicf1 55
;	cutoff 8
;	musicf3
	octave 3
	note C#, 10
;	musicf2
	note D_, 6
	note D_, 5
	note F_, 5
	note F_, 5
;	musicf3
	note C_, 3
	note C#, 4
	note C_, 4
	dec_octave
;	musicf2
	note A#, 5
	note A#, 5
;	musicf3
	sound_call Branch_1ea90c
	sound_call Branch_1ea66f
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
	sound_call Branch_1ea5ed
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	octave 4
;	musicf2
	note D_, 4
	note D_, 6
;	musicf3
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
;	cutoff 8
	note D_, 11
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	octave 3
;	cutoff 8
	note C#, 10
;	musicf2
	note D_, 6
	note D_, 5
	note F_, 5
	note D_, 5
;	musicf3
	note C_, 4
	note C#, 3
	note C_, 4
	dec_octave
;	musicf2
	note A#, 5
	note A#, 5
;	musicf3
	inc_octave
	note C_, 11
	dec_octave
	note A#, 3
	inc_octave
	note C_, 3
	dec_octave
	note A#, 4
	sound_call Branch_1ea90c
	note C_, 11
;	tie
	dec_octave
;	frequency_offset 15
	note B_, 2
;	tie
;	frequency_offset 0
	note B_, 2
;	tie
;	frequency_offset 13
	note A#, 1
;	tie
;	frequency_offset 0
	note A#, 1
;	tie
;	frequency_offset 14
	note A_, 1
;	tie
;	frequency_offset 0
	note A_, 1
;	tie
;	frequency_offset 17
	note G#, 1
;	tie
;	frequency_offset 0
	note G#, 1
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	cutoff 8
	octave 2
	note A#, 16
;	tie
	note A#, 5
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
;	cutoff 8
;	musicef 2
	octave 1
	note A_, 3
	note B_, 3
	inc_octave
	note C_, 3
	note E_, 3
	note G_, 3
	inc_octave
	note C_, 2
	note F_, 2
	note A_, 2
	sound_call Branch_1ea603
	octave 3
;	musicf2
	note C_, 8
	note C_, 3
;	musicf3
	note C_, 10
	dec_octave
	note A#, 11
	inc_octave
;	musicf2
	note C_, 10
	note C_, 11
;	musicf3
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	octave 4
;	musicf2
	note C_, 4
	note C_, 6
;	musicf3
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 1
;	cutoff 8
;	musicf1 103
	note G_, 5
	rest 6
	note G_, 5
	rest 5
;	musicf3
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
;	musicef -4
;	musicf1 39
	octave 3
;	cutoff 4
	rest 11
;	musicf2
	note F_, 10
	note F_, 11
;	musicf3
;	cutoff 8
;	musicef 4
;	musicf1 55
;	musicf3
	note C_, 2
	rest 1
	note C_, 1
	rest 2
	note C_, 2
	rest 1
	note C_, 1
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	cutoff 8
	octave 2
	note B_, 6
;	tie
	inc_octave
	note C_, 5
;	tie
	note C#, 16
;	tie
	note C#, 5
;	tie
	note C#, 10
	sound_call Branch_1ea603
;	musicf1 55
;	musicf3
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 3
	note C_, 11
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
;	cutoff 8
	inc_octave
;	musicf2
	note F_, 4
	note F_, 6
	dec_octave
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	note C_, 5
	note C_, 6
	dec_octave
;	musicf3
	note B_, 10
	inc_octave
	inc_octave
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
;	cutoff 8
;	musicf2
	note E_, 4
	note E_, 7
	dec_octave
	dec_octave
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	cutoff 8
	note B_, 5
	note B_, 5
;	musicf3
	note A#, 11
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	inc_octave
	inc_octave
;	cutoff 8
;	musicf2
	note D#, 4
	note D#, 6
	dec_octave
	dec_octave
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
;	cutoff 8
	note A#, 5
	note A#, 6
;	musicf3
	note G#, 10
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	inc_octave
	inc_octave
;	cutoff 8
;	musicf2
	note C#, 4
	note C#, 7
	dec_octave
	dec_octave
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	cutoff 8
	note G#, 5
	note G#, 5
;	musicf3
	note F_, 16
;	tie
	note F_, 5
	note F#, 16
;	tie
	note F#, 5
	sound_loop 0, .MainLoop

Branch_1ea5ed:
;	musicf2
	note G_, 8
	note G_, 3
;	musicf3
	note G_, 10
	note F_, 11
;	musicf2
	note G_, 10
	note G_, 11
;	musicf3
	sound_ret

Branch_1ea5f8:
;	musicf2
	note D_, 8
	note D_, 3
;	musicf3
	note D_, 10
	note C_, 11
;	musicf2
	note D_, 10
	note D_, 11
;	musicf3
	sound_ret

Branch_1ea603:
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	musicf3
	octave 3
;	musicf2
	note C_, 8
	note C_, 3
;	musicf3
	note C_, 10
	dec_octave
	note A#, 11
;	musicf2
	inc_octave
	note C_, 10
	note C_, 11
;	musicf3
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	octave 4
;	cutoff 8
;	musicf2
	note C_, 4
	note C_, 6
;	musicf3
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 1
;	cutoff 8
;	musicf1 55
	note G_, 5
	rest 6
	note G_, 5
	rest 5
;	musicf3
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
;	musicef -4
;	musicf1 39
	octave 3
;	cutoff 4
	rest 11
;	musicf2
	note F_, 10
	note F_, 11
;	cutoff 8
;	musicf3
;	musicef 4
;	musicf1 55
;	musicf3
	note C_, 2
	rest 1
	note C_, 1
	rest 2
	note C_, 2
	rest 1
	note C_, 1
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
	note A#, 16
;	tie
	note A#, 5
	note B_, 16
;	tie
	note B_, 5
	sound_ret

Branch_1ea64e:
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	cutoff 8
	octave 3
;	musicef -1
	note G#, 16
;	tie
	note G#, 16
;	tie
	note G#, 10
;	musicef 1
	note G#, 2
	rest 4
	note G#, 1
	rest 4
	note G#, 2
	rest 4
	note G#, 1
	rest 3
	note G_, 16
;	tie
	note G_, 5
;	tie
	note G_, 11
;	tie
	note F#, 5
;	tie
	note F_, 5
	dec_octave
	sound_ret

Branch_1ea66f:
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	cutoff 8
	octave 2
	note E_, 16
;	tie
	note E_, 5
	note F_, 16
;	tie
	note F_, 5
	note F#, 16
;	tie
	note F#, 5
	sound_ret
	sound_ret


Music_HereComesGR_Ch1:
.MainLoop
	speed 1
	stereo_panning TRUE, TRUE
	octave 2
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	musicf1 55
	octave 2
	sound_call Branch_1ea5f8
	rest 10
	rest 11
	rest 10
	rest 16
	rest 16
	rest 10
	rest 6
	rest 5
	rest 10
	rest 16
	rest 5
	sound_call Branch_1ea5f8
	rest 10
	rest 11
	rest 10
	note F#, 6
;	tie
	note G_, 5
;	tie
	note G#, 16
;	tie
	note G#, 15
	note G_, 16
;	tie
	note G_, 16
;	tie
	note F#, 5
;	tie
	note F_, 5
	octave 2
	sound_call Branch_1ea5f8
	rest 10
	rest 11
	rest 10
	rest 16
	rest 16
	rest 10
	rest 6
	rest 5
	rest 10
	rest 16
	rest 5
	sound_call Branch_1ea5f8
	rest 10
	rest 11
	rest 10
	note G_, 11
	inc_octave
	note C_, 5
	rest 5
	dec_octave
	note A#, 11
	note A_, 5
	note A#, 5
	note G#, 10
	note F_, 10
	note C_, 11
	note C#, 10
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
	sound_call Branch_1ea5f8
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	octave 4
;	cutoff 4
;	musicf2
	note C_, 10
	note C_, 11
;	musicf3
	rest 10
	rest 11
	dec_octave
;	musicef -4
;	cutoff 4
	note A#, 10
;	musicef 4
;	musicf1 55
;	musicf3
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	octave 1
;	cutoff 8
;	musicef -2
.Loop1
	note D_, 2
	rest 1
	note D_, 2
	rest 2
	sound_loop 3, .Loop1
;	musicef 2
	rest 11
	rest 10
	rest 11
	rest 10
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
	sound_call Branch_1ea5f8
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	octave 4
;	cutoff 4
;	musicf2
	note C_, 10
	note C_, 11
	rest 10
;	musicf3
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
;	cutoff 8
	note F#, 6
;	tie
	note G_, 5
;	tie
	note G#, 16
;	tie
	note G#, 15
	note G_, 16
;	tie
	note G_, 16
;	tie
	note F#, 5
;	tie
	note F_, 5
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
	sound_call Branch_1ea5f8
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	octave 4
;	cutoff 4
;	musicf2
	note C_, 10
	note C_, 11
;	musicf3
	rest 10
	rest 11
	dec_octave
;	musicef -4
	note A#, 10
;	musicef 4
;	musicf1 55
;	musicf3
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 1
;	cutoff 8
;	musicef -2
.Loop2
	note D_, 2
	rest 1
	note D_, 2
	rest 2
	sound_loop 3, .Loop2
;	musicef 2
	rest 11
	rest 10
	rest 11
	rest 10
	octave 2
	sound_call Branch_1ea5f8
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	octave 4
;	cutoff 4
;	musicf2
	note C_, 10
	note C_, 11
;	musicf3
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 3
;	cutoff 8
	note C_, 10
	dec_octave
	rest 11
	note G_, 5
	note G#, 5
;	musicf2
	note A_, 6
	note A_, 5
	inc_octave
	note C_, 5
	note C_, 5
;	musicf3
	dec_octave
	note G_, 6
	note G#, 5
	note G_, 10
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	cutoff 8
	octave 2
	note A#, 11
	note G_, 10
	sound_call Branch_1ea64e
	rest 11
	rest 10
	rest 11
	rest 10
	rest 11
	rest 10
	rest 16
	rest 5
	rest 16
	rest 5
	octave 4
	rest 11
;	cutoff 4
	note C_, 10
	rest 11
	dec_octave
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
;	cutoff 8
	note F_, 10
	sound_call Branch_1ea5ed
	rest 10
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
;	cutoff 8
	note G_, 16
;	tie
	note G_, 5
	sound_call Branch_1ea64e
	rest 16
	rest 5
	rest 16
	rest 5
	rest 16
	rest 5
	rest 16
	rest 5
	rest 16
	rest 5
	rest 11
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
;	cutoff 6
;	musicf1 16
	octave 3
;	musicf3
	note A#, 10
	rest 11
	inc_octave
	note C_, 10
	rest 11
;	musicf3
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	musicf1 55
;	cutoff 8
	octave 2
	note G_, 10
	note F_, 11
;	musicf2
	note G_, 10
	note G_, 11
;	musicf3
	note D_, 10
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
;	cutoff 8
	note G_, 11
;	tie
	note G_, 10
	sound_call Branch_1ea64e
	rest 16
	rest 5
	rest 16
	rest 5
	rest 16
	rest 5
	rest 16
	rest 5
	rest 16
	rest 5
	octave 4
	rest 11
;	cutoff 4
	note C_, 10
	rest 11
	dec_octave
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
;	cutoff 8
	note F_, 10
;	musicf2
	note G_, 8
	note G_, 3
;	musicf3
	note G_, 10
	note F_, 11
;	musicf2
	note G_, 10
	note G_, 11
	rest 10
;	musicf3
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
;	cutoff 8
	note G_, 16
;	tie
	note G_, 5
;	musicef -1
	octave 3
	note G#, 16
;	tie
	note G#, 16
;	tie
	note G#, 10
;	musicef 1
	note G#, 2
	rest 4
	note G#, 1
	rest 4
	note G#, 2
	rest 4
	note G#, 1
	rest 3
	note G_, 16
;	tie
	note G_, 5
;	tie
	note G_, 16
;	tie
	note G_, 5
	dec_octave
	note F_, 6
;	tie
	note F#, 5
;	tie
	note G_, 10
;	preset 10
	volume_envelope 13, 0
	duty_cycle 3
;	musicf1 144
;	musicef -3
;	musicf2
	octave 3
	note G_, 3
	note G_, 3
	inc_octave
	note C_, 3
	dec_octave
	note G_, 2
	note F_, 3
	inc_octave
	note C_, 2
	dec_octave
	note A#, 3
	note F_, 2
	inc_octave
	note D#, 3
	dec_octave
	note A#, 3
	inc_octave
	note G#, 3
	note D#, 2
	inc_octave
	note C#, 3
	dec_octave
	note G#, 2
	inc_octave
	note F#, 3
	note C#, 2
;	musicf1 55
	sound_call Branch_1ea8d3
	octave 2
	sound_call Branch_1ea5ed
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
;	cutoff 4
	octave 3
;	musicf2
	note A#, 10
	note A#, 11
;	musicf3
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 1
;	cutoff 8
	rest 10
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
;	musicef -4
;	musicf1 55
	octave 2
;	cutoff 4
	rest 11
	note A#, 10
	note A#, 11
;	musicf3
;	cutoff 8
;	musicef 4
;	musicf1 55
;	musicf3
	note C_, 2
	rest 1
	note C_, 2
	rest 1
	note C_, 2
	rest 1
	note C_, 1
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	cutoff 8
	octave 2
	note F#, 6
;	tie
	note G_, 5
;	tie
	note G#, 16
;	tie
	note G#, 5
;	tie
	note G#, 10
	sound_call Branch_1ea8d3
;	musicf1 55
;	musicf3
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
	note G_, 11
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
;	cutoff 8
	inc_octave
	inc_octave
;	musicf2
	note C_, 4
	note C_, 6
	dec_octave
	dec_octave
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	note G_, 5
	note G_, 6
;	musicf3
	note F#, 10
	inc_octave
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
;	cutoff 8
;	musicf2
	note B_, 4
	note B_, 7
	dec_octave
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	cutoff 8
	note F#, 5
	note F#, 5
;	musicf3
	note F_, 11
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	inc_octave
;	cutoff 8
;	musicf2
	note A#, 4
	note A#, 6
	dec_octave
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
;	cutoff 8
	note F_, 5
	note F_, 6
;	musicf3
	note D#, 10
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	inc_octave
;	cutoff 8
;	musicf2
	note G#, 4
	note G#, 7
	dec_octave
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
;	cutoff 8
	note D#, 5
	note D#, 5
;	musicf3
	note C_, 16
;	tie
	note C_, 5
	note C#, 16
;	tie
	note C#, 5
	sound_loop 0, .MainLoop

Branch_1ea8d3:
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	stereo_panning TRUE, TRUE
	octave 2
;	musicf1 55
;	musicf2
	note G_, 8
	note G_, 3
;	musicf3
	note G_, 10
	note F_, 11
;	musicf2
	note G_, 10
	note G_, 11
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	octave 3
;	cutoff 4
	note A#, 10
	note A#, 11
;	musicf3
	rest 10
;	musicef -4
	octave 2
;	cutoff 4
	rest 11
	note A#, 10
	rest 11
;	cutoff 8
;	musicef 4
;	musicf1 55
;	musicf3
	note G_, 2
	rest 1
	note G_, 2
	rest 1
	note G_, 2
	rest 1
	note G_, 1
;	preset 8
	volume_envelope 10, 0
	duty_cycle 0
	vibrato 28, 3, 3
	octave 2
	note F_, 16
;	tie
	note F_, 5
	note F#, 16
;	tie
	note F#, 5
	sound_ret

Branch_1ea90c:
;	preset 9
	volume_envelope 9, 0
	duty_cycle 1
	vibrato 11, 3, 3
	vibrato 11, 3, 3
	octave 1
	note A_, 4
	note B_, 3
	inc_octave
	note D_, 3
	note G_, 3
	note B_, 2
	inc_octave
	note D_, 2
	note F_, 2
	note G_, 2
	note A#, 10
;	tie
	note A#, 16
;	tie
	note A#, 16
	dec_octave
	note C_, 4
	note D_, 3
	note F_, 2
	note A_, 2
	note B_, 2
	inc_octave
	note D_, 2
	note F_, 2
	note A_, 2
	note B_, 2
	inc_octave
	note C_, 11
;	tie
	note C_, 10
;	tie
	note C_, 11
;	tie
	note C_, 10
	sound_ret


Music_HereComesGR_Ch3:
	speed 1
	fade_wave 11
	channel_volume 1
;	echo 128
	stereo_panning TRUE, TRUE
.MainLoop
	octave 5
	octave 2
	note G_, 8
	rest 3
	note G_, 10
	note F_, 11
	note G_, 10
	rest 16
	rest 16
	rest 10
	rest 16
	rest 16
	rest 10
	note C_, 5
;	tie
	note C#, 6
;	tie
	note D_, 10
	note F_, 16
;	tie
	note F_, 5
	note G_, 8
	rest 3
	note G_, 10
	note F_, 11
	note G_, 10
	rest 16
	rest 16
	rest 10
	note G#, 6
;	tie
	note A_, 5
;	tie
	note A#, 16
;	tie
	note A#, 15
	note A_, 16
;	tie
	note A_, 16
;	tie
	note A_, 10
	note G_, 8
	rest 3
	note G_, 10
	note F_, 11
	note G_, 10
	rest 16
	rest 16
	rest 10
	rest 16
	rest 16
	rest 10
	note C_, 5
;	tie
	note C#, 6
;	tie
	note D_, 10
	note F_, 16
;	tie
	note F_, 5
	note G_, 8
	rest 3
	note G_, 10
	note F_, 11
	note G_, 10
	rest 16
	rest 15
	inc_octave
	note C#, 10
	note D_, 11
	inc_octave
	channel_volume 2
;	cutoff 8
	note C_, 10
;	cutoff 8
	channel_volume 1
	dec_octave
	note C#, 11
	note C_, 10
	dec_octave
	note A#, 11
	inc_octave
	note C_, 10
	dec_octave
	note F_, 11
	note G#, 10
	channel_volume 1
	octave 2
	note G_, 8
	rest 3
	note G_, 10
	note F_, 11
	note G_, 10
	rest 11
	octave 5
;	cutoff 4
	note G_, 10
	channel_volume 3
	note G_, 11
;	cutoff 8
	octave 2
	channel_volume 2
	note F_, 10
	note G_, 11
	octave 5
;	cutoff 4
	note F_, 10
;	cutoff 8
	octave 2
	channel_volume 1
	rest 10
	rest 11
	note C_, 5
;	tie
	note C#, 6
;	tie
	note D_, 10
	note F_, 16
;	tie
	note F_, 5
	channel_volume 1
	octave 2
	note G_, 8
	rest 3
	note G_, 10
	note F_, 11
	note G_, 10
	rest 11
	octave 5
;	cutoff 4
	note G_, 10
	channel_volume 3
	note G_, 11
;	cutoff 8
	channel_volume 1
	octave 2
	rest 10
	note G#, 6
;	tie
	note A_, 5
;	tie
	note A#, 16
;	tie
	note A#, 15
	note A_, 16
;	tie
	note A_, 16
;	tie
	note A_, 10
	channel_volume 1
	octave 2
	note G_, 8
	rest 3
	note G_, 10
	note F_, 11
	note G_, 10
	rest 11
	octave 5
;	cutoff 4
	note G_, 10
	channel_volume 3
	note G_, 11
;	cutoff 8
	octave 2
	channel_volume 2
	note F_, 10
	note G_, 11
	octave 5
;	cutoff 4
	note F_, 10
;	cutoff 8
	channel_volume 1
	octave 2
	rest 10
	rest 11
	note C_, 5
;	tie
	note C#, 6
;	tie
	note D_, 10
	note F_, 16
;	tie
	note F_, 5
	note G_, 8
	rest 3
	note G_, 10
	note F_, 11
	note G_, 8
	rest 2
	note G_, 5
	rest 6
	inc_octave
	note F_, 10
	rest 11
	note G_, 10
	octave 3
	rest 11
	note C#, 10
	note D_, 11
	note F_, 10
	dec_octave
	note A#, 11
	note F_, 10
	note G_, 11
	note A_, 10
	sound_call Branch_1eaaf6
	rest 11
	octave 2
	note G_, 5
	rest 5
	note E_, 16
;	tie
	note E_, 5
	note F_, 16
;	tie
	note F_, 5
	note F#, 16
;	tie
	note F#, 5
	note G_, 8
	rest 3
	note G_, 10
	note F_, 11
	note G_, 8
	rest 13
	inc_octave
	note F_, 8
	rest 13
	note G_, 8
	rest 2
	rest 16
	rest 16
	rest 16
	rest 5
	dec_octave
	note D_, 10
	note F_, 11
	note G_, 10
	sound_call Branch_1eaaf6
	rest 11
	octave 2
	note G#, 5
;	tie
	note A_, 5
	inc_octave
	note C_, 11
	note D_, 5
	rest 5
	note F#, 6
;	tie
	note G_, 5
	note A#, 10
	inc_octave
	note C_, 6
;	tie
	note C_, 5
;	tie
	dec_octave
	note B_, 5
;	tie
	note A#, 5
	octave 2
	note D_, 16
;	tie
	note D_, 16
	inc_octave
	note D_, 8
	rest 2
	rest 11
	inc_octave
	inc_octave
;	cutoff 4
	note F_, 10
	channel_volume 3
	note F_, 11
;	cutoff 8
	dec_octave
	dec_octave
	channel_volume 2
	dec_octave
	note C_, 10
	note D_, 8
	rest 13
	inc_octave
	note G_, 3
	rest 8
	dec_octave
	note G_, 3
	rest 7
	channel_volume 1
	note C_, 16
;	tie
	note C_, 5
	note C#, 16
;	tie
	note C#, 5
	octave 2
	note D_, 16
;	tie
	note D_, 16
	inc_octave
	note D_, 8
	rest 2
	rest 11
	inc_octave
	inc_octave
;	cutoff 4
	note F_, 10
	channel_volume 3
	note F_, 11
;	cutoff 8
	dec_octave
	dec_octave
	channel_volume 2
	dec_octave
	note C_, 10
	note D_, 8
	rest 13
	inc_octave
	note G_, 3
	rest 8
	dec_octave
	note G_, 3
	rest 7
	channel_volume 1
	note C#, 6
;	tie
	note D_, 5
;	tie
	note D#, 16
;	tie
	note D#, 15
	octave 2
	note D_, 16
;	tie
	note D_, 16
	inc_octave
	note D_, 8
	rest 2
	rest 11
	inc_octave
	inc_octave
;	cutoff 4
	note F_, 10
	channel_volume 3
	note F_, 11
;	cutoff 8
	dec_octave
	dec_octave
	channel_volume 2
	dec_octave
	note C_, 10
	note D_, 8
	rest 13
	inc_octave
	note G_, 3
	rest 8
	dec_octave
	note G_, 3
	rest 7
	channel_volume 1
	note C_, 16
;	tie
	note C_, 5
	note C#, 16
;	tie
	note C#, 5
	note D_, 16
;	tie
	note D_, 5
	note D_, 2
	rest 9
	note C#, 16
;	tie
	note C#, 5
	note C#, 2
	rest 8
	note C_, 16
;	tie
	note C_, 5
	rest 11
	note G#, 2
;	tie
	note A_, 3
;	tie
	note A#, 16
;	tie
	note A#, 10
	note F_, 16
;	tie
	note F_, 5
	note F#, 16
;	tie
	note F#, 5
	sound_loop 0, .MainLoop

Branch_1eaaf6:
;	vibrato_type 1
	vibrato 11, 3, 3
	octave 2
	note A#, 11
;	tie
	note A#, 7
	rest 3
	note A#, 2
	rest 9
	inc_octave
	note A#, 5
	rest 5
	dec_octave
	note A#, 5
	rest 6
	note G#, 5
	rest 5
	note G#, 6
;	tie
	note A_, 5
;	tie
	note A_, 10
	rest 11
	inc_octave
	note A_, 5
	rest 5
	dec_octave
	note A_, 11
	note E_, 10
	note F_, 16
;	tie
	note F_, 5
	note F#, 16
;	tie
	note F#, 5
	channel_volume 1
	octave 2
	note G_, 8
	rest 3
	note G_, 10
	note F_, 11
	note G_, 10
	rest 11
	octave 5
;	cutoff 4
	note G_, 10
	channel_volume 3
	note G_, 11
;	cutoff 8
	octave 2
	channel_volume 1
	rest 10
	rest 16
	rest 16
	rest 16
	rest 5
	note D_, 10
	note F_, 11
	note G_, 10
	note A#, 11
;	tie
	note A#, 7
	rest 3
	note A#, 2
	rest 9
	inc_octave
	note A#, 5
	rest 5
	dec_octave
	note A#, 5
	rest 6
	note B_, 5
	rest 5
	note A#, 6
;	tie
	note B_, 5
;	tie
	inc_octave
	note C_, 10
	sound_ret


Music_HereComesGR_Ch4:
	toggle_noise 6
.MainLoop
	drum_speed 1
	octave 1
	sound_call Branch_1eacf7
	sound_call Branch_1ead02
	sound_call Branch_1eacf7
	drum_note 4, 11
	drum_note 2, 10
	drum_note 5, 11
	drum_note 1, 10
	drum_note 2, 11
	drum_note 2, 10
	drum_note 4, 11
;	musicef -3
	drum_note 2, 3
;	musicef -1
	drum_note 2, 3
;	musicef 0
	drum_note 2, 4
	sound_call Branch_1eacf7
	drum_note 4, 11
	drum_note 1, 10
	drum_note 5, 7
	drum_note 1, 7
	drum_note 1, 7
	drum_note 2, 16
;	tie
	rest 5
	drum_note 4, 11
	drum_note 2, 10
	sound_call Branch_1eacf7
	drum_note 1, 11
	drum_note 2, 10
	drum_note 5, 11
	drum_note 2, 5
	drum_note 2, 5
	drum_note 2, 11
	drum_note 2, 10
	drum_note 1, 11
	drum_note 2, 10
	sound_call Branch_1eacf7
	drum_note 4, 11
	drum_note 1, 10
	drum_note 5, 7
	drum_note 1, 4
	drum_note 1, 4
	drum_note 1, 3
	drum_note 1, 3
	drum_note 2, 11
	drum_note 1, 10
	drum_note 4, 11
	drum_note 1, 4
	drum_note 2, 3
	drum_note 2, 3
	drum_note 1, 16
;	tie
	rest 5
	drum_note 4, 11
	drum_note 1, 10
	drum_note 2, 16
;	tie
	rest 5
	drum_note 4, 11
	drum_note 1, 5
	drum_note 1, 5
	drum_note 4, 11
	drum_note 2, 10
	drum_note 5, 11
	drum_note 2, 4
	drum_note 2, 3
	drum_note 2, 3
	drum_note 2, 11
	drum_note 2, 10
	drum_note 4, 11
	drum_note 2, 5
	drum_note 2, 5
	sound_call Branch_1eacf7
	drum_note 4, 11
	drum_note 1, 10
	drum_note 5, 7
	drum_note 1, 4
	drum_note 1, 4
	drum_note 1, 3
	drum_note 1, 3
	drum_note 2, 11
	drum_note 1, 10
	drum_note 4, 11
	drum_note 1, 4
;	musicef -2
	drum_note 2, 3
;	musicef 0
	drum_note 2, 3
	drum_note 1, 11
	drum_note 1, 10
	drum_note 4, 11
	drum_note 1, 5
	drum_note 1, 5
	drum_note 2, 11
	drum_note 1, 10
	drum_note 4, 11
	drum_note 1, 10
	drum_note 4, 11
	drum_note 2, 10
	drum_note 5, 11
	drum_note 2, 5
	drum_note 2, 5
	drum_note 2, 11
	drum_note 4, 5
	drum_note 2, 5
	drum_note 2, 11
	drum_note 2, 10
	drum_note 1, 11
	drum_note 4, 5
	drum_note 2, 5
	drum_note 2, 11
	drum_note 2, 10
	drum_note 2, 11
	drum_note 1, 10
	drum_note 5, 16
;	tie
	rest 5
	drum_note 4, 11
	drum_note 2, 10
	drum_note 5, 11
	drum_note 2, 10
	drum_note 2, 11
	drum_note 4, 5
	drum_note 2, 5
	drum_note 2, 11
	drum_note 2, 10
	drum_note 1, 11
	drum_note 1, 10
	drum_note 4, 11
	drum_note 1, 10
	drum_note 2, 11
	drum_note 5, 10
	drum_note 1, 11
;	musicef -3
	drum_note 2, 4
	drum_note 2, 3
	drum_note 2, 3
;	musicef 0
	drum_note 1, 11
	drum_note 2, 10
	drum_note 5, 11
;	musicef -3
	drum_note 2, 5
;	musicef -2
	drum_note 2, 5
;	musicef 0
	drum_note 2, 11
	drum_note 2, 10
	drum_note 1, 11
;	musicef -3
	drum_note 2, 4
;	musicef -2
	drum_note 2, 3
;	musicef 0
	drum_note 2, 3
	drum_note 1, 11
	drum_note 4, 10
	drum_note 5, 11
	drum_note 1, 5
	drum_note 2, 5
	drum_note 2, 11
	drum_note 1, 10
	drum_note 2, 16
;	tie
	rest 5
	drum_note 4, 11
	drum_note 2, 10
	drum_note 5, 11
	drum_note 1, 10
	drum_note 2, 11
	drum_note 4, 5
	drum_note 2, 5
	drum_note 2, 11
	drum_note 2, 10
	drum_note 1, 16
;	tie
	rest 5
	drum_note 4, 11
	drum_note 1, 10
	drum_note 2, 11
	drum_note 1, 10
	rest 11
	drum_note 1, 10
	rest 11
	drum_note 2, 10
	drum_note 5, 11
	drum_note 1, 10
	drum_note 2, 11
	drum_note 4, 5
	drum_note 2, 5
	drum_note 2, 11
	drum_note 2, 10
	drum_note 1, 11
	drum_note 4, 5
	drum_note 2, 5
	drum_note 2, 11
	drum_note 2, 10
	drum_note 2, 11
	drum_note 1, 10
	drum_note 5, 16
;	tie
	rest 5
	drum_note 4, 11
	drum_note 2, 10
	drum_note 5, 11
	drum_note 2, 10
	drum_note 2, 11
	drum_note 4, 5
	drum_note 2, 5
	drum_note 2, 11
	drum_note 2, 10
	drum_note 1, 11
	drum_note 1, 10
	drum_note 4, 11
	drum_note 1, 10
	drum_note 2, 11
	drum_note 5, 10
	drum_note 1, 11
;	musicef -3
	drum_note 2, 4
	drum_note 2, 3
	drum_note 2, 3
;	musicef 0
	drum_note 1, 11
	drum_note 2, 10
	drum_note 5, 11
;	musicef -3
	drum_note 2, 5
;	musicef -2
	drum_note 2, 5
;	musicef 0
	drum_note 2, 11
	drum_note 2, 10
	drum_note 1, 11
;	musicef -3
	drum_note 2, 4
;	musicef -2
	drum_note 2, 3
;	musicef 0
	drum_note 2, 3
	drum_note 1, 11
	drum_note 4, 10
	drum_note 5, 11
	drum_note 1, 5
	drum_note 2, 5
	drum_note 2, 11
	drum_note 1, 10
	drum_note 2, 16
;	tie
	rest 5
	drum_note 4, 11
	drum_note 2, 10
	drum_note 2, 11
	drum_note 2, 5
	drum_note 2, 5
	drum_note 2, 11
	drum_note 2, 5
	drum_note 2, 5
	drum_note 2, 11
;	musicef -3
	drum_note 2, 5
;	musicef 0
	drum_note 2, 5
	drum_note 1, 16
;	tie
	rest 5
	drum_note 4, 11
	drum_note 1, 4
	drum_note 4, 3
	drum_note 4, 3
	drum_note 5, 11
	drum_note 2, 10
	drum_note 4, 11
	drum_note 1, 10
	drum_note 4, 11
	drum_note 1, 10
	drum_note 5, 11
;	musicef -3
	drum_note 2, 4
;	musicef -2
	drum_note 2, 3
;	musicef 0
	drum_note 2, 3
	drum_note 2, 11
	drum_note 2, 10
	drum_note 4, 11
	drum_note 2, 5
	drum_note 2, 5
	drum_note 1, 16
;	tie
	rest 5
	drum_note 4, 11
	drum_note 1, 4
	drum_note 4, 3
	drum_note 4, 3
	drum_note 5, 11
	drum_note 2, 10
	drum_note 4, 11
	drum_note 1, 10
	drum_note 4, 11
	drum_note 2, 10
	drum_note 5, 11
	drum_note 1, 5
	drum_note 1, 5
;	musicef 1
	drum_speed 2
	drum_note 8, 15
	drum_speed 1
	rest 1
;	musicef -3
	drum_note 2, 4
;	musicef -2
	drum_note 2, 3
;	musicef 0
	drum_note 2, 3
	drum_note 1, 16
;	tie
	rest 5
	drum_note 4, 11
	drum_note 1, 4
	drum_note 4, 3
	drum_note 4, 3
	drum_note 5, 11
	drum_note 2, 10
	drum_note 4, 11
	drum_note 1, 10
	drum_note 4, 11
	drum_note 1, 10
	drum_note 5, 11
;	musicef -3
	drum_note 2, 4
;	musicef -2
	drum_note 2, 3
;	musicef 0
	drum_note 2, 3
	drum_note 2, 11
	drum_note 4, 5
	drum_note 2, 5
	drum_note 2, 11
	drum_note 2, 10
	drum_note 1, 11
	drum_note 4, 10
	drum_note 2, 11
	drum_note 1, 10
	drum_note 4, 11
	drum_note 2, 10
	drum_note 1, 11
	drum_note 4, 10
	drum_note 2, 11
	drum_note 1, 10
	drum_note 4, 11
	drum_note 2, 10
	drum_note 2, 11
	drum_note 4, 5
	drum_note 2, 5
;	musicef -2
	drum_note 2, 4
;	musicef -3
	drum_note 2, 4
	drum_note 2, 3
;	musicef -2
	drum_note 2, 4
;	musicef -1
	drum_note 2, 3
;	musicef 0
	drum_note 2, 3
	sound_loop 0, .MainLoop

Branch_1eacf7:
	drum_note 1, 16
;	tie
	rest 5
	drum_note 4, 11
	drum_note 1, 10
	drum_note 2, 16
;	tie
	rest 5
	drum_note 4, 11
	drum_note 1, 10
	sound_ret

Branch_1ead02:
	drum_note 4, 11
	drum_note 1, 10
	drum_note 5, 11
	drum_note 1, 5
	drum_note 1, 5
	drum_note 2, 16
;	tie
	rest 5
	drum_note 4, 11
	drum_note 2, 10
	sound_ret
