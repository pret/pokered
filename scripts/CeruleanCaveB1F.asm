CeruleanCaveB1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, wCurrentMapScriptFlags
	res BIT_CUR_MAP_LOADED_1, [hl]
	ld a, [wCeruleanCaveB1FCurScript]
	ld hl, CeruleanCaveB1F_ScriptPointers
	jp CallFunctionInTable

CeruleanCaveB1F_ScriptPointers:
	def_script_pointers
	dw_const DoRet, SCRIPT_CERULEANCAVEB1F_DEFAULT
	dw_const MewtwoAnimation, SCRIPT_CERULEANCAVEB1F_MEWTWO_ANIMATION
	dw_const MewtwoPostBattle, SCRIPT_CERULEANCAVEB1F_MEWTWO_POST_BATTLE

CeruleanCaveB1F_TextPointers:
	def_text_pointers
	dw_const MewtwoBattleText,          TEXT_CERULEANCAVEB1F_MEWTWO
	dw_const PickUpItemText,            TEXT_CERULEANCAVEB1F_ITEM1
	dw_const PickUpItemText,            TEXT_CERULEANCAVEB1F_ITEM2

MewtwoBattleText:
	text_far _MewtwoBattleText
	text_asm
	ld a, 1
	ld [wMuteAudioAndPauseMusic], a
	ld a, MEWTWO
	call PlayCry
	call WaitForSoundToFinish
	ld a, SCRIPT_CERULEANCAVEB1F_MEWTWO_ANIMATION
	ld [wCeruleanCaveB1FCurScript], a
	rst TextScriptEnd

; PureRGBnote: ADDED: a special animation happens before you battle MEWTWO.
MewtwoAnimation:
	ld a, CERULEANCAVEB1F_MEWTWO
	call SetSpriteFacingDown
	call UpdateSprites
	; make mewtwo move visually
	ld b, 5
.loop
	push bc
	call .setNextSprite
	rst _DelayFrame
	rst _DelayFrame
	pop bc
	dec b
	jr nz, .loop
	; now show a "psychic" visual
	SetFlag FLAG_HIDE_PLAYER_SPRITE
	call UpdateSprites
	ld hl, vNPCSprites2 tile $40
	ld de, PsychicEyeSprite
	lb bc, BANK(PsychicEyeSprite), 1
	call CopyVideoData
	ld d, $C0
	callfar FillScreenWithTile
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld b, HIGH(vBGMap0)
	call CopyScreenTileBufferToVRAM
	ld b, HIGH(vBGMap1)
	call CopyScreenTileBufferToVRAM
	ld a, OVERWORLD
	ld [wCurMapTileset], a
	ld a, LAVENDER_TOWN
	ld [wCurMap], a
	call RunDefaultPaletteCommand
	ld a, CERULEAN_CAVE_B1F
	ld [wCurMap], a
	ld a, CAVERN
	ld [wCurMapTileset], a
	; show a "psychic" animation with mewtwo
	ld a, BANK(SFX_Psychic_M)
	ld [wAudioROMBank], a
	xor a
	ld [wFrequencyModifier], a
	ld a, $80
	ld [wTempoModifier], a
	ld a, SFX_PSYCHIC_M
	rst _PlaySound
	callfar AnimationWavyScreen
	ld a, MEWTWO
	ld [wEngagedTrainerClass], a
	ld a, 70
	ld [wEngagedTrainerSet], a
	call InitBattleEnemyParameters
	ld a, BANK(Music_Dungeon1)
	ld [wAudioROMBank], a
	xor a
	ld [wMuteAudioAndPauseMusic], a
	callfar PlayTrainerMusic
	ld c, 90
	rst _DelayFrames
	ResetFlag FLAG_HIDE_PLAYER_SPRITE
	ld a, SCRIPT_CERULEANCAVEB1F_MEWTWO_POST_BATTLE
	ld [wCeruleanCaveB1FCurScript], a
	ret
.setNextSprite
	ld a, b
	ld hl, wSpriteOptions2
	bit BIT_MENU_ICON_SPRITES, [hl]
	jr nz, .psychicSprite
	; normal monster sprite
	rrca
	jr c, .secondMonsterSprite
	ld hl, vNPCSprites tile $0C
	ld de, MonsterSprite
	lb bc, BANK(MonsterSprite), 4
	jr .copy
.secondMonsterSprite
	ld hl, vNPCSprites tile $0C
	ld de, PartyMonSprites1 tile 0
	call .copyPartyMonSprites1
	ld hl, vNPCSprites tile $0E
	ld de, PartyMonSprites1 tile 4
	jr .copyPartyMonSprites1
.psychicSprite
	rrca
	jr c, .secondPsychicSprite
	ld hl, vNPCSprites tile $0C
	ld de, PsychicSprite
	lb bc, BANK(PsychicSprite), 4
	jr .copy
.secondPsychicSprite
	ld hl, vNPCSprites tile $0C
	ld de, PartyMonSprites1 tile 114
	call .copyPartyMonSprites1
	ld hl, vNPCSprites tile $0E
	ld de, PartyMonSprites1 tile 118
.copyPartyMonSprites1
	lb bc, BANK(PartyMonSprites1), 2
.copy
	jp CopyVideoData


	
MewtwoPostBattle:
	ld a, [wIsInBattle]
	cp $ff ; do nothing if you lost the battle
	jr z, CeruleanCaveB1FResetScript
	SetEvent EVENT_BEAT_MEWTWO
	ld a, HS_MEWTWO
	ld [wMissableObjectIndex], a
	predef HideObject
CeruleanCaveB1FResetScript:
	ld a, SCRIPT_CERULEANCAVEB1F_DEFAULT
	ld [wCeruleanCaveB1FCurScript], a
	ret
