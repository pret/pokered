Music_Cities1_Ch1_AlternateTempo::
	tempo 232
	sound_loop 0, Music_Cities1_Ch1.body

Music_Cities1_Ch1::
	tempo 144
.body:
	volume 7, 7
	vibrato 8, 2, 4
	duty_cycle 3
.mainloop:
	note_type 12, 12, 5
	octave 3
	note G#, 4
	note F#, 4
	note E_, 2
	note E_, 2
	note F#, 2
	note D#, 2
	note E_, 2
	note E_, 2
	note D#, 2
	note C#, 4
	note D#, 4
	note E_, 2
	note D#, 4
	note C#, 2
	note E_, 2
	note E_, 4
	note_type 12, 10, 5
	note C#, 4
	octave 2
	note B_, 6
	octave 3
	note C#, 2
	note C#, 4
	octave 2
	note B_, 4
	note_type 12, 12, 5
	sound_call .sub1
	octave 3
	note D#, 6
	note E_, 2
	octave 2
	note B_, 4
	note_type 12, 10, 5
	octave 3
	note C#, 2
	octave 2
	note B_, 2
	note A_, 4
	note B_, 4
	note B_, 2
	octave 3
	note C#, 2
	note D#, 2
	note E_, 2
	note D#, 2
	note C#, 2
	note D#, 2
	note_type 12, 12, 5
	note G#, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note E_, 4
	note F#, 2
	note D#, 2
	note E_, 4
	note D#, 2
	note C#, 4
	note D#, 4
	note E_, 2
	note D#, 2
	note C#, 2
	note C#, 2
	note E_, 2
	note E_, 4
	note_type 12, 10, 5
	note C#, 2
	octave 2
	note A_, 2
	note B_, 6
	octave 3
	note C#, 2
	note C#, 2
	octave 2
	note B_, 2
	note B_, 4
	note_type 12, 12, 5
	sound_call .sub1
	octave 3
	note D#, 4
	note D#, 2
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note C#, 2
	note G#, 2
	note E_, 4
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	note_type 12, 10, 5
	note C#, 4
	octave 2
	note B_, 2
	octave 3
	note D#, 4
	note C#, 2
	note E_, 4
	note_type 12, 11, 3
	sound_call .sub2
	note A_, 2
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 4
	note F#, 4
	note G#, 2
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 4
	note G#, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note D#, 2
	note E_, 2
	note D#, 2
	note C#, 2
	octave 2
	note B_, 2
	octave 3
.loop1:
	note C#, 2
	note D#, 2
	note C#, 2
	octave 2
	note B_, 4
	note B_, 2
	octave 3
	note C#, 2
	note D#, 2
	sound_loop 2, .loop1
	note E_, 2
	octave 2
	note B_, 4
	octave 3
	note E_, 4
	octave 2
	note B_, 2
	octave 3
	note C#, 2
	note G#, 2
	note G#, 2
	octave 2
	note B_, 2
	octave 3
	note F#, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	octave 2
	note B_, 2
	octave 3
	sound_call .sub2
	note A_, 2
	note E_, 2
	note A_, 2
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note F#, 2
	note G#, 2
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note D#, 2
	note B_, 2
	note E_, 2
	note G#, 2
	note E_, 2
	note F#, 2
	note E_, 4
	note G#, 2
	note F#, 2
	note D#, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 4
	note F#, 2
	note D#, 2
	note D#, 2
	note F#, 2
	octave 2
	note B_, 2
	octave 3
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	octave 2
	note B_, 2
	note B_, 2
	octave 3
	note D#, 2
	note_type 12, 11, 6
	note F#, 8
	note F#, 4
	note D#, 4
	note E_, 8
	note_type 12, 8, 4
	octave 2
	note B_, 4
	octave 3
	note E_, 2
	note F#, 2
	sound_loop 0, .mainloop

.sub1:
	octave 3
	note F#, 2
	note D#, 4
	note E_, 2
	note D#, 4
	note C#, 4
	octave 2
	note B_, 4
	octave 3
	note C#, 2
	note D#, 2
	note C#, 2
	sound_ret

