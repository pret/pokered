PromptUserToPlaySlots:
	call SaveScreenTilesToBuffer2
	ld a, BANK(DisplayTextIDInit) ; TRUE
	ld [wAutoTextBoxDrawingControl], a
	ld b, a
	ld hl, DisplayTextIDInit
	call Bankswitch
	ld hl, PlaySlotMachineText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done ; if player chose No
	dec a
	ld [wUpdateSpritesEnabled], a
	ld hl, wSlotMachineRerollCounter
	xor a
	ld [hli], a
	ld [hl], SMILE_BUBBLE
	predef EmotionBubble
	call GBPalWhiteOutWithDelay3
	call LoadSlotMachineTiles
	call LoadFontTilePatterns
	ld b, SET_PAL_SLOTS
	call RunPaletteCommand
	call GBPalNormal
	ld a, $e4
	ldh [rOBP0], a
	ld hl, wd730
	set 6, [hl]
	xor a
	ld [wSlotMachineAllowMatchesCounter], a
	ld hl, wStoppingWhichSlotMachineWheel
	ld bc, $14
	call FillMemory
	call MainSlotMachineLoop
	ld hl, wd730
	res 6, [hl]
	xor a
	ld [wSlotMachineAllowMatchesCounter], a
	call GBPalWhiteOutWithDelay3
	ld a, $1
	ld [wUpdateSpritesEnabled], a
	call RunDefaultPaletteCommand
	call ReloadMapSpriteTilePatterns
	call ReloadTilesetTilePatterns
.done
	call LoadScreenTilesFromBuffer2
	call Delay3
	call GBPalNormal
	ld a, [wSlotMachineSavedROMBank]
	push af
	jp CloseTextDisplay

PlaySlotMachineText:
	text_far _PlaySlotMachineText
	text_end

MainSlotMachineLoop:
	call SlotMachine_PrintCreditCoins
	xor a
	ld hl, wPayoutCoins
	ld [hli], a
	ld [hl], a
	call SlotMachine_PrintPayoutCoins
	ld hl, BetHowManySlotMachineText
	call PrintText
	call SaveScreenTilesToBuffer1
.loop
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, 2
	ld [wMaxMenuItem], a
	ld a, 12
	ld [wTopMenuItemY], a
	ld a, 15
	ld [wTopMenuItemX], a
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wMenuWatchMovingOutOfBounds], a
	hlcoord 14, 11
	ld b, 5
	ld c, 4
	call TextBoxBorder
	hlcoord 16, 12
	ld de, CoinMultiplierSlotMachineText
	call PlaceString
	call HandleMenuInput
	and B_BUTTON
	jp nz, LoadScreenTilesFromBuffer1
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, 3
	sub b
	ld [wSlotMachineBet], a
	ld hl, wPlayerCoins
	ld c, a
	ld a, [hli]
	and a
	jr nz, .skip1
	ld a, [hl]
	cp c
	jr nc, .skip1
	ld hl, NotEnoughCoinsSlotMachineText
	call PrintText
	jr .loop
.skip1
	call LoadScreenTilesFromBuffer1
	call SlotMachine_SubtractBetFromPlayerCoins
	call SlotMachine_LightBalls
	call SlotMachine_SetFlags
	ld a, 4
	ld hl, wSlotMachineWheel1SlipCounter
	ld [hli], a
	ld [hli], a
	ld [hl], a
	call WaitForSoundToFinish
	ld a, SFX_SLOTS_NEW_SPIN
	call PlaySound
	ld hl, StartSlotMachineText
	call PrintText
	call SlotMachine_SpinWheels
	call SlotMachine_CheckForMatches
	ld hl, wPlayerCoins
	ld a, [hli]
	or [hl]
	jr nz, .skip2
	ld hl, OutOfCoinsSlotMachineText
	call PrintText
	ld c, 60
	jp DelayFrames
.skip2
	ld hl, OneMoreGoSlotMachineText
	call PrintText
	hlcoord 14, 12
	lb bc, 13, 15
	xor a ; YES_NO_MENU
	ld [wTwoOptionMenuID], a
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld a, [wCurrentMenuItem]
	and a
	ret nz
	call SlotMachine_PutOutLitBalls
	jp MainSlotMachineLoop

CoinMultiplierSlotMachineText:
	db   "×3"
	next "×2"
	next "×1@"

