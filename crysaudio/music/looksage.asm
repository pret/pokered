Music_LookSage:
	channel_count 2
	channel 1, Music_LookSage_Ch1
	channel 3, Music_LookSage_Ch3

Music_LookSage_Ch1:
	tempo 144
	stereo_panning FALSE, TRUE
	volume 7, 7
	duty_cycle 3
	note_type 12, 11, 3
	rest 2
	rest 16
	sound_call .sub1
	volume_envelope 11, 3
	octave 3
	note D_, 2
	volume_envelope 9, 3
	note D_, 2
	volume_envelope 11, 3
	note E_, 2
	volume_envelope 9, 3
	note E_, 2
	volume_envelope 11, 3
	note A_, 2
	volume_envelope 9, 3
	note A_, 2
	volume_envelope 11, 3
	note F_, 2
	volume_envelope 9, 3
	note F_, 2
.mainloop:
	volume_envelope 11, 3
	note D_, 2
	volume_envelope 9, 3
	note D_, 2
	volume_envelope 11, 3
	octave 2
	note B_, 2
	volume_envelope 9, 3
	note B_, 2
	volume_envelope 11, 3
	note A_, 2
	volume_envelope 9, 3
	note A_, 2
	volume_envelope 11, 3
	note B_, 2
	volume_envelope 9, 3
	note B_, 2
	volume_envelope 11, 3
	octave 3
	note D_, 2
	volume_envelope 9, 3
	note D_, 2
	volume_envelope 11, 3
	octave 2
	note B_, 2
	volume_envelope 9, 3
	note B_, 2
	volume_envelope 11, 3
	octave 3
	note D_, 2
	volume_envelope 9, 3
	note D_, 2
	volume_envelope 11, 3
	note E_, 2
	volume_envelope 9, 3
	note E_, 2
	volume_envelope 11, 3
	note F_, 2
	volume_envelope 9, 3
	note F_, 2
	volume_envelope 11, 3
	note D_, 2
	volume_envelope 9, 3
	note D_, 2
	volume_envelope 11, 3
	note E_, 2
	volume_envelope 9, 3
	note E_, 2
	volume_envelope 11, 3
	note A_, 2
	volume_envelope 9, 3
	note A_, 2
	volume_envelope 11, 3
	note D_, 2
	volume_envelope 9, 3
	note D_, 2
	volume_envelope 11, 3
	octave 2
	note B_, 2
	volume_envelope 9, 3
	note B_, 2
	volume_envelope 11, 3
	note A_, 2
	volume_envelope 9, 3
	note A_, 2
	volume_envelope 11, 3
	note B_, 2
	volume_envelope 9, 3
	note B_, 2
	sound_call .sub1
	sound_loop 0, .mainloop

.sub1:
	volume_envelope 11, 3
	octave 2
	note E_, 2
	volume_envelope 9, 3
	note E_, 2
	volume_envelope 11, 3
	note A_, 2
	volume_envelope 9, 3
	note A_, 2
	volume_envelope 11, 3
	note B_, 2
	volume_envelope 9, 3
	note B_, 2
	volume_envelope 11, 3
	note A_, 2
	volume_envelope 9, 3
	note A_, 2
	sound_ret

Music_LookSage_Ch3:
	stereo_panning TRUE, FALSE
	vibrato 22, 2, 3
	note_type 12, 1, 0
	octave 5
	note B_, 1
	octave 6
	note C_, 1
	octave 5
	note B_, 16
	vibrato 7, 2, 3
	note B_, 8
	vibrato 20, 2, 3
	octave 6
	note D_, 6
	note E_, 1
	note F_, 1
	note E_, 14
	note G_, 1
	note G#, 1
.mainloop:
	note A_, 12
	note B_, 4
	note D_, 9
	note E_, 1
	note F_, 1
	note D_, 1
	vibrato 0, 0, 0
	note E_, 4
	vibrato 7, 2, 3
	note E_, 8
	vibrato 20, 2, 3
	octave 5
	note B_, 8
	octave 6
	note F_, 8
	note_type 6, 1, 0
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 5
	note B_, 1
	note A#, 1
	note A_, 1
	rest 4
	octave 6
	note E_, 2
	note F_, 2
	note_type 12, 1, 0
	note E_, 14
	note G_, 1
	note G#, 1
	sound_loop 0, .mainloop
