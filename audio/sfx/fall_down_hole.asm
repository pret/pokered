; PureRGBnote: ADDED: sound effect when you fall down a hole.
; only caves use this sound and caves all use audio engine 3 for audio, so this sound effect is only in that bank
; play it on channel 5 or 6

FallDownHole::
	duty_cycle 2
	pitch_sweep 1, -7
	square_note 15, 13, 0, 1900
	square_note 15, 11, 0, 1500
	pitch_sweep 0, 8
	square_note 0, 0, 0, 0
	sound_ret
	