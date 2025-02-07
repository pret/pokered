SFX_Intro_Whoosh_Ch8:
IF DEF(_BLUE)
	noise_note 4, 2, -4, 32
	noise_note 3, 10, 0, 32
	noise_note 3, 11, 0, 33
	noise_note 3, 12, 0, 34
	noise_note 15, 13, 2, 36
ELSE
	noise_note 8, 3, -4, 32
	noise_note 6, 10, 0, 32
	noise_note 8, 11, 0, 33
	noise_note 10, 12, 0, 34
	noise_note 15, 13, 2, 35
ENDC
	sound_ret
