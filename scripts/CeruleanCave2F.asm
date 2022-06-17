CeruleanCave2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, CeruleanCave2F_ScriptPointers
	ld a, [wCeruleanCave2FCurScript]
	jp CallFunctionInTable

CeruleanCave2F_ScriptPointers:
	dw CeruleanCave2FScript0
	dw CeruleanCave2FScript1

CeruleanCave2FScript0:
	ret

CeruleanCave2FScript1:
	ld a, [wIsInBattle]
	cp $ff
	jr z, .done
	SetEvent EVENT_BEAT_PROF_OAK
	CheckEvent EVENT_BEAT_PROF_OAK_ONCE
	jr z, .initialLossText
	jr .done
.initialLossText
	ld a, 5
	ldh [hSpriteIndexOrTextID], a
    call DisplayTextID
	SetEvent EVENT_BEAT_PROF_OAK_ONCE
.done
	ld a, 0
	ld [wCeruleanCave2FCurScript], a
	ret

CeruleanCave2F_TextPointers:
	dw OakCeruleanCaveText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw OakCeruleanCaveFirstDefeatText

OakCeruleanCaveText:
	text_asm
	CheckEvent EVENT_BEAT_PROF_OAK
	jr z, .challengeOak
	ld hl, OakBeatenText
	call PrintText
	jr .done
.challengeOak
	ld c, BANK(Music_MeetProfOak)
	ld a, MUSIC_MEET_PROF_OAK
	call PlayMusic
	ld hl, OakBattleStartText
	call PrintText
	call OakBattle
.done
	jp TextScriptEnd

OakBattle:
	ld hl, OakBattleWinText
	ld de, OakBattleLoseText
	call SaveEndBattleTextPointers
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld a, OPP_PROF_OAK
	ld [wCurOpponent], a

	; select which team to use during the encounter
	ld a, [wPlayerStarter]
	cp STARTER2
	jr nz, .NotSquirtle
	ld a, 1
	jr .done
.NotSquirtle
	cp STARTER3
	jr nz, .Charmander
	ld a, 2
	jr .done
.Charmander
	ld a, 3
.done
	ld [wTrainerNo], a
	ld a, 1
	ld [wCeruleanCave2FCurScript], a
	ret

OakCeruleanCaveFirstDefeatText:
	text_asm
	ld hl, OakFirstLoseText
	call PrintText
	jp TextScriptEnd

OakBattleStartText:
	text_far _OakBattleStartText
	text_end

OakBattleWinText:
	text_far _OakBattleWinText
	text_end

OakBattleLoseText:
	text_far _OakBattleLoseText
	text_end

OakBeatenText:
	text_far _OakBeatenText
	text_end

OakFirstLoseText:
	text_far _OakFirstLoseText
	sound_pokedex_rating
	text_end