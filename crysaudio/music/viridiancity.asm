Music_ViridianCity:
	channel_count 4
	channel 1, Music_ViridianCity_Ch1
	channel 2, Music_ViridianCity_Ch2
	channel 3, Music_ViridianCity_Ch3
	channel 4, Music_ViridianCity_Ch4

Music_ViridianCity_Ch1:
	tempo 157
	volume 7, 7
	stereo_panning FALSE, TRUE
	duty_cycle 2
	vibrato 18, 3, 4
	note_type 12, 10, 7
	octave 3
	note F#, 1
	rest 3
	note F#, 2
	rest 4
	note F#, 2
	rest 2
	note F#, 1
	rest 1
	note F#, 4
	rest 2
	octave 4
	note D_, 2
	rest 2
	octave 3
	note A_, 2
	rest 2
	note F#, 1
	rest 1
	note F#, 1
	rest 3
	note F#, 2
	rest 4
	note F#, 2
	rest 2
	note G_, 1
	rest 1
	rest 4
	note G_, 8
	rest 4
.mainloop:
	sound_call .sub1
	rest 4
	sound_call .sub1
	octave 4
	note C_, 4
	sound_call .sub2
	octave 4
	note B_, 2
	note G_, 2
	note D_, 2
	octave 3
	note B_, 2
	note F#, 2
	note E_, 2
	note F#, 1
	rest 1
	note A_, 1
	rest 3
	note F#, 2
	note A_, 1
	rest 1
	octave 4
	note C#, 1
	rest 1
	rest 2
	octave 3
	note A_, 1
	rest 1
	octave 4
	note C#, 1
	rest 1
	note F#, 1
	rest 1
	volume_envelope 8, 7
	octave 5
	note F#, 4
	note F_, 4
	volume_envelope 10, 7
	octave 3
	note G_, 6
	note B_, 8
	octave 4
	note E_, 2
	rest 2
	note E_, 2
	octave 3
	note B_, 4
	note G_, 2
	note F#, 2
	note E_, 4
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 1
	rest 1
	note F#, 1
	rest 3
	note D_, 2
	note F#, 1
	rest 1
	note A_, 1
	rest 1
	rest 2
	note F#, 2
	note A_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	note D#, 2
	note C_, 2
	octave 3
	note B_, 2
	note A_, 2
	sound_call .sub2
	octave 4
	note A_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note F#, 2
	note E_, 2
	note F#, 1
	rest 1
	note A_, 1
	rest 3
	note F#, 2
	note A_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	rest 2
	note E_, 2
	rest 2
	note C_, 2
	rest 2
	octave 3
	note A_, 2
	rest 2
	note F#, 2
	note G_, 6
	note B_, 1
	rest 1
	octave 4
	note E_, 4
	note F#, 2
	note G_, 6
	note E_, 2
	rest 2
	octave 3
	note G_, 2
	octave 4
	note E_, 2
	rest 2
	note F#, 6
	note D_, 4
	octave 3
	note A_, 4
	note F#, 4
	note G_, 1
	rest 3
	note G_, 8
	note A#, 4
	sound_loop 0, .mainloop

.sub1:
	octave 3
	note A_, 1
	rest 3
	note A_, 2
	rest 4
	note A_, 2
	rest 2
	note A_, 1
	rest 1
	octave 4
	note C_, 4
	rest 2
	octave 3
	note A_, 2
	rest 2
	octave 4
	note C_, 2
	octave 3
	note A_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	octave 3
	note B_, 1
	rest 3
	note G_, 2
	rest 4
	note G_, 2
	rest 2
	octave 4
	note D_, 2
	rest 2
	octave 3
	note B_, 2
	rest 2
	note G_, 1
	rest 1
	note G_, 4
	rest 2
	note B_, 1
	rest 1
	octave 4
	note D_, 1
	rest 3
	note D_, 2
	rest 4
	note D_, 2
	rest 2
	note D_, 1
	rest 1
	octave 3
	note G_, 4
	rest 2
	octave 4
	note C#, 1
	rest 1
	note E_, 1
	rest 1
	note D_, 4
	note C#, 1
	rest 1
	octave 3
	note A_, 1
	rest 3
	note F#, 2
	rest 4
	note F#, 2
	rest 2
	note G_, 1
	rest 1
	rest 4
	note G_, 8
	sound_ret

