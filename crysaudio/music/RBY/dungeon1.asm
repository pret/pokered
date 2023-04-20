Music_Dungeon1::
	channel_count 4
	channel 1, Music_Dungeon1_Ch1
	channel 2, Music_Dungeon1_Ch2
	channel 3, Music_Dungeon1_Ch3
	channel 4, Music_Dungeon1_Ch4

Music_Dungeon1_Ch1::
	tempo 144
	volume 7, 7
	duty_cycle 3
	toggle_perfect_pitch
	vibrato 10, 1, 4
	note_type 12, 4, -5
	rest 8
	;stereo_panning %1110, %1101
	stereo_panning FALSE, TRUE
	octave 4
	note F#, 8
	;stereo_panning %1111, %1111
	stereo_panning TRUE, TRUE

Music_Dungeon1_branch_7dee5::
	note_type 12, 11, 2
	octave 3

Music_Dungeon1_branch_7dee8::
	sound_call Music_Dungeon1_branch_7dfaa
	sound_loop 3, Music_Dungeon1_branch_7dee8
	note E_, 1
	note D#, 1
	note B_, 1
	note A#, 1
	note G_, 1
	note G#, 1
	rest 1
	note A#, 1
	note E_, 1
	note D#, 1
	note B_, 1
	note A#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1

Music_Dungeon1_branch_7deff::
	sound_call Music_Dungeon1_branch_7dfaa
	sound_loop 4, Music_Dungeon1_branch_7deff
	sound_call Music_Dungeon1_branch_7dfd5
	octave 3
	note G_, 1
	note F#, 1
	note E_, 1
	note G_, 1
	sound_call Music_Dungeon1_branch_7dfd5
	octave 3
	note A_, 1
	note G_, 1
	note E_, 1
	note A_, 1
	sound_call Music_Dungeon1_branch_7dfd5
	octave 3
	note B_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note_type 12, 12, 3
	note G_, 4
	note F#, 4
	note E_, 4
	note D#, 4
	note_type 12, 12, 2
	sound_call Music_Dungeon1_branch_7dfc5
	octave 3
	note B_, 3
	sound_call Music_Dungeon1_branch_7dfc5
	note C_, 3
	sound_call Music_Dungeon1_branch_7dfc5
	note C#, 3
	note_type 12, 12, 3
	octave 3
	note G_, 4
	note F#, 4
	note E_, 4
	note D#, 4
	note E_, 4
	note D#, 4
	note C_, 4
	octave 2
	note B_, 4
	note_type 12, 12, 2
	note B_, 1
	note A#, 1
	note G_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note G_, 1
	note A#, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note G#, 1
	note B_, 1
	octave 3
	note C_, 1
	octave 2
	note B_, 1
	note G#, 1
	note B_, 1
	octave 3
	note C#, 1
	note C_, 1
	octave 2
	note A_, 1
	octave 3
	note C_, 1
	note C#, 1
	note C_, 1
	octave 2
	note A_, 1
	octave 3
	note C_, 1
	note D_, 1
	note C#, 1
	octave 2
	note A#, 1
	octave 3
	note C#, 1
	note D_, 1
	note C#, 1
	octave 2
	note A#, 1
	octave 3
	note C#, 1

Music_Dungeon1_branch_7df6e::
	rest 16
	sound_loop 8, Music_Dungeon1_branch_7df6e
	note_type 12, 12, 3
	sound_call Music_Dungeon1_branch_7dfbb
	note B_, 2
	note G_, 2
	octave 3
	note C#, 4
	octave 2
	note G_, 2
	note A_, 4
	note F#, 2
	sound_call Music_Dungeon1_branch_7dfbb
	note A#, 2
	note G_, 2
	note B_, 4
	note G_, 2
	note F#, 2
	note G_, 2
	note D#, 2
	note_type 12, 12, 2
	sound_call Music_Dungeon1_branch_7dfc5
	octave 3
	note B_, 3
	sound_call Music_Dungeon1_branch_7dfc5
	note C_, 3
	sound_call Music_Dungeon1_branch_7dfc5
	note C#, 3
	note_type 12, 12, 7
	octave 3
	note F#, 8
	note D#, 8
	note_type 12, 12, 2
	sound_call Music_Dungeon1_branch_7dfaa
	sound_call Music_Dungeon1_branch_7dfaa
	sound_loop 0, Music_Dungeon1_branch_7dee5