OutOfCoinsSlotMachineText:
	text_far _OutOfCoinsSlotMachineText
	text_end

BetHowManySlotMachineText:
	text_far _BetHowManySlotMachineText
	text_end

StartSlotMachineText:
	text_far _StartSlotMachineText
	text_end

NotEnoughCoinsSlotMachineText:
	text_far _NotEnoughCoinsSlotMachineText
	text_end

OneMoreGoSlotMachineText:
	text_far _OneMoreGoSlotMachineText
	text_end

SlotMachine_SetFlags:
	ld hl, wSlotMachineFlags
	bit 7, [hl]
	ret nz
	ld a, [wSlotMachineAllowMatchesCounter]
	and a
	jr nz, .allowMatches
	call Random
	and a
	jr z, .setAllowMatchesCounter ; 1/256 (~0.4%) chance
	ld b, a
	ld a, [wSlotMachineSevenAndBarModeChance]
	cp b
	jr c, .allowSevenAndBarMatches
	ld a, 210
	cp b
	jr c, .allowMatches ; 55/256 (~21.5%) chance
	ld [hl], 0
	ret
.allowMatches
	set 6, [hl]
	ret
.setAllowMatchesCounter
	ld a, 60
	ld [wSlotMachineAllowMatchesCounter], a
	ret
.allowSevenAndBarMatches
	set 7, [hl]
	ret

SlotMachine_SpinWheels:
	ld c, 20
.loop1
	push bc
	call SlotMachine_AnimWheel1
	call SlotMachine_AnimWheel2
	call SlotMachine_AnimWheel3
	ld c, 2
	call DelayFrames
	pop bc
	dec c
	jr nz, .loop1
	xor a
	ld [wStoppingWhichSlotMachineWheel], a
.loop2
	call SlotMachine_HandleInputWhileWheelsSpin
	call SlotMachine_StopOrAnimWheel1
	call SlotMachine_StopOrAnimWheel2
	call SlotMachine_StopOrAnimWheel3
	ret c
	ld a, [wOnSGB]
	xor $1
	inc a
	ld c, a
	call DelayFrames
	jr .loop2

; Note that the wheels can only stop when a symbol is centred in the wheel
; and thus 3 full symbols rather than 2 full symbols and 2 half symbols are
; visible. The 3 functions below ensure this by checking if the wheel offset
; is even before stopping the wheel.

SlotMachine_StopOrAnimWheel1:
	ld a, [wStoppingWhichSlotMachineWheel]
	cp 1
	jr c, .animWheel
	ld de, wSlotMachineWheel1Offset
	ld a, [de]
	rra
	jr nc, .animWheel ; check that a symbol is centred in the wheel
	ld hl, wSlotMachineWheel1SlipCounter
	ld a, [hl]
	and a
	ret z
	dec [hl]
	call SlotMachine_StopWheel1Early
	ret nz
.animWheel
	jp SlotMachine_AnimWheel1

SlotMachine_StopOrAnimWheel2:
	ld a, [wStoppingWhichSlotMachineWheel]
	cp 2
	jr c, .animWheel
	ld de, wSlotMachineWheel2Offset
	ld a, [de]
	rra
	jr nc, .animWheel ; check that a symbol is centred in the wheel
	ld hl, wSlotMachineWheel2SlipCounter
	ld a, [hl]
	and a
	ret z
	dec [hl]
	call SlotMachine_StopWheel2Early
	ret z
.animWheel
	jp SlotMachine_AnimWheel2

SlotMachine_StopOrAnimWheel3:
	ld a, [wStoppingWhichSlotMachineWheel]
	cp 3
	jr c, .animWheel
	ld de, wSlotMachineWheel3Offset
	ld a, [de]
	rra
	jr nc, .animWheel ; check that a symbol is centred in the wheel
; wheel 3 stops as soon as possible
	scf
	ret
.animWheel
	call SlotMachine_AnimWheel3
	and a
	ret

SlotMachine_StopWheel1Early:
	call SlotMachine_GetWheel1Tiles
	ld hl, wSlotMachineWheel1BottomTile
	ld a, [wSlotMachineFlags]
	and $80
	jr nz, .sevenAndBarMode
; Stop early if the middle symbol is not a cherry.
	inc hl
	ld a, [hl]
	cp HIGH(SLOTSCHERRY)
	jr nz, .stopWheel
	ret
