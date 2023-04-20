Music_Route2:
	channel_count 4
	channel 1, Music_Route2_Ch1
	channel 2, Music_Route2_Ch2
	channel 3, Music_Route2_Ch3
	channel 4, Music_Route2_Ch4

Music_Route2_Ch1:
	tempo 151
	volume 7, 7
	stereo_panning FALSE, TRUE
	vibrato 6, 2, 3
	note_type 12, 11, 1
	rest 16
	rest 16
	sound_call .sub1
.mainloop:
	volume_envelope 11, 1
	octave 3
	note B_, 4
	note B_, 4
	note B_, 4
	note B_, 4
	octave 4
	note E_, 4
	note E_, 4
	note E_, 4
	note E_, 4
	sound_call .sub1
	sound_call .sub2
	sound_call .sub2
	sound_call .sub3
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	note F_, 2
	note D_, 2
	octave 3
	note B_, 2
	note G_, 2
	sound_call .sub3
	note G_, 2
	octave 4
	note C_, 2
	note D_, 2
	note G_, 2
	note F_, 2
	note D_, 2
	octave 3
	note B_, 2
	note G_, 2
	sound_loop 0, .mainloop

.sub1:
	octave 4
	note C_, 4
	note C_, 4
	note C_, 4
	note C_, 4
	note C_, 4
	note C_, 4
	volume_envelope 11, 7
	note C_, 4
	octave 3
	note B_, 4
	volume_envelope 11, 1
	sound_ret

.sub2:
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	note E_, 2
	note A#, 2
	note E_, 2
	note A#, 2
	note E_, 2
	note A#, 2
	note E_, 2
	note A#, 2
	note C_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note C_, 2
	note G#, 2
	note C_, 2
	note G#, 2
	volume_envelope 11, 7
	octave 2
	note B_, 2
	octave 3
	note G#, 2
	octave 2
	note B_, 2
	octave 3
	note G_, 2
	volume_envelope 11, 1
	sound_ret

.sub3:
	note B_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note B_, 2
	note G#, 2
	note B_, 2
	note G#, 2
	octave 4
	note E_, 2
	note C_, 2
	note E_, 2
	note C_, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	sound_ret

Music_Route2_Ch2:
	stereo_panning TRUE, TRUE
	vibrato 8, 2, 4
	note_type 12, 11, 2
	sound_call .sub1
.mainloop:
	volume_envelope 11, 2
	sound_call .sub1
	duty_cycle 2
	volume_envelope 11, 5
	sound_call .sub2
	sound_call .sub2
	sound_call .sub3
	sound_call .sub3
	sound_loop 0, .mainloop

.sub1:
	octave 4
	note E_, 4
	note E_, 4
	note E_, 2
	octave 2
	note C_, 2
	octave 4
	note E_, 2
	octave 2
	note C_, 2
	octave 4
	note A#, 4
	note A#, 4
	note A#, 2
	octave 2
	note G_, 2
	octave 4
	note A#, 2
	octave 2
	note G_, 2
	octave 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note G#, 4
	note G#, 4
	volume_envelope 11, 7
	note G#, 4
	note G_, 4
	volume_envelope 11, 2
	sound_ret

.sub2:
	octave 2
	note C_, 4
	rest 2
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 2
	rest 2
	note C_, 1
	rest 1
	note G_, 4
	rest 2
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 2
	rest 2
	note G_, 1
	rest 1
	note F_, 4
	rest 2
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 2
	rest 2
	note F_, 1
	rest 1
	note F_, 4
	rest 2
	note F_, 1
	rest 1
	note F_, 4
	note D_, 4
	sound_ret

.sub3:
	octave 2
	note E_, 4
	rest 2
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	note E_, 2
	rest 2
	note E_, 1
	rest 1
	note A_, 4
	rest 2
	note A_, 1
	rest 1
	note G#, 1
	rest 1
	note G#, 2
	rest 2
	note G#, 1
	rest 1
	note F_, 4
	rest 2
	note F_, 1
	rest 1
	note F#, 1
	rest 1
	note F#, 2
	rest 2
	note F#, 1
	rest 1
	note G_, 4
	rest 2
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 2
	rest 2
	note G_, 1
	rest 1
	sound_ret

