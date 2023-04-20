Music_Surf:
	channel_count 3
	channel 1, Music_Surf_Ch1
	channel 2, Music_Surf_Ch2
	channel 3, Music_Surf_Ch3

	db $3 ; unused

Music_Surf_Ch1:
	tempo 108
	volume 7, 7
	note_type 12, 10, 7
	stereo_panning FALSE, TRUE
.mainloop:
	duty_cycle 2
	vibrato 16, 2, 4
	volume_envelope 7, 3
	octave 3
	note F_, 1
	rest 1
	note D#, 1
	rest 1
	volume_envelope 7, 3
	note F_, 1
	rest 1
	note D#, 1
	rest 1
	note G#, 1
	rest 1
	note D#, 1
	rest 1
	volume_envelope 7, 3
	note F_, 1
	rest 1
	note D#, 1
	rest 1
	note F_, 1
	rest 1
	note D#, 1
	volume_envelope 9, 3
	rest 1
	note G#, 1
	rest 1
	note D#, 1
	rest 1
	volume_envelope 10, 7
	note F_, 1
	rest 1
	note D#, 1
	rest 1
	note F_, 1
	rest 1
	note D#, 1
	volume_envelope 11, 7
	rest 1
	note A#, 2
	note G#, 2
	note F_, 2
	note D_, 2
	note_type 8, 12, 7
	octave 2
	note A#, 2
	octave 3
	note D_, 2
	note F_, 2
	volume_envelope 15, 7
	note G#, 2
	note A#, 2
	octave 4
	note D_, 2
	duty_cycle 0
	sound_call .sub1
	duty_cycle 1
	note_type 8, 10, 7
	sound_call .sub1
	sound_call .sub2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note G_, 2
	octave 4
	note C_, 2
	note D#, 2
	note G_, 2
	duty_cycle 1
	note_type 6, 9, 7
	sound_call .sub2
	volume_envelope 10, 8
	note G#, 6
	note A_, 6
	note A#, 3
	octave 4
	note D_, 3
	volume_envelope 10, 8
	duty_cycle 1
	sound_call .sub3
	octave 3
	note D#, 8
	note G#, 8
	note D#, 8
	duty_cycle 3
	note_type 8, 9, 8
	sound_call .sub3
	note_type 12, 10, 7
	octave 3
	note D#, 12
	octave 2
	note F_, 4
	note D#, 4
	note F_, 4
	note G#, 4
	note D#, 2
	note G#, 2
	note B_, 2
	octave 3
	note D#, 2
	sound_loop 0, .mainloop

.sub1:
	note_type 12, 10, 7
	octave 3
	note D#, 4
	note A#, 1
	rest 1
	octave 4
	note D#, 1
	rest 1
	octave 3
	note A#, 1
	rest 1
	octave 4
	note D#, 1
	rest 1
	octave 3
	note D#, 4
	note A#, 1
	rest 1
	octave 4
	note D#, 1
	rest 1
	octave 3
	note A#, 1
	rest 1
	octave 4
	note D#, 1
	rest 1
	octave 3
	note C#, 4
	note A#, 1
	rest 1
	octave 4
	note C#, 1
	rest 1
	octave 3
	note A#, 1
	rest 1
	octave 4
	note C#, 1
	rest 1
	octave 3
	note C#, 4
	note A#, 1
	rest 1
	octave 4
	note C#, 1
	rest 1
	octave 3
	note A#, 1
	rest 1
	octave 4
	note C#, 1
	rest 1
	octave 3
	note C_, 4
	note G#, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note G#, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note C_, 4
	note G#, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note G#, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	note_type 6, 10, 7
	octave 3
	note A#, 1
	note B_, 15
	octave 4
	note D#, 4
	octave 3
	note B_, 4
	note G#, 8
	note F_, 8
	note C#, 4
	note D_, 4
	sound_ret

.sub2:
	octave 4
	note G#, 16
	note D#, 4
	note C_, 4
	octave 3
	note G#, 4
	octave 4
	note C_, 4
	note D_, 4
	note D#, 4
	note G_, 4
	note G#, 4
	note_type 8, 9, 2
	note A#, 2
	note F_, 2
	note D_, 2
	note F_, 2
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	note F_, 2
	note A#, 2
	note F_, 2
	note D_, 2
	octave 2
	note A#, 2
	octave 3
	note D_, 2
	note F_, 2
	note G#, 2
	note A#, 2
	octave 4
	note D_, 2
	note_type 6, 9, 7
	note C#, 1
	note D_, 15
	note G_, 4
	note D_, 4
	octave 3
	note A#, 4
	octave 4
	note D_, 4
	note F_, 4
	note G_, 4
	note A_, 4
	note A#, 4
	note_type 8, 9, 2
	octave 5
	note C_, 2
	octave 4
	note G_, 2
	note D#, 2
	note G_, 2
	note D#, 2
	note C_, 2
	note D#, 2
	note C_, 2
	octave 3
	note G_, 2
	sound_ret

