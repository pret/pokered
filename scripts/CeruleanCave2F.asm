; PureRGBnote: ADDED: code was added pertaining to battling professor oak on this floor.

CeruleanCave2F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, CeruleanCave2F_ScriptPointers
	ld a, [wCeruleanCave2FCurScript]
	jp CallFunctionInTable

CeruleanCave2F_ScriptPointers:
	def_script_pointers
	dw_const DoRet,                               SCRIPT_CERULEANCAVE2F_DEFAULT
	dw_const CeruleanCave2FAfterOakBattleScript,  SCRIPT_CERULEANCAVE2F_AFTER_OAK_BATTLE

CeruleanCave2FAfterOakBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jr z, .done
	SetEvent EVENT_BEAT_PROF_OAK
	CheckEvent EVENT_BEAT_PROF_OAK_ONCE
	jr nz, .done
	ld a, [wOptions2]
	bit BIT_ALT_PKMN_PALETTES, a ; do we have alt palettes enabled
	jr z, .done ; don't do anything if alt palettes are turned off
	ld a, TEXT_CERULEANCAVE2F_OAK_FIRST_DEFEAT
	ldh [hTextID], a
    call DisplayTextID
	SetEvent EVENT_BEAT_PROF_OAK_ONCE
.done
	ld a, SCRIPT_CERULEANCAVE2F_DEFAULT
	ld [wCeruleanCave2FCurScript], a
	ret

CeruleanCave2F_TextPointers:
	def_text_pointers
	dw_const OakCeruleanCaveText, TEXT_CERULEANCAVE2F_OAK
	dw_const PickUpItemText, TEXT_CERULEANCAVE2F_ITEM1
	dw_const PickUpItemText, TEXT_CERULEANCAVE2F_ITEM2
	dw_const PickUpItemText, TEXT_CERULEANCAVE2F_ITEM3
	dw_const OakCeruleanCaveFirstDefeatText, TEXT_CERULEANCAVE2F_OAK_FIRST_DEFEAT

OakCeruleanCaveText:
	text_asm
	CheckEvent EVENT_BEAT_PROF_OAK
	jr z, .challengeOak
	ld hl, OakBeatenText
	rst _PrintText
	jr .done
.challengeOak
	ld c, BANK(Music_MeetProfOak)
	ld a, MUSIC_MEET_PROF_OAK
	call PlayMusic
	ld hl, OakBattleStartText
	rst _PrintText
	call OakBattle
.done
	rst TextScriptEnd

OakBattle:
	ld hl, OakBattleWinText
	ld de, OakBattleLoseText
	call SaveEndBattleTextPointers
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld a, OPP_PROF_OAK
	ld [wCurOpponent], a

	; select which team to use during the encounter
	ld a, [wPlayerStarter]
	call StarterToPartyID
	ld [wTrainerNo], a
	ld a, SCRIPT_CERULEANCAVE2F_AFTER_OAK_BATTLE
	ld [wCeruleanCave2FCurScript], a
	ret

OakCeruleanCaveFirstDefeatText:
	text_asm
	ld hl, OakFirstLoseText
	rst _PrintText
	rst TextScriptEnd

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
	
