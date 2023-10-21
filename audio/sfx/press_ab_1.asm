SFX_Press_AB_1_Ch5:
	duty_cycle 2
	square_note 0, 9, 1, 1984
	square_note 0, 8, 1, 2000
	square_note 0, 9, 1, 1984
	square_note 12, 10, 1, 2000
	sound_ret

SFX_Get_On_Bike_1_Ch5::
	duty_cycle 2
	sound_call .ring
	sound_call .ring
	sound_ret
.ring
	square_note 1, 6, 1, 1990
	square_note 1, 6, 1, 1990
	square_note 1, 6, 1, 1990
	square_note 5, 8, 1, 1990
	sound_ret