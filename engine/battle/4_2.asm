EndOfBattle: ; 137aa (4:77aa)
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr nz, .notLinkBattle
; link battle
	ld a, [wEnemyMonPartyPos]
	ld hl, wEnemyMon1Status
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld a, [wEnemyMonStatus]
	ld [hl], a
	call ClearScreen
	callab DisplayLinkBattleVersusTextBox
	ld a, [wBattleResult]
	cp $1
	ld de, YouWinText
	jr c, .placeWinOrLoseString
	ld de, YouLoseText
	jr z, .placeWinOrLoseString
	ld de, DrawText
.placeWinOrLoseString
	hlCoord 6, 8
	call PlaceString
	ld c, $c8
	call DelayFrames
	jr .evolution
.notLinkBattle
	ld a, [wBattleResult]
	and a
	jr nz, .resetVariables
	ld hl, wTotalPayDayMoney
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	jr z, .evolution ; if pay day money is 0, jump
	ld de, wPlayerMoney + 2
	ld c, $3
	predef AddBCDPredef
	ld hl, PickUpPayDayMoneyText
	call PrintText
.evolution
	xor a
	ld [wccd4], a
	predef EvolutionAfterBattle
.resetVariables
	xor a
	ld [wd083], a
	ld [wc02a], a
	ld [W_ISINBATTLE], a
	ld [W_BATTLETYPE], a
	ld [W_MOVEMISSED], a
	ld [W_CUROPPONENT], a
	ld [wd11f], a
	ld [wNumRunAttempts], a
	ld [wEscapedFromBattle], a
	ld hl, wcc2b
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [wListScrollOffset], a
	ld hl, wPlayerStatsToDouble
	ld b, $18
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ld hl, wd72c
	set 0, [hl]
	call WaitForSoundToFinish
	call GBPalWhiteOut
	ld a, $ff
	ld [wDestinationWarpID], a
	ret

YouWinText: ; 13853 (4:7853)
	db "YOU WIN@"

YouLoseText: ; 1385b (4:785b)
	db "YOU LOSE@"

DrawText: ; 13864 (4:7864)
	db "  DRAW@"

PickUpPayDayMoneyText: ; 1386b (4:786b)
	TX_FAR _PickUpPayDayMoneyText
	db "@"

; try to initiate a wild pokemon encounter
; returns success in Z
TryDoWildEncounter: ; 13870 (4:7870)
	ld a, [wNPCMovementScriptPointerTableNum]
	and a
	ret nz
	ld a, [wd736]
	and a
	ret nz
	callab IsPlayerStandingOnDoorTileOrWarpTile
	jr nc, .notStandingOnDoorOrWarpTile
.CantEncounter
	ld a, $1
	and a
	ret
.notStandingOnDoorOrWarpTile
	callab IsPlayerJustOutsideMap
	jr z, .CantEncounter
	ld a, [wRepelRemainingSteps]
	and a
	jr z, .asm_1389e
	dec a
	jr z, .lastRepelStep
	ld [wRepelRemainingSteps], a
.asm_1389e
; determine if wild pokémon can appear in the half-block we’re standing in	
; is the bottom right tile (9,9) of the half-block we're standing in a grass/water tile?
	hlCoord 9, 9
	ld c, [hl]
	ld a, [W_GRASSTILE]
	cp c
	ld a, [W_GRASSRATE]
	jr z, .CanEncounter
	ld a, $14 ; in all tilesets with a water tile, this is its id
	cp c
	ld a, [W_WATERRATE]
	jr z, .CanEncounter
; even if not in grass/water, standing anywhere we can encounter pokémon
; so long as the map is “indoor” and has wild pokémon defined.
; …as long as it’s not Viridian Forest or Safari Zone.
	ld a, [W_CURMAP]
	cp REDS_HOUSE_1F ; is this an indoor map?
	jr c, .CantEncounter2
	ld a, [W_CURMAPTILESET]
	cp FOREST ; Viridian Forest/Safari Zone
	jr z, .CantEncounter2
	ld a, [W_GRASSRATE]
.CanEncounter
; compare encounter chance with a random number to determine if there will be an encounter
	ld b, a
	ld a, [hRandomAdd]
	cp b
	jr nc, .CantEncounter2
	ld a, [hRandomSub]
	ld b, a
	ld hl, WildMonEncounterSlotChances