.sub2:
	octave 3
	note B_, 2
	note D_, 2
	note G_, 1
	rest 1
	note B_, 1
	rest 3
	note G_, 2
	note B_, 1
	rest 1
	octave 4
	note D_, 1
	rest 1
	rest 2
	octave 3
	note B_, 2
	octave 4
	note D_, 1
	rest 1
	note G_, 1
	rest 1
	sound_ret

Music_ViridianCity_Ch2:
	vibrato 16, 4, 6
	duty_cycle 1
	note_type 12, 11, 7
	stereo_panning TRUE, FALSE
	octave 2
	note D_, 4
	rest 2
	note A_, 1
	rest 1
	note A_, 4
	rest 4
	note D_, 4
	rest 2
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	octave 3
	note C#, 4
	octave 2
	note A_, 1
	rest 1
	note D_, 4
	rest 2
	note A_, 1
	rest 1
	note A_, 4
	rest 2
	note E_, 1
	rest 1
	rest 4
	note E_, 8
	rest 4
.mainloop:
	sound_call .sub1
	rest 4
	sound_call .sub1
	octave 2
	note F#, 4
	sound_call .sub2
	note G_, 4
	rest 2
	octave 3
	note D_, 1
	rest 1
	octave 2
	note G_, 1
	rest 1
	octave 3
	note D_, 4
	octave 2
	note B_, 2
	sound_call .sub3
	rest 2
	note F#, 2
	rest 2
	octave 3
	note C#, 1
	rest 1
	note C#, 4
	note C_, 4
	sound_call .sub4
	note E_, 4
	rest 2
	note B_, 1
	rest 1
	note E_, 2
	note B_, 2
	note G_, 4
	note D_, 4
	rest 2
	note A_, 1
	rest 1
	note A_, 4
	note C_, 2
	note C#, 2
	rest 2
	note D#, 2
	note A_, 1
	rest 1
	octave 3
	note C_, 1
	rest 1
	note D#, 2
	note C_, 2
	octave 2
	note A_, 2
	note F#, 2
	sound_call .sub2
	note G_, 4
	rest 2
	note B_, 1
	rest 1
	note G_, 1
	rest 1
	note B_, 4
	note G_, 2
	sound_call .sub3
	rest 2
	note F#, 2
	rest 2
	note A_, 2
	rest 2
	octave 3
	note C_, 2
	rest 2
	octave 2
	note D#, 2
	sound_call .sub4
	note E_, 4
	rest 2
	note A#, 1
	rest 1
	note A#, 4
	rest 2
	note G_, 1
	rest 1
	note D_, 4
	rest 2
	note A_, 1
	rest 1
	note A_, 4
	rest 2
	note D_, 1
	rest 1
	note E_, 1
	rest 3
	note E_, 8
	octave 1
	note A_, 4
	sound_loop 0, .mainloop

.sub1:
	octave 2
	note D_, 4
	rest 2
	note A_, 1
	rest 1
	note A_, 4
	rest 4
	note D#, 4
	rest 2
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	octave 3
	note C_, 4
	octave 2
	note A_, 1
	rest 1
	note E_, 4
	rest 2
	note B_, 1
	rest 1
	note B_, 4
	rest 4
	note E_, 4
	rest 2
	note B_, 1
	rest 1
	note B_, 1
	rest 1
	octave 3
	note D_, 4
	octave 2
	note B_, 1
	rest 1
	note G_, 4
	rest 2
	octave 3
	note D_, 1
	rest 1
	note D_, 4
	rest 4
	octave 2
	note A_, 4
	rest 2
	octave 3
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	note G_, 4
	note E_, 1
	rest 1
	octave 2
	note D_, 4
	rest 2
	note A_, 1
	rest 1
	note A_, 4
	rest 2
	note E_, 1
	rest 1
	rest 4
	note E_, 8
	sound_ret

.sub2:
	note G_, 4
	rest 2
	octave 3
	note D_, 1
	rest 1
	note D_, 4
	octave 2
	note F_, 2
	note F#, 2
	sound_ret

.sub3:
	note F#, 4
	rest 2
	octave 3
	note C#, 1
	rest 1
	note C#, 4
	octave 2
	note E_, 2
	note F_, 2
	sound_ret

.sub4:
	octave 2
	note E_, 4
	rest 2
	note B_, 1
	rest 1
	note B_, 4
	note D_, 2
	note D#, 2
	sound_ret

