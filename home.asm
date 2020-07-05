INCLUDE "constants.asm"


SECTION "NULL", ROM0
NULL::

INCLUDE "home/header.asm"


SECTION "High Home", ROM0

INCLUDE "home/lcd.asm"
INCLUDE "home/clear_sprites.asm"
INCLUDE "home/copy.asm"


SECTION "Home", ROM0

INCLUDE "home/start.asm"
INCLUDE "home/joypad.asm"
INCLUDE "data/maps/map_header_pointers.asm"
INCLUDE "home/overworld.asm"

CheckForUserInterruption::
; Return carry if Up+Select+B, Start or A are pressed in c frames.
; Used only in the intro and title screen.
	call DelayFrame

	push bc
	call JoypadLowSensitivity
	pop bc

	ld a, [hJoyHeld]
	cp D_UP + SELECT + B_BUTTON
	jr z, .input

	ld a, [hJoy5]
	and START | A_BUTTON
	jr nz, .input

	dec c
	jr nz, CheckForUserInterruption

	and a
	ret

.input
	scf
	ret

; function to load position data for destination warp when switching maps
; INPUT:
; a = ID of destination warp within destination map
LoadDestinationWarpPosition::
	ld b, a
	ld a, [hLoadedROMBank]
	push af
	ld a, [wPredefParentBank]
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ld a, b
	add a
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld bc, 4
	ld de, wCurrentTileBlockMapViewPointer
	call CopyData
	pop af
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

INCLUDE "home/pokemon.asm"
INCLUDE "home/print_bcd.asm"
INCLUDE "home/pics.asm"
INCLUDE "data/tilesets/collision_tile_ids.asm"
INCLUDE "home/copy2.asm"
INCLUDE "home/text.asm"
INCLUDE "home/vcopy.asm"
INCLUDE "home/init.asm"
INCLUDE "home/vblank.asm"
INCLUDE "home/fade.asm"
INCLUDE "home/serial.asm"
INCLUDE "home/timer.asm"
INCLUDE "home/audio.asm"

UpdateSprites::
	ld a, [wUpdateSpritesEnabled]
	dec a
	ret nz
	ld a, [hLoadedROMBank]
	push af
	ld a, BANK(_UpdateSprites)
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call _UpdateSprites
	pop af
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

INCLUDE "data/items/marts.asm"
INCLUDE "home/overworld_text.asm"
INCLUDE "home/uncompress.asm"

ResetPlayerSpriteData::
	ld hl, wSpriteStateData1
	call ResetPlayerSpriteData_ClearSpriteData
	ld hl, wSpriteStateData2
	call ResetPlayerSpriteData_ClearSpriteData
	ld a, $1
	ld [wSpritePlayerStateData1PictureID], a
	ld [wSpritePlayerStateData2ImageBaseOffset], a
	ld hl, wSpritePlayerStateData1YPixels
	ld [hl], $3c     ; set Y screen pos
	inc hl
	inc hl
	ld [hl], $40     ; set X screen pos
	ret

; overwrites sprite data with zeroes
ResetPlayerSpriteData_ClearSpriteData::
	ld bc, $10
	xor a
	jp FillMemory

FadeOutAudio::
	ld a, [wAudioFadeOutControl]
	and a ; currently fading out audio?
	jr nz, .fadingOut
	ld a, [wd72c]
	bit 1, a
	ret nz
	ld a, $77
	ld [rNR50], a
	ret
.fadingOut
	ld a, [wAudioFadeOutCounter]
	and a
	jr z, .counterReachedZero
	dec a
	ld [wAudioFadeOutCounter], a
	ret
.counterReachedZero
	ld a, [wAudioFadeOutCounterReloadValue]
	ld [wAudioFadeOutCounter], a
	ld a, [rNR50]
	and a ; has the volume reached 0?
	jr z, .fadeOutComplete
	ld b, a
	and $f
	dec a
	ld c, a
	ld a, b
	and $f0
	swap a
	dec a
	swap a
	or c
	ld [rNR50], a
	ret
.fadeOutComplete
	ld a, [wAudioFadeOutControl]
	ld b, a
	xor a
	ld [wAudioFadeOutControl], a
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	ld a, [wAudioSavedROMBank]
	ld [wAudioROMBank], a
	ld a, b
	ld [wNewSoundID], a
	jp PlaySound

INCLUDE "home/text_script.asm"
INCLUDE "home/start_menu.asm"

; function to count how many bits are set in a string of bytes
; INPUT:
; hl = address of string of bytes
; b = length of string of bytes
; OUTPUT:
; [wNumSetBits] = number of set bits
CountSetBits::
	ld c, 0
.loop
	ld a, [hli]
	ld e, a
	ld d, 8
.innerLoop ; count how many bits are set in the current byte
	srl e
	ld a, 0
	adc c
	ld c, a
	dec d
	jr nz, .innerLoop
	dec b
	jr nz, .loop
	ld a, c
	ld [wNumSetBits], a
	ret

; subtracts the amount the player paid from their money
; OUTPUT: carry = 0(success) or 1(fail because there is not enough money)
SubtractAmountPaidFromMoney::
	jpba SubtractAmountPaidFromMoney_

; adds the amount the player sold to their money
AddAmountSoldToMoney::
	ld de, wPlayerMoney + 2
	ld hl, hMoney + 2 ; total price of items
	ld c, 3 ; length of money in bytes
	predef AddBCDPredef ; add total price to money
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID ; redraw money text box
	ld a, SFX_PURCHASE
	call PlaySoundWaitForCurrent
	jp WaitForSoundToFinish

; function to remove an item (in varying quantities) from the player's bag or PC box
; INPUT:
; HL = address of inventory (either wNumBagItems or wNumBoxItems)
; [wWhichPokemon] = index (within the inventory) of the item to remove
; [wItemQuantity] = quantity to remove
RemoveItemFromInventory::
	ld a, [hLoadedROMBank]
	push af
	ld a, BANK(RemoveItemFromInventory_)
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call RemoveItemFromInventory_
	pop af
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

