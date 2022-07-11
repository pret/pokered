SFX_Battle_36_Ch5:
	duty_cycle 0
	square_note 2, 15, 1, 1920
	square_note 2, 15, 1, 1792
	square_note 2, 15, 1, 1936
	square_note 2, 15, 1, 1792
	square_note 2, 15, 1, 1952
	square_note 2, 15, 1, 1792
	square_note 2, 15, 1, 1968
	square_note 2, 15, 1, 1792
	square_note 2, 15, 1, 1984
	square_note 2, 15, 1, 1792
	square_note 2, 15, 1, 2000
.loop1:
	square_note 2, 15, 1, 1792
	square_note 2, 15, 1, 2016
	sound_loop 12, .loop1
	square_note 15, 15, 1, 1792
	sound_ret

SFX_Battle_36_Ch6:
	duty_cycle_pattern 2, 3, 0, 3
	square_note 2, 15, 1, 1921
	square_note 2, 15, 1, 1793
	square_note 2, 15, 1, 1937
	square_note 2, 15, 1, 1793
	square_note 2, 15, 1, 1953
	square_note 2, 15, 1, 1793
	square_note 2, 15, 1, 1969
	square_note 2, 15, 1, 1793
	square_note 2, 15, 1, 1985
	square_note 2, 15, 1, 1793
	square_note 2, 15, 1, 2001
	square_note 2, 15, 1, 1793
	square_note 2, 15, 1, 2017
	sound_loop 12, SFX_Battle_36_Ch5.loop1
	square_note 15, 15, 1, 1793
	sound_ret

SFX_Battle_36_Ch8:
	noise_note 1, 13, 1, 73
	noise_note 1, 13, 1, 41
	sound_loop 26, SFX_Battle_36_Ch8
	sound_ret
