Music_AfterTheRivalFight:
	channel_count 4
	channel 1, Music_AfterTheRivalFight_Ch1
	channel 2, Music_AfterTheRivalFight_Ch2
	channel 3, Music_AfterTheRivalFight_Ch3
	channel 4, Music_AfterTheRivalFight_Ch4

Music_AfterTheRivalFight_Ch1:
	tempo 112
	volume 7, 7
	duty_cycle 0
	pitch_offset 1
	vibrato 8, 1, 4
	stereo_panning TRUE, FALSE
	note_type 12, 11, 2
	octave 2
	note G#, 4
	note G#, 4
	volume_envelope 8, 2
	octave 3
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	sound_loop 0, Music_LookRival_Ch1.mainloop

Music_AfterTheRivalFight_Ch2:
	duty_cycle 1
	vibrato 6, 3, 5
	stereo_panning FALSE, TRUE
	note_type 12, 12, 2
	octave 4
	note G#, 4
	note G#, 4
	volume_envelope 10, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	sound_loop 0, Music_LookRival_Ch2.mainloop

Music_AfterTheRivalFight_Ch3:
	note_type 12, 2, 8
	octave 3
	note D#, 2
	rest 2
	note D#, 2
	rest 2
	note G#, 2
	note F#, 2
	note F_, 2
	note D#, 2
	sound_loop 0, Music_LookRival_Ch3.mainloop

Music_AfterTheRivalFight_Ch4:
	toggle_noise 3
	stereo_panning FALSE, TRUE
	drum_speed 12
	drum_note 3, 4
	drum_note 3, 4
	drum_note 4, 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 2
	sound_loop 0, Music_LookRival_Ch4.mainloop