; function to add an item (in varying quantities) to the player's bag or PC box
; INPUT:
; HL = address of inventory (either wNumBagItems or wNumBoxItems)
; [wcf91] = item ID
; [wItemQuantity] = item quantity
; sets carry flag if successful, unsets carry flag if unsuccessful
AddItemToInventory::
	push bc
	ld a, [hLoadedROMBank]
	push af
	ld a, BANK(AddItemToInventory_)
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call AddItemToInventory_
	pop bc
	ld a, b
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	pop bc
	ret

INCLUDE "home/list_menu.asm"
INCLUDE "home/names.asm"

; reloads text box tile patterns, current map view, and tileset tile patterns
ReloadMapData::
	ld a, [hLoadedROMBank]
	push af
	ld a, [wCurMap]
	call SwitchToMapRomBank
	call DisableLCD
	call LoadTextBoxTilePatterns
	call LoadCurrentMapView
	call LoadTilesetTilePatternData
	call EnableLCD
	pop af
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

; reloads tileset tile patterns
ReloadTilesetTilePatterns::
	ld a, [hLoadedROMBank]
	push af
	ld a, [wCurMap]
	call SwitchToMapRomBank
	call DisableLCD
	call LoadTilesetTilePatternData
	call EnableLCD
	pop af
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

; shows the town map and lets the player choose a destination to fly to
ChooseFlyDestination::
	ld hl, wd72e
	res 4, [hl]
	jpba LoadTownMap_Fly

; causes the text box to close without waiting for a button press after displaying text
DisableWaitingAfterTextDisplay::
	ld a, $01
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret

; uses an item
; UseItem is used with dummy items to perform certain other functions as well
; INPUT:
; [wcf91] = item ID
; OUTPUT:
; [wActionResultOrTookBattleTurn] = success
; 00: unsuccessful
; 01: successful
; 02: not able to be used right now, no extra menu displayed (only certain items use this)
UseItem::
	jpba UseItem_

; confirms the item toss and then tosses the item
; INPUT:
; hl = address of inventory (either wNumBagItems or wNumBoxItems)
; [wcf91] = item ID
; [wWhichPokemon] = index of item within inventory
; [wItemQuantity] = quantity to toss
; OUTPUT:
; clears carry flag if the item is tossed, sets carry flag if not
TossItem::
	ld a, [hLoadedROMBank]
	push af
	ld a, BANK(TossItem_)
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call TossItem_
	pop de
	ld a, d
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

; checks if an item is a key item
; INPUT:
; [wcf91] = item ID
; OUTPUT:
; [wIsKeyItem] = result
; 00: item is not key item
; 01: item is key item
IsKeyItem::
	push hl
	push de
	push bc
	callba IsKeyItem_
	pop bc
	pop de
	pop hl
	ret

; function to draw various text boxes
; INPUT:
; [wTextBoxID] = text box ID
; b, c = y, x cursor position (TWO_OPTION_MENU only)
DisplayTextBoxID::
	ld a, [hLoadedROMBank]
	push af
	ld a, BANK(DisplayTextBoxID_)
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call DisplayTextBoxID_
	pop bc
	ld a, b
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

; not zero if an NPC movement script is running, the player character is
; automatically stepping down from a door, or joypad states are being simulated
IsPlayerCharacterBeingControlledByGame::
	ld a, [wNPCMovementScriptPointerTableNum]
	and a
	ret nz
	ld a, [wd736]
	bit 1, a ; currently stepping down from door bit
	ret nz
	ld a, [wd730]
	and $80
	ret

RunNPCMovementScript::
	ld hl, wd736
	bit 0, [hl]
	res 0, [hl]
	jr nz, .playerStepOutFromDoor
	ld a, [wNPCMovementScriptPointerTableNum]
	and a
	ret z
	dec a
	add a
	ld d, 0
	ld e, a
	ld hl, .NPCMovementScriptPointerTables
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hLoadedROMBank]
	push af
	ld a, [wNPCMovementScriptBank]
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ld a, [wNPCMovementScriptFunctionNum]
	call CallFunctionInTable
	pop af
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

.NPCMovementScriptPointerTables
	dw PalletMovementScriptPointerTable
	dw PewterMuseumGuyMovementScriptPointerTable
	dw PewterGymGuyMovementScriptPointerTable
.playerStepOutFromDoor
	jpba PlayerStepOutFromDoor

EndNPCMovementScript::
	jpba _EndNPCMovementScript

EmptyFunc2::
	ret

INCLUDE "home/trainers.asm"

; checks if the player's coordinates match an arrow movement tile's coordinates
; and if so, decodes the RLE movement data
; b = player Y
; c = player X
DecodeArrowMovementRLE::
	ld a, [hli]
	cp $ff
	ret z ; no match in the list
	cp b
	jr nz, .nextArrowMovementTileEntry1
	ld a, [hli]
	cp c
	jr nz, .nextArrowMovementTileEntry2
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wSimulatedJoypadStatesEnd
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	ret
.nextArrowMovementTileEntry1
	inc hl
.nextArrowMovementTileEntry2
	inc hl
	inc hl
	jr DecodeArrowMovementRLE

TextScript_ItemStoragePC::
	call SaveScreenTilesToBuffer2
	ld b, BANK(PlayerPC)
	ld hl, PlayerPC
	jr bankswitchAndContinue

TextScript_BillsPC::
	call SaveScreenTilesToBuffer2
	ld b, BANK(BillsPC_)
	ld hl, BillsPC_
	jr bankswitchAndContinue

TextScript_GameCornerPrizeMenu::
; XXX find a better name for this function
; special_F7
	ld b, BANK(CeladonPrizeMenu)
	ld hl, CeladonPrizeMenu
bankswitchAndContinue::
	call Bankswitch
	jp HoldTextDisplayOpen        ; continue to main text-engine function

