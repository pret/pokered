Music_GameCorner:
	channel_count 4
	channel 1, Music_GameCorner_Ch1
	channel 2, Music_GameCorner_Ch2
	channel 3, Music_GameCorner_Ch3
	channel 4, Music_GameCorner_Ch4

Music_GameCorner_Ch1:
	tempo 147
	volume 7, 7
	stereo_panning FALSE, TRUE
	note_type 12, 9, 1
	rest 8
.mainloop:
	volume_envelope 9, 1
	rest 16
	rest 16
	rest 16
	rest 16
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub2
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	sound_call .sub1
	sound_call .sub1
	sound_call .sub1
	sound_call .sub2
	octave 3
	rest 2
	note G#, 3
	note G#, 3
	note A#, 2
	note A#, 2
	note G#, 2
	note G_, 2
	volume_envelope 7, 1
.loop1:
	octave 4
	note G#, 1
	octave 5
	note C_, 1
	note F_, 1
	note C_, 1
	sound_loop 4, .loop1
.loop2:
	octave 4
	note A#, 1
	octave 5
	note D_, 1
	note G_, 1
	note D_, 1
	sound_loop 4, .loop2
.loop3:
	octave 4
	note D#, 1
	note G_, 1
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	sound_loop 4, .loop3
.loop4:
	octave 4
	note F_, 1
	note A_, 1
	octave 5
	note C_, 1
	octave 4
	note A_, 1
	sound_loop 4, .loop4
.loop5:
	octave 4
	note G#, 1
	octave 5
	note C_, 1
	note F_, 1
	note C_, 1
	sound_loop 4, .loop5
.loop6:
	octave 4
	note A#, 1
	octave 5
	note D_, 1
	note G_, 1
	note D_, 1
	sound_loop 4, .loop6
.loop7:
	octave 4
	note B_, 1
	octave 5
	note D_, 1
	note G_, 1
	note D_, 1
	sound_loop 4, .loop7
	octave 3
	note D_, 1
	note D_, 1
	note D_, 3
	note F_, 2
	note F_, 9
	sound_loop 0, .mainloop

.sub1:
	rest 2
	octave 4
	note A#, 3
	note G_, 3
	note D#, 3
	octave 3
	note F_, 3
	note F_, 2
	rest 2
	note G#, 3
	note G#, 3
	note A#, 2
	note A#, 2
	note G#, 1
	note A#, 3
	sound_ret

.sub2:
	rest 2
	octave 4
	note A#, 3
	note G_, 3
	note D#, 3
	octave 3
	note F_, 3
	note F_, 2
	sound_ret

Music_GameCorner_Ch2:
	stereo_panning TRUE, TRUE
	vibrato 8, 2, 4
	note_type 12, 10, 1
	rest 8
.mainloop:
	volume_envelope 9, 2
	duty_cycle 1
	sound_call .sub1
	octave 1
	note F_, 2
	octave 3
	note G#, 2
	octave 1
	note F_, 1
	octave 3
	note G#, 2
	volume_envelope 10, 4
	note G#, 3
	volume_envelope 9, 2
	note G_, 2
	note A#, 1
	octave 4
	note C_, 3
	sound_call .sub1
	octave 4
	note F_, 2
	note D#, 2
	note F_, 1
	note D#, 2
	volume_envelope 10, 4
	note G_, 3
	note F_, 4
	duty_cycle 2
	volume_envelope 12, 7
	octave 3
	note D#, 1
	note F_, 1
	note G_, 6
	note F_, 6
	note C_, 4
	note D_, 6
	note D#, 6
	note F_, 4
	note D_, 6
	note C_, 6
	octave 2
	note A#, 4
	note A_, 4
	rest 10
	octave 3
	note D#, 1
	note F_, 1
	note G_, 6
	note F_, 6
	note C_, 4
	note D_, 6
	note D#, 6
	note F_, 2
	note D#, 1
	note F_, 1
	note G_, 16
	volume_envelope 9, 2
	note G_, 1
	note G_, 1
	note G_, 3
	note A#, 2
	note A#, 9
	volume_envelope 10, 4
	sound_loop 0, .mainloop

.sub1:
	octave 1
	note C_, 2
	octave 3
	note D#, 3
	note D#, 3
	note D#, 3
	note F_, 3
	note F_, 2
	octave 1
	note C_, 2
	octave 3
	note D#, 3
	note D#, 3
	note F_, 2
	note F_, 2
	note D#, 1
	note F_, 3
	octave 1
	note C_, 2
	octave 3
	note D#, 3
	note D#, 3
	note D#, 3
	note F_, 3
	note F_, 2
	octave 1
	note C_, 2
	octave 3
	note D#, 3
	note D#, 3
	note F_, 2
	note C_, 2
	note D#, 1
	note F_, 3
	octave 1
	note C_, 2
	octave 5
	note D_, 3
	octave 4
	note A#, 3
	note G_, 2
	note C_, 2
	note D_, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note F_, 1
	note D#, 2
	volume_envelope 10, 4
	note F_, 3
	note G_, 4
	volume_envelope 9, 2
	note F#, 1
	note F_, 1
	octave 1
	note C_, 2
	octave 5
	note D_, 3
	octave 4
	note A#, 3
	note G_, 2
	note C_, 2
	note D_, 2
	note D#, 2
	octave 1
	note F_, 1
	octave 4
	note F_, 1
	note D#, 2
	note G_, 1
	note D#, 2
	volume_envelope 10, 4
	note A#, 3
	note A_, 2
	volume_envelope 9, 2
	note A#, 1
	octave 5
	note C_, 3
	octave 1
	note C_, 2
	octave 5
	note D_, 3
	octave 4
	note A#, 3
	note G_, 2
	note C_, 2
	note D_, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note F_, 1
	note D#, 2
	volume_envelope 10, 4
	note F_, 3
	note G_, 4
	volume_envelope 9, 2
	note F#, 1
	note F_, 1
	octave 1
	note C_, 2
	octave 5
	note D_, 3
	octave 4
	note A#, 3
	note G_, 2
	note C_, 2
	note D_, 2
	note D#, 2
	sound_ret

Music_GameCorner_Ch3:
	vibrato 8, 2, 2
	note_type 12, 1, 4
	rest 8
.mainloop:
	stereo_panning TRUE, TRUE
	note_type 12, 1, 4
	sound_call .sub1
	sound_call .sub2
	octave 4
	note G_, 1
	note A_, 3
	sound_call .sub1
	sound_call .sub2
	octave 4
	note A#, 1
	octave 5
	note C_, 3
	stereo_panning TRUE, FALSE
	sound_call .sub1
	sound_call .sub3
	sound_call .sub1
	sound_call .sub4
	sound_call .sub1
	sound_call .sub3
	sound_call .sub1
	stereo_panning TRUE, TRUE
	octave 2
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 2
	note F_, 1
	octave 5
	note C_, 1
	octave 3
	note F_, 1
	octave 5
	note D#, 3
	note D_, 1
	rest 1
	note D#, 1
	note F_, 1
	rest 2
	sound_call .sub1
	sound_call .sub2
	octave 4
	note G_, 1
	note A_, 3
	sound_call .sub1
	sound_call .sub2
	octave 4
	note A#, 1
	octave 5
	note C_, 3
	stereo_panning TRUE, FALSE
	sound_call .sub1
	sound_call .sub3
	sound_call .sub1
	sound_call .sub4
	sound_call .sub1
	sound_call .sub3
	sound_call .sub1
	octave 2
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note D#, 1
	rest 1
	note D_, 1
	rest 1
	note C_, 1
	rest 1
	octave 4
	note A#, 1
	rest 1
	volume_envelope 1, 5
	sound_call .sub5
	octave 2
	note C_, 2
	rest 1
	note C_, 1
	octave 3
	note C_, 1
	octave 2
	note C_, 1
	rest 1
	note C_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 2
	note C_, 2
	octave 3
	note C_, 1
	octave 2
	note C_, 1
	rest 1
	octave 3
	note C_, 1
	octave 2
	note F_, 2
	rest 1
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note F_, 1
	rest 1
	note F_, 1
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note F_, 2
	octave 3
	note F_, 1
	octave 2
	note F_, 1
	rest 1
	octave 3
	note F_, 1
	sound_call .sub5
	octave 2
	note G_, 2
	rest 1
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note G_, 1
	rest 1
	note G_, 1
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note G_, 2
	octave 3
	note G_, 1
	octave 2
	note G_, 1
	rest 1
	octave 3
	note G_, 1
	octave 2
	note B_, 1
	note B_, 1
	note B_, 1
	rest 2
	note B_, 1
	rest 1
	note B_, 1
	rest 4
	note_type 6, 1, 5
	octave 3
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	sound_loop 0, .mainloop

.sub1:
	octave 2
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note G_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note G_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note G_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note A_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note A_, 2
	sound_ret

.sub2:
	octave 2
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note G_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note G_, 1
	note C_, 1
	octave 3
	note C_, 1
	octave 4
	note A#, 1
	rest 1
	note A_, 1
	rest 1
	sound_ret

.sub3:
	octave 2
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note D#, 1
	rest 1
	note D_, 1
	rest 1
	note C_, 1
	note D_, 3
	sound_ret

.sub4:
	octave 2
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 3
	note F_, 1
	octave 5
	note D#, 1
	rest 1
	note D_, 1
	rest 1
	note C_, 1
	note D_, 1
	octave 3
	note F_, 1
	rest 1
	sound_ret

.sub5:
	octave 2
	note F_, 2
	rest 1
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note F_, 1
	rest 1
	note F_, 1
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note F_, 2
	octave 3
	note F_, 1
	octave 2
	note F_, 1
	rest 1
	octave 3
	note F_, 1
	octave 2
	note G_, 2
	rest 1
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note G_, 1
	rest 1
	note G_, 1
	note G_, 1
	octave 3
	note G_, 1
	octave 2
	note F_, 1
	octave 3
	note F_, 1
	octave 2
	note D#, 1
	octave 3
	note D#, 1
	octave 2
	note D_, 1
	octave 3
	note D_, 1
	sound_ret

Music_GameCorner_Ch4:
	toggle_noise 3
	drum_speed 12
	drum_speed 8
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_speed 12
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
.mainloop:
	sound_call .sub1
.loop1:
	drum_note 11, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	drum_note 11, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	sound_loop 6, .loop1
	sound_call .sub2
.loop2:
	drum_note 11, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	drum_note 11, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	sound_loop 3, .loop2
	rest 12
	drum_note 3, 1
	drum_note 3, 1
	drum_note 7, 2
	sound_call .sub1
.loop3:
	drum_note 11, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	drum_note 11, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	sound_loop 6, .loop3
	sound_call .sub2
.loop4:
	drum_note 11, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	drum_note 11, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	sound_loop 3, .loop4
	drum_note 11, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	drum_note 4, 2
	drum_note 7, 2
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
.loop5:
	drum_note 11, 2
	drum_note 7, 1
	drum_note 4, 1
	drum_note 3, 1
	drum_note 4, 1
	drum_note 7, 1
	drum_note 4, 1
	drum_note 4, 1
	drum_note 3, 1
	drum_note 7, 1
	drum_note 4, 1
	drum_note 3, 2
	drum_note 7, 2
	sound_loop 3, .loop5
	drum_note 11, 2
	drum_note 7, 1
	drum_note 4, 1
	drum_note 3, 1
	drum_note 4, 1
	drum_note 7, 1
	drum_note 4, 1
	drum_note 4, 1
	drum_note 3, 1
	drum_note 7, 1
	drum_note 4, 1
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
.loop6:
	drum_note 11, 2
	drum_note 7, 1
	drum_note 4, 1
	drum_note 3, 1
	drum_note 4, 1
	drum_note 7, 1
	drum_note 4, 1
	drum_note 4, 1
	drum_note 3, 1
	drum_note 7, 1
	drum_note 4, 1
	drum_note 3, 2
	drum_note 7, 2
	sound_loop 3, .loop6
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 2
	drum_note 11, 1
	drum_note 7, 2
	drum_note 7, 5
	drum_note 3, 1
	drum_note 3, 1
	drum_note 4, 2
	sound_loop 0, .mainloop

.sub1:
	drum_note 1, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	drum_note 11, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	sound_ret

.sub2:
	drum_note 11, 2
	drum_note 7, 2
	drum_note 3, 2
	drum_note 7, 2
	drum_note 11, 2
	drum_note 7, 2
	drum_note 3, 1
	drum_note 3, 1
	drum_note 7, 2
	sound_ret