Music_Dungeon1_branch_7dfaa::
	note E_, 1
	note D#, 1
	note B_, 1
	note A#, 1
	note G_, 1
	note G#, 1
	rest 1
	note A#, 1
	note E_, 1
	note D#, 1
	note B_, 1
	note A#, 1
	note G_, 1
	note G#, 1
	rest 1
	note A#, 1
	sound_ret

Music_Dungeon1_branch_7dfbb::
	octave 2
	note G_, 2
	note A#, 4
	note G_, 2
	octave 3
	note C#, 4
	octave 2
	note G_, 2
	note A#, 2
	sound_ret

Music_Dungeon1_branch_7dfc5::
	octave 3
	note E_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note G_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A#, 1
	note E_, 1
	note B_, 1
	note E_, 1
	octave 4
	note C_, 1
	sound_ret

Music_Dungeon1_branch_7dfd5::
	note E_, 1
	note E_, 1
	rest 4
	octave 1
	note E_, 1
	rest 3
	note E_, 1
	rest 1
	sound_ret


Music_Dungeon1_Ch2::
	vibrato 11, 1, 5
	duty_cycle 3
	note_type 12, 0, -7
	octave 4
	note G#, 8
	stereo_panning TRUE, FALSE
	note_type 12, 4, -5
	octave 5
	note D_, 8
	stereo_panning TRUE, TRUE

Music_Dungeon1_branch_7dfeb::
	note_type 12, 12, 2

Music_Dungeon1_branch_7dfed::
	sound_call Music_Dungeon1_branch_7e097
	sound_loop 3, Music_Dungeon1_branch_7dfed
	octave 2
	note E_, 1
	note E_, 1
	note B_, 1
	octave 3
	note C_, 1
	rest 2
	note C_, 1
	octave 2
	note B_, 1
	note E_, 1
	note E_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note D#, 1

Music_Dungeon1_branch_7e006::
	sound_call Music_Dungeon1_branch_7e097
	sound_loop 4, Music_Dungeon1_branch_7e006
	rest 2
	sound_call Music_Dungeon1_branch_7e0ab
	octave 3
	note C_, 4
	sound_call Music_Dungeon1_branch_7e0ab
	octave 3
	note C#, 4
	sound_call Music_Dungeon1_branch_7e0ab
	octave 3
	note D#, 4
	note_type 12, 13, 3
	octave 4
	note E_, 4
	note D#, 4
	note C_, 4
	octave 3
	note B_, 4
	note_type 12, 13, 2
	sound_call Music_Dungeon1_branch_7e0b5
	octave 3
	note F#, 4
	sound_call Music_Dungeon1_branch_7e0b5
	octave 3
	note G_, 4
	sound_call Music_Dungeon1_branch_7e0b5
	octave 3
	note A#, 4
	note_type 12, 13, 3
	octave 4
	note E_, 4
	note D#, 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	note G_, 4
	note F#, 2
	note_type 12, 13, 6
	note E_, 8
	note F_, 8
	note F#, 8
	note G_, 8
	note_type 12, 13, 2
	sound_call Music_Dungeon1_branch_7e0ba
	rest 10
	note E_, 1
	rest 1
	sound_call Music_Dungeon1_branch_7e0ba
	rest 12
	sound_call Music_Dungeon1_branch_7e0ba
	rest 12
	sound_call Music_Dungeon1_branch_7e0ba
	rest 14
	note_type 12, 13, 3
	sound_call Music_Dungeon1_branch_7e0cd
	note D#, 4
	sound_call Music_Dungeon1_branch_7e0cd
	note D#, 2
	rest 2
	note_type 12, 13, 2
	sound_call Music_Dungeon1_branch_7e0c0
	rest 2
	octave 3
	note F#, 4
	octave 2
	note E_, 1
	note E_, 1
	octave 3
	note B_, 1
	rest 1
	octave 4
	note C_, 1
	rest 1
	note C#, 1
	rest 1
	note D_, 1
	note C#, 1
	rest 2
	octave 3
	note G_, 4
	sound_call Music_Dungeon1_branch_7e0c0
	octave 3
	note A#, 4
	note_type 12, 13, 6
	note B_, 8
	octave 4
	note D#, 8
	note_type 12, 13, 2
	sound_call Music_Dungeon1_branch_7e097
	sound_call Music_Dungeon1_branch_7e097
	sound_loop 0, Music_Dungeon1_branch_7dfeb

