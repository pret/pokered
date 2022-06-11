Music_IndigoPlateau:
	channel_count 4
	channel 1, Music_IndigoPlateau_Ch1
	channel 2, Music_IndigoPlateau_Ch2
	channel 3, Music_IndigoPlateau_Ch3
	channel 4, Music_IndigoPlateau_Ch4

Music_IndigoPlateau_Ch1:
	tempo 128
	volume 7, 7
	duty_cycle 3
	pitch_offset 2
	stereo_panning FALSE, TRUE
.mainloop:
	sound_call .sub1
	octave 3
	note D_, 4
	sound_call .sub1
	octave 3
	note D#, 4
	sound_call .sub1
	octave 3
	note D#, 4
	sound_call .sub1
	note A#, 4
	sound_loop 0, .mainloop

.sub1:
	note_type 12, 11, 6
	octave 2
	note A_, 4
	volume_envelope 11, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 4
	note A_, 2
	note A_, 2
	volume_envelope 10, 0
	sound_ret

Music_IndigoPlateau_Ch2:
	duty_cycle 3
	vibrato 16, 2, 2
	stereo_panning TRUE, FALSE
.mainloop:
	sound_call .sub1
	note A_, 4
	sound_call .sub1
	note A#, 4
	sound_call .sub1
	note A_, 4
	sound_call .sub1
	note C#, 4
	volume_envelope 12, 7
	note A_, 6
	note D_, 2
	note G_, 2
	note A#, 2
	note A_, 8
	volume_envelope 11, 0
	note A_, 4
	sound_call .sub1
	note A#, 4
	volume_envelope 12, 7
	octave 4
	note D_, 6
	note D#, 2
	note C_, 4
	note D_, 8
	volume_envelope 11, 0
	octave 3
	note A_, 4
	sound_call .sub1
	note C#, 4
	volume_envelope 12, 7
	octave 4
	note C_, 6
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	note F#, 8
	volume_envelope 11, 0
	note A_, 4
	sound_call .sub1
	note A#, 4
	volume_envelope 12, 7
	octave 4
	note D_, 6
	note D#, 2
	note F_, 4
	note F#, 8
	volume_envelope 11, 0
	octave 3
	note A_, 4
	sound_call .sub1
	note C#, 4
	sound_loop 0, .mainloop

.sub1:
	note_type 12, 12, 6
	octave 3
	note D_, 4
	volume_envelope 12, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 4
	note D_, 2
	note D_, 2
	volume_envelope 11, 0
	sound_ret

Music_IndigoPlateau_Ch3:
	note_type 12, 1, 9
.mainloop:
	sound_call .sub1
	octave 3
	note A_, 4
	sound_call .sub1
	octave 3
	note A_, 4
	sound_call .sub1
	octave 3
	note A_, 4
	sound_call .sub1
	octave 3
	note F#, 4
	sound_loop 0, .mainloop

.sub1:
	octave 3
	note D_, 1
	rest 3
	octave 2
	note A_, 1
	rest 3
	octave 3
	note C_, 1
	rest 3
	note D_, 1
	rest 3
	octave 2
	note A_, 1
	rest 3
	sound_ret

Music_IndigoPlateau_Ch4:
	stereo_panning TRUE, FALSE
	toggle_noise 0
	drum_speed 12
.mainloop:
	drum_note 4, 4
	drum_note 3, 2
	drum_note 4, 2
	drum_note 4, 2
	drum_note 4, 2
	drum_note 3, 4
	drum_note 3, 2
	drum_note 3, 2
	drum_speed 6
	drum_note 3, 1
	drum_note 3, 1
	drum_note 4, 1
	drum_note 4, 1
	drum_note 4, 1
	drum_note 4, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_speed 12
	drum_note 4, 4
	drum_note 3, 2
	drum_note 4, 2
	drum_note 4, 2
	drum_note 3, 2
	drum_note 2, 4
	drum_note 3, 2
	drum_note 3, 2
	drum_note 2, 4
	sound_loop 0, .mainloop
