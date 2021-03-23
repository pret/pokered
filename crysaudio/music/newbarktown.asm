Music_NewBarkTown:
	channel_count 3
	channel 1, Music_NewBarkTown_Ch1
	channel 2, Music_NewBarkTown_Ch2
	channel 3, Music_NewBarkTown_Ch3

	db $3 ; unused

Music_NewBarkTown_Ch1:
	tempo 187
	volume 7, 7
	stereo_panning FALSE, TRUE
	vibrato 18, 2, 3
	note_type 12, 8, 7
	rest 4
.mainloop:
	duty_cycle 0
	sound_call .sub1
	octave 3
	note C#, 1
	rest 1
	octave 2
	note A_, 1
	rest 1
	octave 3
	note G_, 2
	note F#, 2
	duty_cycle 2
	volume_envelope 8, 2
	note E_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note C#, 1
	octave 2
	note B_, 1
	note A_, 1
	note G_, 1
	duty_cycle 0
	volume_envelope 8, 7
	sound_call .sub1
	octave 3
	note C#, 1
	rest 1
	octave 2
	note A_, 1
	rest 1
	octave 3
	note E_, 2
	duty_cycle 2
	volume_envelope 8, 2
	note C#, 1
	rest 1
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note G_, 1
	note A_, 1
	octave 4
	note C#, 1
	note E_, 1
	note A_, 1
	duty_cycle 1
	volume_envelope 5, -6
	sound_call .sub2
	sound_call .sub2
	sound_call .sub2
	octave 2
	note G_, 2
	note B_, 2
	octave 3
	note D_, 2
	note F#, 4
	note G_, 4
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	note E_, 2
	note G_, 4
	note A_, 4
	note B_, 2
	volume_envelope 8, 7
	sound_loop 0, .mainloop

.sub1:
	octave 3
	note F#, 1
	rest 1
	note D_, 1
	rest 1
	note A_, 2
	note D_, 1
	rest 1
	note F#, 1
	rest 1
	note D_, 1
	rest 1
	note A#, 2
	note D_, 1
	rest 1
	note F#, 1
	rest 1
	note D_, 1
	rest 1
	note B_, 2
	note F#, 1
	rest 1
	note F#, 1
	rest 1
	note D_, 1
	rest 1
	octave 4
	note C_, 2
	octave 3
	note D_, 1
	rest 1
	octave 2
	note B_, 1
	rest 1
	note G_, 1
	rest 1
	octave 3
	note G_, 2
	octave 2
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	note G#, 1
	rest 1
	octave 3
	note E_, 2
	octave 2
	note B_, 1
	rest 1
	sound_ret

.sub2:
	octave 2
	note G_, 2
	note B_, 2
	octave 3
	note D_, 2
	note F#, 4
	note G_, 4
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	note E_, 2
	note G_, 4
	note A_, 4
	note E_, 2
	sound_ret

Music_NewBarkTown_Ch2:
	stereo_panning TRUE, TRUE
	vibrato 18, 2, 3
	note_type 6, 10, 7
	rest 8
.mainloop:
	duty_cycle 2
	note_type 6, 10, 7
	sound_call .sub1
	sound_call .sub1
	sound_call .sub2
	volume_envelope 8, 7
	octave 5
	note B_, 6
	note A_, 6
	volume_envelope 7, 7
	octave 6
	note D_, 4
	note C#, 16
	sound_call .sub2
	volume_envelope 8, 7
	octave 5
	note B_, 6
	note A_, 6
	volume_envelope 7, 7
	octave 6
	note D_, 4
	note E_, 16
	sound_loop 0, .mainloop

.sub1:
	octave 2
	note D_, 4
	rest 8
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	note D_, 2
	rest 2
	note D_, 8
	note A#, 2
	rest 2
	note D_, 4
	rest 8
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	note D_, 2
	rest 2
	note D_, 8
	octave 3
	note C_, 2
	rest 2
	octave 2
	note G_, 4
	rest 8
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	octave 1
	note G#, 2
	rest 2
	note G#, 8
	octave 2
	note D_, 2
	rest 2
	note A_, 4
	rest 8
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	octave 1
	note A_, 2
	rest 2
	note A_, 8
	octave 2
	note C#, 4
	sound_ret

.sub2:
	note_type 6, 9, 7
	duty_cycle 2
	octave 4
	note B_, 12
	note A_, 12
	note G_, 8
	note_type 12, 9, 7
	note E_, 16
	sound_ret

Music_NewBarkTown_Ch3:
	stereo_panning TRUE, FALSE
	note_type 12, 1, 0
	octave 5
	note D_, 2
	note E_, 2
.mainloop:
	vibrato 22, 2, 3
	note F#, 4
	note A_, 4
	note G_, 2
	note F#, 2
	note E_, 2
	note G_, 2
	note F#, 6
	note D_, 2
	octave 4
	note A_, 6
	note G_, 1
	note A_, 1
	note B_, 4
	octave 5
	note D_, 4
	note E_, 2
	note D_, 2
	note C#, 2
	note D_, 2
	note E_, 6
	note F#, 2
	note E_, 4
	rest 2
	note D_, 1
	note E_, 1
	note F#, 4
	note A_, 4
	note A#, 2
	note A_, 2
	note G_, 2
	note A#, 2
	note A_, 6
	octave 6
	note C#, 2
	note D_, 6
	octave 5
	note E_, 1
	note F#, 1
	note G_, 6
	note A_, 2
	note B_, 8
	note A_, 6
	note G_, 1
	note F#, 1
	note E_, 4
	rest 4
	volume_envelope 2, 5
	vibrato 18, 5, 3
	octave 2
	note G_, 16
	note A_, 16
	note G_, 16
	note A_, 16
	note G_, 16
	note A_, 16
	note G_, 16
	note A_, 14
	volume_envelope 1, 0
	vibrato 22, 2, 3
	octave 5
	note D_, 1
	note E_, 1
	sound_loop 0, .mainloop
