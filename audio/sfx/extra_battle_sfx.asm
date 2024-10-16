; PureRGBnote: ADDED: sound effect from gold/silver/crystal, used for the master ball visual effect in those games, but in PureRGB it's used in the
; THE MAW battle for when Cubone gets powered up.
SFX_Sparkle_Ch5::
SFX_Sparkle_Ch6::
	execute_music
	duty_cycle 1
	note_type 2, 14, 1
	octave 6
	note B_, 2
	octave 7
	note D_, 2
	octave 6
	note B_, 2
	note G_, 2
	note B_, 2
	note A#, 2
	note A_, 2
	note A#, 2
	note A_, 2
	volume_envelope 12, 1
	note G#, 2
	note G_, 2
	note F#, 2
	volume_envelope 9, 1
	note F_, 2
	note E_, 2
	note D#, 2
	volume_envelope 6, 1
	note D_, 2
	note C#, 2
	note C_, 2
	sound_ret