TextScript_PokemonCenterPC::
	ld b, BANK(ActivatePC)
	ld hl, ActivatePC
	jr bankswitchAndContinue

StartSimulatingJoypadStates::
	xor a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ld [wSpritePlayerStateData2MovementByte1], a
	ld hl, wd730
	set 7, [hl]
	ret

IsItemInBag::
; given an item_id in b
; set zero flag if item isn't in player's bag
; else reset zero flag
; related to Pokémon Tower and ghosts
	predef GetQuantityOfItemInBag
	ld a, b
	and a
	ret

DisplayPokedex::
	ld [wd11e], a
	jpba _DisplayPokedex

SetSpriteFacingDirectionAndDelay::
	call SetSpriteFacingDirection
	ld c, 6
	jp DelayFrames

SetSpriteFacingDirection::
	ld a, $9
	ld [hSpriteDataOffset], a
	call GetPointerWithinSpriteStateData1
	ld a, [hSpriteFacingDirection]
	ld [hl], a
	ret

SetSpriteImageIndexAfterSettingFacingDirection::
	ld de, -7
	add hl, de
	ld [hl], a
	ret

; tests if the player's coordinates are in a specified array
; INPUT:
; hl = address of array
; OUTPUT:
; [wCoordIndex] = if there is match, the matching array index
; sets carry if the coordinates are in the array, clears carry if not
ArePlayerCoordsInArray::
	ld a, [wYCoord]
	ld b, a
	ld a, [wXCoord]
	ld c, a
	; fallthrough

CheckCoords::
	xor a
	ld [wCoordIndex], a
.loop
	ld a, [hli]
	cp $ff ; reached terminator?
	jr z, .notInArray
	push hl
	ld hl, wCoordIndex
	inc [hl]
	pop hl
.compareYCoord
	cp b
	jr z, .compareXCoord
	inc hl
	jr .loop
.compareXCoord
	ld a, [hli]
	cp c
	jr nz, .loop
.inArray
	scf
	ret
.notInArray
	and a
	ret

; tests if a boulder's coordinates are in a specified array
; INPUT:
; hl = address of array
; [hSpriteIndex] = index of boulder sprite
; OUTPUT:
; [wCoordIndex] = if there is match, the matching array index
; sets carry if the coordinates are in the array, clears carry if not
CheckBoulderCoords::
	push hl
	ld hl, wSpritePlayerStateData2MapY
	ld a, [hSpriteIndex]
	swap a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hli]
	sub $4 ; because sprite coordinates are offset by 4
	ld b, a
	ld a, [hl]
	sub $4 ; because sprite coordinates are offset by 4
	ld c, a
	pop hl
	jp CheckCoords

GetPointerWithinSpriteStateData1::
	ld h, $c1
	jr _GetPointerWithinSpriteStateData

GetPointerWithinSpriteStateData2::
	ld h, $c2

_GetPointerWithinSpriteStateData:
	ld a, [hSpriteDataOffset]
	ld b, a
	ld a, [hSpriteIndex]
	swap a
	add b
	ld l, a
	ret

; decodes a $ff-terminated RLEncoded list
; each entry is a pair of bytes <byte value> <repetitions>
; the final $ff will be replicated in the output list and a contains the number of bytes written
; de: input list
; hl: output list
DecodeRLEList::
	xor a
	ld [wRLEByteCount], a     ; count written bytes here
.listLoop
	ld a, [de]
	cp $ff
	jr z, .endOfList
	ld [hRLEByteValue], a ; store byte value to be written
	inc de
	ld a, [de]
	ld b, $0
	ld c, a                      ; number of bytes to be written
	ld a, [wRLEByteCount]
	add c
	ld [wRLEByteCount], a     ; update total number of written bytes
	ld a, [hRLEByteValue]
	call FillMemory              ; write a c-times to output
	inc de
	jr .listLoop
.endOfList
	ld a, $ff
	ld [hl], a                   ; write final $ff
	ld a, [wRLEByteCount]
	inc a                        ; include sentinel in counting
	ret

; sets movement byte 1 for sprite [hSpriteIndex] to $FE and byte 2 to [hSpriteMovementByte2]
SetSpriteMovementBytesToFE::
	push hl
	call GetSpriteMovementByte1Pointer
	ld [hl], $fe
	call GetSpriteMovementByte2Pointer
	ld a, [hSpriteMovementByte2]
	ld [hl], a
	pop hl
	ret

; sets both movement bytes for sprite [hSpriteIndex] to $FF
SetSpriteMovementBytesToFF::
	push hl
	call GetSpriteMovementByte1Pointer
	ld [hl], $FF
	call GetSpriteMovementByte2Pointer
	ld [hl], $FF ; prevent person from walking?
	pop hl
	ret

; returns the sprite movement byte 1 pointer for sprite [hSpriteIndex] in hl
GetSpriteMovementByte1Pointer::
	ld h, $C2
	ld a, [hSpriteIndex]
	swap a
	add 6
	ld l, a
	ret

; returns the sprite movement byte 2 pointer for sprite [hSpriteIndex] in hl
GetSpriteMovementByte2Pointer::
	push de
	ld hl, wMapSpriteData
	ld a, [hSpriteIndex]
	dec a
	add a
	ld d, 0
	ld e, a
	add hl, de
	pop de
	ret

GetTrainerInformation::
	call GetTrainerName
	ld a, [wLinkState]
	and a
	jr nz, .linkBattle
	ld a, BANK(TrainerPicAndMoneyPointers)
	call BankswitchHome
	ld a, [wTrainerClass]
	dec a
	ld hl, TrainerPicAndMoneyPointers
	ld bc, $5
	call AddNTimes
	ld de, wTrainerPicPointer
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld de, wTrainerBaseMoney
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	jp BankswitchBack
.linkBattle
	ld hl, wTrainerPicPointer
	ld de, RedPicFront
	ld [hl], e
	inc hl
	ld [hl], d
	ret

GetTrainerName::
	jpba GetTrainerName_

