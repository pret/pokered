SFX_SecretLabNotesInit:
	execute_music
	tempo 144
	volume 7, 7
	duty_cycle 2
	toggle_perfect_pitch
	vibrato 10, 2, 4
	note_type 12, 15, 2
	octave 3
	sound_ret

SFX_SecretLabNotesD#::
	sound_call SFX_SecretLabNotesInit
	note D#, 8
	sound_ret

SFX_SecretLabNotesE::
	sound_call SFX_SecretLabNotesInit
	note E_, 8
	sound_ret

SFX_SecretLabNotesG::
	sound_call SFX_SecretLabNotesInit
	note G_, 8
	sound_ret

SFX_SecretLabNotesG#::
	sound_call SFX_SecretLabNotesInit
	note G#, 8
	sound_ret

SFX_SecretLabNotesA::
	sound_call SFX_SecretLabNotesInit
	note A_, 8
	sound_ret

SFX_SecretLabNotesA#::
	sound_call SFX_SecretLabNotesInit
	note A#, 8
	sound_ret

SFX_SecretLabNotesB::
	sound_call SFX_SecretLabNotesInit
	note B_, 8
	sound_ret