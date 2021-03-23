Music_VermilionCity:
	channel_count 3
	channel 1, Music_VermilionCity_Ch1
	channel 2, Music_VermilionCity_Ch2
	channel 3, Music_VermilionCity_Ch3

	db $3 ; unused

Music_VermilionCity_Ch1:
	stereo_panning FALSE, TRUE
	tempo 176
	volume 7, 7
	duty_cycle 2
	note_type 12, 6, 5
	octave 4
	note B_, 4
	note G#, 4
	note F#, 4
	note E_, 4
	note D_, 4
	octave 3
	note B_, 4
	note A_, 2
	note B_, 1
	octave 4
	note D_, 1
	note E_, 1
	note G#, 1
	note B_, 1
	octave 5
	note D_, 1
	vibrato 16, 2, 3
.mainloop:
	duty_cycle 1
	note_type 12, 8, 5
	sound_call .sub1
	note F_, 4
	octave 4
	note D_, 4
	note C#, 4
	note E_, 4
	sound_call .sub1
	sound_call .sub2
	duty_cycle 2
	note_type 12, 8, 5
	sound_call .sub1
	note F_, 4
	octave 4
	note D_, 4
	note E_, 1
	note C#, 1
	octave 3
	note A_, 1
	note E_, 1
	octave 4
	note C#, 1
	octave 3
	note A_, 1
	note E_, 1
	note C_, 1
	sound_call .sub1
	sound_call .sub2
	volume_envelope 9, 3
	duty_cycle 0
	rest 2
	note F#, 2
	rest 2
	note F#, 2
	rest 2
	note F#, 2
	rest 2
	note F#, 2
	sound_call .sub3
	sound_call .sub3
	volume_envelope 8, 7
	duty_cycle 2
	octave 4
	note D_, 8
	octave 3
	note G#, 8
	note E_, 8
	note B_, 8
	note A_, 4
	note G#, 4
	note F#, 4
	note E_, 4
	octave 2
	note B_, 4
	note G#, 4
	note B_, 4
	octave 3
	note D_, 4
	sound_loop 0, .mainloop

.sub1:
	octave 3
	note C#, 4
	note E_, 4
	note F#, 2
	note A_, 2
	note E_, 2
	note G#, 2
	sound_ret

.sub2:
	note D_, 2
	note F_, 2
	note A_, 2
	octave 4
	note D_, 2
	note E_, 2
	note C#, 2
	octave 3
	note A_, 2
	note E_, 2
	sound_ret

.sub3:
	rest 2
	note F#, 2
	note A_, 2
	note F#, 2
	octave 4
	note D_, 2
	octave 3
	note F#, 2
	note A_, 2
	note F#, 2
	rest 2
	note G#, 2
	note B_, 2
	note G#, 2
	octave 4
	note E_, 2
	octave 3
	note G#, 2
	note B_, 2
	note G#, 2
	sound_ret

Music_VermilionCity_Ch2:
	stereo_panning TRUE, TRUE
	duty_cycle 3
	note_type 12, 7, 7
	vibrato 16, 2, 3
	octave 5
	note E_, 4
	note D_, 4
	octave 4
	note B_, 4
	note G#, 4
	note F#, 4
	note E_, 4
	note F#, 4
	note G#, 4
.mainloop:
	note_type 12, 9, 7
	sound_call .sub1
	note G#, 2
	sound_call .sub1
	note E_, 2
	volume_envelope 11, 7
	octave 3
	note B_, 4
	octave 4
	note C#, 4
	note D_, 4
	note E_, 4
	sound_call .sub2
	sound_call .sub2
	note F#, 6
	note E_, 1
	note F#, 1
	note E_, 8
	note A_, 6
	note G#, 1
	note A_, 1
	note G#, 8
	note G#, 14
	note_type 6, 5, 7
	rest 1
	octave 4
	note E_, 1
	note G#, 1
	note B_, 1
	note_type 12, 8, 7
	octave 5
	note E_, 16
	sound_loop 0, .mainloop

.sub1:
	octave 1
	note A_, 8
	octave 2
	note F#, 4
	note E_, 4
	note D_, 6
	note C#, 1
	note D_, 1
	note E_, 8
	octave 1
	note A_, 8
	octave 2
	note F#, 4
	note E_, 4
	note D_, 6
	note E_, 1
	note D_, 1
	note C#, 2
	note E_, 2
	octave 1
	note A_, 2
	sound_ret

.sub2:
	note F#, 8
	note B_, 8
	note A_, 4
	note G#, 4
	note F#, 4
	note E_, 4
	sound_ret

Music_VermilionCity_Ch3:
	stereo_panning TRUE, FALSE
	vibrato 34, 2, 3
	note_type 12, 2, 5
	octave 2
	note E_, 4
	note B_, 4
	octave 3
	note E_, 4
	note B_, 4
	note D_, 4
	note E_, 4
	note D_, 2
	octave 3
	note B_, 1
	note G#, 1
	note F#, 1
	note E_, 1
	note D_, 1
	octave 2
	note B_, 1
.mainloop:
	note_type 12, 2, 2
	sound_call .sub1
	octave 5
	note A_, 6
	volume_envelope 2, 4
	note E_, 1
	note G#, 1
	sound_call .sub1
	note A_, 8
	volume_envelope 1, 4
	octave 3
	note D_, 4
	note C#, 4
	octave 2
	note B_, 4
	note A_, 4
	octave 3
	note D_, 2
	rest 4
	note D_, 1
	note D_, 1
	sound_call .sub2
	octave 4
	note D_, 2
	octave 3
	note D_, 2
	rest 2
	note D_, 2
	sound_call .sub2
	volume_envelope 2, 5
	octave 3
	note E_, 8
	octave 4
	note E_, 8
	octave 3
	note B_, 8
	octave 4
	note E_, 8
	octave 2
	note E_, 16
	octave 3
	note E_, 14
	volume_envelope 2, 2
	octave 5
	note E_, 1
	note G#, 1
	sound_loop 0, .mainloop

.sub1:
	octave 5
	note A_, 8
	octave 6
	note D_, 4
	note C#, 4
	octave 5
	note B_, 6
	note A_, 1
	note B_, 1
	octave 6
	note C#, 8
	octave 5
	note A_, 8
	octave 6
	note D_, 4
	note C#, 4
	octave 5
	note B_, 6
	octave 6
	note C#, 1
	octave 5
	note B_, 1
	sound_ret

.sub2:
	note A_, 1
	rest 1
	note A_, 2
	rest 2
	note F#, 2
	note E_, 2
	rest 4
	note E_, 1
	note E_, 1
	octave 4
	note E_, 1
	rest 1
	note D_, 2
	rest 2
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	sound_ret