HasEnoughMoney::
; Check if the player has at least as much
; money as the 3-byte BCD value at hMoney.
	ld de, wPlayerMoney
	ld hl, hMoney
	ld c, 3
	jp StringCmp

HasEnoughCoins::
; Check if the player has at least as many
; coins as the 2-byte BCD value at hCoins.
	ld de, wPlayerCoins
	ld hl, hCoins
	ld c, 2
	jp StringCmp

INCLUDE "home/bankswitch.asm"
INCLUDE "home/yes_no.asm"

; calculates the difference |a-b|, setting carry flag if a<b
CalcDifference::
	sub b
	ret nc
	cpl
	add $1
	scf
	ret

MoveSprite::
; move the sprite [hSpriteIndex] with the movement pointed to by de
; actually only copies the movement data to wNPCMovementDirections for later
	call SetSpriteMovementBytesToFF
MoveSprite_::
	push hl
	push bc
	call GetSpriteMovementByte1Pointer
	xor a
	ld [hl], a
	ld hl, wNPCMovementDirections
	ld c, 0

.loop
	ld a, [de]
	ld [hli], a
	inc de
	inc c
	cp $FF ; have we reached the end of the movement data?
	jr nz, .loop

	ld a, c
	ld [wNPCNumScriptedSteps], a ; number of steps taken

	pop bc
	ld hl, wd730
	set 0, [hl]
	pop hl
	xor a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ld [wSimulatedJoypadStatesEnd], a
	dec a
	ld [wJoyIgnore], a
	ld [wWastedByteCD3A], a
	ret

; divides [hDividend2] by [hDivisor2] and stores the quotient in [hQuotient2]
DivideBytes::
	push hl
	ld hl, hQuotient2
	xor a
	ld [hld], a
	ld a, [hld]
	and a
	jr z, .done
	ld a, [hli]
.loop
	sub [hl]
	jr c, .done
	inc hl
	inc [hl]
	dec hl
	jr .loop
.done
	pop hl
	ret

LoadFontTilePatterns::
	ld a, [rLCDC]
	bit 7, a ; is the LCD enabled?
	jr nz, .on
.off
	ld hl, FontGraphics
	ld de, vFont
	ld bc, FontGraphicsEnd - FontGraphics
	ld a, BANK(FontGraphics)
	jp FarCopyDataDouble ; if LCD is off, transfer all at once
.on
	ld de, FontGraphics
	ld hl, vFont
	lb bc, BANK(FontGraphics), (FontGraphicsEnd - FontGraphics) / $8
	jp CopyVideoDataDouble ; if LCD is on, transfer during V-blank

LoadTextBoxTilePatterns::
	ld a, [rLCDC]
	bit 7, a ; is the LCD enabled?
	jr nz, .on
.off
	ld hl, TextBoxGraphics
	ld de, vChars2 + $600
	ld bc, TextBoxGraphicsEnd - TextBoxGraphics
	ld a, BANK(TextBoxGraphics)
	jp FarCopyData2 ; if LCD is off, transfer all at once
.on
	ld de, TextBoxGraphics
	ld hl, vChars2 + $600
	lb bc, BANK(TextBoxGraphics), (TextBoxGraphicsEnd - TextBoxGraphics) / $10
	jp CopyVideoData ; if LCD is on, transfer during V-blank

LoadHpBarAndStatusTilePatterns::
	ld a, [rLCDC]
	bit 7, a ; is the LCD enabled?
	jr nz, .on
.off
	ld hl, HpBarAndStatusGraphics
	ld de, vChars2 + $620
	ld bc, HpBarAndStatusGraphicsEnd - HpBarAndStatusGraphics
	ld a, BANK(HpBarAndStatusGraphics)
	jp FarCopyData2 ; if LCD is off, transfer all at once
.on
	ld de, HpBarAndStatusGraphics
	ld hl, vChars2 + $620
	lb bc, BANK(HpBarAndStatusGraphics), (HpBarAndStatusGraphicsEnd - HpBarAndStatusGraphics) / $10
	jp CopyVideoData ; if LCD is on, transfer during V-blank

FillMemory::
; Fill bc bytes at hl with a.
	push de
	ld d, a
.loop
	ld a, d
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	pop de
	ret

UncompressSpriteFromDE::
; Decompress pic at a:de.
	ld hl, wSpriteInputPtr
	ld [hl], e
	inc hl
	ld [hl], d
	jp UncompressSpriteData

SaveScreenTilesToBuffer2::
	coord hl, 0, 0
	ld de, wTileMapBackup2
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyData
	ret

LoadScreenTilesFromBuffer2::
	call LoadScreenTilesFromBuffer2DisableBGTransfer
	ld a, 1
	ld [hAutoBGTransferEnabled], a
	ret

; loads screen tiles stored in wTileMapBackup2 but leaves hAutoBGTransferEnabled disabled
LoadScreenTilesFromBuffer2DisableBGTransfer::
	xor a
	ld [hAutoBGTransferEnabled], a
	ld hl, wTileMapBackup2
	coord de, 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyData
	ret

SaveScreenTilesToBuffer1::
	coord hl, 0, 0
	ld de, wTileMapBackup
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	jp CopyData

LoadScreenTilesFromBuffer1::
	xor a
	ld [hAutoBGTransferEnabled], a
	ld hl, wTileMapBackup
	coord de, 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyData
	ld a, 1
	ld [hAutoBGTransferEnabled], a
	ret

DelayFrames::
; wait c frames
	call DelayFrame
	dec c
	jr nz, DelayFrames
	ret

PlaySoundWaitForCurrent::
	push af
	call WaitForSoundToFinish
	pop af
	jp PlaySound

; Wait for sound to finish playing
WaitForSoundToFinish::
	ld a, [wLowHealthAlarm]
	and $80
	ret nz
	push hl
.waitLoop
	ld hl, wChannelSoundIDs + Ch5
	xor a
	or [hl]
	inc hl
	or [hl]
	inc hl
	inc hl
	or [hl]
	jr nz, .waitLoop
	pop hl
	ret