; It looks like this was intended to make the wheel stop when a 7 symbol was
; visible, but it has a bug and so the wheel stops randomly.
.sevenAndBarMode
	ld c, $3
.loop
	ld a, [hli]
	cp HIGH(SLOTS7)
	jr c, .stopWheel ; condition never true
	dec c
	jr nz, .loop
	ret
.stopWheel
	inc a
	ld hl, wSlotMachineWheel1SlipCounter
	ld [hl], 0
	ret

SlotMachine_StopWheel2Early:
	call SlotMachine_GetWheel2Tiles
	ld a, [wSlotMachineFlags]
	and $80
	jr nz, .sevenAndBarMode
; Stop early if any symbols are lined up in the first two wheels.
	call SlotMachine_FindWheel1Wheel2Matches
	ret nz
	jr .stopWheel
; Stop early if two 7 symbols or two bar symbols are lined up in the first two
; wheels OR if no symbols are lined up and the bottom symbol in wheel 2 is a
; 7 symbol or bar symbol. The second part could be a bug or a way to reduce the
; player's odds.
.sevenAndBarMode
	call SlotMachine_FindWheel1Wheel2Matches
	ld a, [de]
	cp HIGH(SLOTSBAR) + 1
	ret nc
.stopWheel
	xor a
	ld [wSlotMachineWheel2SlipCounter], a
	ret

SlotMachine_FindWheel1Wheel2Matches:
; return whether wheel 1 and wheel 2's current positions allow a match (given
; that wheel 3 stops in a good position) in Z
	ld hl, wSlotMachineWheel1BottomTile
	ld de, wSlotMachineWheel2BottomTile
	ld a, [de]
	cp [hl] ; wheel 1 bottom, wheel 2 bottom
	ret z
	inc de
	ld a, [de]
	cp [hl] ; wheel 1 bottom, wheel 2 middle
	ret z
	inc hl
	cp [hl] ; wheel 1 middle, wheel 2 middle
	ret z
	inc hl
	cp [hl] ; wheel 1 top, wheel 2 middle
	ret z
	inc de
	ld a, [de]
	cp [hl] ; wheel 1 top, wheel 2 top
	ret z
	dec de
	dec de
	ret

SlotMachine_CheckForMatches:
	call SlotMachine_GetWheel3Tiles
	ld a, [wSlotMachineBet]
	cp 2
	jr z, .checkMatchesFor2CoinBet
	cp 1
	jr z, .checkMatchFor1CoinBet
; 3 coin bet allows diagonal matches (plus the matches for 1/2 coin bets)
	ld hl, wSlotMachineWheel1BottomTile
	ld de, wSlotMachineWheel2MiddleTile
	ld bc, wSlotMachineWheel3TopTile
	call SlotMachine_CheckForMatch
	jp z, .foundMatch
	ld hl, wSlotMachineWheel1TopTile
	ld de, wSlotMachineWheel2MiddleTile
	ld bc, wSlotMachineWheel3BottomTile
	call SlotMachine_CheckForMatch
	jr z, .foundMatch
; 2 coin bet allows top/bottom horizontal matches (plus the match for a 1 coin bet)
.checkMatchesFor2CoinBet
	ld hl, wSlotMachineWheel1TopTile
	ld de, wSlotMachineWheel2TopTile
	ld bc, wSlotMachineWheel3TopTile
	call SlotMachine_CheckForMatch
	jr z, .foundMatch
	ld hl, wSlotMachineWheel1BottomTile
	ld de, wSlotMachineWheel2BottomTile
	ld bc, wSlotMachineWheel3BottomTile
	call SlotMachine_CheckForMatch
	jr z, .foundMatch
; 1 coin bet only allows a middle horizontal match
.checkMatchFor1CoinBet
	ld hl, wSlotMachineWheel1MiddleTile
	ld de, wSlotMachineWheel2MiddleTile
	ld bc, wSlotMachineWheel3MiddleTile
	call SlotMachine_CheckForMatch
	jr z, .foundMatch
	ld a, [wSlotMachineFlags]
	and $c0
	jr z, .noMatch
	ld hl, wSlotMachineRerollCounter
	dec [hl]
	jr nz, .rollWheel3DownByOneSymbol
.noMatch
	ld hl, NotThisTimeText
	call PrintText
.done
	xor a
	ld [wMuteAudioAndPauseMusic], a
	ret
