Music_Route12:
	channel_count 4
	channel 1, Music_Route12_Ch1
	channel 2, Music_Route12_Ch2
	channel 3, Music_Route12_Ch3
	channel 4, Music_Route12_Ch4

Music_Route12_Ch1:
	tempo 148
	volume 7, 7
	vibrato 18, 3, 4
	pitch_offset 1
	stereo_panning FALSE, TRUE
	duty_cycle 3
	note_type 12, 9, 8
	octave 3
	note G#, 1
	rest 2
	note A_, 1
	note G#, 8
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	note F#, 1
	note G#, 1
	note F#, 1
	rest 2
	note E_, 1
	volume_envelope 9, 7
	note D#, 12
.mainloop:
	duty_cycle 2
	volume_envelope 9, 6
	sound_call .sub1
	sound_call .sub2
	sound_call .sub1
	note E_, 1
	rest 2
	note F#, 1
	note E_, 4
	note B_, 4
	octave 4
	note D#, 4
	sound_call .sub1
	sound_call .sub2
	sound_call .sub1
	volume_envelope 9, 2
	octave 4
	note E_, 1
	octave 3
	note B_, 1
	note G#, 1
	note E_, 1
	octave 4
	note D#, 1
	octave 3
	note B_, 1
	note G#, 1
	note D#, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note F_, 1
	note G#, 1
	note B_, 1
	duty_cycle 3
	volume_envelope 7, -7
	octave 4
	note C#, 3
	octave 3
	note B_, 3
	note A_, 1
	rest 1
	note A_, 4
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	note A_, 4
	note G#, 2
	note F#, 2
	note G#, 2
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 3
	note A_, 3
	note G#, 1
	rest 1
	note G#, 4
	note B_, 2
	note A_, 2
	note B_, 1
	note A_, 1
	note G#, 4
	note F#, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note E_, 2
	note D#, 3
	note F#, 3
	note D#, 2
	note E_, 8
	note F#, 8
	note D#, 4
	note F#, 4
.loop1:
	volume_envelope 9, 7
	note G#, 1
	note A_, 1
	note B_, 4
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	note E_, 1
	rest 1
	note E_, 1
	note F#, 1
	note G#, 4
	sound_loop 2, .loop1
	sound_loop 0, .mainloop

.sub1:
	octave 3
	note G#, 1
	rest 1
	note E_, 1
	rest 1
	octave 2
	note B_, 1
	rest 1
	note B_, 1
	octave 3
	note D#, 1
	note E_, 4
	note G#, 4
	sound_ret

.sub2:
	note A_, 1
	rest 1
	note F#, 1
	rest 1
	note D_, 1
	rest 1
	note F#, 1
	note G#, 1
	note A_, 4
	note F#, 4
	sound_ret

Music_Route12_Ch2:
	duty_cycle 3
	vibrato 18, 3, 4
	note_type 12, 11, 8
	octave 4
	note E_, 1
	rest 2
	note F#, 1
	note E_, 12
	octave 3
	note B_, 1
	rest 2
	octave 4
	note C_, 1
	volume_envelope 11, 7
	octave 3
	note B_, 8
	note D#, 1
	note F#, 1
	note B_, 1
	octave 4
	note D#, 1
.mainloop:
	duty_cycle 3
	volume_envelope 11, 7
	sound_call .sub1
	note F#, 1
	note A_, 1
	note G#, 1
	note F#, 1
	note G#, 2
	rest 1
	note E_, 1
	octave 3
	note B_, 12
	duty_cycle 2
	octave 2
	note B_, 1
	rest 2
	octave 3
	note C_, 1
	octave 2
	note B_, 4
	octave 3
	note D#, 4
	note F#, 4
	duty_cycle 3
	sound_call .sub1
	note A_, 1
	octave 5
	note C#, 1
	octave 4
	note B_, 1
	note A_, 1
	note B_, 2
	rest 1
	note A_, 1
	volume_envelope 11, 8
	note G#, 6
	volume_envelope 11, 7
	note G#, 6
	volume_envelope 6, -7
	note G#, 16
	duty_cycle 2
	volume_envelope 10, 8
	note A_, 3
	note G#, 3
	note F#, 1
	rest 1
	note F#, 8
	volume_envelope 10, 7
	note F#, 10
	rest 2
	note F#, 4
	volume_envelope 10, 8
	note G#, 3
	note F#, 3
	note E_, 1
	rest 1
	note E_, 8
	volume_envelope 10, 7
	note E_, 10
	rest 2
	note E_, 4
	note F#, 3
	note D#, 3
	octave 3
	note B_, 2
	volume_envelope 10, 8
	octave 4
	note B_, 8
	note B_, 8
	note A_, 8
	note G#, 1
	note F#, 1
	note E_, 14
	note E_, 10
	volume_envelope 10, 4
	note E_, 6
	sound_loop 0, .mainloop