.sub2:
	note A_, 2
	note E_, 2
	note C#, 2
	note E_, 4
	note A_, 2
	note C#, 2
	note E_, 2
	sound_ret

Music_Cities1_Ch2::
.mainloop:
	vibrato 5, 1, 5
	sound_call .sub1
	octave 4
	note G#, 2
	note_type 12, 12, 4
	note E_, 6
	note_type 12, 12, 5
	duty_cycle 3
	octave 3
	note C#, 4
	note D#, 4
	note E_, 6
	note F#, 6
	note G#, 4
	sound_call .sub1
	octave 4
	note G#, 2
	note_type 12, 12, 4
	note E_, 14
	duty_cycle 3
	octave 3
	note E_, 6
	note F#, 6
	note G#, 4
	note_type 12, 11, 7
	duty_cycle 2
	vibrato 8, 1, 7
	octave 5
	note C#, 12
	octave 4
	note A_, 4
	octave 5
	note E_, 8
	note F#, 2
	note E_, 2
	note D#, 2
	note C#, 2
	octave 4
	note B_, 12
	note G#, 4
	note B_, 16
	note F#, 12
	note G#, 2
	note A_, 2
	note B_, 4
	note A_, 4
	note G#, 4
	note F#, 4
	note G#, 12
	note E_, 4
	note B_, 16
	octave 5
	note C#, 12
	note D#, 2
	note E_, 2
	note F#, 4
	note E_, 4
	note D#, 4
	note C#, 4
	octave 4
	note B_, 12
	octave 5
	note C#, 2
	note D#, 2
	note C#, 4
	octave 4
	note B_, 4
	note A_, 4
	note G#, 4
	note A_, 12
	note B_, 2
	octave 5
	note C_, 2
	note C_, 4
	octave 4
	note B_, 4
	note A_, 4
	note F#, 4
	note_type 12, 11, 7
	note A_, 8
	octave 5
	note C_, 8
	octave 4
	note B_, 14
	note_type 12, 8, 4
	note G#, 1
	note_type 12, 10, 4
	note A_, 1
	sound_loop 0, .mainloop

.sub1:
	duty_cycle 2
	note_type 12, 12, 3
	octave 4
	note B_, 4
	note A_, 4
	note_type 12, 12, 4
	note G#, 10
	note_type 12, 12, 3
	note G#, 2
	note A_, 2
	note B_, 4
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note_type 12, 12, 4
	note F#, 10
	note_type 12, 12, 5
	duty_cycle 3
	octave 3
	note E_, 4
	note D#, 8
	note E_, 4
	note F#, 4
	note_type 12, 12, 3
	duty_cycle 2
	octave 4
	note A_, 4
	note G#, 4
	note_type 12, 12, 4
	note F#, 10
	note_type 12, 12, 3
	note F#, 2
	note G#, 2
	note A_, 4
	note A_, 2
	note G#, 2
	note F#, 2
	sound_ret

Music_Cities1_Ch3::
	note_type 12, 1, 1
	toggle_perfect_pitch
