; ch 8
ArticunoIcyWindSFX::
	noise_note 15, 13, 7, 52
	sound_ret

ArticunoIcyWindSFX2::
	noise_note 15, 0, -7, 52
	sound_ret


; ch 5 or 6
ArticunoFreezesEverythingCh5::
	duty_cycle 3
	square_note 5, 14, 1, 1792
	square_note 3, 14, 1, 1920
	square_note 15, 15, 1, 1999
	sound_ret

ArticunoFreezesEverythingCh8::
	noise_note 7, 8, 1, 91
	noise_note 15, 10, 1, 92
	sound_ret