INCLUDE "home/names2.asm"

GetItemPrice::
; Stores item's price as BCD at hItemPrice (3 bytes)
; Input: [wcf91] = item id
	ld a, [hLoadedROMBank]
	push af
	ld a, [wListMenuID]
	cp MOVESLISTMENU
	ld a, BANK(ItemPrices)
	jr nz, .ok
	ld a, $f ; hardcoded Bank
.ok
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ld hl, wItemPrices
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcf91] ; a contains item id
	cp HM_01
	jr nc, .getTMPrice
	ld bc, $3
.loop
	add hl, bc
	dec a
	jr nz, .loop
	dec hl
	ld a, [hld]
	ld [hItemPrice + 2], a
	ld a, [hld]
	ld [hItemPrice + 1], a
	ld a, [hl]
	ld [hItemPrice], a
	jr .done
.getTMPrice
	ld a, BANK(GetMachinePrice)
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call GetMachinePrice
.done
	ld de, hItemPrice
	pop af
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

; copies a string from [de] to [wcf4b]
CopyStringToCF4B::
	ld hl, wcf4b
	; fall through

; copies a string from [de] to [hl]
CopyString::
	ld a, [de]
	inc de
	ld [hli], a
	cp "@"
	jr nz, CopyString
	ret

; this function is used when lower button sensitivity is wanted (e.g. menus)
; OUTPUT: [hJoy5] = pressed buttons in usual format
; there are two flags that control its functionality, [hJoy6] and [hJoy7]
; there are essentially three modes of operation
; 1. Get newly pressed buttons only
;    ([hJoy7] == 0, [hJoy6] == any)
;    Just copies [hJoyPressed] to [hJoy5].
; 2. Get currently pressed buttons at low sample rate with delay
;    ([hJoy7] == 1, [hJoy6] != 0)
;    If the user holds down buttons for more than half a second,
;    report buttons as being pressed up to 12 times per second thereafter.
;    If the user holds down buttons for less than half a second,
;    report only one button press.
; 3. Same as 2, but report no buttons as pressed if A or B is held down.
;    ([hJoy7] == 1, [hJoy6] == 0)
JoypadLowSensitivity::
	call Joypad
	ld a, [hJoy7] ; flag
	and a ; get all currently pressed buttons or only newly pressed buttons?
	ld a, [hJoyPressed] ; newly pressed buttons
	jr z, .storeButtonState
	ld a, [hJoyHeld] ; all currently pressed buttons
.storeButtonState
	ld [hJoy5], a
	ld a, [hJoyPressed] ; newly pressed buttons
	and a ; have any buttons been newly pressed since last check?
	jr z, .noNewlyPressedButtons
.newlyPressedButtons
	ld a, 30 ; half a second delay
	ld [hFrameCounter], a
	ret
.noNewlyPressedButtons
	ld a, [hFrameCounter]
	and a ; is the delay over?
	jr z, .delayOver
.delayNotOver
	xor a
	ld [hJoy5], a ; report no buttons as pressed
	ret
.delayOver
; if [hJoy6] = 0 and A or B is pressed, report no buttons as pressed
	ld a, [hJoyHeld]
	and A_BUTTON | B_BUTTON
	jr z, .setShortDelay
	ld a, [hJoy6] ; flag
	and a
	jr nz, .setShortDelay
	xor a
	ld [hJoy5], a
.setShortDelay
	ld a, 5 ; 1/12 of a second delay
	ld [hFrameCounter], a
	ret

WaitForTextScrollButtonPress::
	ld a, [hDownArrowBlinkCount1]
	push af
	ld a, [hDownArrowBlinkCount2]
	push af
	xor a
	ld [hDownArrowBlinkCount1], a
	ld a, $6
	ld [hDownArrowBlinkCount2], a
.loop
	push hl
	ld a, [wTownMapSpriteBlinkingEnabled]
	and a
	jr z, .skipAnimation
	call TownMapSpriteBlinkingAnimation
.skipAnimation
	coord hl, 18, 16
	call HandleDownArrowBlinkTiming
	pop hl
	call JoypadLowSensitivity
	predef CableClub_Run
	ld a, [hJoy5]
	and A_BUTTON | B_BUTTON
	jr z, .loop
	pop af
	ld [hDownArrowBlinkCount2], a
	pop af
	ld [hDownArrowBlinkCount1], a
	ret

; (unless in link battle) waits for A or B being pressed and outputs the scrolling sound effect
ManualTextScroll::
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr z, .inLinkBattle
	call WaitForTextScrollButtonPress
	ld a, SFX_PRESS_AB
	jp PlaySound
.inLinkBattle
	ld c, 65
	jp DelayFrames

; function to do multiplication
; all values are big endian
; INPUT
; FF96-FF98 =  multiplicand
; FF99 = multiplier
; OUTPUT
; FF95-FF98 = product
Multiply::
	push hl
	push bc
	callab _Multiply
	pop bc
	pop hl
	ret

; function to do division
; all values are big endian
; INPUT
; FF95-FF98 = dividend
; FF99 = divisor
; b = number of bytes in the dividend (starting from FF95)
; OUTPUT
; FF95-FF98 = quotient
; FF99 = remainder
Divide::
	push hl
	push de
	push bc
	ld a, [hLoadedROMBank]
	push af
	ld a, BANK(_Divide)
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call _Divide
	pop af
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	pop bc
	pop de
	pop hl
	ret

; This function is used to wait a short period after printing a letter to the
; screen unless the player presses the A/B button or the delay is turned off
; through the [wd730] or [wLetterPrintingDelayFlags] flags.
PrintLetterDelay::
	ld a, [wd730]
	bit 6, a
	ret nz
	ld a, [wLetterPrintingDelayFlags]
	bit 1, a
	ret z
	push hl
	push de
	push bc
	ld a, [wLetterPrintingDelayFlags]
	bit 0, a
	jr z, .waitOneFrame
	ld a, [wOptions]
	and $f
	ld [hFrameCounter], a
	jr .checkButtons
