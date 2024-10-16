; PureRGBnote: ADDED: various new sound effects that are used in the volcano.
SFX_Drill::
	; channel 8
	noise_note 15, 10, 4, 73
	sound_loop 4, SFX_Drill
	noise_note 0,0,0,0
	sound_ret

SFX_Power_Drill::
	; channel 8
	noise_note 15, 10, 4, 75
	sound_ret

SFX_Volcano_Rumble::
	; channel 8
	noise_note 15, 7, 7, 86
	sound_loop 8, SFX_Volcano_Rumble
	noise_note 15, 6, 7, 86
	noise_note 15, 4, 7, 86
	noise_note 15, 3, 7, 86
	noise_note 15, 1, 7, 86
	sound_ret

SFX_Drilled_Hole::
	; channel 8
	noise_note 15, 13, 3, 69
	sound_ret

SFX_Explode_Rocks::
	noise_note 4, 15, -7, 112
	noise_note 1, 0, 0, 0
	noise_note 4, 15, -7, 113
	noise_note 1, 0, 0, 0
	sound_loop 6, SFX_Explode_Rocks
	noise_note 15, 15, -7, 111
	noise_note 8, 15, 2, 111
	noise_note 6, 15, -7, 112
	noise_note 6, 15, -7, 113
	noise_note 8, 15, -7, 114
	noise_note 15, 15, 2, 114
	sound_ret

SFX_Lava_Flows::
	noise_note 10, 13, 5, 113
	noise_note 1, 0, 0, 0
	sound_loop 2, SFX_Lava_Flows
SFX_Lava_Splash::
	noise_note 15, 13, 7, 23
	sound_ret

SFX_Melt_Rocks::
	noise_note 7, 15, 3, 53
	noise_note 9, 15, 6, 69
	sound_loop 4, SFX_Melt_Rocks
SFX_Fire_Powerup::
	noise_note 15, 15, -7, 125
	noise_note 15, 15, 7, 126
	sound_ret

SFX_Drill_PowerUp::
	; channel 8
	noise_note 3, 10, 4, 73
	noise_note 3, 10, 4, 73
	noise_note 3, 10, 4, 72
	noise_note 3, 10, 4, 57
	noise_note 6, 13, 2, 69
	noise_note 15, 10, -1, 75
	noise_note 0,0,0,0
	sound_ret

SFX_Volcano_Ball_Poof_Ch5::
	duty_cycle 2
	pitch_sweep 1, 6
	square_note 15, 15, 2, 1024
	pitch_sweep 0, 8
	sound_ret

SFX_Volcano_Ball_Poof_Ch8::
	noise_note 15, 10, 2, 34
	sound_ret