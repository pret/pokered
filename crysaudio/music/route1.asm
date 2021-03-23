Music_Route1:
	channel_count 3
	channel 1, Music_Route1_Ch1
	channel 2, Music_Route1_Ch2
	channel 3, Music_Route1_Ch3

	db $3 ; unused

Music_Route1_Ch1:
	stereo_panning FALSE, TRUE
	tempo 184
	volume 7, 7
	vibrato 22, 1, 1
	duty_cycle 3
	note_type 12, 8, 3
	octave 4
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 2
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	note D_, 2
	octave 3
	note A_, 2
	note F#, 2
	note G_, 1
	note A_, 1
	note G_, 2
	note E_, 2
	note G_, 1
	note E_, 1
	octave 4
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 2
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note B_, 2
	note A_, 2
	note G_, 3
	note E_, 1
	note E_, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	volume_envelope 8, 1
	octave 5
	note D_, 2
	note D_, 2
	volume_envelope 8, 3
	rest 2
.mainloop:
	volume_envelope 8, 3
	rest 2
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	rest 4
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	rest 2
	rest 2
	octave 4
	note D_, 2
	octave 3
	note A_, 3
	octave 4
	note D_, 1
	octave 3
	note E_, 2
	volume_envelope 8, 1
	note G_, 2
	note G_, 2
	volume_envelope 8, 3
	rest 2
	rest 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	rest 4
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	rest 2
	rest 2
	octave 4
	note C#, 2
	note C#, 1
	octave 3
	note B_, 1
	note A_, 1
	note G_, 1
	note F#, 2
	note A_, 2
	octave 4
	note D_, 2
	rest 2
	rest 2
	octave 3
	note F#, 1
	note G_, 1
	note A_, 4
	rest 2
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 1
	note G_, 1
	note A_, 2
	note A_, 1
	note B_, 1
	note A_, 2
	note A_, 1
	note B_, 1
	note A_, 2
	volume_envelope 8, 1
	octave 4
	note G_, 2
	note G_, 2
	volume_envelope 8, 3
	octave 3
	note F#, 1
	note E_, 1
	rest 2
	note E_, 1
	note F#, 1
	note G_, 6
	note E_, 1
	octave 2
	note B_, 1
	octave 3
	note C#, 2
	note E_, 1
	note F#, 1
	note G_, 4
	note_type 8, 8, 3
	note A_, 1
	note B_, 1
	note A_, 1
	note_type 12, 8, 3
	note G_, 1
	note E_, 1
	note F#, 2
	volume_envelope 8, 1
	octave 4
	note A_, 2
	note A_, 2
	volume_envelope 8, 3
	octave 3
	note A_, 1
	note G_, 1
	volume_envelope 7, 7
	volume_envelope 1, -5
	note F#, 4
	note A_, 4
	note G_, 2
	note F#, 2
	note E_, 2
	note G_, 2
	note F#, 4
	note A_, 3
	note F#, 1
	note E_, 2
	note A_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 1
	note G_, 1
	duty_cycle 2
	volume_envelope 8, 7
	octave 6
	note F#, 4
	note A_, 4
	note G_, 2
	note F#, 2
	note E_, 3
	note G_, 1
	note F#, 2
	note D_, 2
	note E_, 2
	note C#, 2
	note D_, 2
	volume_envelope 8, 1
	octave 5
	note D_, 2
	note D_, 2
	rest 2
	sound_loop 0, .mainloop

Music_Route1_Ch2:
	stereo_panning TRUE, FALSE
	vibrato 18, 2, 2
	duty_cycle 2
	note_type 12, 9, 2
	octave 4
	note F#, 1
	note G_, 1
	sound_call .sub2
	octave 3
	note A_, 2
	note A_, 2
	octave 4
	note F#, 1
	note G_, 1
	sound_call .sub3
	note C#, 2
	note E_, 2
	note D_, 2
	volume_envelope 8, 1
	note F#, 2
	note F#, 2
	volume_envelope 8, 2
	octave 4
	note D_, 1
	note E_, 1
	duty_cycle 2
.mainloop:
	volume_envelope 8, 2
	sound_call .sub1
	volume_envelope 8, 1
	octave 3
	note A_, 2
	note A_, 2
	volume_envelope 8, 2
	octave 4
	note C#, 1
	note D_, 1
	note E_, 2
	note E_, 2
	note E_, 2
	note C#, 1
	note D_, 1
	note E_, 2
	note E_, 2
	note E_, 2
	note C#, 1
	note D_, 1
	note E_, 2
	note E_, 2
	note F#, 1
	note E_, 1
	note E_, 1
	note F#, 1
	note D_, 2
	rest 2
	note F#, 2
	note D_, 1
	note E_, 1
	sound_call .sub1
	volume_envelope 8, 1
	note A_, 2
	note A_, 2
	volume_envelope 8, 2
	note C#, 1
	note D_, 1
	note E_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	octave 4
	note B_, 4
	note_type 8, 9, 2
	note C#, 1
	note D_, 1
	note C#, 1
	note_type 12, 9, 2
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	note D_, 2
	volume_envelope 8, 1
	octave 5
	note D_, 2
	note D_, 2
	volume_envelope 8, 2
	octave 4
	note F#, 1
	note G_, 1
	sound_call .sub2
	rest 4
	note F#, 1
	note G_, 1
	sound_call .sub3
	note_type 8, 9, 2
	note C#, 1
	note D_, 1
	note C#, 1
	note_type 12, 9, 2
	octave 4
	note B_, 1
	octave 5
	note C#, 1
	note D_, 2
	volume_envelope 8, 1
	note F#, 2
	note F#, 2
	volume_envelope 8, 2
	octave 4
	note D_, 1
	note E_, 1
	sound_loop 0, .mainloop

