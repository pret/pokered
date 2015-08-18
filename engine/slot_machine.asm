PromptUserToPlaySlots: ; 3730e (d:730e)
	call SaveScreenTilesToBuffer2
	ld a, BANK(DisplayTextIDInit)
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
	ld [rOBP0], a
	ld hl, wd730
	set 6, [hl]
	xor a
	ld [wSlotMachineAllowMatchesCounter], a
	ld hl, wStoppingWhichSlotMachineWheel
	ld bc, $0014
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

PlaySlotMachineText: ; 37390 (d:7390)
	TX_FAR _PlaySlotMachineText
	db "@"

MainSlotMachineLoop: ; 37395 (d:7395)
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
	coord hl, 14, 11
	ld b, 5
	ld c, 4
	call TextBoxBorder
	coord hl, 16, 12
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
	coord hl, 14, 12
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

CoinMultiplierSlotMachineText: ; 3745e (d:745e)
	db   "×3"
	next "×2"
	next "×1@"

OutOfCoinsSlotMachineText: ; 37467 (d:7467)
	TX_FAR _OutOfCoinsSlotMachineText
	db "@"

BetHowManySlotMachineText: ; 3746c (d:746c)
	TX_FAR _BetHowManySlotMachineText
	db "@"

StartSlotMachineText: ; 37471 (d:7471)
	TX_FAR _StartSlotMachineText
	db "@"

NotEnoughCoinsSlotMachineText: ; 37476 (d:7476)
	TX_FAR _NotEnoughCoinsSlotMachineText
	db "@"

OneMoreGoSlotMachineText: ; 3747b (d:747b)
	TX_FAR _OneMoreGoSlotMachineText
	db "@"

SlotMachine_SetFlags: ; 37480 (d:7480)
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

SlotMachine_SpinWheels: ; 374ad (d:74ad)
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

SlotMachine_StopOrAnimWheel1: ; 374df (d:74df)
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

SlotMachine_StopOrAnimWheel2: ; 374fb (d:74fb)
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

SlotMachine_StopOrAnimWheel3: ; 37517 (d:7517)
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

SlotMachine_StopWheel1Early: ; 3752c (d:752c)
	call SlotMachine_GetWheel1Tiles
	ld hl, wSlotMachineWheel1BottomTile
	ld a, [wSlotMachineFlags]
	and $80
	jr nz, .sevenAndBarMode
; Stop early if the middle symbol is not a cherry.
	inc hl
	ld a, [hl]
	cp SLOTSCHERRY >> 8
	jr nz, .stopWheel
	ret
; It looks like this was intended to make the wheel stop when a 7 symbol was
; visible, but it has a bug and so the wheel stops randomly.
.sevenAndBarMode
	ld c, $3
.loop
	ld a, [hli]
	cp SLOTS7 >> 8
	jr c, .stopWheel ; condition never true
	dec c
	jr nz, .loop
	ret
.stopWheel
	inc a
	ld hl, wSlotMachineWheel1SlipCounter
	ld [hl], 0
	ret

SlotMachine_StopWheel2Early: ; 37552 (d:7552)
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
	cp (SLOTSBAR >> 8) + 1
	ret nc
.stopWheel
	xor a
	ld [wSlotMachineWheel2SlipCounter], a
	ret

SlotMachine_FindWheel1Wheel2Matches: ; 3756e (d:756e)
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

SlotMachine_CheckForMatches: ; 37588 (d:7588)
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
	cp (SLOTSBAR >> 8) + 1
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
	jp [hl]

.flashScreenLoop
	ld a, [rBGP]
	xor $40
	ld [rBGP], a
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
	ld [rOBP0], a
	jp .done

SymbolLinedUpSlotMachineText: ; 37665 (d:7665)
	TX_ASM
	push bc
	call SlotMachine_PrintWinningSymbol
	ld hl, LinedUpText
	pop bc
	inc bc
	inc bc
	inc bc
	inc bc
	ret

LinedUpText: ; 37673 (d:7673)
	TX_FAR _LinedUpText
	db "@"

SlotRewardPointers: ; 37678 (d:7678)
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

SlotReward300Text: ; 37690 (d:7690)
	db "300@"