Music_Route2_Ch3:
	stereo_panning TRUE, FALSE
	vibrato 22, 1, 5
	note_type 12, 1, 4
	octave 4
	note B_, 1
	rest 3
	note B_, 1
	rest 3
	note B_, 1
	rest 3
	note B_, 1
	rest 3
	octave 5
	note E_, 1
	rest 3
	note E_, 1
	rest 3
	note E_, 1
	rest 3
	note E_, 1
	rest 3
	sound_call .sub1
	octave 3
	note D_, 4
.mainloop:
	note_type 12, 1, 5
	octave 3
	note C_, 4
	rest 2
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note C_, 2
	rest 2
	note C_, 1
	rest 1
	note G_, 4
	rest 2
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 2
	rest 2
	note G_, 1
	rest 1
	sound_call .sub1
	octave 3
	note D_, 2
	volume_envelope 1, 0
	octave 6
	note C_, 1
	note D_, 1
	sound_call .sub2
	rest 4
	note G_, 8
	note F_, 2
	note G_, 2
	note_type 12, 1, 0
	sound_call .sub2
	rest 16
	volume_envelope 2, 5
	sound_call .sub3
	rest 4
	note D#, 1
	note E_, 7
	note D_, 4
	octave 5
	note B_, 1
	octave 6
	note C_, 3
	octave 5
	note B_, 4
	note A_, 4
	note B_, 8
	note G_, 4
	octave 6
	note A_, 4
	note G_, 4
	sound_call .sub3
	rest 4
	note G#, 1
	note A_, 7
	note B_, 4
	note F#, 1
	note G_, 16
	note G_, 15
	sound_loop 0, .mainloop

.sub1:
	octave 3
	note F_, 4
	rest 2
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note F_, 2
	rest 2
	note F_, 1
	rest 1
	note F_, 4
	rest 2
	note F_, 1
	rest 1
	note F_, 4
	sound_ret

.sub2:
	octave 6
	note E_, 10
	note D_, 2
	rest 2
	note C_, 2
	note_type 6, 1, 0
	octave 5
	note F#, 1
	note G_, 15
	note A_, 4
	note A#, 4
	rest 4
	octave 6
	note C_, 2
	note D_, 2
	note D#, 1
	note E_, 16
	note E_, 7
	note F_, 4
	note E_, 4
	note D#, 1
	note E_, 3
	note D_, 4
	note C_, 4
	note D_, 4
	sound_ret

.sub3:
	octave 5
	note B_, 16
	rest 4
	octave 6
	note C#, 1
	note D_, 7
	note E_, 4
	octave 5
	note B_, 1
	octave 6
	note C_, 16
	note C_, 3
	note D_, 4
	rest 4
	note E_, 4
	note F_, 16
	sound_ret

Music_Route2_Ch4:
	toggle_noise 5
	drum_speed 12
.loop1:
	drum_note 10, 4
	drum_note 10, 4
	drum_note 10, 2
	drum_note 12, 2
	drum_note 10, 2
	drum_note 12, 2
	sound_loop 3, .loop1
	drum_note 10, 4
	drum_note 10, 4
	drum_note 10, 2
	drum_note 10, 2
	drum_note 4, 4
.mainloop:
.loop2:
	drum_note 10, 4
	drum_note 10, 4
	drum_note 10, 2
	drum_note 10, 2
	drum_note 12, 2
	drum_note 10, 2
	sound_loop 4, .loop2
.loop3:
	drum_note 12, 4
	drum_note 10, 2
	drum_note 12, 2
	drum_note 10, 2
	drum_note 12, 2
	drum_note 10, 2
	drum_note 12, 2
	sound_loop 7, .loop3
	drum_note 12, 4
	drum_note 10, 4
	drum_note 10, 2
	drum_note 10, 2
	drum_note 4, 4
.loop4:
	drum_note 12, 4
	drum_note 1, 4
	drum_note 12, 2
	drum_note 12, 2
	drum_note 1, 4
	sound_loop 3, .loop4
	drum_note 12, 4
	drum_note 1, 4
	drum_note 2, 2
	drum_note 1, 2
	drum_note 2, 4
.loop5:
	drum_note 12, 4
	drum_note 1, 4
	drum_note 12, 2
	drum_note 12, 2
	drum_note 1, 4
	sound_loop 3, .loop5
	drum_note 12, 4
	drum_note 1, 4
	drum_note 3, 2
	drum_note 3, 2
	drum_note 4, 4
	sound_loop 0, .mainloop
