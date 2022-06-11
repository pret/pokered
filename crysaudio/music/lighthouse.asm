Music_Lighthouse:
	channel_count 4
	channel 1, Music_Lighthouse_Ch1
	channel 2, Music_Lighthouse_Ch2
	channel 3, Music_Lighthouse_Ch3
	channel 4, Music_Lighthouse_Ch4

Music_Lighthouse_Ch1:
	tempo 144
	volume 7, 7
	duty_cycle 3
	pitch_offset 4
	vibrato 8, 4, 5
	stereo_panning FALSE, TRUE
.mainloop:
	note_type 12, 11, 3
	octave 3
	note C#, 8
	octave 2
	note F#, 2
	note G#, 2
	note A_, 2
	note B_, 2
	octave 3
	note C#, 4
	octave 2
	note B_, 4
	note A_, 4
	note B_, 4
	note G#, 1
	rest 7
	octave 3
	note C_, 4
	octave 2
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note C_, 2
	note D#, 1
	rest 1
	note F#, 1
	rest 1
	note G#, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	octave 3
	note C#, 8
	octave 2
	note C#, 2
	note F#, 2
	note G#, 2
	octave 3
	note C_, 2
	note D_, 2
	note C#, 2
	octave 2
	note A_, 2
	note G#, 2
	note A_, 2
	note G#, 2
	note F#, 2
	note A_, 2
	note G#, 1
	rest 7
	octave 3
	note C_, 12
	octave 2
	note G#, 1
	rest 1
	note G#, 1
	rest 1
	note G#, 1
	rest 3
	octave 3
	note C_, 1
	rest 3
	octave 2
	note A_, 4
	octave 3
	note A_, 4
	note G#, 4
	note F#, 4
	note E_, 4
	note D#, 4
	note C#, 4
	note E_, 4
	note F#, 2
	note E_, 2
	note D#, 12
	octave 2
	note B_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note G#, 8
	note A_, 4
	octave 3
	note A_, 4
	note G#, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note D#, 2
	note C#, 2
	octave 2
	note B_, 2
	note A_, 2
	note B_, 2
	octave 3
	note C#, 2
	note D#, 2
	note E_, 2
	note F#, 2
	note G#, 12
	octave 2
	note B_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note G#, 8
	sound_loop 0, .mainloop

Music_Lighthouse_Ch2:
	duty_cycle 3
	pitch_offset 2
	vibrato 16, 4, 5
.mainloop:
	note_type 12, 12, 5
	octave 3
	note G#, 12
	note F#, 2
	note G#, 2
	note A_, 8
	octave 4
	note C#, 8
	note C_, 1
	rest 7
	octave 3
	note G#, 16
	volume_envelope 12, 5
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note G#, 12
	note F#, 2
	note G#, 2
	note A_, 8
	octave 4
	note C#, 8
	note C_, 1
	rest 7
	note D#, 12
	octave 3
	note D#, 1
	rest 1
	note D#, 1
	rest 1
	note D#, 1
	rest 3
	note D#, 1
	rest 3
	octave 4
	note E_, 12
	note D#, 2
	note C#, 2
	octave 3
	note G#, 12
	note A#, 4
	note B_, 2
	octave 4
	note C#, 2
	note D#, 12
	octave 3
	note D#, 2
	note C#, 2
	note D#, 2
	note C#, 2
	note C_, 8
	octave 4
	note E_, 12
	note D#, 2
	note C#, 2
	octave 3
	note G#, 12
	octave 4
	note C_, 4
	octave 3
	note B_, 2
	octave 4
	note C_, 2
	note D#, 12
	octave 3
	note D#, 2
	note C#, 2
	note D#, 2
	note C#, 2
	note C_, 8
	sound_loop 0, .mainloop

Music_Lighthouse_Ch3:
	note_type 12, 1, 9
	stereo_panning TRUE, FALSE
.mainloop:
	octave 2
	note G#, 2
	rest 2
	note D#, 2
	rest 2
	note F#, 2
	rest 2
	note G_, 2
	rest 2
.loop1:
	note G#, 2
	rest 2
	note D#, 2
	rest 2
	note F#, 2
	rest 2
	note A_, 2
	rest 2
	sound_loop 2, .loop1
	note G#, 2
	rest 2
	note D#, 2
	rest 2
	note F#, 2
	rest 2
	note A_, 2
	octave 3
	note C_, 2
	note C#, 2
	rest 2
	octave 2
	note G#, 2
	rest 2
	note A_, 2
	rest 2
	octave 3
	note C_, 2
	rest 2
.loop2:
	note C#, 2
	rest 2
	octave 2
	note G#, 2
	rest 2
	note A_, 2
	rest 2
	octave 3
	note D_, 2
	rest 2
	sound_loop 2, .loop2
	note C#, 2
	rest 2
	octave 2
	note G#, 2
	rest 2
	note A_, 2
	rest 2
	octave 3
	note D#, 2
	note F#, 2
.loop3:
	note E_, 2
	rest 2
	octave 2
	note B_, 2
	rest 2
	octave 3
	note C_, 2
	rest 2
	note F_, 2
	rest 2
	sound_loop 8, .loop3
	sound_loop 0, .mainloop

Music_Lighthouse_Ch4:
	toggle_noise 0
	drum_speed 12
.mainloop:
	stereo_panning FALSE, TRUE
	drum_note 9, 4
	drum_note 6, 2
	drum_note 9, 4
	drum_note 6, 2
	drum_note 10, 2
	drum_note 11, 2
	stereo_panning TRUE, TRUE
	drum_note 9, 2
	drum_note 6, 4
	drum_note 9, 2
	drum_note 6, 4
	drum_note 9, 2
	drum_note 10, 2
	sound_loop 0, .mainloop