.sub3:
	octave 3
	note A#, 3
	note G_, 3
	note A#, 3
	octave 4
	note D#, 9
	note_type 6, 5, 8
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	volume_envelope 10, 8
	note D#, 4
	note D_, 4
	note D#, 4
	note G_, 4
	note A_, 4
	note G#, 4
	note G_, 4
	note F#, 4
	note F_, 4
	note E_, 4
	note G_, 8
	note C#, 8
	note A#, 8
	note A_, 1
	note A#, 3
	note G#, 4
	octave 4
	note C_, 4
	note F_, 12
	volume_envelope 5, 8
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	note A#, 1
	note A_, 1
	note G_, 1
	volume_envelope 10, 8
	note G#, 8
	octave 4
	note D#, 4
	octave 3
	note B_, 4
	note G#, 8
	note D#, 8
	octave 2
	note B_, 8
	sound_ret

Music_Surf_Ch2:
.mainloop:
	note_type 12, 12, 2
	stereo_panning TRUE, FALSE
	duty_cycle 2
	vibrato 20, 2, 3
.loop1:
	octave 1
	note A#, 4
	octave 2
	note A#, 1
	rest 3
	note A#, 1
	rest 3
	sound_loop 3, .loop1
	octave 1
	note A#, 4
	octave 2
	note F_, 1
	rest 3
	note A#, 1
	rest 3
.loop2:
	note D#, 4
	note G_, 2
	note G#, 2
	note A#, 4
	note D#, 4
	note G_, 2
	note G#, 2
	note A#, 4
	note C#, 4
	note G_, 2
	note G#, 2
	note A#, 4
	note C#, 4
	note G_, 2
	note G#, 2
	note A#, 4
	note C_, 4
	note F_, 2
	note G_, 2
	note G#, 4
	note C_, 4
	note F_, 2
	note G_, 2
	note G#, 4
	octave 1
	note B_, 4
	octave 2
	note F_, 2
	note G_, 2
	note G#, 2
	note A#, 2
	note B_, 4
	note A#, 4
	note G#, 4
	sound_loop 2, .loop2
	volume_envelope 12, 7
	sound_call .sub1
	note D#, 4
	note D_, 4
	note C#, 4
	sound_call .sub1
	note D_, 4
	note D#, 4
	octave 1
	note A#, 4
	note_type 6, 11, 8
	sound_call .sub2
	duty_cycle 1
	volume_envelope 11, 8
	sound_call .sub3
	duty_cycle 2
	sound_call .sub4
	duty_cycle 1
	volume_envelope 11, 8
	sound_call .sub5
	octave 3
	note B_, 16
	octave 4
	note C#, 8
	transpose 0, 12
	duty_cycle 3
	sound_call .sub2
	volume_envelope 11, 8
	duty_cycle 1
	sound_call .sub3
	duty_cycle 3
	sound_call .sub4
	volume_envelope 11, 8
	duty_cycle 1
	sound_call .sub5
	transpose 0, 0
	note_type 12, 11, 8
	octave 4
	note B_, 12
	duty_cycle 2
	note A#, 4
	note G#, 4
	note D#, 4
	note G#, 4
	note A#, 4
	note B_, 4
	sound_loop 0, .mainloop

.sub1:
	octave 1
	note G#, 4
	octave 3
	note F_, 4
	note D#, 4
	octave 1
	note G#, 4
	octave 3
	note D#, 4
	note D_, 4
	octave 1
	note A#, 4
	octave 3
	note C_, 4
	octave 2
	note A#, 4
	octave 1
	note A#, 4
	octave 2
	note G#, 4
	note A#, 4
	octave 1
	note G_, 4
	octave 3
	note D_, 4
	note C_, 4
	octave 1
	note G_, 4
	octave 2
	note A#, 4
	note G_, 4
	note C_, 4
	octave 3
	note F_, 4
	note G_, 4
	sound_ret