.sub1:
	octave 4
	note E_, 6
	volume_envelope 11, 1
	octave 3
	note B_, 1
	note B_, 1
	volume_envelope 11, 7
	note B_, 4
	octave 4
	note B_, 4
	note A_, 4
	note G#, 4
	note F#, 4
	sound_ret

Music_Route12_Ch3:
	vibrato 18, 5, 4
	note_type 12, 1, 6
	octave 3
	note G#, 2
	rest 4
	note G#, 1
	note A_, 1
	note B_, 2
	rest 2
	note E_, 4
	note D#, 2
	rest 4
	note D#, 1
	note E_, 1
	note F#, 2
	rest 2
	note D#, 4
.mainloop:
	sound_call .sub1
	note F#, 1
	rest 1
	note E_, 1
	rest 3
	note D#, 1
	note E_, 1
	note F#, 4
	octave 2
	note B_, 4
	sound_call .sub1
	note E_, 1
	rest 1
	note B_, 1
	rest 3
	octave 2
	note B_, 1
	octave 3
	note C#, 1
	note D_, 4
	note F_, 4
	note F#, 13
	rest 1
	note F#, 1
	note G#, 1
	note A_, 5
	rest 1
	note A_, 1
	note B_, 1
	octave 4
	note C_, 4
	octave 3
	note F#, 4
	note E_, 14
	note G#, 1
	note A_, 1
	note B_, 6
	note E_, 1
	note F#, 1
	note G_, 4
	note E_, 4
	octave 2
	note B_, 5
	rest 1
	note B_, 1
	octave 3
	note D#, 1
	note F#, 8
	note E_, 8
	note F#, 4
	note D#, 4
.loop1:
	note E_, 1
	rest 1
	note E_, 1
	rest 3
	note E_, 1
	note F#, 1
	note G#, 4
	note E_, 3
	rest 1
	sound_loop 2, .loop1
	sound_loop 0, .mainloop

.sub1:
	octave 3
	note E_, 1
	rest 1
	note E_, 1
	rest 3
	note E_, 1
	note F#, 1
	note G#, 4
	note E_, 4
	note D_, 1
	rest 1
	note D_, 1
	rest 3
	note D_, 1
	note E_, 1
	note F#, 4
	note D_, 4
	note E_, 1
	rest 1
	note E_, 1
	rest 3
	note E_, 1
	note F#, 1
	note G#, 4
	note E_, 4
	sound_ret

Music_Route12_Ch4:
	toggle_noise 4
	stereo_panning TRUE, FALSE
	drum_speed 12
	drum_note 12, 10
	drum_note 2, 1
	drum_note 2, 1
	drum_note 3, 4
	drum_note 12, 6
	drum_note 2, 1
	drum_note 2, 1
	drum_note 3, 4
	drum_speed 6
	sound_call .sub1
.mainloop:
.loop1:
	drum_note 3, 4
	drum_note 3, 8
	drum_note 2, 2
	drum_note 2, 2
	drum_note 3, 8
	sound_call .sub1
	sound_loop 8, .loop1
.loop2:
	drum_speed 12
	drum_note 12, 10
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 6
	drum_note 2, 1
	drum_note 2, 1
	drum_note 3, 6
	drum_note 2, 1
	drum_note 2, 1
	drum_note 3, 4
	sound_loop 2, .loop2
	drum_note 12, 16
	drum_speed 6
	sound_call .sub1
	sound_call .sub1
	drum_note 12, 16
.loop3:
	drum_note 3, 4
	drum_note 3, 8
	drum_note 2, 2
	drum_note 2, 2
	drum_note 3, 8
	sound_call .sub1
	sound_loop 2, .loop3
	sound_loop 0, .mainloop

.sub1:
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	sound_ret