.waitOneFrame
	ld a, 1
	ld [hFrameCounter], a
.checkButtons
	call Joypad
	ld a, [hJoyHeld]
.checkAButton
	bit 0, a ; is the A button pressed?
	jr z, .checkBButton
	jr .endWait
.checkBButton
	bit 1, a ; is the B button pressed?
	jr z, .buttonsNotPressed
.endWait
	call DelayFrame
	jr .done
.buttonsNotPressed ; if neither A nor B is pressed
	ld a, [hFrameCounter]
	and a
	jr nz, .checkButtons
.done
	pop bc
	pop de
	pop hl
	ret

; Copies [hl, bc) to [de, de + bc - hl).
; In other words, the source data is from hl up to but not including bc,
; and the destination is de.
CopyDataUntil::
	ld a, [hli]
	ld [de], a
	inc de
	ld a, h
	cp b
	jr nz, CopyDataUntil
	ld a, l
	cp c
	jr nz, CopyDataUntil
	ret

INCLUDE "home/move_mon.asm"

; skips a text entries, each of size NAME_LENGTH (like trainer name, OT name, rival name, ...)
; hl: base pointer, will be incremented by NAME_LENGTH * a
SkipFixedLengthTextEntries::
	and a
	ret z
	ld bc, NAME_LENGTH
.skipLoop
	add hl, bc
	dec a
	jr nz, .skipLoop
	ret

AddNTimes::
; add bc to hl a times
	and a
	ret z
.loop
	add hl, bc
	dec a
	jr nz, .loop
	ret

; Compare strings, c bytes in length, at de and hl.
; Often used to compare big endian numbers in battle calculations.
StringCmp::
	ld a, [de]
	cp [hl]
	ret nz
	inc de
	inc hl
	dec c
	jr nz, StringCmp
	ret

; INPUT:
; a = oam block index (each block is 4 oam entries)
; b = Y coordinate of upper left corner of sprite
; c = X coordinate of upper left corner of sprite
; de = base address of 4 tile number and attribute pairs
WriteOAMBlock::
	ld h, wOAMBuffer / $100
	swap a ; multiply by 16
	ld l, a
	call .writeOneEntry ; upper left
	push bc
	ld a, 8
	add c
	ld c, a
	call .writeOneEntry ; upper right
	pop bc
	ld a, 8
	add b
	ld b, a
	call .writeOneEntry ; lower left
	ld a, 8
	add c
	ld c, a
	                      ; lower right
.writeOneEntry
	ld [hl], b ; Y coordinate
	inc hl
	ld [hl], c ; X coordinate
	inc hl
	ld a, [de] ; tile number
	inc de
	ld [hli], a
	ld a, [de] ; attribute
	inc de
	ld [hli], a
	ret

HandleMenuInput::
	xor a
	ld [wPartyMenuAnimMonEnabled], a

HandleMenuInput_::
	ld a, [hDownArrowBlinkCount1]
	push af
	ld a, [hDownArrowBlinkCount2]
	push af ; save existing values on stack
	xor a
	ld [hDownArrowBlinkCount1], a ; blinking down arrow timing value 1
	ld a, 6
	ld [hDownArrowBlinkCount2], a ; blinking down arrow timing value 2
.loop1
	xor a
	ld [wAnimCounter], a ; counter for pokemon shaking animation
	call PlaceMenuCursor
	call Delay3
.loop2
	push hl
	ld a, [wPartyMenuAnimMonEnabled]
	and a ; is it a pokemon selection menu?
	jr z, .getJoypadState
	callba AnimatePartyMon ; shake mini sprite of selected pokemon
.getJoypadState
	pop hl
	call JoypadLowSensitivity
	ld a, [hJoy5]
	and a ; was a key pressed?
	jr nz, .keyPressed
	push hl
	coord hl, 18, 11 ; coordinates of blinking down arrow in some menus
	call HandleDownArrowBlinkTiming ; blink down arrow (if any)
	pop hl
	ld a, [wMenuJoypadPollCount]
	dec a
	jr z, .giveUpWaiting
	jr .loop2
.giveUpWaiting
; if a key wasn't pressed within the specified number of checks
	pop af
	ld [hDownArrowBlinkCount2], a
	pop af
	ld [hDownArrowBlinkCount1], a ; restore previous values
	xor a
	ld [wMenuWrappingEnabled], a ; disable menu wrapping
	ret
.keyPressed
	xor a
	ld [wCheckFor180DegreeTurn], a
	ld a, [hJoy5]
	ld b, a
	bit 6, a ; pressed Up key?
	jr z, .checkIfDownPressed
.upPressed
	ld a, [wCurrentMenuItem] ; selected menu item
	and a ; already at the top of the menu?
	jr z, .alreadyAtTop
.notAtTop
	dec a
	ld [wCurrentMenuItem], a ; move selected menu item up one space
	jr .checkOtherKeys
.alreadyAtTop
	ld a, [wMenuWrappingEnabled]
	and a ; is wrapping around enabled?
	jr z, .noWrappingAround
	ld a, [wMaxMenuItem]
	ld [wCurrentMenuItem], a ; wrap to the bottom of the menu
	jr .checkOtherKeys
.checkIfDownPressed
	bit 7, a
	jr z, .checkOtherKeys
.downPressed
	ld a, [wCurrentMenuItem]
	inc a
	ld c, a
	ld a, [wMaxMenuItem]
	cp c
	jr nc, .notAtBottom
.alreadyAtBottom
	ld a, [wMenuWrappingEnabled]
	and a ; is wrapping around enabled?
	jr z, .noWrappingAround
	ld c, $00 ; wrap from bottom to top
.notAtBottom
	ld a, c
	ld [wCurrentMenuItem], a
.checkOtherKeys
	ld a, [wMenuWatchedKeys]
	and b ; does the menu care about any of the pressed keys?
	jp z, .loop1
