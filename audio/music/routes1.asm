Music_Routes1_Ch1::
	tempo 152
	volume 7, 7
	vibrato 4, 2, 3
	duty_cycle 2
	toggle_perfect_pitch
.mainloop:
	note_type 12, 10, 1
	rest 4
	octave 4
	note D_, 2
	note D_, 6
	note D_, 2
	note D_, 6
	note D_, 2
	note D_, 1
	note C#, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	octave 3
	note A_, 2
	note A_, 2
	note A_, 6
	octave 4
	note C#, 2
	note C#, 6
	note C#, 2
	note C#, 4
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 4
	octave 3
	note A_, 2
	note A_, 6
	octave 4
	note D_, 2
	note D_, 6
	note D_, 2
	note D_, 6
	note D_, 2
	note D_, 1
	note E_, 1
	note D_, 1
	note C#, 1
	octave 3
	note B_, 2
	note A_, 2
	note A_, 6
	octave 4
	note C#, 2
	note C#, 6
	octave 3
	note A_, 2
	octave 4
	note E_, 2
	octave 3
	note A_, 2
	note_type 12, 10, 2
	octave 4
	note G_, 4
	note E_, 4
	note F#, 2
	note_type 12, 10, 1
	octave 3
	note A_, 2
	note A_, 6
	note A_, 2
	note F#, 2
	note A_, 4
	note B_, 2
	octave 4
	note C#, 2
	octave 3
	note B_, 4
	note A_, 2
	note F#, 2
	note A_, 4
	note G_, 2
	note E_, 2
	note C#, 4
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 4
	note B_, 2
	note G_, 2
	note B_, 4
	octave 4
	note D_, 2
	note E_, 2
	note C#, 2
	note D_, 2
	octave 3
	note A_, 2
	note A_, 2
	sound_loop 0, .mainloop

	sound_ret ; unused

Music_Routes1_Ch2::
	duty_cycle 2
.mainloop:
	note_type 12, 13, 1
	sound_call .sub1
	sound_call .sub2
	sound_call .sub1
	sound_call .sub3
	sound_loop 0, .mainloop

.sub1:
	octave 4
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 2
	note F#, 2
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 2
	note F#, 2
	note D_, 1
	note E_, 1
	note F#, 2
	note F#, 2
	note G_, 3
	note F#, 1
	note E_, 6
	sound_ret

.sub2:
	note C#, 1
	note D_, 1
	note E_, 2
	note E_, 2
	note E_, 2
	note C#, 1
	note D_, 1
	note E_, 2
	note E_, 2
	note E_, 2
	note C#, 1
	note D_, 1
	note E_, 2
	note E_, 2
	note F#, 1
	note E_, 1
	note E_, 1
	note F#, 1
	note D_, 4
	note F#, 2
	sound_ret

.sub3:
	note C#, 1
	note D_, 1
	note E_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 2
	note_type 12, 13, 2
	note B_, 4
	note_type 6, 13, 1
	octave 3
	note B_, 1
	octave 4
	note C#, 1
	note_type 12, 13, 1
	octave 3
	note B_, 1
	note A_, 1
	octave 4
	note C#, 1
	note D_, 6
	note_type 12, 13, 2
	note F#, 1
	note G_, 1
	note A_, 2
	note A_, 2
	note F#, 2
	note D_, 2
	octave 5
	note D_, 2
	note C#, 2
	octave 4
	note B_, 2
	octave 5
	note C#, 2
	octave 4
	note A_, 2
	note F#, 2
	note D_, 3
	note F#, 1
	note E_, 6
	note F#, 1
	note G_, 1
	note A_, 2
	note A_, 2
	note F#, 2
	note A_, 2
	octave 5
	note D_, 2
	note C#, 2
	octave 4
	note B_, 3
	note G_, 1
	note A_, 2
	octave 5
	note D_, 2
	note C#, 2
	note E_, 2
	note D_, 2
	note_type 12, 13, 1
	octave 4
	note D_, 2
	note D_, 2
	sound_ret

	sound_ret ; unused

Music_Routes1_Ch3::
	vibrato 8, 2, 5
	note_type 12, 1, 3
.mainloop:
	rest 2
	octave 4
	note D_, 4
	note C#, 4
	octave 3
	note B_, 4
	note A_, 4
	octave 4
	note D_, 4
	octave 3
	note A_, 4
	note B_, 4
	note A_, 4
	octave 4
	note C#, 4
	octave 3
	note A_, 4
	note B_, 4
	octave 4
	note C_, 4
	note C#, 4
	octave 3
	note A_, 4
	octave 4
	note D_, 4
	octave 3
	note A_, 4
	octave 4
	note D_, 4
	note C#, 4
	octave 3
	note B_, 4
	note A_, 4
	octave 4
	note D_, 4
	octave 3
	note A_, 4
	note B_, 4
	note A_, 4
	octave 4
	note C#, 4
	octave 3
	note B_, 4
	note A_, 4
	note B_, 4
	octave 4
	note C#, 4
	octave 3
	note A_, 4
	octave 4
	note D_, 4
	octave 3
	note A_, 4
	octave 4
	note D_, 8
	octave 3
	note G_, 8
	note A_, 8
	octave 4
	note C#, 8
	note D_, 8
	octave 3
	note G_, 8
	note A_, 8
	octave 4
	note D_, 6
	sound_loop 0, .mainloop

	sound_ret ; unused

Music_Routes1_Ch4::
.mainloop:
	drum_speed 12
	rest 4
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	drum_note 15, 2
	rest 4
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	drum_note 15, 2
	drum_note 15, 2
	drum_note 15, 2
	rest 4
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	drum_note 15, 2
	rest 4
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	drum_note 15, 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	drum_note 15, 2
	rest 4
	drum_note 15, 2
	drum_note 15, 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	drum_note 15, 2
	rest 4
	drum_note 15, 2
	drum_note 15, 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	drum_note 15, 2
	rest 4
	drum_note 15, 2
	drum_note 15, 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	drum_note 15, 2
	drum_note 15, 2
	rest 2
	drum_note 15, 2
	drum_note 15, 2
	sound_loop 0, .mainloop

	sound_ret ; unused
