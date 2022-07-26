SFX_Battle_27_Ch5:
	duty_cycle 2
	square_note 15, 3, -7, 1984
.loop1:
	square_note 15, 13, -7, 1984
	sound_loop 4, .loop1
	square_note 15, 13, 1, 1984
	sound_ret

SFX_Battle_27_Ch6:
	duty_cycle_pattern 2, 3, 0, 3
	square_note 15, 2, -7, 1992
.loop1:
	square_note 15, 12, -7, 1991
	sound_loop 4, .loop1
	square_note 15, 12, 1, 1992
	sound_ret

SFX_Battle_27_Ch8:
	noise_note 3, 9, 7, 18
	noise_note 3, 10, 1, 17
	sound_loop 10, SFX_Battle_27_Ch8
	sound_ret