.mainloop:
	vibrato 0, 0, 0
	octave 4
	sound_call .sub1
	sound_call .sub1
	sound_call .sub2
	note G#, 2
	note E_, 2
	note F#, 2
	note G#, 2
	rest 2
	note E_, 2
	note F#, 2
	note G#, 2
	sound_call .sub1
	note B_, 2
	note E_, 2
	note F#, 2
	note G#, 2
	rest 2
	note E_, 2
	note F#, 2
	note G#, 2
	sound_call .sub1
	sound_call .sub2
	note G#, 2
	note E_, 2
	note F#, 2
	note G#, 2
	rest 2
	note G#, 2
	note E_, 2
	note B_, 2
	rest 2
	note E_, 2
	note F#, 2
	note E_, 2
	note G#, 2
	note E_, 2
	note B_, 2
	note E_, 2
	vibrato 8, 2, 5
	note A_, 8
	note E_, 8
	note A_, 8
	note F#, 8
	note G#, 8
	note E_, 8
	note G#, 12
	note E_, 4
	note F#, 2
	note F#, 2
	note D#, 2
	note E_, 4
	note F#, 2
	note D#, 2
	note E_, 2
	note F#, 2
	note F#, 2
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note G#, 2
	note E_, 2
	note G#, 2
	rest 2
	note E_, 2
	note F#, 2
	note G#, 2
	rest 2
	note E_, 2
	note F#, 2
	note G#, 2
	note B_, 2
	note A_, 2
	note G#, 2
	note F#, 2
	note A_, 8
	note E_, 8
	note A_, 8
	note B_, 2
	note A_, 2
	note G#, 2
	note F#, 2
	note G#, 8
	note E_, 8
	note B_, 4
	note E_, 4
	note F#, 4
	note G#, 4
	rest 2
	note D#, 2
	note E_, 2
	note F#, 2
	rest 2
	note F#, 2
	note B_, 2
	note A_, 2
	note A_, 4
	note G#, 4
	note F#, 2
	note D#, 2
	note A_, 2
	note F#, 2
	rest 2
	note E_, 2
	note F#, 2
	note G#, 2
	rest 2
	note E_, 2
	note F#, 1
	note G#, 1
	note E_, 1
	note F#, 1
	note G#, 4
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note G#, 2
	note F#, 2
	sound_loop 0, .mainloop

.sub1:
	rest 2
	note E_, 2
	note F#, 2
	note G#, 2
	rest 2
	note E_, 2
	note F#, 2
	note G#, 2
	sound_ret

.sub2:
	note A_, 2
	note F#, 2
	note G#, 2
	note A_, 2
	rest 2
	note A_, 2
	note G#, 2
	note F#, 2
	rest 2
	note F#, 2
	note G#, 2
	note A_, 2
	rest 2
	note A_, 2
	note G#, 2
	note F#, 2
	note D#, 2
	note D#, 2
	note E_, 2
	note F#, 2
	rest 2
	note D#, 2
	note E_, 2
	note F#, 2
	rest 2
	note D#, 2
	note E_, 2
	note F#, 2
	rest 2
	note D#, 2
	note E_, 2
	note F#, 2
	sound_ret

Music_Cities1_Ch4::
.mainloop:
	drum_speed 12
	sound_call .sub1
.loop1:
	sound_call .sub1
	sound_call .sub2
	sound_call .sub2
	sound_loop 2, .loop1
	sound_call .sub1
	sound_call .sub4
	sound_call .sub3
	drum_note 6, 6
	drum_note 6, 6
	drum_note 7, 4
	sound_call .sub5
	sound_call .sub4
	sound_call .sub3
	sound_call .sub5
	sound_call .sub3
	drum_note 6, 6
	drum_note 6, 6
	drum_note 7, 2
	drum_note 6, 2
	drum_note 6, 6
	drum_note 6, 6
	drum_note 6, 4
	drum_note 6, 6
	drum_note 8, 6
	drum_note 8, 4
	sound_loop 0, .mainloop

.sub1:
	drum_note 8, 6
	drum_note 8, 6
	drum_note 8, 4
	drum_note 8, 6
	drum_note 8, 6
	drum_note 8, 2
	drum_note 8, 2
	sound_ret

.sub2:
	drum_note 8, 6
	drum_note 8, 6
	drum_note 8, 4
	drum_note 8, 6
	drum_note 8, 6
	drum_note 8, 4
	sound_ret

.sub3:
	drum_note 6, 6
	drum_note 6, 6
	drum_note 7, 4
	drum_note 6, 6
	drum_note 6, 6
	drum_note 7, 4
	sound_ret

.sub4:
	drum_note 6, 6
	drum_note 6, 6
	drum_note 7, 4
	drum_note 6, 6
	drum_note 6, 6
	drum_note 7, 2
	drum_note 6, 2
	sound_ret

.sub5:
	drum_note 6, 6
	drum_note 6, 6
	drum_note 7, 2
	drum_note 7, 2
	sound_ret