SlotReward100Text: ; 37694 (d:7694)
	db "100@"

SlotReward8Text: ; 37698 (d:7698)
	db "8@"

SlotReward15Text: ; 3769a (d:769a)
	db "15@"

NotThisTimeText: ; 3769d (d:769d)
	TX_FAR _NotThisTimeText
	db "@"

; compares the slot machine tiles at bc, de, and hl
SlotMachine_CheckForMatch: ; 376a2 (d:76a2)
	ld a, [de]
	cp [hl]
	ret nz
	ld a, [bc]
	cp [hl]
	ret

SlotMachine_GetWheel3Tiles: ; 376a8 (d:76a8)
	ld de, wSlotMachineWheel3BottomTile
	ld hl, SlotMachineWheel3
	ld a, [wSlotMachineWheel3Offset]
	call SlotMachine_GetWheelTiles

SlotMachine_GetWheel2Tiles: ; 376b4 (d:76b4)
	ld de, wSlotMachineWheel2BottomTile
	ld hl, SlotMachineWheel2
	ld a, [wSlotMachineWheel2Offset]
	call SlotMachine_GetWheelTiles

SlotMachine_GetWheel1Tiles: ; 376c0 (d:76c0)
	ld de, wSlotMachineWheel1BottomTile
	ld hl, SlotMachineWheel1
	ld a, [wSlotMachineWheel1Offset]

SlotMachine_GetWheelTiles: ; 376c9 (d:76c9)
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

SlotReward8Func: ; 376d7 (d:76d7)
	ld hl, wSlotMachineAllowMatchesCounter
	ld a, [hl]
	and a
	jr z, .skip
	dec [hl]
.skip
	ld b, $2
	ld de, 8
	ret

SlotReward15Func: ; 376e5 (d:76e5)
	ld hl, wSlotMachineAllowMatchesCounter
	ld a, [hl]
	and a
	jr z, .skip
	dec [hl]
.skip
	ld b, $4
	ld de, 15
	ret

SlotReward100Func: ; 376f3 (d:76f3)
	ld a, SFX_GET_KEY_ITEM
	call PlaySound
	xor a
	ld [wSlotMachineFlags], a
	ld b, $8
	ld de, 100
	ret

SlotReward300Func: ; 37702 (d:7702)
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

YeahText: ; 37722 (d:7722)
	TX_FAR _YeahText
	db $0a, "@"

SlotMachine_PrintWinningSymbol: ; 37728 (d:7728)
; prints winning symbol and down arrow in text box
	coord hl, 2, 14
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
	coord hl, 18, 16
	ld [hl], $ee ; down arrow
	ret

SlotMachine_SubtractBetFromPlayerCoins: ; 37741 (d:7741)
	ld hl, wTempCoins2 + 1
	ld a, [wSlotMachineBet]
	ld [hld], a
	xor a
	ld [hli], a
	ld de, wPlayerCoins + 1
	ld c, $2
	predef SubBCDPredef

SlotMachine_PrintCreditCoins: ; 37754 (d:7754)
	coord hl, 5, 1
	ld de, wPlayerCoins
	ld c, $2
	jp PrintBCDNumber

SlotMachine_PrintPayoutCoins: ; 3775f (d:775f)
	coord hl, 11, 1
	ld de, wPayoutCoins
	lb bc, LEADING_ZEROES | 2, 4 ; 2 bytes, 4 digits
	jp PrintNumber

SlotMachine_PayCoinsToPlayer: ; 3776b (d:776b)
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
	ld a, [rOBP0]
	xor $40 ; make the slot wheel symbols flash
	ld [rOBP0], a
	ld a, 5
.skip1
	ld [wAnimCounter], a
	ld a, [wSlotMachineWinningSymbol]
	cp (SLOTSBAR >> 8) + 1
	ld c, 8
	jr nc, .skip2
	srl c ; c = 4 (make the the coins transfer faster if the symbol was 7 or bar)
.skip2
	call DelayFrames
	jr .loop

SlotMachine_PutOutLitBalls: ; 377ce (d:77ce)
	ld a, $23
	ld [wNewSlotMachineBallTile], a
	jr SlotMachine_UpdateThreeCoinBallTiles

