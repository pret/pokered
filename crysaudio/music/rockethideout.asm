Music_RocketHideout:
	channel_count 4
	channel 1, Music_RocketHideout_Ch1
	channel 2, Music_RocketHideout_Ch2
	channel 3, Music_RocketHideout_Ch3
	channel 4, Music_RocketHideout_Ch4

Music_RocketHideout_Ch1:
	tempo 144
	volume 7, 7
	duty_cycle 3
	pitch_offset 4
	vibrato 16, 4, 4
	note_type 12, 11, 3
	stereo_panning TRUE, FALSE
.mainloop:
.loop1
	rest 16
	sound_loop 4, .loop1
.loop2:
	octave 2
	note D#, 2
	rest 2
	note A#, 4
	note A_, 2
	rest 6
	note D#, 2
	note A#, 4
	note A_, 2
	rest 8
	sound_loop 2, .loop2
	octave 3
	note A#, 2
	note A_, 2
	note F_, 2
	note F#, 2
	octave 4
	note C#, 2
	note C_, 2
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	note F_, 2
	note F#, 2
	octave 4
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	note F#, 2
	note F_, 2
	note D#, 2
	note F_, 2
	note F#, 2
	note A#, 2
	note F#, 2
	note F_, 2
	note D#, 2
	note F_, 2
	note F#, 2
	note A_, 2
	octave 2
	note A#, 2
	note B_, 2
	octave 3
	note D#, 2
	note F_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 2
	note G_, 2
	note G#, 2
	octave 4
	note D#, 2
	note D_, 2
	note D#, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	note G_, 2
	note G#, 2
	octave 4
	note D#, 2
	note D_, 2
	note C_, 2
	octave 3
	note B_, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note G#, 2
	note B_, 2
	note C_, 2
	note C#, 2
	note F_, 2
	note G_, 2
	rest 16
	volume_envelope 11, 7
	octave 2
	note G#, 16
	rest 16
	note A_, 16
	volume_envelope 11, 3
.loop3:
	rest 16
	sound_loop 4, .loop3
	sound_loop 0, .mainloop

Music_RocketHideout_Ch2:
	duty_cycle 3
	pitch_offset 2
	vibrato 0, 15, 0
	note_type 12, 12, 4
	stereo_panning FALSE, TRUE
.mainloop:
	octave 2
	note D#, 2
	rest 2
	note A#, 4
	note A_, 2
	rest 6
	note D#, 2
	note A#, 4
	note A_, 2
	rest 8
	note D#, 2
	rest 2
	note A#, 4
	note A_, 2
	rest 6
	note D#, 2
	note A#, 4
	note A_, 2
	rest 8
	octave 3
	note D#, 12
	note A#, 2
	note A_, 2
	octave 4
	note C#, 8
	note C_, 8
	octave 3
	note A#, 12
	note A_, 4
	note F#, 8
	note F_, 8
	octave 4
	note D#, 12
	note A#, 2
	note A_, 2
	note F#, 8
	note F_, 8
	note D#, 12
	note D_, 4
	octave 3
	note B_, 8
	note A#, 8
	octave 4
	note F_, 12
	octave 5
	note C_, 2
	octave 4
	note B_, 2
	note G#, 8
	note G_, 8
	note F_, 12
	note E_, 4
	note C#, 8
	note C_, 8
	octave 2
	note C#, 2
	rest 2
	note G#, 4
	note G_, 2
	rest 6
	volume_envelope 12, 7
	octave 3
	note C#, 16
	volume_envelope 12, 4
	octave 2
	note C#, 2
	rest 2
	note G#, 4
	note G_, 2
	rest 6
	volume_envelope 12, 7
	octave 3
	note C#, 16
	volume_envelope 12, 4
	octave 2
	note C#, 2
	rest 2
	note G#, 4
	note G_, 2
	rest 6
	note C#, 2
	note G#, 4
	note G_, 2
	rest 8
	note C#, 2
	rest 2
	note G#, 4
	note G_, 2
	rest 6
	note C#, 2
	note G#, 4
	note G_, 2
	rest 8
	sound_loop 0, .mainloop

Music_RocketHideout_Ch3:
	note_type 12, 1, 9
.mainloop:
.loop1:
	octave 2
	note D#, 2
	rest 2
	note A#, 4
	note A_, 2
	rest 6
	note D#, 2
	note A#, 4
	note A_, 2
	rest 8
	sound_loop 6, .loop1
.loop2:
	note F_, 2
	rest 2
	octave 3
	note C_, 4
	octave 2
	note B_, 2
	rest 6
	note F_, 2
	octave 3
	note C_, 4
	octave 2
	note B_, 2
	rest 8
	sound_loop 2, .loop2
.loop3:
	note C#, 2
	rest 2
	note G#, 4
	note G_, 2
	rest 6
	octave 3
	note C#, 16
	sound_loop 2, .loop3
.loop4:
	octave 2
	note C#, 2
	rest 2
	note G#, 4
	note G_, 2
	rest 6
	note C#, 2
	note G#, 4
	note G_, 2
	rest 8
	sound_loop 2, .loop4
	sound_loop 0, .mainloop

Music_RocketHideout_Ch4:
	toggle_noise 0
	drum_speed 12
	stereo_panning FALSE, TRUE
	rest 16
	rest 16
	drum_note 3, 1
	drum_note 3, 1
	drum_note 4, 1
	drum_note 4, 1
	sound_call .sub1
.mainloop:
	sound_call .sub1
	drum_note 5, 4
	sound_call .sub1
	drum_note 6, 4
	sound_call .sub1
	drum_note 11, 4
	sound_call .sub1
	drum_note 7, 4
	sound_loop 0, .mainloop

.sub1:
	stereo_panning TRUE, FALSE
	drum_note 4, 1
	drum_note 4, 1
	stereo_panning FALSE, TRUE
	drum_note 10, 4
	drum_note 4, 1
	drum_note 4, 1
	stereo_panning TRUE, FALSE
	drum_note 10, 4
	sound_ret