.sub2:
	octave 4
	note F_, 4
	note D#, 4
	note F_, 4
	note G_, 12
	volume_envelope 5, 8
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	note A_, 1
	sound_ret

.sub3:
	note A#, 7
	octave 4
	note C_, 8
	note C#, 16
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note C_, 16
	note G_, 8
	sound_ret

.sub4:
	note F#, 1
	note G_, 3
	note F_, 4
	note G_, 4
	note G#, 12
	volume_envelope 5, 8
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	octave 3
	note B_, 1
	sound_ret

.sub5:
	octave 4
	note C_, 8
	note G_, 4
	note G#, 4
	note A#, 8
	note G#, 8
	note D#, 8
	sound_ret

Music_Surf_Ch3:
.mainloop:
	stereo_panning TRUE, TRUE
	note_type 12, 1, 5
	vibrato 22, 2, 3
	octave 4
	note A#, 12
	octave 5
	note C_, 12
	note D_, 8
	note D#, 4
	note F_, 4
	note G_, 4
	note G#, 4
	volume_envelope 1, 2
	note A#, 12
	rest 4
	note G#, 4
	note G_, 4
	note_type 6, 1, 2
	note F#, 1
	note G_, 15
	note G#, 4
	note G_, 4
	note F_, 16
	octave 4
	note A#, 8
	note_type 12, 1, 2
	octave 5
	note G#, 16
	note G_, 4
	note F_, 4
	note_type 6, 1, 2
	note E_, 1
	note F_, 15
	note G_, 4
	note F_, 4
	note D#, 16
	note F_, 8
	note_type 12, 1, 4
	note A#, 12
	rest 4
	note G#, 4
	note G_, 4
	note_type 6, 1, 4
	note F#, 1
	note G_, 15
	note G#, 4
	note G_, 4
	note F_, 16
	octave 4
	note A#, 8
	note_type 12, 1, 4
	octave 5
	note G#, 16
	note G_, 4
	note F_, 4
	note_type 6, 1, 4
	note E_, 1
	note F_, 15
	note G_, 4
	note F_, 4
	note D#, 16
	octave 6
	note D#, 8
	note_type 12, 1, 3
	note C_, 16
	note D_, 4
	note D#, 4
	note_type 6, 1, 3
	note D_, 1
	note D#, 15
	note D_, 4
	note C_, 4
	octave 5
	note D_, 16
	octave 6
	note D_, 8
	note_type 12, 1, 3
	octave 5
	note A#, 12
	note_type 6, 1, 3
	note A_, 1
	note A#, 7
	octave 6
	note C_, 8
	note D_, 8
	note F_, 16
	note D#, 4
	note D_, 4
	note D#, 16
	note D_, 8
	note_type 12, 1, 4
	note C_, 12
	note C_, 4
	note D_, 4
	note D#, 4
	note_type 6, 1, 4
	note D_, 1
	note D#, 15
	note D_, 4
	note C_, 4
	octave 5
	note D_, 16
	octave 6
	note D_, 8
	note_type 12, 1, 4
	octave 5
	note A#, 12
	note_type 6, 1, 4
	note A_, 1
	note A#, 7
	octave 6
	note C_, 8
	note D_, 8
	note_type 12, 1, 4
	note F_, 12
	note G_, 8
	octave 5
	note A#, 4
	volume_envelope 1, 5
	sound_call .sub1
	octave 2
	note B_, 4
	octave 3
	note D#, 4
	note F_, 4
	note G#, 4
	note A#, 4
	note B_, 4
	sound_call .sub1
	octave 2
	note B_, 4
	octave 3
	note D#, 4
	note G#, 4
	note B_, 12
	octave 2
	note B_, 12
	octave 3
	note D#, 8
	octave 2
	note B_, 4
	sound_loop 0, .mainloop

.sub1:
	octave 3
	note D#, 4
	note G_, 1
	rest 3
	note A#, 1
	rest 3
	note D#, 4
	note G_, 1
	rest 3
	note A#, 1
	rest 3
	note C#, 4
	note G_, 1
	rest 3
	note A#, 1
	rest 3
	note C#, 4
	note G_, 1
	rest 3
	note A#, 1
	rest 3
	note C_, 4
	note F_, 1
	rest 3
	note G#, 1
	rest 3
	note C_, 4
	note F_, 1
	rest 3
	note G#, 1
	rest 3
	sound_ret
