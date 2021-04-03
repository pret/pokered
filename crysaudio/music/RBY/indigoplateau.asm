Music_RBYIndigoPlateau::
	channel_count 4
	channel 1, Music_RBYIndigoPlateau_Ch1
	channel 2, Music_RBYIndigoPlateau_Ch2
	channel 3, Music_RBYIndigoPlateau_Ch3
	channel 4, Music_RBYIndigoPlateau_Ch4

Music_RBYIndigoPlateau_Ch1::
	tempo 132
	volume 7, 7
	duty_cycle 3
	vibrato 6, 3, 4
	toggle_perfect_pitch
	note_type 12, 11, 2
	octave 2
	note A_, 8
	note A_, 8
	note A_, 8
	note A_, 4
	note_type 12, 10, 4
	note A#, 4

Music_RBYIndigoPlateau_branch_a605::
	sound_call Music_RBYIndigoPlateau_branch_a659
	note_type 12, 11, 4
	octave 3
	note D_, 4
	sound_call Music_RBYIndigoPlateau_branch_a659
	note_type 12, 11, 4
	octave 3
	note D#, 4
	sound_call Music_RBYIndigoPlateau_branch_a659
	note_type 12, 11, 4
	octave 3
	note D_, 4
	sound_call Music_RBYIndigoPlateau_branch_a659
	note_type 12, 10, 0
	octave 2
	note A#, 4
	sound_call Music_RBYIndigoPlateau_branch_a659
	note_type 12, 11, 4
	octave 3
	note D_, 4
	note_type 12, 13, 4
	octave 3
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note_type 12, 11, 4
	octave 3
	note D#, 4
	note_type 12, 13, 4
	octave 3
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note_type 12, 11, 4
	octave 3
	note F_, 2
	note_type 12, 11, 4
	octave 3
	note G_, 2
	note_type 12, 11, 0
	note A_, 8
	octave 2
	note A_, 8
	note_type 12, 11, 7
	octave 3
	note F_, 8
	note_type 12, 4, -6
	octave 2
	note A#, 8
	sound_loop 0, Music_RBYIndigoPlateau_branch_a605

Music_RBYIndigoPlateau_branch_a659::
	note_type 12, 11, 2
	octave 2
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	sound_ret


Music_RBYIndigoPlateau_Ch2::
	duty_cycle 3
	vibrato 8, 2, 5
	note_type 12, 12, 2
	octave 3
	note D_, 8
	note D_, 8
	note D_, 8
	note D_, 4
	note_type 12, 5, -2
	note D#, 4

Music_RBYIndigoPlateau_branch_a673::
	sound_call Music_RBYIndigoPlateau_branch_a6af
	note_type 12, 12, 5
	note A_, 4
	sound_call Music_RBYIndigoPlateau_branch_a6af
	note_type 12, 12, 5
	note A#, 4
	sound_call Music_RBYIndigoPlateau_branch_a6af
	note_type 12, 12, 5
	note A_, 4
	sound_call Music_RBYIndigoPlateau_branch_a6af
	note_type 12, 12, 7
	note C#, 4
	sound_call Music_RBYIndigoPlateau_branch_a6af
	note_type 12, 12, 5
	note A_, 4
	sound_call Music_RBYIndigoPlateau_branch_a6af
	note_type 12, 12, 5
	note A#, 4
	sound_call Music_RBYIndigoPlateau_branch_a6af
	note_type 12, 12, 5
	octave 4
	note C_, 2
	note_type 12, 12, 7
	octave 4
	note C#, 2
	note D_, 8
	octave 3
	note D_, 8
	octave 4
	note C_, 8
	note_type 12, 4, -5
	octave 4
	note D#, 8
	sound_loop 0, Music_RBYIndigoPlateau_branch_a673

Music_RBYIndigoPlateau_branch_a6af::
	note_type 12, 12, 2
	octave 3
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 4
	sound_ret


Music_RBYIndigoPlateau_Ch3::
	note_type 12, 1, 0
	octave 4
	note D_, 2
	rest 6
	note D_, 2
	rest 6
	note D_, 2
	rest 6
	note D_, 2
	rest 2
	note D#, 4