.determineEncounterSlot
	ld a, [hli]
	cp b
	jr nc, .gotEncounterSlot
	inc hl
	jr .determineEncounterSlot
.gotEncounterSlot
; determine which wild pokémon (grass or water) can appear in the half-block we’re standing in
	ld c, [hl]
	ld hl, W_GRASSMONS
	aCoord 8, 9	
	cp $14 ; is the bottom left tile (8,9) of the half-block we're standing in a water tile?	
	jr nz, .gotWildEncounterType ; else, it's treated as a grass tile by default
	ld hl, W_WATERMONS
; since the bottom right tile of a "left shore" half-block is $14 but the bottom left tile is not,
; "left shore" half-blocks (such as the one in the east coast of Cinnabar) load grass encounters.	
.gotWildEncounterType
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld [W_CURENEMYLVL], a
	ld a, [hl]
	ld [wcf91], a
	ld [wEnemyMonSpecies2], a
	ld a, [wRepelRemainingSteps]
	and a
	jr z, .willEncounter
	ld a, [wPartyMon1Level]
	ld b, a
	ld a, [W_CURENEMYLVL]
	cp b
	jr c, .CantEncounter2 ; repel prevents encounters if the leading party mon's level is higher than the wild mon
	jr .willEncounter
.lastRepelStep
	ld [wRepelRemainingSteps], a
	ld a, $d2
	ld [H_DOWNARROWBLINKCNT2], a
	call EnableAutoTextBoxDrawing
	call DisplayTextID
.CantEncounter2
	ld a, $1
	and a
	ret
.willEncounter
	xor a
	ret

WildMonEncounterSlotChances: ; 13918 (4:7918)
; There are 10 slots for wild pokemon, and this is the table that defines how common each of
; those 10 slots is. A random number is generated and then the first byte of each pair in this
; table is compared against that random number. If the random number is less than or equal
; to the first byte, then that slot is chosen.  The second byte is double the slot number.
	db $32, $00 ; 51/256 = 19.9% chance of slot 0
	db $65, $02 ; 51/256 = 19.9% chance of slot 1
	db $8C, $04 ; 39/256 = 15.2% chance of slot 2
	db $A5, $06 ; 25/256 =  9.8% chance of slot 3
	db $BE, $08 ; 25/256 =  9.8% chance of slot 4
	db $D7, $0A ; 25/256 =  9.8% chance of slot 5
	db $E4, $0C ; 13/256 =  5.1% chance of slot 6
	db $F1, $0E ; 13/256 =  5.1% chance of slot 7
	db $FC, $10 ; 11/256 =  4.3% chance of slot 8
	db $FF, $12 ;  3/256 =  1.2% chance of slot 9

RecoilEffect_: ; 1392c (4:792c)
	ld a, [H_WHOSETURN]
	and a
	ld a, [W_PLAYERMOVENUM]
	ld hl, wBattleMonMaxHP
	jr z, .asm_1393d
	ld a, [W_ENEMYMOVENUM]
	ld hl, wEnemyMonMaxHP
.asm_1393d
	ld d, a
	ld a, [W_DAMAGE]
	ld b, a
	ld a, [W_DAMAGE + 1]
	ld c, a
	srl b
	rr c
	ld a, d
	cp STRUGGLE
	jr z, .asm_13953
	srl b
	rr c
.asm_13953
	ld a, b
	or c
	jr nz, .asm_13958
	inc c
.asm_13958
	ld a, [hli]
	ld [wHPBarMaxHP+1], a
	ld a, [hl]
	ld [wHPBarMaxHP], a
	push bc
	ld bc, $fff2
	add hl, bc
	pop bc
	ld a, [hl]
	ld [wHPBarOldHP], a
	sub c
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [hl]
	ld [wHPBarOldHP+1], a
	sbc b
	ld [hl], a
	ld [wHPBarNewHP+1], a
	jr nc, .asm_13982
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, wHPBarNewHP
	ld [hli], a
	ld [hl], a
.asm_13982
	hlCoord 10, 9
	ld a, [H_WHOSETURN]
	and a
	ld a, $1
	jr z, .asm_13990
	hlCoord 2, 2
	xor a
