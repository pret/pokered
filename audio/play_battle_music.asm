; PureRGBnote: CHANGED: adjusted to be able to play new songs based on wSpecialBattleMusicID, used in champ arena
PlayBattleMusic::
	ResetFlag FLAG_ALTERNATE_BATTLE_WIN_THEME
	xor a
	ld [wAudioFadeOutControl], a
	ld [wLowHealthAlarm], a
	call StopAllMusic ; shinpokerednote: MOVED: a common function to do what the 3 lines that used to be here did was created
	rst _DelayFrame
	ld c, BANK(Music_GymLeaderBattle)
	ld a, [wGymLeaderNo]
	and a
	ld b, MUSIC_GYM_LEADER_BATTLE
	jr nz, .playSong
	ld a, [wCurOpponent]
	cp OPP_ID_OFFSET
	ld b, MUSIC_WILD_BATTLE
	jr c, .playSong
	cp OPP_RIVAL3
	ld b, MUSIC_FINAL_BATTLE
	jr z, .playSong
	cp OPP_PROF_OAK
	jr z, .playSong ; PureRGBnote: ADDED: professor oak battle uses final battle music
	; normal trainer
	ld b, MUSIC_TRAINER_BATTLE
.playSong
	ld a, [wSpecialBattleMusicID]
	and a
	jr nz, .specialMusic
	ld a, b
	jp PlayMusic
.specialMusic
	cp 2 ; seel stage music
	jr nz, .notSeelStage
	SetFlagHL FLAG_ALTERNATE_BATTLE_WIN_THEME
.notSeelStage
	ld hl, SpecialMusicData
	dec a
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld c, a
	call GetAddressFromPointer
	xor a
	ld [wSpecialBattleMusicID], a
	jp PlaySpecialBattleMusic

SpecialMusicData:
	dba Music_DuelTheme1
	dba Music_SeelStage
	dba Music_HereComesGR
	dba Music_CatchEmBlue
	dba Music_Ronald
	dba Music_WhackTheDiglett
	dba Music_DuelTheme2
	dba Music_Fort2
	dba Music_DuelTheme3
	dba Music_GRChallengeCup
	dba Music_GengarInTheGraveyard
	dba Music_TitleScreen