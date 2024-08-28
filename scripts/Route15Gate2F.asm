Route15Gate2F_Script:
	jp DisableAutoTextBoxDrawing

Route15Gate2F_TextPointers:
	def_text_pointers
	dw_const Route15Gate2FOaksAideText,   TEXT_ROUTE15GATE2F_OAKS_AIDE
	dw_const Route15Gate2FBinocularsText, TEXT_ROUTE15GATE2F_BINOCULARS

; PureRGBnote: CHANGED: oak's aide here will give you the BOOSTER CHIP instead of EXP.ALL, and it requires 80 pokemon caught to obtain.
; Once you install it, you must talk to him to get it removed. This removes the need for it taking up an item slot when in use.
Route15Gate2FOaksAideText:
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
	rst _CopyData
	predef OaksAideScript
	ldh a, [hOaksAideResult]
	cp OAKS_AIDE_GOT_ITEM
	jr nz, .no_item
	SetEvent EVENT_GOT_BOOSTER_CHIP
.got_item
	CheckEvent EVENT_BOOSTER_CHIP_ACTIVE
	jr z, .boosterChipNotActive
	ld hl, Route15GateUpstairsRemoveBoosterText
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .noUninstall
	lb bc, BOOSTER_CHIP, 1
	call GiveItem
	jr nc, .bagFull
	ResetEvent EVENT_BOOSTER_CHIP_ACTIVE
	call RemoveBoosterChipSounds
	ld hl, Route15GateUpstairsDoneText
	rst _PrintText
	jr .no_item
.bagFull
	ld hl, Route15GateUpstairsNoRoomText
	rst _PrintText
	jr .no_item
.noUninstall
	ld hl, Route15GateUpstairsNoUninstallText
	rst _PrintText
	jr .no_item
.boosterChipNotActive
	ld hl, BoosterChipText
	rst _PrintText
.no_item
	rst TextScriptEnd

RemoveBoosterChipSounds:
	ld b, 5
	ld a, SFX_STOP_ALL_MUSIC
	rst _PlaySound
.loop
	ld a, SFX_NOISE_INSTRUMENT16
	rst _PlaySound
	ld c, 10
	rst _DelayFrames
	dec b
	jr nz, .loop
	ld a, SFX_NOISE_INSTRUMENT03
	rst _PlaySound
	ld c, 10
	rst _DelayFrames
	ld a, SFX_WITHDRAW_DEPOSIT
	rst _PlaySound
	ld c, 30
	jp PlayDefaultMusic
	

BoosterChipText:
	text_far _Route15Gate2FOaksAideBoosterChipText
	text_end

Route15Gate2FBinocularsText:
	text_asm
	ld hl, .Text
	jp GateUpstairsScript_PrintIfFacingUp

.Text:
	text_far _Route15Gate2FBinocularsText
	text_end

Route15GateUpstairsNoRoomText:
	text_far _PewterGymTM34NoRoomText
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