Music_RBYIndigoPlateau_branch_a6c6::
	sound_call Music_RBYIndigoPlateau_branch_a6fe
	sound_call Music_RBYIndigoPlateau_branch_a6fe
	sound_call Music_RBYIndigoPlateau_branch_a6fe
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note F#, 4
	sound_call Music_RBYIndigoPlateau_branch_a6fe
	sound_call Music_RBYIndigoPlateau_branch_a6fe
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note A#, 1
	rest 1
	note A#, 1
	rest 1
	note A_, 8
	note D_, 8
	note A#, 8
	note D#, 8
	sound_loop 0, Music_RBYIndigoPlateau_branch_a6c6

Music_RBYIndigoPlateau_branch_a6fe::
	octave 4
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note D_, 2
	rest 2
	note A_, 4
	sound_ret


Music_RBYIndigoPlateau_Ch4::
	toggle_noise 1
	drum_speed 6
	drum_note 10, 16
	drum_note 10, 16
	drum_note 10, 16
	drum_note 10, 8
	drum_note 12, 1
	drum_note 12, 1
	drum_note 12, 1
	drum_note 12, 1
	drum_note 11, 1
	drum_note 11, 1
	drum_note 11, 1
	drum_note 11, 1

Music_RBYIndigoPlateau_branch_a728::
	sound_call Music_RBYIndigoPlateau_branch_a791
	sound_call Music_RBYIndigoPlateau_branch_a77e
	sound_call Music_RBYIndigoPlateau_branch_a791
	sound_call Music_RBYIndigoPlateau_branch_a7a8
	sound_call Music_RBYIndigoPlateau_branch_a791
	sound_call Music_RBYIndigoPlateau_branch_a77e
	sound_call Music_RBYIndigoPlateau_branch_a791
	sound_call Music_RBYIndigoPlateau_branch_a7a8
	sound_call Music_RBYIndigoPlateau_branch_a791
	sound_call Music_RBYIndigoPlateau_branch_a77e
	sound_call Music_RBYIndigoPlateau_branch_a791
	sound_call Music_RBYIndigoPlateau_branch_a7a8
	sound_call Music_RBYIndigoPlateau_branch_a77e
	sound_call Music_RBYIndigoPlateau_branch_a7a8
	drum_note 10, 16
	drum_note 10, 8
	drum_note 11, 8
	drum_note 10, 16
	drum_note 12, 1
	drum_note 12, 1
	drum_note 12, 1
	drum_note 12, 1
	drum_note 11, 1
	drum_note 12, 1
	drum_note 11, 1
	drum_note 12, 1
	drum_note 11, 1
	drum_note 11, 1
	drum_note 11, 1
	drum_note 11, 1
	drum_note 10, 1
	drum_note 10, 1
	drum_note 10, 1
	drum_note 10, 1
	sound_loop 0, Music_RBYIndigoPlateau_branch_a728

Music_RBYIndigoPlateau_branch_a77e::
	drum_note 10, 4
	drum_note 11, 4
	drum_note 12, 4
	drum_note 11, 4
	drum_note 10, 4
	drum_note 11, 4
	drum_note 12, 4
	drum_note 12, 2
	drum_note 11, 2
	sound_ret

Music_RBYIndigoPlateau_branch_a791::
	drum_note 10, 4
	drum_note 11, 4
	drum_note 12, 4
	drum_note 11, 4
	drum_note 10, 4
	drum_note 11, 4
	drum_note 12, 4
	drum_note 12, 1
	drum_note 12, 1
	drum_note 11, 1
	drum_note 11, 1
	sound_ret

Music_RBYIndigoPlateau_branch_a7a8::
	drum_note 10, 4
	drum_note 11, 4
	drum_note 10, 4
	drum_note 11, 4
	drum_note 10, 4
	drum_note 10, 4
	drum_note 12, 1
	drum_note 12, 1
	drum_note 12, 1
	drum_note 12, 1
	drum_note 11, 1
	drum_note 11, 1
	drum_note 11, 1
	drum_note 11, 1
	sound_ret
