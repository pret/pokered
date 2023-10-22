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
	jr z, .notGymLeaderBattle
	ld a, MUSIC_GYM_LEADER_BATTLE
	jr .playSong
.notGymLeaderBattle
	ld a, [wCurOpponent]
	cp OPP_ID_OFFSET
	jr c, .wildBattle
	cp OPP_RIVAL3
	jr z, .finalBattle
	cp OPP_PROF_OAK
	jr z, .finalBattle ; PureRGBnote: ADDED: professor oak battle uses final battle music
	cp OPP_CHIEF
	jr z, .gymLeader ; PureRGBnote: ADDED: chief battle uses gym leader music
	cp OPP_LANCE
	jr nz, .normalTrainerBattle
.gymLeader
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
	push af
	ld a, [wSpecialBattleMusicID]
	and a
	jr nz, .specialMusic
	pop af
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
	ld c, [hl]
	inc hl
	call GetAddressFromPointer
	pop af
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