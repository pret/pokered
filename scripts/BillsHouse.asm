BillsHouse_Script:
	call EnableAutoTextBoxDrawing
	ld a, [wBillsHouseCurScript]
	ld hl, BillsHouse_ScriptPointers
	jp CallFunctionInTable

BillsHouse_ScriptPointers:
	def_script_pointers
	dw_const BillsHouseDefaultScript,              SCRIPT_BILLSHOUSE_DEFAULT
	dw_const BillsHousePokemonWalkToMachineScript, SCRIPT_BILLSHOUSE_POKEMON_WALK_TO_MACHINE
	dw_const BillsHousePokemonEntersMachineScript, SCRIPT_BILLSHOUSE_POKEMON_ENTERS_MACHINE
	dw_const BillsHouseBillExitsMachineScript,     SCRIPT_BILLSHOUSE_BILL_EXITS_MACHINE
	dw_const BillsHouseCleanupScript,              SCRIPT_BILLSHOUSE_CLEANUP
	dw_const BillsHousePCScript,                   SCRIPT_BILLSHOUSE_PC

BillsHouseDefaultScript:
	ret

BillsHousePokemonWalkToMachineScript:
	ld a, [wSpritePlayerStateData1FacingDirection]
	and a ; cp SPRITE_FACING_DOWN
	ld de, .PokemonWalkToMachineMovement
	jr nz, .notDown
	ld de, .PokemonWalkAroundPlayerMovement
.notDown
	ld a, BILLSHOUSE_BILL_POKEMON
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_BILLSHOUSE_POKEMON_ENTERS_MACHINE
	ld [wBillsHouseCurScript], a
	ret

.PokemonWalkToMachineMovement:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1 ; end

; make Bill walk around the player
.PokemonWalkAroundPlayerMovement:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_UP
	db -1 ; end

BillsHousePokemonEntersMachineScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, HS_BILL_POKEMON
	ld [wMissableObjectIndex], a
	predef HideObject
	SetEvent EVENT_BILL_SAID_USE_CELL_SEPARATOR
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_BILLSHOUSE_BILL_EXITS_MACHINE
	ld [wBillsHouseCurScript], a
	ret

BillsHouseBillExitsMachineScript:
	CheckEvent EVENT_USED_CELL_SEPARATOR_ON_BILL
	ret z
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, BILLSHOUSE_BILL1
	ld [wSpriteIndex], a
	ld a, $c
	ldh [hSpriteScreenYCoord], a
	ld a, $40
	ldh [hSpriteScreenXCoord], a
	ld a, 6
	ldh [hSpriteMapYCoord], a
	ld a, 5
	ldh [hSpriteMapXCoord], a
	call SetSpritePosition1
	ld a, HS_BILL_1
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld c, 8
	call DelayFrames
	ld a, BILLSHOUSE_BILL1
	ldh [hSpriteIndex], a
	ld de, BillExitMachineMovement
	call MoveSprite
	ld a, SCRIPT_BILLSHOUSE_CLEANUP
	ld [wBillsHouseCurScript], a
	ret

BillExitMachineMovement:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db -1 ; end

BillsHouseCleanupScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	SetEvent EVENT_MET_BILL_2 ; this event seems redundant
	SetEvent EVENT_MET_BILL
	ld a, SCRIPT_BILLSHOUSE_DEFAULT
	ld [wBillsHouseCurScript], a
	ret

BillsHousePCScript:
	ld a, TEXT_BILLSHOUSE_ACTIVATE_PC
	ldh [hTextID], a
	call DisplayTextID
	ld a, SCRIPT_BILLSHOUSE_DEFAULT
	ld [wBillsHouseCurScript], a
	ret

BillsHouse_TextPointers:
	def_text_pointers
	dw_const BillsHouseBillPokemonText,               TEXT_BILLSHOUSE_BILL_POKEMON
	dw_const BillsHouseBillSSTicketText,              TEXT_BILLSHOUSE_BILL_SS_TICKET
	dw_const BillsHouseBillCheckOutMyRarePokemonText, TEXT_BILLSHOUSE_BILL_CHECK_OUT_MY_RARE_POKEMON
	dw_const BillsHouseActivatePCScript,              TEXT_BILLSHOUSE_ACTIVATE_PC

BillsHouseActivatePCScript:
	script_bills_pc

BillsHouseBillPokemonText:
	text_asm
	ld hl, .ImNotAPokemonText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .answered_no
.use_machine
	ld hl, .UseSeparationSystemText
	call PrintText
	ld a, SCRIPT_BILLSHOUSE_POKEMON_WALK_TO_MACHINE
	ld [wBillsHouseCurScript], a
	jr .text_script_end
.answered_no
	ld hl, .NoYouGottaHelpText
	call PrintText
	jr .use_machine
.text_script_end
	jp TextScriptEnd

.ImNotAPokemonText:
	text_far _BillsHouseBillImNotAPokemonText
	text_end

.UseSeparationSystemText:
	text_far _BillsHouseBillUseSeparationSystemText
	text_end

.NoYouGottaHelpText:
	text_far _BillsHouseBillNoYouGottaHelpText
	text_end

BillsHouseBillSSTicketText:
	text_asm
	CheckEvent EVENT_GOT_SS_TICKET
	jr nz, .got_ss_ticket
	ld hl, .ThankYouText
	call PrintText
	lb bc, S_S_TICKET, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .SSTicketReceivedText
	call PrintText
	SetEvent EVENT_GOT_SS_TICKET
	ld a, HS_CERULEAN_GUARD_1
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_CERULEAN_GUARD_2
	ld [wMissableObjectIndex], a
	predef HideObject
.got_ss_ticket
	ld hl, .WhyDontYouGoInsteadOfMeText
	call PrintText
	jr .text_script_end
.bag_full
	ld hl, .SSTicketNoRoomText
	call PrintText
.text_script_end
	jp TextScriptEnd

.ThankYouText:
	text_far _BillsHouseBillThankYouText
	text_end

.SSTicketReceivedText:
	text_far _SSTicketReceivedText
	sound_get_key_item
	text_promptbutton
	text_end

.SSTicketNoRoomText:
	text_far _SSTicketNoRoomText
	text_end

.WhyDontYouGoInsteadOfMeText:
	text_far _BillsHouseBillWhyDontYouGoInsteadOfMeText
	text_end

BillsHouseBillCheckOutMyRarePokemonText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text_far _BillsHouseBillCheckOutMyRarePokemonText
	text_end