.sub1:
	note F#, 2
	note F#, 2
	note F#, 2
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 2
	note F#, 2
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 2
	note G_, 3
	note F#, 1
	note E_, 2
	sound_ret

.sub2:
	note A_, 2
	note A_, 2
	note F#, 2
	note D_, 2
	octave 5
	note D_, 2
	note C#, 2
	octave 4
	note B_, 2
	octave 5
	note D_, 2
	octave 4
	note A_, 2
	note F#, 2
	note D_, 3
	note F#, 1
	note E_, 2
	sound_ret

.sub3:
	note A_, 2
	note A_, 2
	note F#, 2
	note D_, 2
	octave 5
	note D_, 2
	note C#, 2
	octave 4
	note B_, 3
	note G_, 1
	note A_, 2
	octave 5
	note D_, 2
	sound_ret

Music_Route1_Ch3:
	stereo_panning TRUE, TRUE
	vibrato 16, 2, 3
	note_type 12, 2, 5
	rest 2
	octave 3
	note D_, 1
	rest 1
	note A_, 1
	rest 1
	octave 4
	note F#, 1
	rest 3
	octave 3
	note D_, 1
	rest 1
	note B_, 1
	rest 1
	octave 4
	note G_, 1
	rest 1
	octave 3
	note B_, 1
	rest 1
	note D_, 1
	rest 1
	note A_, 1
	rest 1
	octave 4
	note D_, 1
	rest 3
	octave 3
	note C#, 1
	rest 1
	note A_, 1
	rest 1
	octave 4
	note C#, 1
	rest 1
	note C#, 1
	octave 3
	note A_, 1
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note D_, 1
	note F#, 1
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	note F#, 1
	note A_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note B_, 1
	octave 4
	note G_, 1
	note D_, 1
	octave 3
	note B_, 1
	note G_, 1
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note G_, 1
	note E_, 1
	note A_, 1
	octave 4
	note C#, 1
	note G_, 1
	note F#, 2
	note A_, 1
	rest 1
	note A_, 1
	rest 3
.mainloop:
	octave 3
	note D_, 1
	rest 1
	octave 4
	note D_, 2
	octave 3
	note C#, 1
	rest 1
	octave 4
	note C#, 2
	octave 2
	note B_, 1
	rest 1
	octave 3
	note B_, 2
	octave 2
	note A_, 1
	rest 1
	octave 3
	note A_, 2
	note D_, 1
	rest 1
	octave 4
	note D_, 2
	octave 2
	note A_, 1
	rest 1
	octave 3
	note A_, 2
	octave 2
	note B_, 1
	rest 1
	octave 3
	note B_, 2
	octave 2
	note A_, 1
	rest 1
	octave 3
	note A_, 2
	note C#, 1
	rest 1
	octave 4
	note C#, 2
	octave 2
	note A_, 1
	rest 1
	octave 3
	note A_, 2
	octave 2
	note B_, 1
	rest 1
	octave 3
	note B_, 2
	note C_, 1
	rest 1
	octave 4
	note C_, 2
	octave 3
	note C#, 1
	rest 1
	octave 4
	note C#, 2
	octave 2
	note A_, 1
	rest 1
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	note C#, 1
	octave 3
	note B_, 1
	note A_, 2
	note G_, 1
	note E_, 1
	octave 2
	note D_, 1
	rest 1
	octave 3
	note D_, 2
	octave 2
	note E_, 1
	rest 1
	octave 3
	note E_, 2
	octave 2
	note F#, 1
	rest 1
	octave 3
	note F#, 2
	octave 2
	note A_, 1
	rest 1
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	note F#, 2
	note E_, 2
	octave 3
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	octave 4
	note E_, 2
	octave 3
	note C#, 1
	rest 1
	octave 4
	note C#, 2
	octave 2
	note B_, 1
	rest 1
	octave 3
	note B_, 2
	octave 2
	note A_, 1
	rest 1
	octave 3
	note A_, 2
	octave 2
	note G_, 1
	rest 1
	octave 3
	note G_, 1
	note B_, 1
	octave 4
	note C#, 2
	note E_, 1
	note C#, 1
	octave 3
	note A_, 1
	note G_, 1
	note E_, 1
	note C#, 1
	note D_, 2
	octave 4
	note F#, 1
	rest 1
	note F#, 1
	rest 3
	octave 3
	note D_, 4
	note F#, 4
	note G_, 2
	note A_, 2
	note B_, 3
	note G_, 1
	note F#, 2
	note D_, 2
	octave 2
	note A_, 3
	octave 3
	note D_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note B_, 1
	note A_, 3
	note G_, 1
	note F#, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note G_, 2
	note F#, 2
	note E_, 3
	note C#, 1
	note D_, 2
	note F#, 2
	note A_, 2
	octave 4
	note C#, 2
	note D_, 2
	octave 5
	note A_, 1
	rest 1
	note A_, 1
	rest 3
	sound_loop 0, .mainloop
