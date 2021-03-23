Music_GymLeaderVictory:
	channel_count 4
	channel 1, Music_GymLeaderVictory_Ch1
	channel 2, Music_GymLeaderVictory_Ch2
	channel 3, Music_GymLeaderVictory_Ch3
	channel 4, Music_GymLeaderVictory_Ch4

Music_GymLeaderVictory_Ch1:
	tempo 116
	volume 7, 7
	vibrato 18, 3, 4
	duty_cycle 3
	pitch_offset 1
	note_type 12, 11, 7
	octave 4
	note D_, 6
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	note F#, 6
	note D_, 1
	note F#, 1
	note A_, 6
	note F#, 1
	note A_, 1
	octave 5
	note D_, 8
	stereo_panning FALSE, TRUE
.mainloop:
.loop1:
	duty_cycle 1
	sound_call .sub1
	octave 4
	note C#, 4
	note E_, 4
	sound_call .sub1
	note F#, 8
	sound_loop 2, .loop1
	duty_cycle 2
	sound_call .sub2
	note A_, 4
	note G_, 4
	note F#, 6
	note D_, 1
	note E_, 1
	note F#, 6
	note E_, 2
	note D_, 8
	note C#, 8
	duty_cycle 3
	sound_call .sub2
	note C#, 4
	note E_, 4
	note G_, 6
	note A_, 1
	note G_, 1
	note A_, 6
	note G_, 2
	volume_envelope 8, 7
	note F#, 16
	sound_loop 0, .mainloop

.sub1:
	volume_envelope 9, 1
	octave 3
	note F#, 2
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 1
	note F#, 1
	note E_, 2
	note A_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 1
	note E_, 1
	note D_, 2
	note G_, 2
	note B_, 2
	note G_, 1
	note D_, 1
	sound_ret

.sub2:
	volume_envelope 8, 7
	octave 3
	note F#, 14
	note D_, 1
	note F#, 1
	note A_, 8
	note F#, 4
	note A_, 1
	note G#, 1
	note F#, 1
	note A_, 1
	note G#, 14
	note E_, 1
	note G#, 1
	note B_, 8
	octave 4
	note D_, 4
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note C#, 14
	octave 3
	note A_, 1
	octave 4
	note C#, 1
	note E_, 8
	sound_ret

Music_GymLeaderVictory_Ch2:
	vibrato 18, 3, 4
	duty_cycle 3
	note_type 12, 13, 7
	octave 4
	note A_, 6
	note F#, 1
	note A_, 1
	octave 5
	note D_, 6
	octave 4
	note A_, 1
	octave 5
	note D_, 1
	note F#, 16
.mainloop:
	duty_cycle 3
	volume_envelope 10, 1
	sound_call .sub1
	note A_, 4
	note A_, 4
	sound_call .sub1
	note D_, 6
	duty_cycle 2
	note B_, 1
	octave 5
	note C#, 1
	sound_call .sub1
	note A_, 4
	note A_, 4
	sound_call .sub1
	note D_, 8
	duty_cycle 3
	sound_call .sub2
	note F#, 4
	note E_, 4
	note D_, 14
	octave 4
	note B_, 2
	volume_envelope 10, 7
	note A_, 16
	duty_cycle 2
	sound_call .sub2
	octave 4
	note A_, 4
	octave 5
	note C#, 4
	note D_, 14
	note E_, 2
	volume_envelope 10, 6
	note D_, 12
	rest 2
	duty_cycle 3
	octave 4
	note B_, 1
	octave 5
	note C#, 1
	sound_loop 0, .mainloop

.sub1:
	octave 5
	note D_, 2
	note C#, 2
	octave 4
	note B_, 4
	octave 5
	note C#, 2
	octave 4
	note B_, 2
	note A_, 4
	note B_, 2
	note A_, 2
	note G_, 2
	note F#, 2
	sound_ret

.sub2:
	volume_envelope 9, 8
	note A_, 6
	note F#, 1
	note A_, 1
	octave 5
	note D_, 8
	note D_, 16
	octave 4
	note B_, 6
	note G#, 1
	note B_, 1
	octave 5
	note E_, 8
	note E_, 16
	octave 4
	note G_, 6
	note E_, 1
	note G_, 1
	octave 5
	note C#, 8
	note C#, 8
	sound_ret

Music_GymLeaderVictory_Ch3:
	note_type 12, 2, 5
	octave 3
	note F#, 16
	note D_, 10
	octave 2
	note A_, 2
	note B_, 2
	octave 3
	note C#, 2
	stereo_panning TRUE, FALSE
.mainloop:
.loop1:
	note D_, 2
	rest 4
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	rest 4
	octave 2
	note A_, 2
	note B_, 2
	rest 4
	note G_, 2
	note A_, 2
	rest 2
	octave 3
	note C#, 4
	note D_, 2
	rest 4
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	rest 4
	octave 2
	note A_, 2
	note B_, 2
	rest 4
	note G_, 2
	octave 3
	note D_, 2
	rest 6
	sound_loop 2, .loop1
	sound_call .sub1
	octave 3
	note D_, 2
	rest 2
	note D_, 2
	octave 4
	note D_, 2
	rest 2
	octave 3
	note D_, 2
	note F#, 2
	note D_, 2
	note A_, 2
	rest 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	rest 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	octave 2
	note A_, 2
	sound_call .sub1
	octave 3
	note D_, 2
	rest 2
	note G_, 2
	octave 4
	note D_, 2
	rest 2
	octave 3
	note D_, 2
	note G_, 2
	note E_, 2
	note D_, 2
	rest 2
	note D_, 2
	note A_, 2
	rest 2
	octave 2
	note A_, 2
	note B_, 2
	octave 3
	note C#, 2
	sound_loop 0, .mainloop

.sub1:
	octave 3
	note D_, 2
	rest 2
	note D_, 2
	octave 4
	note D_, 2
	rest 2
	octave 3
	note D_, 2
	note F#, 2
	note D_, 2
	note A_, 2
	rest 2
	note D_, 2
	note F#, 2
	rest 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	rest 2
	note E_, 2
	octave 4
	note E_, 2
	rest 2
	octave 3
	note E_, 2
	note G#, 2
	note E_, 2
	note B_, 2
	rest 2
	note E_, 2
	note G#, 2
	rest 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	note A_, 2
	rest 2
	note A_, 2
	octave 3
	note A_, 2
	rest 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	octave 2
	note A_, 2
	octave 3
	note A_, 2
	rest 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	rest 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	octave 2
	note A_, 2
	sound_ret

Music_GymLeaderVictory_Ch4:
	toggle_noise 4
	drum_speed 12
	drum_note 12, 16
	drum_note 12, 16
.mainloop:
	sound_call .sub1
	drum_note 4, 6
	drum_note 4, 2
	drum_note 4, 8
	sound_call .sub1
	drum_note 4, 6
	drum_note 4, 2
	drum_note 4, 4
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
	drum_note 2, 1
.loop1:
	drum_note 4, 2
	drum_note 8, 2
	drum_note 3, 2
	drum_note 4, 2
	drum_note 8, 2
	drum_note 4, 2
	drum_note 3, 2
	drum_note 8, 2
	sound_loop 16, .loop1
	sound_loop 0, .mainloop

.sub1:
.sub1loop1:
	drum_note 4, 6
	drum_note 4, 2
	drum_note 4, 4
	drum_note 3, 2
	drum_note 4, 2
	sound_loop 3, .sub1loop1
	sound_ret
