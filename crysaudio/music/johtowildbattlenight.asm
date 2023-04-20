Music_JohtoWildBattleNight:
	channel_count 3
	channel 1, Music_JohtoWildBattleNight_Ch1
	channel 2, Music_JohtoWildBattleNight_Ch2
	channel 3, Music_JohtoWildBattleNight_Ch3

Music_JohtoWildBattleNight_Ch1:
	tempo 107
	volume 7, 7
	duty_cycle 3
	pitch_offset 2
	vibrato 16, 2, 5
	sound_loop 0, Music_JohtoWildBattle_Ch1.body

Music_JohtoWildBattleNight_Ch2:
	duty_cycle 3
	vibrato 32, 3, 6
	pitch_offset 1
	sound_call Music_JohtoWildBattle_Ch2.sub1
	note_type 12, 12, 2
	octave 4
	note G_, 6
	pitch_offset 1
	duty_cycle 2
	sound_loop 0, Music_JohtoWildBattle_Ch2.body

Music_JohtoWildBattleNight_Ch3:
	note_type 12, 1, 1
	sound_loop 0, Music_JohtoWildBattle_Ch3.body
