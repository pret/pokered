PlayBattleMusic::
	xor a
	ld [wAudioFadeOutControl], a
	ld [wLowHealthAlarm], a
	dec a ; SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	call DelayFrame
	ld c, BANK(Music_GymLeaderBattle)
	ld a, [wGymLeaderNo]
	and a
	jr z, .notGymLeaderBattle
	ld a, MUSIC_GYM_LEADER_BATTLE
	jr .playSong
.notGymLeaderBattle
	ld a, [wCurOpponent]
	cp OPP_ID_OFFSET
	jr c, .wildBattle
	cp OPP_RIVAL3
	jr z, .finalBattle
	cp OPP_LANCE
	jr nz, .normalTrainerBattle
	ld a, MUSIC_GYM_LEADER_BATTLE ; lance also plays gym leader theme
	jr .playSong
.normalTrainerBattle
	ld a, MUSIC_TRAINER_BATTLE
	jr .playSong
.finalBattle
	ld a, MUSIC_FINAL_BATTLE
	jr .playSong
.wildBattle
	ld a, MUSIC_WILD_BATTLE
.playSong
	jp PlayMusic
