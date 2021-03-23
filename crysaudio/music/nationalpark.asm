Music_NationalPark:
	channel_count 4
	channel 1, Music_NationalPark_Ch1
	channel 2, Music_NationalPark_Ch2
	channel 3, Music_NationalPark_Ch3
	channel 4, Music_NationalPark_Ch4

Music_NationalPark_Ch1:
	tempo 192
	volume 7, 7
	stereo_panning FALSE, TRUE
	vibrato 24, 2, 4
	duty_cycle 1
	note_type 12, 7, 7
	rest 2
.mainloop:
	sound_call .sub1
	sound_call .sub1
	note_type 6, 6, 7
	sound_call .sub2
	note_type 12, 7, 7
	rest 16
	octave 2
	note A#, 1
	octave 3
	note D_, 1
	note F_, 1
	note G#, 1
	note D_, 1
	note F_, 1
	note A#, 1
	note_type 6, 6, 7
	octave 4
	note D_, 1
	note C#, 1
	note D_, 1
	rest 1
	note D_, 1
	rest 1
	note C#, 1
	rest 1
	note D_, 1
	rest 3
	note D_, 1
	rest 3
	note D_, 1
	rest 1
	sound_call .sub2
	volume_envelope 7, 7
	octave 3
	note E_, 1
	note F_, 5
	note D#, 4
	rest 2
	note C_, 12
	note F_, 8
	note C#, 1
	volume_envelope 9, 8
	note D_, 16
	volume_envelope 7, 7
	note D_, 7
	note_type 12, 7, 7
	rest 4
	sound_loop 0, .mainloop

.sub1:
	octave 2
	note G#, 6
	octave 3
	note F_, 2
	volume_envelope 4, 7
	note F_, 1
	note G#, 1
	volume_envelope 5, 7
	note F_, 1
	note G#, 1
	volume_envelope 7, 7
	note F_, 1
	note G#, 1
	volume_envelope 9, 7
	note F_, 1
	note G#, 1
	volume_envelope 7, 7
	octave 2
	note A_, 6
	octave 3
	note F#, 2
	volume_envelope 4, 7
	note F#, 1
	note A_, 1
	volume_envelope 5, 7
	note F#, 1
	note A_, 1
	volume_envelope 7, 7
	note F#, 1
	note A_, 1
	volume_envelope 9, 7
	note F#, 1
	note A_, 1
	volume_envelope 7, 7
	octave 2
	note G#, 6
	octave 3
	note F_, 2
	volume_envelope 4, 7
	octave 4
	note C_, 1
	note C#, 1
	volume_envelope 5, 7
	note C_, 1
	note C#, 1
	volume_envelope 7, 7
	note C_, 1
	note C#, 1
	volume_envelope 9, 7
	note C_, 1
	note C#, 1
	volume_envelope 7, 7
	octave 2
	note A_, 6
	octave 3
	note C#, 2
	volume_envelope 4, 7
	octave 4
	note C#, 1
	note D#, 1
	volume_envelope 5, 7
	note C#, 1
	note D#, 1
	volume_envelope 7, 7
	note C#, 1
	note D#, 1
	volume_envelope 9, 7
	note C#, 1
	note D#, 1
	volume_envelope 7, 7
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	volume_envelope 4, 7
	octave 4
	note C#, 1
	note D#, 1
	volume_envelope 5, 7
	note C#, 1
	note D#, 1
	volume_envelope 7, 7
	note C#, 1
	note D#, 1
	volume_envelope 9, 7
	note C#, 1
	note D#, 1
	volume_envelope 7, 7
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note D#, 2
	note C_, 2
	note D#, 2
	note C_, 2
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	volume_envelope 5, 7
	octave 4
	note F_, 1
	note D#, 1
	volume_envelope 6, 7
	note D_, 1
	note D#, 1
	volume_envelope 7, 7
	note F_, 1
	note F#, 1
	volume_envelope 9, 7
	note G#, 1
	note A#, 1
	volume_envelope 7, 7
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	volume_envelope 4, 7
	octave 4
	note C#, 1
	note D#, 1
	volume_envelope 5, 7
	note C#, 1
	note D#, 1
	volume_envelope 7, 7
	note C#, 1
	note D#, 1
	volume_envelope 9, 7
	note C#, 1
	note D#, 1
	volume_envelope 7, 7
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note D#, 2
	note C_, 2
	note D#, 2
	note C_, 2
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	sound_ret

.sub2:
	rest 16
	rest 3
	octave 4
	note A#, 1
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	note A#, 2
	rest 4
	rest 16
	rest 3
	note A_, 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 2
	rest 4
	sound_ret

Music_NationalPark_Ch2:
	vibrato 20, 2, 4
	duty_cycle 1
	note_type 12, 10, 7
	rest 2
	stereo_panning TRUE, FALSE
.mainloop:
	note_type 12, 10, 7
	sound_call .sub1
	octave 3
	note D_, 8
	sound_call .sub1
	rest 2
	volume_envelope 10, 7
	octave 4
	note G#, 2
	note F#, 2
	note F_, 2
	note_type 6, 10, 7
	sound_call .sub2
	octave 3
	note B_, 1
	octave 4
	note C_, 5
	octave 3
	note G#, 4
	rest 2
	octave 4
	note A#, 8
	note G#, 2
	rest 2
	note F#, 2
	rest 2
	note G#, 4
	note E_, 1
	note F_, 14
	volume_envelope 8, 7
	note G_, 1
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note G_, 1
	rest 1
	note G#, 1
	rest 3
	note G#, 1
	rest 3
	note G#, 1
	rest 1
	volume_envelope 10, 7
	sound_call .sub2
	octave 3
	note B_, 1
	octave 4
	note C_, 5
	octave 3
	note G#, 4
	rest 2
	note A#, 12
	octave 4
	note C_, 8
	octave 3
	note A_, 1
	vibrato 0, 0, 0
	volume_envelope 11, 8
	note A#, 16
	vibrato 20, 2, 4
	volume_envelope 11, 7
	note A#, 11
	octave 2
	note D#, 2
	note D_, 2
	sound_loop 0, .mainloop

