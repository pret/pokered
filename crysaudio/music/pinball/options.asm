Music_Options:
	channel_count 3
	channel 1, Music_Options_Ch1
	channel 2, Music_Options_Ch2
	channel 3, Music_Options_Ch3

Music_Options_Ch1:
	tempo 272
	volume 7, 7
	sound_ret

Music_Options_Ch2:
	duty_cycle 2
	pitch_offset 1
Music_Options_branch_49388:
	sound_call Music_Options_branch_49406
	volume_envelope 10, 2
	note A_, 1
	volume_envelope 5, 2
	note A_, 1
	volume_envelope 2, 2
	note A_, 2
	volume_envelope 10, 2
	note G#, 1
	volume_envelope 5, 2
	note G#, 1
	sound_call Music_Options_branch_49406
	volume_envelope 10, 2
	note B_, 1
	volume_envelope 5, 2
	note B_, 1
	volume_envelope 2, 2
	note B_, 2
	volume_envelope 10, 2
	octave 6
	note C#, 1
	volume_envelope 5, 2
	note C#, 1
	volume_envelope 10, 2
	note D#, 1
	volume_envelope 5, 2
	note D#, 1
	volume_envelope 10, 2
	octave 5
	note F#, 1
	volume_envelope 5, 2
	note F#, 1
	volume_envelope 10, 2
	note G#, 1
	volume_envelope 5, 2
	note G#, 1
	volume_envelope 10, 2
	note F#, 1
	volume_envelope 5, 2
	note F#, 1
	volume_envelope 2, 2
	note F#, 2
	volume_envelope 10, 2
	note A#, 1
	volume_envelope 5, 2
	note A#, 1
	volume_envelope 10, 2
	note G#, 1
	volume_envelope 5, 2
	note G#, 1
	volume_envelope 10, 2
	note F#, 1
	volume_envelope 5, 2
	note F#, 1
	volume_envelope 10, 2
	note F#, 1
	volume_envelope 5, 2
	note F#, 1
	volume_envelope 10, 2
	note F_, 1
	volume_envelope 5, 2
	note F_, 1
	volume_envelope 10, 2
	note E_, 1
	volume_envelope 5, 2
	note E_, 1
	volume_envelope 10, 2
	note D#, 1
	volume_envelope 5, 2
	note D#, 1
	volume_envelope 10, 2
	note C#, 1
	volume_envelope 5, 2
	note C#, 1
	volume_envelope 2, 2
	note C#, 4
	volume_envelope 10, 2
	note A_, 1
	volume_envelope 5, 2
	note A_, 1
	sound_loop 0, Music_Options_branch_49388

Music_Options_branch_49406:
	note_type 12, 10, 2
	octave 5
	note A#, 1
	volume_envelope 5, 2
	note A#, 1
	volume_envelope 10, 2
	note A_, 1
	volume_envelope 5, 2
	note A_, 1
	volume_envelope 10, 2
	note G#, 1
	volume_envelope 5, 2
	note G#, 1
	volume_envelope 10, 2
	note A#, 1
	volume_envelope 5, 2
	note A#, 1
	volume_envelope 2, 2
	note A#, 2
	sound_ret

Music_Options_Ch3:
	sound_call Music_Options_branch_494ac
	volume_envelope 2, 2
	octave 5
	note C#, 1
	volume_envelope 3, 2
	note C#, 1
	rest 2
	sound_call Music_Options_branch_494ac
	volume_envelope 2, 2
	octave 5
	note D_, 1
	volume_envelope 3, 2
	note D_, 1
	rest 2
	sound_call Music_Options_branch_494ac
	volume_envelope 2, 2
	octave 5
	note D#, 1
	volume_envelope 3, 2
	note D#, 1
	rest 2
	sound_call Music_Options_branch_494ac
	volume_envelope 2, 2
	octave 5
	note E_, 1
	volume_envelope 3, 2
	note E_, 1
	rest 2
	volume_envelope 2, 2
	octave 3
	note B_, 1
	volume_envelope 3, 2
	note B_, 1
	volume_envelope 2, 2
	octave 4
	note D#, 1
	volume_envelope 3, 2
	note D#, 1
	volume_envelope 2, 2
	note F#, 1
	volume_envelope 3, 2
	note F#, 1
	rest 2
	volume_envelope 2, 2
	note C_, 1
	volume_envelope 3, 2
	note C_, 1
	volume_envelope 2, 2
	note D#, 1
	volume_envelope 3, 2
	note D#, 1
	volume_envelope 2, 2
	note F#, 1
	volume_envelope 3, 2
	note F#, 1
	rest 2
	volume_envelope 2, 2
	note C#, 1
	volume_envelope 3, 2
	note C#, 1
	volume_envelope 2, 2
	note F_, 1
	volume_envelope 3, 2
	note F_, 1
	volume_envelope 2, 2
	note G#, 1
	volume_envelope 3, 2
	note G#, 1
	volume_envelope 2, 2
	note F_, 1
	volume_envelope 3, 2
	note F_, 1
	volume_envelope 2, 2
	note G#, 1
	volume_envelope 3, 2
	note G#, 1
	volume_envelope 2, 2
	note F_, 1
	volume_envelope 3, 2
	note F_, 1
	volume_envelope 2, 2
	note G#, 1
	volume_envelope 3, 2
	note G#, 1
	volume_envelope 2, 2
	note B_, 1
	volume_envelope 3, 2
	note B_, 1
	sound_loop 0, Music_Options_Ch3

Music_Options_branch_494ac:
	note_type 12, 2, 2
	octave 4
	note F#, 1
	volume_envelope 3, 2
	note F#, 1
	volume_envelope 2, 2
	note A#, 1
	volume_envelope 3, 2
	note A#, 1
	sound_ret