Music_ViridianCity_Ch3:
	vibrato 18, 2, 4
	note_type 12, 1, 3
	stereo_panning TRUE, TRUE
	octave 4
	note A_, 1
	rest 3
	note A_, 2
	rest 4
	note A_, 2
	rest 2
	note A_, 1
	rest 1
	note A_, 4
	rest 2
	octave 5
	note F#, 2
	rest 2
	note C#, 2
	rest 2
	octave 4
	note A_, 1
	rest 1
	note A_, 1
	rest 3
	note A_, 2
	rest 4
	note A_, 2
	rest 2
	octave 5
	note D_, 1
	rest 1
	rest 4
	note D_, 8
	note F#, 2
	note G_, 2
.mainloop:
	volume_envelope 1, 3
	sound_call .sub1
	octave 5
	note F#, 2
	note G_, 2
	sound_call .sub1
	note E_, 4
	vibrato 24, 2, 5
	volume_envelope 2, 5
	note B_, 12
	note G_, 4
	octave 6
	note D_, 8
	note E_, 2
	note D_, 2
	note C#, 2
	octave 5
	note B_, 2
	note A_, 12
	note F#, 4
	note A_, 8
	note A_, 4
	note G#, 4
	note E_, 10
	note E_, 2
	note F#, 2
	note G_, 2
	rest 2
	note G_, 2
	note F#, 4
	note E_, 4
	note G_, 4
	note F#, 12
	note D_, 4
	note A_, 4
	rest 4
	octave 6
	note C_, 8
	octave 5
	note B_, 12
	octave 6
	note C#, 2
	note D_, 2
	note E_, 2
	rest 2
	note D_, 2
	rest 2
	note C#, 2
	rest 2
	octave 5
	note B_, 2
	rest 2
	note A_, 10
	note A_, 2
	note B_, 2
	octave 6
	note C_, 2
	rest 2
	octave 5
	note B_, 2
	rest 2
	note A_, 2
	rest 2
	note F#, 2
	rest 2
	note G_, 12
	note G_, 2
	note A_, 2
	note A#, 6
	note A_, 2
	rest 2
	note G_, 2
	note A#, 2
	rest 2
	note A_, 14
	rest 4
	note D_, 1
	rest 3
	note D_, 8
	note E_, 4
	sound_loop 0, .mainloop

.sub1:
	octave 5
	note A_, 2
	rest 2
	note G_, 2
	rest 2
	note F#, 2
	rest 6
	rest 2
	note F#, 2
	note G_, 2
	note A_, 2
	rest 2
	note A_, 2
	note G_, 2
	note F#, 2
	note G_, 2
	note E_, 2
	octave 4
	note B_, 2
	rest 4
	note B_, 2
	rest 2
	octave 5
	note G_, 2
	rest 2
	note D_, 2
	rest 2
	octave 4
	note B_, 1
	rest 1
	note B_, 4
	octave 5
	note E_, 2
	note F#, 2
	note G_, 2
	rest 2
	note F#, 2
	rest 2
	note E_, 2
	rest 6
	rest 2
	note E_, 2
	note F#, 2
	note G_, 2
	rest 2
	note G_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note D_, 2
	octave 4
	note A_, 2
	rest 4
	note A_, 2
	rest 2
	octave 5
	note D_, 1
	rest 1
	rest 4
	note D_, 8
	sound_ret

Music_ViridianCity_Ch4:
	toggle_noise 3
	drum_speed 12
	sound_call .sub1
	sound_call .sub2
.mainloop:
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub2
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub2
	sound_call .sub3
	sound_call .sub4
	sound_call .sub3
	sound_call .sub3
	sound_call .sub3
	sound_call .sub4
	sound_call .sub3
	sound_call .sub3
	sound_loop 0, .mainloop

.sub1:
	drum_note 5, 2
	drum_note 5, 2
	drum_note 3, 2
	drum_note 5, 4
	drum_note 3, 2
	drum_note 5, 2
	drum_note 7, 2
	drum_note 5, 2
	drum_note 5, 2
	drum_note 3, 4
	drum_note 5, 2
	drum_note 3, 2
	drum_note 5, 2
	drum_note 7, 2
	sound_ret

.sub2:
	drum_note 5, 2
	drum_note 5, 2
	drum_note 3, 2
	drum_note 5, 4
	drum_note 3, 2
	drum_note 5, 2
	drum_note 7, 2
	drum_note 5, 2
	drum_note 5, 2
	drum_note 7, 4
	drum_note 3, 2
	drum_note 3, 2
	drum_note 11, 2
	drum_note 11, 2
	sound_ret

.sub3:
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 4, 2
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 4
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 4, 2
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 4, 2
	sound_ret

.sub4:
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 4, 2
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 4
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 4, 2
	drum_note 4, 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 7, 2
	sound_ret