.sub1:
	octave 2
	note C#, 6
	note G#, 2
	octave 3
	note C#, 8
	octave 2
	note C#, 6
	note A_, 2
	octave 3
	note C#, 8
	octave 2
	note C#, 6
	note G#, 2
	octave 3
	note C#, 8
	octave 2
	note C#, 6
	note A_, 2
	octave 3
	note F#, 8
	octave 1
	note F#, 6
	octave 2
	note C#, 2
	note A#, 8
	octave 1
	note F#, 6
	octave 2
	note C#, 2
	note A_, 8
	octave 1
	note F_, 6
	octave 2
	note C_, 2
	note G#, 8
	octave 1
	note A#, 6
	octave 2
	note F_, 2
	octave 3
	note D_, 8
	octave 1
	note F#, 6
	octave 2
	note C#, 2
	note A#, 8
	octave 1
	note F#, 6
	octave 2
	note C#, 2
	note A_, 8
	octave 1
	note F_, 6
	octave 2
	note C_, 2
	note G#, 8
	octave 1
	note A#, 6
	octave 2
	note F_, 2
	sound_ret

.sub2:
	octave 4
	note E_, 1
	note F_, 5
	note F#, 4
	rest 2
	note C#, 7
	volume_envelope 8, 7
	octave 5
	note E_, 1
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note E_, 1
	rest 1
	note F_, 2
	volume_envelope 10, 7
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 4
	note E_, 1
	note F_, 5
	note F#, 4
	rest 2
	note D#, 7
	volume_envelope 8, 7
	octave 5
	note D_, 1
	note D#, 1
	rest 1
	note D#, 1
	rest 1
	note D_, 1
	rest 1
	note D#, 2
	volume_envelope 10, 7
	octave 4
	note D_, 2
	note C#, 2
	sound_ret

Music_NationalPark_Ch3:
	vibrato 22, 2, 4
	note_type 12, 1, 1
	octave 4
	note G#, 1
	note A#, 1
	stereo_panning TRUE, TRUE
.mainloop:
	sound_call .sub1
	octave 5
	note A#, 14
	octave 4
	note G#, 1
	note A#, 1
	sound_call .sub1
	octave 5
	note A#, 8
	octave 4
	note D_, 8
	volume_envelope 1, 5
	sound_call .sub2
	octave 4
	note D_, 1
	octave 3
	note F_, 3
	sound_call .sub2
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	volume_envelope 1, 1
	octave 4
	note G#, 1
	note A#, 1
	sound_loop 0, .mainloop

.sub1:
	octave 5
	note C_, 16
	note C#, 14
	note G#, 1
	note A#, 1
	octave 6
	note C_, 16
	note C#, 10
	note C_, 2
	note C#, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note C#, 2
	octave 5
	note A#, 10
	octave 6
	note F_, 2
	note D#, 2
	note C#, 2
	octave 5
	note A_, 9
	octave 6
	note D_, 1
	octave 6
	note D#, 2
	note C#, 2
	note C_, 2
	octave 5
	note G#, 4
	octave 6
	note G#, 4
	note D#, 2
	note F_, 14
	note D_, 1
	note D#, 1
	note F_, 2
	note D#, 2
	note C#, 2
	octave 5
	note A#, 10
	octave 6
	note F_, 2
	note D#, 2
	note C#, 2
	octave 5
	note A_, 10
	octave 6
	note D#, 2
	note C#, 2
	note C_, 2
	octave 5
	note G#, 4
	note A#, 4
	octave 6
	note C_, 2
	sound_ret

.sub2:
	octave 2
	note F#, 3
	octave 3
	note C#, 2
	rest 1
	note A#, 4
	note C#, 1
	rest 1
	note A#, 1
	note C#, 3
	octave 2
	note F#, 3
	octave 3
	note C#, 2
	rest 1
	note A_, 4
	note C#, 1
	rest 1
	note A_, 1
	note C#, 3
	octave 2
	note F_, 3
	octave 3
	note C_, 2
	rest 1
	note G#, 4
	note C_, 1
	rest 1
	note G#, 1
	note C_, 3
	octave 2
	note A#, 3
	octave 3
	note F_, 2
	rest 1
	octave 4
	note D_, 4
	octave 3
	note F_, 1
	rest 1
	sound_ret

Music_NationalPark_Ch4:
	toggle_noise 3
	drum_speed 12
	rest 2
.mainloop:
.loop1:
	rest 16
	sound_loop 23, .loop1
	rest 8
	drum_note 11, 2
	drum_note 3, 2
	drum_note 11, 1
	drum_note 3, 1
	drum_note 12, 2
.loop2:
	drum_note 11, 2
	drum_note 8, 1
	drum_note 8, 1
	drum_note 3, 2
	drum_note 8, 1
	drum_note 8, 1
	drum_note 11, 2
	drum_note 8, 1
	drum_note 8, 1
	drum_note 3, 2
	drum_note 12, 2
	sound_loop 7, .loop2
	drum_note 11, 2
	drum_note 8, 1
	drum_note 8, 1
	drum_note 3, 2
	drum_note 8, 1
	drum_note 8, 1
	drum_note 11, 2
	drum_note 4, 1
	drum_note 4, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 11, 1
	drum_note 4, 1
	sound_loop 0, .mainloop
