; PureRGBnote: ADDED: new trainers on this route.

Route2_Script:
	call Route2ReplaceCutTiles
	call EnableAutoTextBoxDrawing
	ld hl, Route2TrainerHeaders
	ld de, Route2_ScriptPointers
	ld a, [wRoute2CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute2CurScript], a
	ret

; PureRGBnote: ADDED: replaces the cut trees
; after using the "Tree Deleter" all but 1 of the cut trees will be removed
Route2ReplaceCutTiles:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl] ; did we load the map from a save/warp/door/battle, etc?
	res 5, [hl]
	jr nz, .removeAddCutTiles
	bit 4, [hl] ; did we enter the map by traversal from another route
	res 4, [hl]
	jr nz, .removeAddCutTilesNoRedraw
	ret
.removeAddCutTiles
	CheckEvent EVENT_DELETED_ROUTE2_TREES
	jr z, .checkRemoveTreeBlocker
	ld de, Route2TileBlockReplacements
	jpfar ReplaceMultipleTileBlocks
.checkRemoveTreeBlocker
	; PureRGBnote: ADDED: code that keeps the cut tree cut down if we're in its alcove. Prevents getting softlocked if you delete cut.
	; if we're behind the middle tree and require cut to get back to other areas, remove the middle tree to prevent softlocks
	ld de, Route2CutAlcove
	callfar FarArePlayerCoordsInRange
	ret nc
	; if we're below the center tree on route 2 when loading the map, remove it so we can't get stuck
	lb bc, 11, 7
	ld a, $6D
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlock
.removeAddCutTilesNoRedraw
	CheckEvent EVENT_DELETED_ROUTE2_TREES
	ret z
	ld de, Route2TileBlockReplacements
	; this guarantees avoiding redrawing the map because when going between areas these tiles are offscreen.
	jpfar ReplaceMultipleTileBlocksNoRedraw

Route2_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE2_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE2_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE2_END_BATTLE

Route2_TextPointers:
	def_text_pointers
	dw_const Route2BugCatcherText,       TEXT_ROUTE2_BUG_CATCHER
	dw_const Route2JrTrainerMText,       TEXT_ROUTE2_JR_TRAINER_M
	dw_const Route2JrTrainerFText,       TEXT_ROUTE2_JR_TRAINER_F
	dw_const PickUpItemText,             TEXT_ROUTE2_ITEM1
	dw_const PickUpItemText,             TEXT_ROUTE2_ITEM2
	dw_const PickUpItemText,             TEXT_ROUTE2_ITEM3 ; PureRGBnote: ADDED: new item on this route.
	dw_const Route2SignText,             TEXT_ROUTE2_SIGN
	dw_const Route2DiglettsCaveSignText, TEXT_ROUTE2_DIGLETTS_CAVE_SIGN

Route2TrainerHeaders:
	def_trainers 1
Route2TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_2_TRAINER_0, 4, Route2BattleText1, Route2EndBattleText1, Route2AfterBattleText1
Route2TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_2_TRAINER_1, 4, Route2BattleText2, Route2EndBattleText2, Route2AfterBattleText2
Route2TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_2_TRAINER_2, 1, Route2BattleText3, Route2EndBattleText3, Route2AfterBattleText3
	db -1 ; end

Route2BugCatcherText:
	text_asm
	ld hl, Route2TrainerHeader0
	call TalkToTrainer
	rst TextScriptEnd

Route2BattleText1:
	text_far _Route2BattleText1
	text_end

Route2EndBattleText1:
	text_far _Route2EndBattleText1
	text_end

Route2AfterBattleText1:
	text_far _Route2AfterBattleText1
	text_end

Route2JrTrainerMText:
	text_asm
	ld hl, Route2TrainerHeader1
	call TalkToTrainer
	rst TextScriptEnd

Route2BattleText2:
	text_far _Route2BattleText2
	text_end

Route2EndBattleText2:
	text_far _Route2EndBattleText2
	text_end

Route2AfterBattleText2:
	text_far _Route2AfterBattleText2
	text_end

Route2JrTrainerFText:
	text_asm
	ld hl, Route2TrainerHeader2
	call TalkToTrainer
	rst TextScriptEnd

Route2BattleText3:
	text_far _Route2BattleText3
	text_end

Route2EndBattleText3:
	text_far _Route2EndBattleText3
	text_end

Route2AfterBattleText3:
	text_far _Route2AfterBattleText3
	text_end

Route2SignText:
	text_far _Route2SignText
	text_end

Route2DiglettsCaveSignText:
	text_far _Route2DiglettsCaveSignText
	text_end