Music_Dungeon1_branch_7e097::
	octave 2
	note E_, 1
	note E_, 1
	note B_, 1
	octave 3
	note C_, 1
	rest 2
	note C_, 1
	octave 2
	note B_, 1
	note E_, 1
	note E_, 1
	note B_, 1
	octave 3
	note C_, 1
	rest 2
	note C_, 1
	octave 2
	note B_, 1
	sound_ret

Music_Dungeon1_branch_7e0ab::
	octave 2
	note E_, 1
	note E_, 1
	rest 2
	octave 1
	note E_, 1
	rest 3
	note E_, 1
	rest 3
	sound_ret

Music_Dungeon1_branch_7e0b5::
	octave 2
	note E_, 1
	note E_, 1
	rest 10
	sound_ret

Music_Dungeon1_branch_7e0ba::
	octave 1
	note E_, 1
	note G_, 1
	note E_, 1
	note D#, 1
	sound_ret

Music_Dungeon1_branch_7e0c0::
	octave 2
	note E_, 1
	note E_, 1
	octave 4
	note E_, 1
	rest 1
	note D#, 1
	rest 1
	note D_, 1
	rest 1
	note C#, 1
	note C_, 1
	sound_ret

Music_Dungeon1_branch_7e0cd::
	octave 3
	note E_, 6
	note G_, 6
	note E_, 4
	note A_, 6
	octave 4
	note C_, 6
	octave 3
	note B_, 4
	note G_, 6
	note A#, 6
	note F#, 4
	note E_, 6
	note F#, 6
	sound_ret


Music_Dungeon1_Ch3::
	note_type 12, 1, 1
	vibrato 8, 2, 6
	rest 14
	octave 4
	note D_, 1
	note D#, 1

Music_Dungeon1_branch_7e0e5::
	sound_call Music_Dungeon1_branch_7e140
	sound_call Music_Dungeon1_branch_7e140
	octave 5
	note E_, 2
	rest 4
	octave 3
	note E_, 1
	rest 3
	note E_, 1
	rest 1
	octave 4
	note F#, 4
	sound_call Music_Dungeon1_branch_7e154
	octave 4
	note G_, 4
	sound_call Music_Dungeon1_branch_7e154
	octave 4
	note A_, 4
	note B_, 4
	note A#, 4
	note G_, 4
	note F#, 4
	rest 6
	sound_call Music_Dungeon1_branch_7e177
	note B_, 4
	note A#, 4
	note G_, 4
	note F#, 4
	note G_, 4
	note F#, 4
	note E_, 4
	note D#, 4
	sound_call Music_Dungeon1_branch_7e15e
	rest 12
	sound_call Music_Dungeon1_branch_7e15e
	rest 12
	sound_call Music_Dungeon1_branch_7e15e
	rest 10
	note E_, 1
	rest 1
	sound_call Music_Dungeon1_branch_7e15e
	rest 12
	sound_call Music_Dungeon1_branch_7e15e
	rest 12
	sound_call Music_Dungeon1_branch_7e15e
	rest 10
	note D_, 1
	note D#, 1
	sound_call Music_Dungeon1_branch_7e164
	sound_call Music_Dungeon1_branch_7e164
	note E_, 2
	rest 4
	sound_call Music_Dungeon1_branch_7e177
	note B_, 8
	note F#, 6
	note D_, 1
	note D#, 1
	rest 16
	rest 16
	sound_loop 0, Music_Dungeon1_branch_7e0e5

