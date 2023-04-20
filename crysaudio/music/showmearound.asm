Music_ShowMeAround:
	channel_count 4
	channel 1, Music_ShowMeAround_Ch1
	channel 2, Music_ShowMeAround_Ch2
	channel 3, Music_ShowMeAround_Ch3
	channel 4, Music_ShowMeAround_Ch4

Music_ShowMeAround_Ch1:
	tempo 144
	volume 7, 7
	stereo_panning FALSE, TRUE
	duty_cycle 2
	note_type 12, 11, 1
	octave 4
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note G#, 2
	note F#, 2
	note E_, 2
	note D_, 2
	octave 3
	note B_, 4
	note G#, 1
	note B_, 1
	octave 4
	note D_, 1
	note E_, 1
	note G#, 8
.mainloop:
	rest 16
	rest 16
	rest 16
	rest 16
	sound_call Music_ShowMeAround_Ch2.sub3
	sound_call .sub1
	sound_call Music_ShowMeAround_Ch2.sub3
	sound_call .sub1
	sound_loop 0, .mainloop

.sub1:
	rest 4
	octave 3
	note C#, 1
	rest 5
	note D_, 4
	note C_, 1
	rest 1
	rest 4
	octave 2
	note E_, 1
	rest 1
	note G#, 1
	rest 1
	octave 4
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	note E_, 1
	rest 3
	sound_ret

Music_ShowMeAround_Ch2:
	stereo_panning TRUE, TRUE
	duty_cycle 2
	note_type 12, 11, 1
	octave 5
	note E_, 2
	note D_, 2
	note C#, 2
	note D_, 2
	note C#, 2
	octave 4
	note B_, 2
	note A_, 2
	note G#, 2
	note E_, 4
	note E_, 1
	note G#, 1
	note B_, 1
	octave 5
	note D_, 1
	note E_, 8
	duty_cycle 1
.mainloop:
	sound_call .sub3
	sound_call .sub3
	sound_call .sub1
	note A_, 4
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	note E_, 4
	note D_, 2
	note C#, 2
	octave 3
	note B_, 4
	sound_call .sub1
	note A_, 2
	note A_, 2
	note G#, 2
	note E_, 2
	note F#, 2
	note G#, 2
	note A_, 2
	note A_, 2
	note A_, 4
	sound_call .sub2
	note A_, 4
	octave 5
	note C#, 2
	octave 4
	note A_, 2
	note A_, 4
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	rest 1
	note D#, 1
	note E_, 1
	sound_call .sub2
	note A_, 2
	octave 5
	note E_, 2
	note D_, 2
	octave 4
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note A_, 2
	note A_, 4
	sound_loop 0, .mainloop

.sub1:
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	note E_, 4
	note D_, 2
	note F#, 2
	sound_ret

.sub2:
	octave 5
	note C#, 2
	octave 4
	note A_, 2
	note A_, 4
	octave 5
	note F#, 2
	octave 4
	note A_, 2
	sound_ret

.sub3:
	rest 4
	octave 3
	note C#, 1
	rest 5
	note D_, 4
	note C_, 1
	rest 1
	rest 2
	note C#, 1
	rest 5
	octave 2
	note E_, 1
	rest 3
	note A#, 2
	note B_, 1
	rest 1
	sound_ret

Music_ShowMeAround_Ch3:
	stereo_panning TRUE, FALSE
	vibrato 16, 2, 2
	note_type 6, 2, 5
	octave 2
	note B_, 1
	rest 3
	octave 3
	note D_, 1
	rest 3
	note E_, 1
	rest 3
	note G#, 1
	rest 3
	note B_, 1
	rest 3
	octave 4
	note D_, 1
	rest 3
	note E_, 1
	rest 3
	note G#, 1
	rest 3
	note D_, 2
	rest 6
	note D_, 2
	octave 3
	note B_, 2
	note G#, 2
	note B_, 2
	note E_, 2
	rest 6
	volume_envelope 1, 4
	octave 2
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note E_, 2
	volume_envelope 1, 4
.mainloop:
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub2
	sound_call .sub1
	sound_call .sub2
	sound_loop 0, .mainloop

.sub1:
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
	sound_ret

.sub2:
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
	note G#, 2
	rest 6
	octave 4
	note D_, 2
	rest 2
	octave 3
	note B_, 2
	rest 2
	note C#, 2
	rest 2
	note E_, 2
	rest 2
	octave 2
	note A_, 2
	rest 6
	sound_ret

Music_ShowMeAround_Ch4:
	toggle_noise 3
	drum_speed 12
	rest 16
	rest 8
	drum_note 3, 2
	drum_note 4, 2
	drum_note 7, 4
.mainloop:
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub2
	sound_call .sub1
	sound_call .sub2
	sound_loop 0, .mainloop

.sub1:
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 8, 2
	drum_note 8, 2
	drum_note 7, 4
	drum_note 3, 2
	drum_note 4, 2
	drum_note 7, 4
	drum_note 3, 2
	drum_note 8, 2
	drum_note 8, 2
	drum_note 3, 2
	drum_note 4, 2
	sound_ret

.sub2:
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 8, 2
	drum_note 8, 2
	drum_note 7, 4
	drum_note 3, 2
	drum_note 4, 2
	drum_note 7, 4
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 7, 2
	sound_ret
