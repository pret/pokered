IF DEF(_BLUE)
SFX_Intro_Hip_Ch5:
	duty_cycle 2
	pitch_sweep 2, 6
	square_note 12, 12, 2, 1856
	pitch_sweep 0, 8
	sound_ret
ELSE
SFX_Intro_Hip_Ch8:
	noise_note 4, 13, 1, 65
	sound_ret
ENDC
