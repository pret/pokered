; PureRGBnote: ADDED: these new sound effects are used in various static encounters or new areas.

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

; ch 5
PowerPlantGatePowerDown::
	duty_cycle 2
	pitch_sweep 1, -7
	square_note 15, 13, 0, 1700
	square_note 15, 11, 0, 1300
	square_note 15, 11, 0, 1000
	pitch_sweep 0, 8
StopSFXSound::
	square_note 0, 0, 0, 0
	sound_ret

; ch 8
PowerPlantGateShutOff::
	noise_note 8, 13, 1, 67
	noise_note 9, 15, 1, 68
	sound_ret

PowerPlantElectricityClose::
	noise_note 3, 9, 2, 58
	sound_ret

PowerPlantElectricityFar::
	noise_note 3, 5, 2, 58
	sound_ret

PowerPlantRoofRain::
	noise_note 3, 8, 6, 95
GasSound::
	noise_note 15, 3, -3, 5
	sound_ret

PowerPlantMagnetonFloating::
	duty_cycle 2
	pitch_sweep 5, 5
.loop
	square_note 15, 13, 0, 800
	sound_loop 4, .loop
	pitch_sweep 0, 8
	square_note 0, 0, 0, 0
	sound_ret

Ghost_Encounter_SFX:: ; Actually just the beginning of the Pokemon Pinball graveyard music.
	execute_music
	vibrato 18, 3, 3
	duty_cycle 3
	note_type 6, 4, 8
	octave 5
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	note_type 12, 4, 8
	octave 6
	note C_, 7
	vibrato 0, 3, 3
	volume_envelope 4, 6
	note C_, 2
	sound_ret

Ghost_Encounter_SFX2:: ; Actually just the beginning of the Pokemon Pinball graveyard music. (transposed to make the two channels sound off-key)
	transpose 1, 2
	sound_call Ghost_Encounter_SFX
	transpose 0, 0
	sound_ret

