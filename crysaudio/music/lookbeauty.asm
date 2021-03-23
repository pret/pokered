Music_LookBeauty:
	channel_count 4
	channel 1, Music_LookBeauty_Ch1
	channel 2, Music_LookBeauty_Ch2
	channel 3, Music_LookBeauty_Ch3
	channel 4, Music_LookBeauty_Ch4

Music_LookBeauty_Ch1:
	stereo_panning FALSE, TRUE
	vibrato 18, 2, 5
	duty_cycle 2
	tempo 128
	volume 7, 7
	note_type 12, 10, 3
	rest 16
	rest 8
	octave 4
	note C_, 8
	duty_cycle 3
.mainloop:
	rest 4
	octave 3
	note D_, 1
	rest 5
	note D_, 1
	rest 5
	rest 2
	note D_, 1
	rest 3
	note D_, 1
	rest 5
	note D_, 4
	rest 4
	note D_, 1
	rest 5
	note D_, 1
	rest 5
	rest 2
	note D_, 1
	rest 3
	note D_, 1
	rest 3
	note D_, 2
	rest 2
	note D_, 2
	rest 4
	note E_, 1
	rest 5
	note E_, 1
	rest 5
	rest 2
	note E_, 1
	rest 3
	note E_, 1
	rest 1
	note E_, 1
	rest 3
	note E_, 4
	rest 4
	note F#, 1
	rest 5
	note F#, 1
	rest 3
	note D_, 2
	note D_, 1
	rest 7
	octave 2
	note A_, 1
	octave 3
	note C_, 1
	note D#, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note A_, 1
	octave 4
	note C_, 1
	sound_loop 0, .mainloop

Music_LookBeauty_Ch2:
	stereo_panning TRUE, FALSE
	vibrato 16, 2, 3
	duty_cycle 2
	note_type 12, 12, 7
	octave 3
	note D_, 1
	rest 1
	octave 5
	note D_, 6
	note C_, 1
	rest 1
	octave 4
	note B_, 1
	rest 1
	note A#, 1
	rest 1
	note A_, 1
	rest 1
	note G#, 1
	rest 1
	note G_, 1
	rest 1
	note F#, 1
	rest 1
	note F_, 1
	rest 1
	note E_, 2
	note D_, 1
	rest 1
	note E_, 1
	rest 1
	note F#, 1
	rest 1
	duty_cycle 3
.mainloop:
	note_type 12, 12, 7
	note G_, 16
	note A_, 8
	note B_, 8
	note A_, 10
	note G#, 1
	rest 1
	note A_, 1
	rest 1
	note G#, 2
	note G#, 8
	rest 2
	note F_, 2
	rest 2
	note E_, 2
	volume_envelope 11, 7
	vibrato 16, 2, 4
	octave 5
	note C_, 15
	note_type 6, 12, 7
	volume_envelope 12, 5
	vibrato 16, 2, 3
	rest 1
	note C#, 1
	note D_, 16
	note C_, 16
	octave 4
	note B_, 16
	rest 4
	octave 5
	note D_, 2
	rest 2
	octave 4
	note B_, 2
	rest 2
	note A_, 6
	rest 14
	note F#, 8
	note A_, 8
	sound_loop 0, .mainloop

Music_LookBeauty_Ch3:
	stereo_panning TRUE, TRUE
	vibrato 8, 1, 2
	note_type 12, 1, 5
	rest 16
	octave 5
	note E_, 1
	rest 1
	note D#, 1
	rest 1
	note D_, 1
	rest 1
	note C#, 1
	rest 1
	octave 3
	note D_, 7
	note F#, 1
.mainloop:
	note G_, 4
	octave 4
	note B_, 1
	rest 1
	octave 3
	note G_, 1
	rest 1
	note D_, 1
	rest 1
	octave 4
	note B_, 1
	rest 1
	octave 3
	note D_, 1
	rest 1
	note G_, 2
	note G_, 1
	octave 4
	note A#, 1
	note B_, 1
	rest 1
	octave 3
	note G_, 1
	rest 1
	octave 4
	note B_, 1
	rest 1
	octave 3
	note D_, 1
	rest 3
	octave 4
	note B_, 4
	octave 3
	note E_, 4
	octave 4
	note B_, 1
	rest 1
	octave 3
	note E_, 1
	rest 1
	octave 2
	note B_, 1
	rest 1
	octave 4
	note A_, 1
	rest 1
	octave 2
	note B_, 1
	rest 1
	octave 3
	note E_, 2
	note E_, 1
	octave 4
	note G_, 1
	note G#, 1
	rest 1
	octave 3
	note E_, 1
	rest 1
	octave 4
	note F#, 1
	rest 3
	note G#, 2
	rest 2
	note B_, 2
	octave 3
	note A_, 4
	octave 5
	note C_, 1
	rest 1
	octave 3
	note A_, 1
	rest 1
	note E_, 1
	rest 1
	octave 5
	note C_, 1
	rest 1
	octave 3
	note E_, 1
	rest 1
	note A_, 2
	note A_, 1
	octave 4
	note B_, 1
	octave 5
	note C_, 1
	rest 1
	octave 3
	note A_, 1
	rest 1
	octave 5
	note C_, 1
	rest 1
	note D_, 1
	rest 3
	note C_, 4
	octave 3
	note D_, 4
	octave 4
	note B_, 1
	rest 1
	octave 3
	note D_, 1
	rest 1
	octave 2
	note A_, 1
	rest 1
	octave 4
	note A_, 1
	rest 1
	octave 2
	note A_, 1
	rest 1
	octave 4
	note A_, 2
	note A_, 1
	rest 7
	octave 3
	note D_, 8
	sound_loop 0, .mainloop

Music_LookBeauty_Ch4:
	toggle_noise 3
	drum_speed 12
	rest 16
	rest 16
.mainloop:
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	sound_loop 0, .mainloop

.sub1:
	drum_note 7, 2
	drum_note 8, 2
	drum_note 3, 2
	drum_note 8, 2
	drum_note 8, 2
	drum_note 3, 2
	drum_note 8, 2
	drum_note 8, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 8, 2
	drum_note 3, 2
	drum_note 8, 2
	drum_note 8, 2
	drum_note 3, 2
	drum_note 8, 2
	sound_ret