Music_Dungeon1_branch_7e140::
	octave 5
	note E_, 4
	note B_, 4
	note A#, 4
	octave 6
	note D_, 4
	note C#, 4
	octave 5
	note G#, 4
	note G_, 4
	note B_, 4
	note A#, 4
	note E_, 4
	note D#, 4
	note A_, 4
	note G#, 4
	note E_, 4
	note F#, 4
	note D#, 4
	sound_ret

Music_Dungeon1_branch_7e154::
	octave 6
	note E_, 1
	note E_, 1
	rest 4
	octave 3
	note E_, 1
	rest 3
	note E_, 1
	rest 1
	sound_ret

Music_Dungeon1_branch_7e15e::
	octave 3
	note E_, 1
	note G_, 1
	note E_, 1
	note D#, 1
	sound_ret

Music_Dungeon1_branch_7e164::
	note E_, 4
	note B_, 4
	note A#, 4
	octave 4
	note D_, 4
	note C#, 4
	octave 3
	note G#, 4
	note G_, 4
	note B_, 4
	note A#, 4
	note E_, 4
	note D#, 4
	note A_, 4
	note G#, 4
	note E_, 4
	note F#, 4
	note D#, 4
	sound_ret

Music_Dungeon1_branch_7e177::
	octave 4
	note E_, 1
	rest 3
	note E_, 1
	rest 1
	note F#, 4
	rest 6
	note E_, 1
	rest 3
	note E_, 1
	rest 1
	note G_, 4
	rest 6
	note E_, 1
	rest 3
	note E_, 1
	note E_, 1
	note A#, 4
	sound_ret


Music_Dungeon1_Ch4::
	toggle_noise 1
	drum_speed 12
	rest 14
	drum_note 5, 1
	drum_note 5, 1

Music_Dungeon1_branch_7e190::
	sound_call Music_Dungeon1_branch_7e1f1
	sound_loop 3, Music_Dungeon1_branch_7e190
	drum_note 6, 4
	drum_note 5, 4
	drum_note 6, 4
	drum_note 5, 2
	drum_note 5, 2

Music_Dungeon1_branch_7e1a1::
	sound_call Music_Dungeon1_branch_7e1f1
	sound_loop 3, Music_Dungeon1_branch_7e1a1
	drum_note 6, 4
	drum_note 5, 4
	drum_note 6, 4
	drum_note 6, 4

Music_Dungeon1_branch_7e1b0::
	sound_call Music_Dungeon1_branch_7e1fa
	sound_loop 3, Music_Dungeon1_branch_7e1b0
	sound_call Music_Dungeon1_branch_7e202

Music_Dungeon1_branch_7e1ba::
	sound_call Music_Dungeon1_branch_7e1fa
	sound_loop 3, Music_Dungeon1_branch_7e1ba
	sound_call Music_Dungeon1_branch_7e202
	drum_note 2, 4
	drum_note 3, 4
	drum_note 3, 4
	rest 2
	drum_note 2, 2
	drum_note 6, 4

Music_Dungeon1_branch_7e1cf::
	rest 16
	sound_loop 13, Music_Dungeon1_branch_7e1cf
	rest 12

Music_Dungeon1_branch_7e1d5::
	sound_call Music_Dungeon1_branch_7e1fa
	sound_loop 3, Music_Dungeon1_branch_7e1d5
	drum_note 5, 4
	drum_note 5, 4
	drum_note 5, 4
	rest 2
	drum_note 5, 1
	drum_note 5, 1
	sound_call Music_Dungeon1_branch_7e1f1
	sound_call Music_Dungeon1_branch_7e1f1
	sound_loop 0, Music_Dungeon1_branch_7e190

Music_Dungeon1_branch_7e1f1::
	drum_note 6, 4
	drum_note 5, 4
	drum_note 6, 4
	drum_note 5, 4
	sound_ret

Music_Dungeon1_branch_7e1fa::
	drum_note 5, 1
	drum_note 5, 1
	rest 10
	drum_note 7, 4
	sound_ret

Music_Dungeon1_branch_7e202::
	drum_note 2, 4
	drum_note 3, 4
	drum_note 3, 4
	drum_note 4, 4
	sound_ret
