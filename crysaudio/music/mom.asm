Music_Mom:
	channel_count 3
	channel 2, Music_Mom_Ch2
	channel 3, Music_Mom_Ch3
	channel 4, Music_Mom_Ch4

Music_Mom_Ch2:
	tempo 144
	volume 7, 7
	stereo_panning FALSE, TRUE
	duty_cycle 2
	note_type 6, 11, 3
	octave 3
	note B_, 1
	octave 4
	note E_, 1
	note G#, 1
	note A_, 1
	note B_, 8
.mainloop:
	note_type 12, 11, 1
	rest 4
	octave 3
	note C#, 6
	note D_, 4
	note C_, 2
	rest 2
	note C#, 6
	octave 2
	note E_, 4
	note A#, 2
	note B_, 2
	sound_loop 0, .mainloop

Music_Mom_Ch3:
	stereo_panning TRUE, FALSE
	note_type 6, 2, 5
	octave 3
	note E_, 1
	note D_, 1
	octave 2
	note B_, 1
	note G#, 1
	note E_, 8
	volume_envelope 2, 3
.mainloop:
	octave 2
	note A_, 2
	rest 6
	octave 4
	note E_, 2
	rest 2
	octave 2
	note A_, 2
	rest 2
	octave 3
	note D_, 2
	rest 2
	octave 4
	note F#, 8
	note D#, 2
	rest 2
	octave 2
	note A_, 2
	rest 2
	octave 4
	note E_, 2
	rest 6
	octave 2
	note A_, 2
	rest 2
	octave 4
	note D_, 2
	rest 6
	note C#, 4
	note D_, 2
	rest 2
	sound_loop 0, .mainloop

Music_Mom_Ch4:
	toggle_noise 3
	drum_speed 12
	rest 6
.mainloop:
	drum_note 4, 1
	rest 1
	drum_note 7, 2
	drum_note 3, 1
	rest 1
	drum_note 8, 1
	rest 1
	drum_note 8, 1
	rest 1
	drum_note 7, 4
	drum_note 3, 1
	rest 1
	drum_note 4, 1
	rest 1
	drum_note 7, 4
	drum_note 3, 1
	rest 1
	drum_note 8, 1
	rest 1
	drum_note 8, 1
	rest 1
	drum_note 3, 2
	drum_note 4, 1
	rest 1
	sound_loop 0, .mainloop