.rollWheel3DownByOneSymbol
	call SlotMachine_AnimWheel3
	call DelayFrame
	call SlotMachine_AnimWheel3
	call DelayFrame
	jp SlotMachine_CheckForMatches
.foundMatch
	ld a, [wSlotMachineFlags]
	and $c0
	jr z, .rollWheel3DownByOneSymbol ; roll wheel if player isn't allowed to win
	and $80
	jr nz, .acceptMatch
; if 7/bar matches aren't enabled and the match was a 7/bar symbol, roll wheel
	ld a, [hl]
	cp HIGH(SLOTSBAR) + 1
	jr c, .rollWheel3DownByOneSymbol
.acceptMatch
	ld a, [hl]
	sub $2
	ld [wSlotMachineWinningSymbol], a
	ld hl, SlotRewardPointers
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wcf4b
	ld bc, 4
	call CopyData
	pop hl
	ld de, .flashScreenLoop
	push de
	jp hl

.flashScreenLoop
	ldh a, [rBGP]
	xor $40
	ldh [rBGP], a
	ld c, 5
	call DelayFrames
	dec b
	jr nz, .flashScreenLoop
	ld hl, wPayoutCoins
	ld [hl], d
	inc hl
	ld [hl], e
	call SlotMachine_PrintPayoutCoins
	ld hl, SymbolLinedUpSlotMachineText
	call PrintText
	call WaitForTextScrollButtonPress
	call SlotMachine_PayCoinsToPlayer
	call SlotMachine_PrintPayoutCoins
	ld a, $e4
	ldh [rOBP0], a
	jp .done

SymbolLinedUpSlotMachineText:
	text_asm
	push bc
	call SlotMachine_PrintWinningSymbol
	ld hl, LinedUpText
	pop bc
	inc bc
	inc bc
	inc bc
	inc bc
	ret

LinedUpText:
	text_far _LinedUpText
	text_end

SlotRewardPointers:
	dw SlotReward300Func
	dw SlotReward300Text
	dw SlotReward100Func
	dw SlotReward100Text
	dw SlotReward8Func
	dw SlotReward8Text
	dw SlotReward15Func
	dw SlotReward15Text
	dw SlotReward15Func
	dw SlotReward15Text
	dw SlotReward15Func
	dw SlotReward15Text

SlotReward300Text:
	db "300@"

SlotReward100Text:
	db "100@"

SlotReward8Text:
	db "8@"

SlotReward15Text:
	db "15@"

NotThisTimeText:
	text_far _NotThisTimeText
	text_end

; compares the slot machine tiles at bc, de, and hl
SlotMachine_CheckForMatch:
	ld a, [de]
	cp [hl]
	ret nz
	ld a, [bc]
	cp [hl]
	ret

SlotMachine_GetWheel3Tiles:
	ld de, wSlotMachineWheel3BottomTile
	ld hl, SlotMachineWheel3
	ld a, [wSlotMachineWheel3Offset]
	call SlotMachine_GetWheelTiles

SlotMachine_GetWheel2Tiles:
	ld de, wSlotMachineWheel2BottomTile
	ld hl, SlotMachineWheel2
	ld a, [wSlotMachineWheel2Offset]
	call SlotMachine_GetWheelTiles

SlotMachine_GetWheel1Tiles:
	ld de, wSlotMachineWheel1BottomTile
	ld hl, SlotMachineWheel1
	ld a, [wSlotMachineWheel1Offset]

SlotMachine_GetWheelTiles:
	ld c, a
	ld b, 0
	add hl, bc
	ld c, 3
.loop
	ld a, [hli]
	ld [de], a
	inc de
	inc hl
	dec c
	jr nz, .loop
	ret

SlotReward8Func:
	ld hl, wSlotMachineAllowMatchesCounter
	ld a, [hl]
	and a
	jr z, .skip
	dec [hl]
.skip
	ld b, $2
	ld de, 8
	ret

SlotReward15Func:
	ld hl, wSlotMachineAllowMatchesCounter
	ld a, [hl]
	and a
	jr z, .skip
	dec [hl]
.skip
	ld b, $4
	ld de, 15
	ret

SlotReward100Func:
	ld a, SFX_GET_KEY_ITEM
	call PlaySound
	xor a
	ld [wSlotMachineFlags], a
	ld b, $8
	ld de, 100
	ret

