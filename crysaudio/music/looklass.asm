Music_LookLass:
	channel_count 4
	channel 1, Music_LookLass_Ch1
	channel 2, Music_LookLass_Ch2
	channel 3, Music_LookLass_Ch3
	channel 4, Music_LookLass_Ch4

Music_LookLass_Ch1:
	tempo 132
	volume 7, 7
	pitch_offset 1
	duty_cycle 2
	note_type 12, 12, 7
	octave 3
	note B_, 1
	rest 1
	octave 4
	note B_, 14
	stereo_panning FALSE, TRUE
	duty_cycle 0
.mainloop:
	volume_envelope 10, 2
	octave 3
	note E_, 4
	volume_envelope 10, 1
	note E_, 4
	note E_, 4
	note E_, 2
	volume_envelope 10, 3
	note B_, 2
	sound_loop 0, .mainloop

Music_LookLass_Ch2:
	stereo_panning TRUE, FALSE
	duty_cycle 0
	note_type 12, 8, 3
	rest 16
.mainloop:
	volume_envelope 9, 2
	octave 2
	note B_, 4
	volume_envelope 9, 1
	note B_, 4
	note B_, 4
	note B_, 2
	volume_envelope 9, 3
	octave 3
	note G#, 2
	sound_loop 0, .mainloop

Music_LookLass_Ch3:
	note_type 12, 1, 0
	rest 8
	octave 6
	note E_, 2
	note D#, 2
	note C#, 2
	note C_, 2
.mainloop:
	octave 5
	note B_, 2
	rest 2
	octave 6
	note D#, 2
	rest 2
	note E_, 2
	rest 2
	note D#, 2
	rest 2
	note C#, 2
	note C_, 2
	octave 5
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note A#, 2
	octave 6
	note C#, 2
	octave 5
	note B_, 2
	rest 2
	octave 6
	note C#, 2
	rest 2
	octave 5
	note B_, 2
	rest 2
	note A_, 2
	rest 2
	note G#, 2
	note F#, 2
	note E_, 2
	note D#, 2
	note E_, 2
	note F#, 2
	note G#, 2
	note A_, 2
	sound_loop 0, .mainloop

Music_LookLass_Ch4:
	toggle_noise 4
	drum_speed 12
	drum_note 1, 16
.mainloop:
	drum_speed 6
	drum_note 3, 8
	drum_note 2, 8
	drum_note 2, 8
	drum_note 2, 4
	drum_note 3, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	sound_loop 0, .mainloop
