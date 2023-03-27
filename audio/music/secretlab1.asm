Music_SecretLab_Ch1::
	tempo 144
	volume 7, 7
	duty_cycle 2
	toggle_perfect_pitch
	vibrato 10, 2, 4
	note_type 12, 12, 2
	octave 3
.mainloop
	sound_call SecretLab_MainMelody
	sound_loop 0, .mainloop

SecretLab_MainMelody::
	note E_, 8
	note D#, 8
	note B_, 8
	note A#, 8
	note G_, 8
	note G#, 8
	note A_, 8
	note A#, 8
	sound_ret

Music_SecretLab_Ch2::
	duty_cycle 2
	toggle_perfect_pitch
	vibrato 10, 2, 4
	note_type 12, 12, 2
.mainloop
	octave 3
.firstloop
	sound_call SecretLab_MainMelody
	sound_loop 4, .firstloop
	rest 4 ; now channel 2 is half a bar offset
.secondloop
	sound_call SecretLab_MainMelody
	sound_loop 3, .secondloop
	note E_, 8
	note D#, 8
	note B_, 8
	note A#, 8
	note G_, 8
	note G#, 8
	note A_, 8
	note A#, 4 ; now it's back in line
.thirdloop
; TODO: might remove this portion later
	rest 2
	octave 2
	note E_, 2
	octave 3
	note E_, 2
	octave 2
	note E_, 2
	rest 2
	octave 2
	note D#, 2
	octave 3
	note D#, 2
	octave 2
	note D#, 2
	rest 2
	octave 2
	note B_, 2
	octave 3
	note B_, 2
	octave 2
	note B_, 2
	rest 2
	octave 2
	note A#, 2
	octave 3
	note A#, 2
	octave 2
	note A#, 2
	rest 2
	octave 2
	note G_, 2
	octave 3
	note G_, 2
	octave 2
	note G_, 2
	rest 2
	octave 2
	note G#, 2
	octave 3
	note G#, 2
	octave 2
	note G#, 2
	rest 2
	octave 2
	note A_, 2
	octave 3
	note A_, 2
	octave 2
	note A_, 2
	rest 2
	octave 2
	note A#, 2
	octave 3
	note A#, 2
	octave 2
	note A#, 2
	sound_loop 4, .thirdloop
	sound_loop 0, .mainloop

Music_SecretLab_Ch3::
	note_type 12, 1, 1
	octave 2
.mainloop
	note E_, 16
	note E_, 16
	note D#, 16
	note D#, 16
	note G_, 16
	note G_, 16
	note G#, 16
	note D#, 16
	sound_loop 0, .mainloop

Music_SecretLab_Ch4::
	drum_speed 6
.mainloop
	drum_note 14, 8
	drum_note 12, 8
.sub1
	drum_note 13, 8
	drum_note 12, 8
	sound_loop 6, .sub1
	drum_note 5, 16
	sound_loop 0, .mainloop