SlotReward300Func:
	ld hl, YeahText
	call PrintText
	ld a, SFX_GET_ITEM_2
	call PlaySound
	call Random
	cp $80
	ld a, $0
	jr c, .skip
	ld [wSlotMachineFlags], a
.skip
	ld [wSlotMachineAllowMatchesCounter], a
	ld b, $14
	ld de, 300
	ret

YeahText:
	text_far _YeahText
	text_pause
	text_end

SlotMachine_PrintWinningSymbol:
; prints winning symbol and down arrow in text box
	hlcoord 2, 14
	ld a, [wSlotMachineWinningSymbol]
	add $25
	ld [hli], a
	inc a
	ld [hld], a
	inc a
	ld de, -SCREEN_WIDTH
	add hl, de
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 18, 16
	ld [hl], "▼"
	ret

SlotMachine_SubtractBetFromPlayerCoins:
	ld hl, wTempCoins2 + 1
	ld a, [wSlotMachineBet]
	ld [hld], a
	xor a
	ld [hli], a
	ld de, wPlayerCoins + 1
	ld c, $2
	predef SubBCDPredef

SlotMachine_PrintCreditCoins:
	hlcoord 5, 1
	ld de, wPlayerCoins
	ld c, $2
	jp PrintBCDNumber

SlotMachine_PrintPayoutCoins:
	hlcoord 11, 1
	ld de, wPayoutCoins
	lb bc, LEADING_ZEROES | 2, 4 ; 2 bytes, 4 digits
	jp PrintNumber

SlotMachine_PayCoinsToPlayer:
	ld a, $1
	ld [wMuteAudioAndPauseMusic], a
	call WaitForSoundToFinish

; Put 1 in the temp coins variable. This value is added to the player's coins
; repeatedly so the player can watch the value go up 1 coin at a time.
	ld hl, wTempCoins1
	xor a
	ld [hli], a
	inc a
	ld [hl], a

	ld a, 5
	ld [wAnimCounter], a

; Subtract 1 from the payout amount and add 1 to the player's coins each
; iteration until the payout amount reaches 0.
.loop
	ld a, [wPayoutCoins + 1]
	ld l, a
	ld a, [wPayoutCoins]
	ld h, a
	or l
	ret z
	ld de, -1
	add hl, de
	ld a, l
	ld [wPayoutCoins + 1], a
	ld a, h
	ld [wPayoutCoins], a
	ld hl, wTempCoins1 + 1
	ld de, wPlayerCoins + 1
	ld c, $2
	predef AddBCDPredef
	call SlotMachine_PrintCreditCoins
	call SlotMachine_PrintPayoutCoins
	ld a, SFX_SLOTS_REWARD
	call PlaySound
	ld a, [wAnimCounter]
	dec a
	jr nz, .skip1
	ldh a, [rOBP0]
	xor $40 ; make the slot wheel symbols flash
	ldh [rOBP0], a
	ld a, 5
.skip1
	ld [wAnimCounter], a
	ld a, [wSlotMachineWinningSymbol]
	cp HIGH(SLOTSBAR) + 1
	ld c, 8
	jr nc, .skip2
	srl c ; c = 4 (make the the coins transfer faster if the symbol was 7 or bar)
.skip2
	call DelayFrames
	jr .loop

SlotMachine_PutOutLitBalls:
	ld a, $23
	ld [wNewSlotMachineBallTile], a
	jr SlotMachine_UpdateThreeCoinBallTiles

SlotMachine_LightBalls:
	ld a, $14
	ld [wNewSlotMachineBallTile], a
	ld a, [wSlotMachineBet]
	dec a
	jr z, SlotMachine_UpdateOneCoinBallTiles
	dec a
	jr z, SlotMachine_UpdateTwoCoinBallTiles

SlotMachine_UpdateThreeCoinBallTiles:
	hlcoord 3, 2
	call SlotMachine_UpdateBallTiles
	hlcoord 3, 10
	call SlotMachine_UpdateBallTiles

SlotMachine_UpdateTwoCoinBallTiles:
	hlcoord 3, 4
	call SlotMachine_UpdateBallTiles
	hlcoord 3, 8
	call SlotMachine_UpdateBallTiles

SlotMachine_UpdateOneCoinBallTiles:
	hlcoord 3, 6

