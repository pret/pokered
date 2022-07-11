SFX_Save_3_Ch5:
	duty_cycle 2
IF DEF(_RED)
	square_note 4, 15, 4, 1792
	square_note 3, 14, 4, 1664
	square_note 3, 14, 4, 1728
	square_note 3, 14, 4, 1792
	square_note 2, 14, 4, 1952
ELSE
	square_note 3, 14, 4, 1536
	square_note 3, 14, 4, 1664
	square_note 3, 14, 4, 1728
	square_note 3, 14, 4, 1792
	square_note 15, 15, 2, 2016
ENDC
	sound_ret

SFX_Save_3_Ch6:
	duty_cycle 2
IF DEF(_RED)
	square_note 4, 0, 8, 0
	square_note 3, 13, 4, 1793
	square_note 3, 12, 4, 1665
	square_note 3, 12, 4, 1729
	square_note 3, 12, 4, 1793
	square_note 2, 12, 4, 1953
ELSE
	square_note 3, 0, 8, 0
	square_note 3, 12, 4, 1537
	square_note 3, 12, 4, 1665
	square_note 3, 12, 4, 1729
	square_note 3, 12, 4, 1793
	square_note 15, 13, 2, 2017
ENDC
	sound_ret
