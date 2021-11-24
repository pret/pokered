ViridianCity_Script:
	call EnableAutoTextBoxDrawing
	ld hl, ViridianCity_ScriptPointers
	ld a, [wViridianCityCurScript]
	jp CallFunctionInTable

ViridianCity_ScriptPointers:
	dw ViridianCityScript0
	dw ViridianCityScript1
	dw ViridianCityScript2
	dw ViridianCityScript3

ViridianCityScript0:
	call ViridianCityScript_1900b
	jp ViridianCityScript_1903d

ViridianCityScript_1900b:
	CheckEvent EVENT_VIRIDIAN_GYM_OPEN
	ret nz
	ld a, [wObtainedBadges]
	cp ~(1 << BIT_EARTHBADGE)
	jr nz, .gym_closed
	SetEvent EVENT_VIRIDIAN_GYM_OPEN
	ret
.gym_closed
	ld a, [wYCoord]
	cp 8
	ret nz
	ld a, [wXCoord]
	cp 32
	ret nz
	ld a, $e
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ldh [hJoyHeld], a
	call ViridianCityScript_190cf
	ld a, $3
	ld [wViridianCityCurScript], a
	ret

ViridianCityScript_1903d:
	CheckEvent EVENT_GOT_POKEDEX
	ret nz
	ld a, [wYCoord]
	cp 9
	ret nz
	ld a, [wXCoord]
	cp 19
	ret nz
	ld a, $5
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ldh [hJoyHeld], a
	call ViridianCityScript_190cf
	ld a, $3
	ld [wViridianCityCurScript], a
	ret

ViridianCityScript1:
	ld a, [wSprite03StateData1YPixels]
	ldh [hSpriteScreenYCoord], a
	ld a, [wSprite03StateData1XPixels]
	ldh [hSpriteScreenXCoord], a
	ld a, [wSprite03StateData2MapY]
	ldh [hSpriteMapYCoord], a
	ld a, [wSprite03StateData2MapX]
	ldh [hSpriteMapXCoord], a
	xor a
	ld [wListScrollOffset], a

	; set up battle for Old Man
	ld a, BATTLE_TYPE_OLD_MAN
	ld [wBattleType], a
	ld a, 5
	ld [wCurEnemyLVL], a
	ld a, WEEDLE
	ld [wCurOpponent], a
	ld a, $2
	ld [wViridianCityCurScript], a
	ret

ViridianCityScript2:
	ldh a, [hSpriteScreenYCoord]
	ld [wSprite03StateData1YPixels], a
	ldh a, [hSpriteScreenXCoord]
	ld [wSprite03StateData1XPixels], a
	ldh a, [hSpriteMapYCoord]
	ld [wSprite03StateData2MapY], a
	ldh a, [hSpriteMapXCoord]
	ld [wSprite03StateData2MapX], a
	call UpdateSprites
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld a, $f
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wBattleType], a
	ld [wJoyIgnore], a
	ld a, $0
	ld [wViridianCityCurScript], a
	ret

ViridianCityScript3:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, 0
	ld [wViridianCityCurScript], a
	ret

ViridianCityScript_190cf:
	call StartSimulatingJoypadStates
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	xor a
	ld [wSpritePlayerStateData1FacingDirection], a
	ld [wJoyIgnore], a
	ret

ViridianCity_TextPointers:
	dw ViridianCityText1
	dw ViridianCityText2
	dw ViridianCityText3
	dw ViridianCityText4
	dw ViridianCityText5
	dw ViridianCityText6
	dw ViridianCityText7
	dw ViridianCityText8
	dw ViridianCityText9
	dw ViridianCityText10
	dw MartSignText
	dw PokeCenterSignText
	dw ViridianCityText13
	dw ViridianCityText14
	dw ViridianCityText15

ViridianCityText1:
	text_far _ViridianCityText1
	text_end

ViridianCityText2:
	text_asm
	ld a, [wObtainedBadges]
	cp ~(1 << BIT_EARTHBADGE)
	ld hl, ViridianCityText_19127
	jr z, .done
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr nz, .done
	ld hl, ViridianCityText_19122
.done
	call PrintText
	jp TextScriptEnd

ViridianCityText_19122:
	text_far _ViridianCityText_19122
	text_end

ViridianCityText_19127:
	text_far _ViridianCityText_19127
	text_end

ViridianCityText3:
	text_asm
	ld hl, ViridianCityText_1914d
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .no
	ld hl, ViridianCityText_19157
	call PrintText
	jr .done
.no
	ld hl, ViridianCityText_19152
	call PrintText
.done
	jp TextScriptEnd

ViridianCityText_1914d:
	text_far _ViridianCityText_1914d
	text_end

ViridianCityText_19152:
	text_far _ViridianCityText_19152
	text_end

ViridianCityText_19157:
	text_far _ViridianCityText_19157
	text_end

ViridianCityText4:
	text_asm
	CheckEvent EVENT_GOT_POKEDEX
	jr nz, .gotPokedex
	ld hl, ViridianCityText_19175
	call PrintText
	jr .done
.gotPokedex
	ld hl, ViridianCityText_1917a
	call PrintText
.done
	jp TextScriptEnd

ViridianCityText_19175:
	text_far _ViridianCityText_19175
	text_end

ViridianCityText_1917a:
	text_far _ViridianCityText_1917a
	text_end

ViridianCityText5:
	text_asm
	ld hl, ViridianCityText_19191
	call PrintText
	call ViridianCityScript_190cf
	ld a, $3
	ld [wViridianCityCurScript], a
	jp TextScriptEnd

ViridianCityText_19191:
	text_far _ViridianCityText_19191
	text_end

ViridianCityText6:
	text_asm
	CheckEvent EVENT_GOT_TM42
	jr nz, .got_item
	ld hl, ViridianCityText_191ca
	call PrintText
	lb bc, TM_DREAM_EATER, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, ReceivedTM42Text
	call PrintText
	SetEvent EVENT_GOT_TM42
	jr .done
.bag_full
	ld hl, TM42NoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, TM42Explanation
	call PrintText
.done
	jp TextScriptEnd

ViridianCityText_191ca:
	text_far _ViridianCityText_191ca
	text_end

ReceivedTM42Text:
	text_far _ReceivedTM42Text
	sound_get_item_2
	text_end

TM42Explanation:
	text_far _TM42Explanation
	text_end

TM42NoRoomText:
	text_far _TM42NoRoomText
	text_end

ViridianCityText7:
	text_asm
	ld hl, ViridianCityText_1920a
	call PrintText
	ld c, 2
	call DelayFrames
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr z, .refused
	ld hl, ViridianCityText_1920f
	call PrintText
	ld a, $1
	ld [wViridianCityCurScript], a
	jr .done
.refused
	ld hl, ViridianCityText_19214
	call PrintText
.done
	jp TextScriptEnd

ViridianCityText_1920a:
	text_far _ViridianCityText_1920a
	text_end

ViridianCityText_1920f:
	text_far _ViridianCityText_1920f
	text_end

ViridianCityText_19214:
	text_far _ViridianCityText_19214
	text_end

ViridianCityText15:
	text_far _ViridianCityText_19219
	text_end

ViridianCityText8:
	text_far _ViridianCityText8
	text_end

ViridianCityText9:
	text_far _ViridianCityText9
	text_end

ViridianCityText10:
	text_far _ViridianCityText10
	text_end

ViridianCityText13:
	text_far _ViridianCityText13
	text_end

ViridianCityText14:
	text_far _ViridianCityText14
	text_end