SlotMachine_UpdateBallTiles:
	ld a, [wNewSlotMachineBallTile]
	ld [hl], a
	ld bc, 13
	add hl, bc
	ld [hl], a
	ld bc, 7
	add hl, bc
	inc a
	ld [hl], a
	ld bc, 13
	add hl, bc
	ld [hl], a
	ret

SlotMachine_AnimWheel1:
	ld bc, SlotMachineWheel1
	ld de, wSlotMachineWheel1Offset
	ld hl, wOAMBuffer
	ld a, $30
	ld [wBaseCoordX], a
	jr SlotMachine_AnimWheel

SlotMachine_AnimWheel2:
	ld bc, SlotMachineWheel2
	ld de, wSlotMachineWheel2Offset
	ld hl, wOAMBuffer + $30
	ld a, $50
	ld [wBaseCoordX], a
	jr SlotMachine_AnimWheel

SlotMachine_AnimWheel3:
	ld bc, SlotMachineWheel3
	ld de, wSlotMachineWheel3Offset
	ld hl, wOAMBuffer + $60
	ld a, $70
	ld [wBaseCoordX], a

SlotMachine_AnimWheel:
	ld a, $58
	ld [wBaseCoordY], a
	push de
	ld a, [de]
	ld d, b
	add c
	ld e, a
	jr nc, .loop
	inc d
.loop
	ld a, [wBaseCoordY]
	ld [hli], a
	ld a, [wBaseCoordX]
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld a, $80
	ld [hli], a
	ld a, [wBaseCoordY]
	ld [hli], a
	ld a, [wBaseCoordX]
	add $8
	ld [hli], a
	ld a, [de]
	inc a
	ld [hli], a
	ld a, $80
	ld [hli], a
	inc de
	ld a, [wBaseCoordY]
	sub $8
	ld [wBaseCoordY], a
	cp $28
	jr nz, .loop
	pop de
	ld a, [de]
	inc a ; advance the offset so that the wheel animates
	cp 30
	jr nz, .skip
	xor a ; wrap around to 0 when the offset reaches 30
.skip
	ld [de], a
	ret

SlotMachine_HandleInputWhileWheelsSpin:
	call DelayFrame
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	and A_BUTTON
	ret z
	ld hl, wStoppingWhichSlotMachineWheel
	ld a, [hl]
	dec a
	ld de, wSlotMachineWheel1SlipCounter
	jr z, .skip
	dec a
	ld de, wSlotMachineWheel2SlipCounter
	jr z, .skip
.loop
	inc [hl]
	ld a, SFX_SLOTS_STOP_WHEEL
	jp PlaySound
.skip
	ld a, [de]
	and a
	ret nz
	jr .loop

LoadSlotMachineTiles:
	call DisableLCD
	ld hl, SlotMachineTiles2
	ld de, vChars0
	ld bc, $1c tiles ; should be SlotMachineTiles2End - SlotMachineTiles2, or $18 tiles
	ld a, BANK(SlotMachineTiles2)
	call FarCopyData2
	ld hl, SlotMachineTiles1
	ld de, vChars2
	ld bc, SlotMachineTiles1End - SlotMachineTiles1
	ld a, BANK(SlotMachineTiles1)
	call FarCopyData2
	ld hl, SlotMachineTiles2
	ld de, vChars2 tile $25
	ld bc, $1c tiles ; should be SlotMachineTiles2End - SlotMachineTiles2, or $18 tiles
	ld a, BANK(SlotMachineTiles2)
	call FarCopyData2
	ld hl, SlotMachineMap
	decoord 0, 0
	ld bc, SlotMachineMapEnd - SlotMachineMap
	call CopyData
	call EnableLCD
	ld hl, wSlotMachineWheel1Offset
	ld a, $1c
	ld [hli], a
	ld [hli], a
	ld [hl], a
	call SlotMachine_AnimWheel1
	call SlotMachine_AnimWheel2
	jp SlotMachine_AnimWheel3

SlotMachineMap:
	INCBIN "gfx/slots/slots.tilemap"
SlotMachineMapEnd:

INCLUDE "data/events/slot_machine_wheels.asm"

SlotMachineTiles1:
IF DEF(_RED)
	INCBIN "gfx/slots/red_slots_1.2bpp"
ENDC
IF DEF(_BLUE)
	INCBIN "gfx/slots/blue_slots_1.2bpp"
ENDC
SlotMachineTiles1End:
