Music_BattleTowerTheme:
	channel_count 4
	channel 1, Music_BattleTowerTheme_Ch1
	channel 2, Music_BattleTowerTheme_Ch2
	channel 3, Music_BattleTowerTheme_Ch3
	channel 4, Music_BattleTowerTheme_Ch4

Music_BattleTowerTheme_Ch1:
	tempo 141
	volume 7, 7
	pitch_offset 1
	vibrato 18, 3, 4
	stereo_panning FALSE, TRUE
	note_type 6, 9, 4
.mainloop:
	rest 16
	rest 16
	rest 12
	rest 12
	duty_cycle 2
	octave 3
	note C_, 2
	note E_, 2
	note G_, 4
	sound_call .sub1
	note G_, 2
	rest 2
	note C_, 4
	rest 4
	volume_envelope 9, 2
	note G_, 2
	note F_, 2
	note C_, 2
	note E_, 2
	note G_, 2
	octave 4
	note E_, 2
	note G_, 2
	note E_, 2
	octave 3
	note G_, 2
	note E_, 2
	sound_call .sub1
	note G_, 2
	rest 2
	octave 2
	note A#, 4
	rest 4
	volume_envelope 9, 2
	octave 3
	note G_, 2
	note D#, 2
	note C_, 2
	note F_, 2
	note A_, 2
	octave 4
	note C_, 2
	note F_, 2
	note C_, 2
	octave 3
	note A_, 2
	note F_, 2
	volume_envelope 9, 3
	note D_, 2
	rest 2
	note E_, 4
	note F_, 4
	note G_, 2
	note A_, 2
	note A#, 8
	octave 2
	note A#, 8
	octave 3
	note C_, 2
	rest 2
	note D_, 4
	note E_, 4
	note F_, 2
	note G_, 2
	note A_, 8
	octave 2
	note A_, 8
	note A#, 2
	rest 2
	octave 3
	note C_, 4
	note D_, 4
	note D#, 2
	note F_, 2
	note D#, 4
	note F_, 4
	note G_, 4
	note A#, 4
	octave 4
	note C_, 2
	rest 2
	octave 3
	note F_, 4
	rest 4
	octave 2
	note A_, 2
	octave 3
	note C_, 2
	note E_, 4
	rest 4
	duty_cycle 3
	note C_, 2
	note E_, 2
	note G_, 4
	note A_, 4
	note F_, 8
	note F_, 2
	note G_, 2
	note A_, 8
	note G_, 4
	note F_, 4
	note D_, 8
	note A#, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note A_, 2
	note A#, 2
	octave 4
	note C_, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note D#, 2
	note F_, 4
	octave 3
	note F_, 8
	note C#, 2
	note D#, 2
	note F_, 8
	note G_, 4
	note F_, 4
	note F_, 4
	note C_, 8
	note G_, 2
	note F_, 2
	note E_, 8
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note G_, 2
	note E_, 2
	note C_, 4
	note F_, 8
	note C_, 2
	note F_, 2
	note A_, 8
	note A#, 4
	octave 4
	note C_, 4
	octave 3
	note A#, 4
	note F_, 8
	note A#, 4
	octave 4
	note D_, 8
	octave 3
	note A#, 2
	note A_, 2
	note F_, 4
	note G#, 4
	note F_, 8
	note G#, 4
	note F_, 4
	note D#, 4
	note C#, 4
	note F_, 4
	volume_envelope 9, 4
	octave 4
	note C_, 4
	octave 3
	note E_, 6
	rest 2
	note E_, 1
	rest 1
	note E_, 1
	rest 1
	note E_, 4
	rest 12
	sound_loop 0, .mainloop

.sub1:
	volume_envelope 9, 4
	note A_, 2
	rest 2
	note C_, 4
	rest 4
	note A_, 1
	rest 1
	note A_, 1
	rest 1
	note C_, 4
	note F_, 4
	rest 4
	note A_, 4
	sound_ret

Music_BattleTowerTheme_Ch2:
	vibrato 18, 3, 4
.mainloop:
	duty_cycle 3
	note_type 6, 11, 8
	octave 3
	note F_, 2
	rest 2
	octave 2
	note A_, 4
	rest 4
	octave 3
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	octave 2
	note A_, 4
	octave 3
	note F_, 4
	rest 4
	octave 2
	note A_, 2
	rest 2
	octave 3
	note F_, 2
	rest 2
	octave 2
	note A_, 4
	rest 4
	pitch_offset 1
	note A_, 1
	rest 1
	octave 3
	note C_, 1
	rest 1
	note F_, 4
	rest 4
	pitch_offset 0
	volume_envelope 11, 7
	note G_, 2
	octave 4
	note C_, 2
	note E_, 4
	sound_call .sub1
	note A#, 4
	rest 2
	note F_, 2
	note_type 12, 11, 7
	note C_, 12
	note_type 6, 11, 7
	sound_call .sub1
	note_type 12, 11, 7
	note A#, 2
	rest 1
	note G_, 1
	note A_, 12
	note A#, 1
	rest 1
	note A#, 4
	note G_, 1
	note A_, 1
	note A#, 4
	note D_, 4
	note A_, 1
	rest 1
	note A_, 4
	note G_, 1
	note A_, 1
	note F_, 8
	note G_, 1
	rest 1
	note G_, 4
	note A#, 1
	note A_, 1
	note A#, 4
	note D#, 4
	note F_, 1
	rest 1
	note F_, 4
	note G_, 1
	note F_, 1
	note E_, 8
	stereo_panning TRUE, FALSE
	duty_cycle 2
	note F_, 6
	note A_, 1
	note A#, 1
	octave 5
	note C_, 4
	octave 4
	note A#, 2
	note A_, 2
	note A#, 16
	note A#, 6
	note G_, 1
	note A_, 1
	note A#, 4
	octave 5
	note C_, 2
	octave 4
	note A#, 2
	note A_, 6
	note A#, 1
	note A_, 1
	note G_, 8
	note A_, 6
	note F_, 1
	note A_, 1
	octave 5
	note C_, 4
	note D_, 2
	note D#, 2
	note D_, 6
	note C_, 2
	octave 4
	note A#, 8
	octave 5
	note C#, 6
	note C_, 2
	octave 4
	note A#, 2
	note G#, 2
	note F_, 2
	note G#, 2
	note G_, 5
	rest 1
	note_type 6, 11, 7
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	note G_, 4
	rest 4
	stereo_panning TRUE, TRUE
	duty_cycle 3
	octave 3
	note C_, 2
	note D_, 2
	note E_, 4
	sound_loop 0, .mainloop

.sub1:
	note F_, 2
	rest 2
	note F_, 8
	note C_, 2
	note F_, 2
	octave 5
	note C_, 8
	octave 4
	note A#, 4
	note A_, 4
	sound_ret

Music_BattleTowerTheme_Ch3:
	vibrato 18, 3, 4
	note_type 6, 1, 6
.mainloop:
	stereo_panning TRUE, TRUE
	sound_call .sub1
	note C_, 2
	rest 2
	note F_, 4
	rest 4
	octave 2
	note A_, 1
	rest 1
	octave 3
	note C_, 1
	rest 1
	note F_, 4
	rest 4
	stereo_panning TRUE, FALSE
	note C_, 8
	sound_call .sub1
	note C_, 2
	rest 2
	note F_, 4
	rest 4
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note E_, 4
	note C_, 4
	rest 4
	note C_, 2
	rest 2
	sound_call .sub1
	octave 2
	note A#, 2
	rest 2
	octave 3
	note D#, 4
	rest 4
	octave 2
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	octave 3
	note C_, 4
	note F_, 4
	rest 4
	note C_, 1
	rest 1
	note C_, 2
	octave 2
	note A#, 2
	rest 2
	note A#, 4
	note F_, 4
	octave 3
	note F_, 1
	rest 1
	note F_, 2
	octave 2
	note A#, 2
	rest 2
	octave 3
	note D_, 2
	rest 2
	note F_, 8
	note C_, 2
	rest 2
	note C_, 4
	octave 2
	note F_, 4
	octave 3
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	octave 2
	note A_, 2
	rest 2
	octave 3
	note C_, 2
	rest 2
	note F_, 8
	note D#, 2
	rest 2
	note D#, 4
	octave 2
	note G_, 4
	octave 3
	note G_, 1
	rest 1
	note G_, 1
	rest 1
	octave 2
	note G_, 2
	rest 2
	note A#, 2
	rest 2
	octave 3
	note D#, 8
	note F_, 2
	rest 2
	note C_, 4
	rest 4
	note C_, 2
	octave 2
	note F_, 2
	note G_, 4
	rest 4
	stereo_panning TRUE, TRUE
	note G_, 2
	octave 3
	note C_, 2
	note E_, 4
	note F_, 4
	note C_, 8
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note A_, 4
	note C_, 6
	rest 2
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note F_, 4
	note D_, 8
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note A#, 4
	note A_, 4
	note F_, 4
	note D_, 4
	note F_, 4
	note C#, 8
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note A#, 4
	note F_, 8
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note C_, 4
	note F_, 8
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note G_, 4
	note C_, 4
	note D_, 4
	note E_, 4
	note F_, 4
	note C_, 8
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note A_, 4
	note C_, 8
	note F_, 2
	rest 2
	note F_, 4
	octave 2
	note A#, 8
	octave 3
	note F_, 1
	rest 1
	note F_, 1
	rest 1
	note A#, 4
	octave 2
	note A#, 4
	octave 3
	note D_, 4
	note E_, 4
	note F_, 4
	octave 2
	note G#, 8
	octave 3
	note C#, 1
	rest 1
	note C#, 1
	rest 1
	note G#, 4
	octave 2
	note G#, 8
	octave 3
	note C#, 4
	note C_, 4
	note G_, 8
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note G_, 4
	rest 12
	sound_loop 0, .mainloop

.sub1:
	octave 3
	note C_, 2
	rest 2
	note F_, 4
	rest 4
	note C_, 1
	rest 1
	note C_, 1
	rest 1
	note F_, 4
	note C_, 4
	rest 4
	note C_, 2
	rest 2
	sound_ret

Music_BattleTowerTheme_Ch4:
	toggle_noise 3
	drum_speed 12
.mainloop:
	sound_call .sub1
	drum_note 3, 2
	drum_note 3, 4
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 4
	drum_note 3, 1
	drum_note 2, 1
	drum_note 3, 1
	drum_note 2, 1
.loop1:
	sound_call .sub1
	sound_call .sub2
	sound_loop 2, .loop1
	sound_call .sub3
	sound_call .sub2
	sound_call .sub3
	drum_note 3, 2
	drum_note 3, 4
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 8
.loop2:
	sound_call .sub4
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 1
	drum_note 2, 1
	drum_note 3, 1
	drum_note 2, 1
	sound_loop 3, .loop2
	sound_call .sub4
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 4
	drum_note 3, 1
	drum_note 2, 1
	drum_note 3, 1
	drum_note 2, 1
	sound_loop 0, .mainloop

.sub1:
	drum_note 3, 2
	drum_note 3, 4
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 2
	drum_note 3, 4
	drum_note 3, 1
	drum_note 3, 1
	sound_ret

.sub2:
	drum_note 3, 2
	drum_note 3, 4
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 1
	drum_note 2, 1
	drum_note 3, 1
	drum_note 2, 1
	sound_ret

.sub3:
	drum_note 3, 2
	drum_note 3, 4
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 2
	drum_note 3, 1
	drum_note 3, 1
	sound_ret

.sub4:
	drum_note 3, 2
	drum_note 2, 2
	drum_note 3, 2
	drum_note 3, 1
	drum_note 2, 1
	drum_note 3, 2
	drum_note 2, 2
	drum_note 3, 2
	drum_note 3, 1
	drum_note 2, 1
	sound_ret