SlotMachine_LightBalls: ; 377d5 (d:77d5)
	ld a, $14
	ld [wNewSlotMachineBallTile], a
	ld a, [wSlotMachineBet]
	dec a
	jr z, SlotMachine_UpdateOneCoinBallTiles
	dec a
	jr z, SlotMachine_UpdateTwoCoinBallTiles

SlotMachine_UpdateThreeCoinBallTiles: ; 377e3 (d:77e3)
	coord hl, 3, 2
	call SlotMachine_UpdateBallTiles
	coord hl, 3, 10
	call SlotMachine_UpdateBallTiles

SlotMachine_UpdateTwoCoinBallTiles: ; 377ef (d:77ef)
	coord hl, 3, 4
	call SlotMachine_UpdateBallTiles
	coord hl, 3, 8
	call SlotMachine_UpdateBallTiles

SlotMachine_UpdateOneCoinBallTiles: ; 377fb (d:77fb)
	coord hl, 3, 6

SlotMachine_UpdateBallTiles: ; 377fe (d:77fe)
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

SlotMachine_AnimWheel1: ; 37813 (d:7813)
	ld bc, SlotMachineWheel1
	ld de, wSlotMachineWheel1Offset
	ld hl, wOAMBuffer
	ld a, $30
	ld [W_BASECOORDX], a
	jr SlotMachine_AnimWheel

SlotMachine_AnimWheel2: ; 37823 (d:7823)
	ld bc, SlotMachineWheel2
	ld de, wSlotMachineWheel2Offset
	ld hl, wOAMBuffer + $30
	ld a, $50
	ld [W_BASECOORDX], a
	jr SlotMachine_AnimWheel

SlotMachine_AnimWheel3: ; 37833 (d:7833)
	ld bc, SlotMachineWheel3
	ld de, wSlotMachineWheel3Offset
	ld hl, wOAMBuffer + $60
	ld a, $70
	ld [W_BASECOORDX], a

SlotMachine_AnimWheel: ; 37841 (d:7841)
	ld a, $58
	ld [W_BASECOORDY], a
	push de
	ld a, [de]
	ld d, b
	add c
	ld e, a
	jr nc, .loop
	inc d
.loop
	ld a, [W_BASECOORDY]
	ld [hli], a
	ld a, [W_BASECOORDX]
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld a, $80
	ld [hli], a
	ld a, [W_BASECOORDY]
	ld [hli], a
	ld a, [W_BASECOORDX]
	add $8
	ld [hli], a
	ld a, [de]
	inc a
	ld [hli], a
	ld a, $80
	ld [hli], a
	inc de
	ld a, [W_BASECOORDY]
	sub $8
	ld [W_BASECOORDY], a
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

SlotMachine_HandleInputWhileWheelsSpin: ; 37882 (d:7882)
	call DelayFrame
	call JoypadLowSensitivity
	ld a, [hJoy5]
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

LoadSlotMachineTiles: ; 378a8 (d:78a8)
	call DisableLCD
	ld hl, SlotMachineTiles2
	ld de, vChars0
	ld bc, $1c0
	ld a, BANK(SlotMachineTiles2)
	call FarCopyData2
	ld hl, SlotMachineTiles1
	ld de, vChars2
	ld bc, $250
	ld a, BANK(SlotMachineTiles1)
	call FarCopyData2
	ld hl, SlotMachineTiles2
	ld de, vChars2 + $250
	ld bc, $1c0
	ld a, BANK(SlotMachineTiles2)
	call FarCopyData2
	ld hl, SlotMachineMap
	coord de, 0, 0
	ld bc, $00f0
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

SlotMachineMap: ; 378f5 (d:78f5)
	INCBIN "gfx/tilemaps/slotmachine.map"

INCLUDE "data/slot_machine_wheels.asm"

SlotMachineTiles1: ; 37a51 (d:7a51)
IF DEF(_RED)
	INCBIN "gfx/red/slotmachine1.2bpp"
ENDC
IF DEF(_BLUE)
	INCBIN "gfx/blue/slotmachine1.2bpp"
ENDC
IF DEF(_YELLOW)
	INCBIN "gfx/yellow/slotmachine1.2bpp"
ENDC