.checkIfAButtonOrBButtonPressed
	ld a, [hJoy5]
	and A_BUTTON | B_BUTTON
	jr z, .skipPlayingSound
.AButtonOrBButtonPressed
	push hl
	ld hl, wFlags_0xcd60
	bit 5, [hl]
	pop hl
	jr nz, .skipPlayingSound
	ld a, SFX_PRESS_AB
	call PlaySound
.skipPlayingSound
	pop af
	ld [hDownArrowBlinkCount2], a
	pop af
	ld [hDownArrowBlinkCount1], a ; restore previous values
	xor a
	ld [wMenuWrappingEnabled], a ; disable menu wrapping
	ld a, [hJoy5]
	ret
.noWrappingAround
	ld a, [wMenuWatchMovingOutOfBounds]
	and a ; should we return if the user tried to go past the top or bottom?
	jr z, .checkOtherKeys
	jr .checkIfAButtonOrBButtonPressed

PlaceMenuCursor::
	ld a, [wTopMenuItemY]
	and a ; is the y coordinate 0?
	jr z, .adjustForXCoord
	coord hl, 0, 0
	ld bc, SCREEN_WIDTH
.topMenuItemLoop
	add hl, bc
	dec a
	jr nz, .topMenuItemLoop
.adjustForXCoord
	ld a, [wTopMenuItemX]
	ld b, 0
	ld c, a
	add hl, bc
	push hl
	ld a, [wLastMenuItem]
	and a ; was the previous menu id 0?
	jr z, .checkForArrow1
	push af
	ld a, [hFlagsFFF6]
	bit 1, a ; is the menu double spaced?
	jr z, .doubleSpaced1
	ld bc, 20
	jr .getOldMenuItemScreenPosition
.doubleSpaced1
	ld bc, 40
.getOldMenuItemScreenPosition
	pop af
.oldMenuItemLoop
	add hl, bc
	dec a
	jr nz, .oldMenuItemLoop
.checkForArrow1
	ld a, [hl]
	cp "▶" ; was an arrow next to the previously selected menu item?
	jr nz, .skipClearingArrow
.clearArrow
	ld a, [wTileBehindCursor]
	ld [hl], a
.skipClearingArrow
	pop hl
	ld a, [wCurrentMenuItem]
	and a
	jr z, .checkForArrow2
	push af
	ld a, [hFlagsFFF6]
	bit 1, a ; is the menu double spaced?
	jr z, .doubleSpaced2
	ld bc, 20
	jr .getCurrentMenuItemScreenPosition
.doubleSpaced2
	ld bc, 40
.getCurrentMenuItemScreenPosition
	pop af
.currentMenuItemLoop
	add hl, bc
	dec a
	jr nz, .currentMenuItemLoop
.checkForArrow2
	ld a, [hl]
	cp "▶" ; has the right arrow already been placed?
	jr z, .skipSavingTile ; if so, don't lose the saved tile
	ld [wTileBehindCursor], a ; save tile before overwriting with right arrow
.skipSavingTile
	ld a, "▶" ; place right arrow
	ld [hl], a
	ld a, l
	ld [wMenuCursorLocation], a
	ld a, h
	ld [wMenuCursorLocation + 1], a
	ld a, [wCurrentMenuItem]
	ld [wLastMenuItem], a
	ret

; This is used to mark a menu cursor other than the one currently being
; manipulated. In the case of submenus, this is used to show the location of
; the menu cursor in the parent menu. In the case of swapping items in list,
; this is used to mark the item that was first chosen to be swapped.
PlaceUnfilledArrowMenuCursor::
	ld b, a
	ld a, [wMenuCursorLocation]
	ld l, a
	ld a, [wMenuCursorLocation + 1]
	ld h, a
	ld [hl], $ec ; outline of right arrow
	ld a, b
	ret

; Replaces the menu cursor with a blank space.
EraseMenuCursor::
	ld a, [wMenuCursorLocation]
	ld l, a
	ld a, [wMenuCursorLocation + 1]
	ld h, a
	ld [hl], " "
	ret

; This toggles a blinking down arrow at hl on and off after a delay has passed.
; This is often called even when no blinking is occurring.
; The reason is that most functions that call this initialize hDownArrowBlinkCount1 to 0.
; The effect is that if the tile at hl is initialized with a down arrow,
; this function will toggle that down arrow on and off, but if the tile isn't
; initialized with a down arrow, this function does nothing.
; That allows this to be called without worrying about if a down arrow should
; be blinking.
HandleDownArrowBlinkTiming::
	ld a, [hl]
	ld b, a
	ld a, "▼"
	cp b
	jr nz, .downArrowOff
.downArrowOn
	ld a, [hDownArrowBlinkCount1]
	dec a
	ld [hDownArrowBlinkCount1], a
	ret nz
	ld a, [hDownArrowBlinkCount2]
	dec a
	ld [hDownArrowBlinkCount2], a
	ret nz
	ld a, " "
	ld [hl], a
	ld a, $ff
	ld [hDownArrowBlinkCount1], a
	ld a, $06
	ld [hDownArrowBlinkCount2], a
	ret
.downArrowOff
	ld a, [hDownArrowBlinkCount1]
	and a
	ret z
	dec a
	ld [hDownArrowBlinkCount1], a
	ret nz
	dec a
	ld [hDownArrowBlinkCount1], a
	ld a, [hDownArrowBlinkCount2]
	dec a
	ld [hDownArrowBlinkCount2], a
	ret nz
	ld a, $06
	ld [hDownArrowBlinkCount2], a
	ld a, "▼"
	ld [hl], a
	ret

; The following code either enables or disables the automatic drawing of
; text boxes by DisplayTextID. Both functions cause DisplayTextID to wait
; for a button press after displaying text (unless [wEnteringCableClub] is set).

EnableAutoTextBoxDrawing::
	xor a
	jr AutoTextBoxDrawingCommon

DisableAutoTextBoxDrawing::
	ld a, $01

