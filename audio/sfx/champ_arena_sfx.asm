; PureRGBnote: ADDED: new sounds that are used in the champ arena. Are played by playing another sound and remapping the data to these sounds.
; Only will work on audio engine 3 since this is the bank they're located in.
HeartBubbleSFX::
	duty_cycle 2
	pitch_sweep 1, 4
	square_note 15, 15, 0, 1164
	pitch_sweep 0, 8
	square_note 0, 0, 0, 0
	sound_ret

ExclamationBubbleSFX::
	duty_cycle 0
	square_note 0, 13, 2, 1792
	square_note 0, 13, 2, 1856
	square_note 0, 13, 2, 1920
	square_note 0, 13, 2, 1984
	square_note 10, 14, 1, 1990
	square_note 1, 0, 0, 0
	sound_ret
	
SmileBubbleSFX::
	duty_cycle 2
	pitch_sweep 1, 5
	square_note 15, 15, 0, 1664
	pitch_sweep 0, 8
	square_note 0, 0, 0, 0
	sound_ret
	

QuestionBubbleSFX::
	duty_cycle 2
	pitch_sweep 1, 5
	square_note 15, 15, 0, 1264
	pitch_sweep 0, 8
	square_note 0, 0, 0, 0
	sound_ret

AudienceClappingSFX::
	noise_note 7, 6, 0, 82
	noise_note 7, 8, 7, 82
	noise_note 7, 10, 0, 82
	noise_note 7, 12, 7, 82
	noise_note 7, 14, 0, 82
	noise_note 7, 15, 7, 82
	noise_note 7, 14, 0, 82
	noise_note 7, 12, 7, 82
	noise_note 7, 10, 0, 82
	noise_note 7, 8, 7, 82
	noise_note 7, 6, 0, 82
	noise_note 7, 4, 7, 82
	noise_note 7, 2, 0, 82
	noise_note 7, 1, 7, 82
	noise_note 0, 0, 0, 0
	sound_ret