.asm_13990
	ld [wHPBarType], a
	predef UpdateHPBar2
	ld hl, HitWithRecoilText
	jp PrintText
HitWithRecoilText: ; 1399e (4:799e)
	TX_FAR _HitWithRecoilText
	db "@"

ConversionEffect_: ; 139a3 (4:79a3)
	ld hl, wEnemyMonType1
	ld de, wBattleMonType1
	ld a, [H_WHOSETURN]
	and a
	ld a, [W_ENEMYBATTSTATUS1]
	jr z, .asm_139b8
	push hl
	ld h, d
	ld l, e
	pop de
	ld a, [W_PLAYERBATTSTATUS1]
.asm_139b8
	bit Invulnerable, a ; is mon immune to typical attacks (dig/fly)
	jr nz, PrintButItFailedText
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld hl, PlayCurrentMoveAnimation
	call CallBankF
	ld hl, ConvertedTypeText
	jp PrintText

ConvertedTypeText: ; 139cd (4:79cd)
	TX_FAR _ConvertedTypeText
	db "@"

PrintButItFailedText: ; 139d2 (4:79d2)
	ld hl, PrintButItFailedText_
CallBankF: ; 139d5 (4:79d5)
	ld b, BANK(PrintButItFailedText_)
	jp Bankswitch

HazeEffect_: ; 139da (4:79da)
	ld a, $7
	ld hl, wPlayerMonAttackMod
	call ResetStatMods
	ld hl, wEnemyMonAttackMod
	call ResetStatMods
	ld hl, wPlayerMonUnmodifiedAttack
	ld de, wBattleMonAttack
	call ResetStats
	ld hl, wEnemyMonUnmodifiedAttack
	ld de, wEnemyMonAttack
	call ResetStats
	ld hl, wEnemyMonStatus
	ld de, wEnemySelectedMove
	ld a, [H_WHOSETURN]
	and a
	jr z, .asm_13a09
	ld hl, wBattleMonStatus
	dec de

.asm_13a09
	ld a, [hl]
	ld [hl], $0
	and $27
	jr z, .asm_13a13
	ld a, $ff
	ld [de], a

.asm_13a13
	xor a
	ld [W_PLAYERDISABLEDMOVE], a
	ld [W_ENEMYDISABLEDMOVE], a
	ld hl, wccee
	ld [hli], a
	ld [hl], a
	ld hl, W_PLAYERBATTSTATUS1
	call CureStatuses
	ld hl, W_ENEMYBATTSTATUS1
	call CureStatuses
	ld hl, PlayCurrentMoveAnimation
	call CallBankF
	ld hl, StatusChangesEliminatedText
	jp PrintText

CureStatuses: ; 13a37 (4:7a37)
	res Confused, [hl]
	inc hl ; BATTSTATUS2
	ld a, [hl]
	and (1 << UsingRage) | (1 << NeedsToRecharge) | (1 << HasSubstituteUp) | (1 << 3) ; clear all but these from BATTSTATUS2
	ld [hli], a ; BATTSTATUS3
	ld a, [hl]
	and %11110000 | (1 << Transformed) ; clear Bad Poison, Reflect and Light Screen statuses
	ld [hl], a
	ret

ResetStatMods: ; 13a43 (4:7a43)
	ld b, $8
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

ResetStats: ; 13a4a (4:7a4a)
	ld b, $8
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	ret

StatusChangesEliminatedText: ; 13a53 (4:7a53)
	TX_FAR _StatusChangesEliminatedText
	db "@"

GetTrainerName_: ; 13a58 (4:7a58)
	ld hl, W_GRASSRATE
	ld a, [wLinkState]
	and a
	jr nz, .rival
	ld hl, W_RIVALNAME
	ld a, [W_TRAINERCLASS]
	cp SONY1
	jr z, .rival
	cp SONY2
	jr z, .rival
	cp SONY3
	jr z, .rival
	ld [wd0b5], a
	ld a, TRAINER_NAME
	ld [wNameListType], a
	ld a, BANK(TrainerNames)
	ld [wPredefBank], a
	call GetName
	ld hl, wcd6d
.rival
	ld de, W_TRAINERNAME
	ld bc, $d
	jp CopyData
