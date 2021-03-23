Music_Route3:
	channel_count 4
	channel 1, Music_Route3_Ch1
	channel 2, Music_Route3_Ch2
	channel 3, Music_Route3_Ch3
	channel 4, Music_Route3_Ch4

Music_Route3_Ch1:
	stereo_panning FALSE, TRUE
	tempo 160
	volume 7, 7
	note_type 12, 9, 1
	rest 10
	duty_cycle 0
	vibrato 20, 0, 6
	octave 3
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note F#, 1
	note G#, 1
.mainloop:
	sound_call .sub1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	volume_envelope 6, -7
	note G_, 1
	note D_, 1
	volume_envelope 7, 7
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note G_, 1
	note D_, 1
	note E_, 1
	note G#, 1
	note B_, 4
	volume_envelope 6, -7
	octave 3
	note G#, 2
	note E_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note E_, 8
	note D#, 1
	note E_, 1
	note G#, 2
	octave 2
	note B_, 4
	octave 3
	note D_, 2
	note E_, 2
	note G#, 2
	note B_, 2
	note A_, 1
	note G#, 1
	note F_, 3
	note E_, 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note F_, 2
	volume_envelope 9, 1
	note F#, 1
	note D_, 1
	octave 2
	note A_, 1
	octave 3
	note D_, 1
	note F#, 1
	note A_, 1
	note F#, 1
	note A_, 1
	note B_, 1
	note G#, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note G#, 1
	note B_, 1
	octave 4
	note D_, 1
	sound_loop 0, .mainloop

.sub1:
.sub1loop1:
	octave 3
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	sound_loop 3, .sub1loop1
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
.sub1loop2:
	note A_, 1
	note E_, 1
	note C#, 1
	note E_, 1
	sound_loop 3, .sub1loop2
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
.sub1loop3:
	note G_, 1
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	sound_loop 3, .sub1loop3
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	sound_ret

Music_Route3_Ch2:
	stereo_panning TRUE, FALSE
	note_type 12, 5, -6
	duty_cycle 2
	vibrato 6, 0, 3
	octave 4
	note E_, 1
	note G_, 1
	note G#, 6
	volume_envelope 8, 7
	note F#, 1
	note G#, 1
	note A_, 1
	rest 7
	note C#, 4
	note E_, 4
	note D_, 4
	octave 3
	note B_, 4
	octave 4
	note C#, 4
	volume_envelope 10, 7
	duty_cycle 2
	octave 3
	note A_, 1
	octave 4
	note C#, 1
	note E_, 1
	note G#, 1
.mainloop:
	volume_envelope 7, -5
	sound_call .sub1
	note G_, 1
	note B_, 10
	volume_envelope 11, 7
	note B_, 6
	volume_envelope 7, -5
	rest 4
	duty_cycle 3
	note G#, 4
	sound_call .sub1
	note B_, 1
	volume_envelope 7, -5
	octave 5
	note D_, 5
	volume_envelope 11, 7
	octave 5
	note D_, 5
	duty_cycle 0
	octave 3
	note D_, 1
	note G_, 1
	note B_, 1
	rest 1
	note G_, 1
	note B_, 1
	octave 4
	note D_, 4
	volume_envelope 8, -7
	duty_cycle 2
	octave 4
	note E_, 2
	note D_, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 8
	note G#, 1
	note A_, 1
	note B_, 2
	note E_, 4
	octave 4
	note E_, 8
	note D_, 1
	note C#, 1
	note D_, 3
	note C#, 3
	octave 3
	note A_, 10
	duty_cycle 2
	octave 4
	note F#, 6
	note E_, 1
	note F#, 1
	note G#, 6
	note F#, 1
	note G#, 1
	sound_loop 0, .mainloop

.sub1:
	note A_, 6
	note E_, 1
	note A_, 1
	octave 5
	note C#, 7
	volume_envelope 11, 7
	octave 5
	note C#, 3
	volume_envelope 7, -5
	octave 4
	note E_, 2
	note A_, 2
	octave 5
	note E_, 2
	note D_, 2
	note C#, 2
	octave 4
	note B_, 2
	note A_, 2
	note G_, 6
	note D_, 1
	sound_ret

Music_Route3_Ch3:
	stereo_panning TRUE, TRUE
	vibrato 6, 0, 3
	note_type 12, 1, 3
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	note E_, 6
	note D_, 1
	octave 3
	note B_, 1
	volume_envelope 1, 4
	octave 3
	note A_, 1
	rest 1
	octave 2
	note A_, 2
	rest 2
	note A_, 1
	note A_, 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note G#, 2
	sound_call .sub1
.mainloop:
	volume_envelope 1, 4
	sound_call .sub1
	sound_call .sub1
	sound_call .sub2
	sound_call .sub1
	sound_call .sub1
	sound_call .sub2
	note A_, 2
	octave 3
	note C#, 2
	note E_, 2
	note A_, 6
	note G#, 2
	note F#, 2
	note E_, 2
	note D_, 2
	octave 2
	note B_, 2
	note G#, 2
	note E_, 1
	rest 1
	note E_, 2
	note B_, 2
	octave 3
	note E_, 2
	note F_, 6
	note E_, 2
	note D_, 2
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	note C#, 2
	note D_, 1
	rest 1
	note D_, 2
	rest 2
	note D_, 1
	note D_, 1
	note E_, 1
	rest 1
	note E_, 2
	rest 2
	note F#, 1
	note G#, 1
	sound_loop 0, .mainloop

.sub1:
	octave 3
	note A_, 1
	rest 1
	octave 2
	note A_, 2
	rest 2
	note A_, 1
	note A_, 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	octave 3
	note A_, 2
	octave 2
	note G#, 2
	sound_ret

.sub2:
	octave 3
	note G_, 1
	rest 1
	octave 2
	note A_, 2
	rest 2
	note A_, 1
	note A_, 1
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	octave 3
	note D_, 2
	note G_, 2
	note G_, 1
	rest 1
	octave 2
	note G_, 2
	rest 2
	note G_, 1
	note G_, 1
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	note G#, 2
	note B_, 2
	sound_ret

Music_Route3_Ch4:
	toggle_noise 4
	drum_speed 12
	rest 10
.mainloop:
	drum_speed 12
	drum_note 3, 2
	drum_note 3, 4
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 2
	drum_note 3, 2
	drum_speed 6
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	sound_loop 0, .mainloop
