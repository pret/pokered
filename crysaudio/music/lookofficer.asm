Music_LookOfficer:
	channel_count 3
	channel 1, Music_LookOfficer_Ch1
	channel 2, Music_LookOfficer_Ch2
	channel 3, Music_LookOfficer_Ch3

Music_LookOfficer_Ch1:
	tempo 116
	volume 7, 7
	pitch_offset 1
	vibrato 18, 3, 4
	stereo_panning FALSE, TRUE
	duty_cycle 3
	note_type 12, 10, 7
	octave 4
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 12
	volume_envelope 2, -7
	octave 3
	note B_, 16
.mainloop:
	volume_envelope 8, 2
	rest 4
	note B_, 6
	note G#, 4
	note B_, 6
	note B_, 6
	note G#, 4
	note B_, 2
	volume_envelope 2, -7
	note A#, 16
	note A_, 16
	sound_loop 0, .mainloop

Music_LookOfficer_Ch2:
	vibrato 18, 3, 4
	duty_cycle 3
	note_type 12, 11, 7
	octave 5
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 4
	note B_, 12
	duty_cycle 3
	volume_envelope 10, 2
	octave 1
	note B_, 4
	octave 2
	note A_, 2
	octave 1
	note B_, 4
	octave 2
	note F_, 2
	octave 1
	note B_, 2
	octave 2
	note D#, 2
.mainloop:
.loop1:
	note E_, 2
	note G#, 2
	octave 3
	note E_, 2
	octave 2
	note E_, 2
	note G#, 2
	note B_, 2
	note E_, 2
	note G#, 2
	sound_loop 2, .loop1
	transpose 0, 1
	sound_call .sub1
	transpose 0, 0
	sound_call .sub1
	sound_loop 0, .mainloop

.sub1:
	octave 1
	note A_, 2
	octave 2
	note C#, 2
	note A_, 2
	octave 1
	note A_, 2
	octave 2
	note C#, 2
	note E_, 2
	octave 1
	note A_, 2
	octave 2
	note C#, 2
	sound_ret

Music_LookOfficer_Ch3:
	vibrato 20, 1, 4
	stereo_panning TRUE, FALSE
	note_type 12, 1, 4
	rest 10
	octave 3
	note B_, 2
	rest 2
	note B_, 2
	volume_envelope 1, 2
	octave 5
	note D#, 2
	rest 1
	note F_, 2
	rest 1
	note A_, 2
	note B_, 2
	rest 1
	octave 6
	note C#, 2
	rest 1
	note D#, 2
.mainloop:
	note E_, 6
	note D#, 6
	note C#, 4
	octave 5
	note B_, 2
	note A_, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note A_, 2
	note B_, 2
	octave 6
	note C#, 2
	note F_, 8
	note D_, 8
	note E_, 8
	note C#, 8
	sound_loop 0, .mainloop