AutoTextBoxDrawingCommon::
	ld [wAutoTextBoxDrawingControl], a
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a ; make DisplayTextID wait for button press
	ret

PrintText::
; Print text hl at (1, 14).
	push hl
	ld a, MESSAGE_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call UpdateSprites
	call Delay3
	pop hl
PrintText_NoCreatingTextBox::
	coord bc, 1, 14
	jp TextCommandProcessor

INCLUDE "home/print_num.asm"

CallFunctionInTable::
; Call function a in jumptable hl.
; de is not preserved.
	push hl
	push de
	push bc
	add a
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .returnAddress
	push de
	jp hl
.returnAddress
	pop bc
	pop de
	pop hl
	ret

IsInArray::
; Search an array at hl for the value in a.
; Entry size is de bytes.
; Return count b and carry if found.
	ld b, 0

IsInRestOfArray::
	ld c, a
.loop
	ld a, [hl]
	cp -1
	jr z, .notfound
	cp c
	jr z, .found
	inc b
	add hl, de
	jr .loop

.notfound
	and a
	ret

.found
	scf
	ret

RestoreScreenTilesAndReloadTilePatterns::
	call ClearSprites
	ld a, $1
	ld [wUpdateSpritesEnabled], a
	call ReloadMapSpriteTilePatterns
	call LoadScreenTilesFromBuffer2
	call LoadTextBoxTilePatterns
	call RunDefaultPaletteCommand
	jr Delay3

GBPalWhiteOutWithDelay3::
	call GBPalWhiteOut

Delay3::
; The bg map is updated each frame in thirds.
; Wait three frames to let the bg map fully update.
	ld c, 3
	jp DelayFrames

GBPalNormal::
; Reset BGP and OBP0.
	ld a, %11100100 ; 3210
	ld [rBGP], a
	ld a, %11010000 ; 3100
	ld [rOBP0], a
	ret

GBPalWhiteOut::
; White out all palettes.
	xor a
	ld [rBGP], a
	ld [rOBP0], a
	ld [rOBP1], a
	ret

RunDefaultPaletteCommand::
	ld b, SET_PAL_DEFAULT
RunPaletteCommand::
	ld a, [wOnSGB]
	and a
	ret z
	predef_jump _RunPaletteCommand

GetHealthBarColor::
; Return at hl the palette of
; an HP bar e pixels long.
	ld a, e
	cp 27
	ld d, 0 ; green
	jr nc, .gotColor
	cp 10
	inc d ; yellow
	jr nc, .gotColor
	inc d ; red
.gotColor
	ld [hl], d
	ret

; Copy the current map's sprites' tile patterns to VRAM again after they have
; been overwritten by other tile patterns.
ReloadMapSpriteTilePatterns::
	ld hl, wFontLoaded
	ld a, [hl]
	push af
	res 0, [hl]
	push hl
	xor a
	ld [wSpriteSetID], a
	call DisableLCD
	callba InitMapSprites
	call EnableLCD
	pop hl
	pop af
	ld [hl], a
	call LoadPlayerSpriteGraphics
	call LoadFontTilePatterns
	jp UpdateSprites

GiveItem::
; Give player quantity c of item b,
; and copy the item's name to wcf4b.
; Return carry on success.
	ld a, b
	ld [wd11e], a
	ld [wcf91], a
	ld a, c
	ld [wItemQuantity], a
	ld hl, wNumBagItems
	call AddItemToInventory
	ret nc
	call GetItemName
	call CopyStringToCF4B
	scf
	ret

GivePokemon::
; Give the player monster b at level c.
	ld a, b
	ld [wcf91], a
	ld a, c
	ld [wCurEnemyLVL], a
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	jpba _GivePokemon

Random::
; Return a random number in a.
; For battles, use BattleRandom.
	push hl
	push de
	push bc
	callba Random_
	ld a, [hRandomAdd]
	pop bc
	pop de
	pop hl
	ret

INCLUDE "home/predef.asm"

UpdateCinnabarGymGateTileBlocks::
	jpba UpdateCinnabarGymGateTileBlocks_

CheckForHiddenObjectOrBookshelfOrCardKeyDoor::
	ld a, [hLoadedROMBank]
	push af
	ld a, [hJoyHeld]
	bit 0, a ; A button
	jr z, .nothingFound
; A button is pressed
	ld a, BANK(CheckForHiddenObject)
	ld [MBC1RomBank], a
	ld [hLoadedROMBank], a
	call CheckForHiddenObject
	ld a, [hDidntFindAnyHiddenObject]
	and a
	jr nz, .hiddenObjectNotFound
	ld a, [wHiddenObjectFunctionRomBank]
	ld [MBC1RomBank], a
	ld [hLoadedROMBank], a
	ld de, .returnAddress
	push de
	jp hl
.returnAddress
	xor a
	jr .done
.hiddenObjectNotFound
	callba PrintBookshelfText
	ld a, [hFFDB]
	and a
	jr z, .done
.nothingFound
	ld a, $ff
.done
	ld [hItemAlreadyFound], a
	pop af
	ld [MBC1RomBank], a
	ld [hLoadedROMBank], a
	ret

PrintPredefTextID::
	ld [hSpriteIndexOrTextID], a
	ld hl, TextPredefs
	call SetMapTextPointer
	ld hl, wTextPredefFlag
	set 0, [hl]
	call DisplayTextID

RestoreMapTextPointer::
	ld hl, wMapTextPtr
	ld a, [hSavedMapTextPtr]
	ld [hli], a
	ld a, [hSavedMapTextPtr + 1]
	ld [hl], a
	ret

SetMapTextPointer::
	ld a, [wMapTextPtr]
	ld [hSavedMapTextPtr], a
	ld a, [wMapTextPtr + 1]
	ld [hSavedMapTextPtr + 1], a
	ld a, l
	ld [wMapTextPtr], a
	ld a, h
	ld [wMapTextPtr + 1], a
	ret

INCLUDE "data/text_predef_pointers.asm"
