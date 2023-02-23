Route15Gate2F_Script:
	jp DisableAutoTextBoxDrawing

Route15Gate2F_TextPointers:
	dw Route15GateUpstairsText1
	dw Route15GateUpstairsText2

; PureRGBnote: CHANGED: oak's aide here will give you the BOOSTER CHIP instead of EXP.ALL, and it requires 80 pokemon caught to obtain.
; Once you install it, you must talk to him to get it removed. This removes the need for it taking up an item slot when in use.
Route15GateUpstairsText1:
	text_asm
	CheckEvent EVENT_GOT_BOOSTER_CHIP
	jr nz, .got_item
	ld a, 80
	ldh [hOaksAideRequirement], a
	ld a, BOOSTER_CHIP
	ldh [hOaksAideRewardItem], a
	ld [wd11e], a
	call GetItemName
	ld hl, wcd6d
	ld de, wOaksAideRewardItemName
	ld bc, ITEM_NAME_LENGTH
	rst CopyDataRST
	predef OaksAideScript
	ldh a, [hOaksAideResult]
	cp OAKS_AIDE_GOT_ITEM
	jr nz, .no_item
	SetEvent EVENT_GOT_BOOSTER_CHIP
.got_item
	ld a, [wBoosterChipActive]
	and a
	jr z, .boosterChipNotActive
	ld hl, Route15GateUpstairsRemoveBoosterText
	rst PrintTextRST
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .noUninstall
	lb bc, BOOSTER_CHIP, 1
	call GiveItem
	jr nc, .bagFull
	xor a
	ld [wBoosterChipActive], a
	call RemoveBoosterChipSounds
	ld hl, Route15GateUpstairsDoneText
	rst PrintTextRST
	jr .no_item
.bagFull
	ld hl, Route15GateUpstairsNoRoomText
	rst PrintTextRST
	jr .no_item
.noUninstall
	ld hl, Route15GateUpstairsNoUninstallText
	rst PrintTextRST
	jr .no_item
.boosterChipNotActive
	ld hl, Route15GateUpstairsText_4968c
	rst PrintTextRST
.no_item
	rst TextScriptEnd

RemoveBoosterChipSounds:
	ld b, 5
	ld a, SFX_STOP_ALL_MUSIC
	call PlaySound
.loop
	ld a, SFX_NOISE_INSTRUMENT16
	call PlaySound
	ld c, 10
	rst DelayFramesRST
	dec b
	jr nz, .loop
	ld a, SFX_NOISE_INSTRUMENT03
	call PlaySound
	ld c, 10
	rst DelayFramesRST
	ld a, SFX_WITHDRAW_DEPOSIT
	call PlaySound
	ld c, 30
	jp PlayDefaultMusic
	

Route15GateUpstairsText_4968c:
	text_far _Route15GateUpstairsText_4968c
	text_end

Route15GateUpstairsText2:
	text_asm
	ld hl, Route15GateUpstairsText_49698
	jp GateUpstairsScript_PrintIfFacingUp

Route15GateUpstairsText_49698:
	text_far _Route15GateUpstairsText_49698
	text_end

Route15GateUpstairsNoRoomText:
	text_far _TM34NoRoomText
	text_end

Route15GateUpstairsRemoveBoosterText:
	text_far _Route15GateUpstairsRemoveBoosterText
	text_end

Route15GateUpstairsNoUninstallText:
	text_far _FossilGuyDenied
	text_end

Route15GateUpstairsDoneText:
	text_far _Route15GateUpstairsDoneText
	sound_get_item_1
	text_end