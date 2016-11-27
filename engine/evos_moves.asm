; try to evolve the mon in [wWhichPokemon]
TryEvolvingMon:
	ld hl, wCanEvolveFlags
	xor a
	ld [hl], a
	ld a, [wWhichPokemon]
	ld e, a
	ld d, 0
	ld b, FLAG_SET
	call Evolution_FlagAction

; this is only called after battle
; it is supposed to do level up evolutions, though there is a bug that allows item evolutions to occur
EvolutionAfterBattle:
	ld a, [hTilesetType]
	push af
	xor a
	ld [wEvolutionOccurred], a
	dec a
	ld [wWhichPokemon], a
	push hl
	push bc
	push de
	ld hl, wPartyCount - 1
	push hl

Evolution_PartyMonLoop: ; loop over party mons
	ld hl, wWhichPokemon
	inc [hl]
	pop hl
	inc hl
	inc hl
	ld a, [hli]
	cp $ff ; have we reached the end of the party?
	jp nz, .notDone
	ld a, [hl]
	cp $ff
	jp z, .done
.notDone
	dec hl
	ld a, [hli]
	ld [wEvoOldSpecies], a
	ld a, [hl]
	ld [wEvoOldSpecies + 1], a
	dec hl
	push hl
	ld a, [wWhichPokemon]
	ld e, a
	ld d, 0
	ld hl, wCanEvolveFlags
	ld b, FLAG_TEST
	call Evolution_FlagAction
	ld a, c
	and a ; is the mon's bit set?
	jp z, Evolution_PartyMonLoop ; if not, go to the next mon
	ld a, [wEvoOldSpecies]
	ld c, a
	ld a, [wEvoOldSpecies + 1]
	ld b, a
	dec bc
	ld hl, EvosMovesPointerTable
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]  ; Bank of EvosMoves data
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a   ; hl is pointer to EvosMoves data
	ld a, b
	ld de,wEvosMovesData
	ld bc,wEvosMovesData_End - wEvosMovesData
	call FarCopyData
	ld hl, wEvosMovesData
	push hl
	ld a, [wcf91]
	ld c, a
	ld a, [wcf91 + 1]
	ld b, a
	push bc
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	call LoadMonData
	pop bc
	ld a, c
	ld [wcf91], a
	ld a, b
	ld [wcf91 + 1], a
	pop hl

.evoEntryLoop ; loop over evolution entries
	ld a, [hli]
	and a ; have we reached the end of the evolution data?
	jr z, Evolution_PartyMonLoop
	ld b, a ; evolution type
	cp EV_TRADE
	jr z, .checkTradeEvo
; not trade evolution
	ld a, [wLinkState]
	cp LINK_STATE_TRADING
	jr z, Evolution_PartyMonLoop ; if trading, go the next mon
	ld a, b
	cp EV_ITEM
	jr z, .checkItemEvo
	ld a, [wForceEvolution]
	and a
	jp nz, Evolution_PartyMonLoop
	ld a, b
	cp EV_LEVEL
	jr z, .checkLevel
	cp EV_RANDOM
	jr z, .checkEvoRandom
.checkTradeEvo
	ld a, [wLinkState]
	cp LINK_STATE_TRADING
	jp nz, .nextEvoEntry1 ; if not trading, go to the next evolution entry
	ld a, [hli] ; level requirement
	ld b, a
	ld a, [wLoadedMonLevel]
	cp b ; is the mon's level greater than the evolution requirement?
	jp c, Evolution_PartyMonLoop ; if so, go the next mon
	jr .doEvolution
.checkEvoRandom
	ld a, [hli] ; level requirement
	ld b, a
	ld a, [wLoadedMonLevel]
	cp b ; is the mon's level greater than the evolution requirement?
	jp c, .nextEvoEntry3
	; Use DV's on mon to determine which of the two possible evolutions to use. (50% chance)
	; We'll just add the DVs together, and use bit 0 to determine which evolution mon to use.
	ld a, [wLoadedMonDVs]
	ld b, a
	ld a, [wLoadedMonDVs + 1]
	add b
	bit 0, a
	jr z, .doEvolution
	inc hl
	inc hl
	jr .doEvolution
.checkItemEvo
	ld a, [hli]
	ld b, a ; evolution item
	ld a, [wcf91] ; this is supposed to be the last item used, but it is also used to hold species numbers
	cp b ; was the evolution item in this entry used?
	jp nz, .nextEvoEntry1 ; if not, go to the next evolution entry
.checkLevel
	ld a, [hli] ; level requirement
	ld b, a
	ld a, [wLoadedMonLevel]
	cp b ; is the mon's level greater than the evolution requirement?
	jp c, .nextEvoEntry2 ; if so, go the next evolution entry
.doEvolution
	ld [wCurEnemyLVL], a
	ld a, 1
	ld [wEvolutionOccurred], a
	push hl
	ld a, [hli]
	ld [wEvoNewSpecies], a
	ld a, [hli]
	ld [wEvoNewSpecies + 1], a
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	call CopyStringToCF4B
	ld hl, IsEvolvingText
	call PrintText
	ld c, 50
	call DelayFrames
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	coord hl, 0, 0
	lb bc, 12, 20
	call ClearScreenArea
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	call ClearSprites
	callab EvolveMon
	jp c, CancelledEvolution
	ld hl, EvolvedText
	call PrintText
	pop hl
	ld a, [hli]
	ld [wd0b5], a
	ld [wLoadedMonSpecies], a
	ld [wEvoNewSpecies], a
	ld a, [hl]
	ld [wd0b5 + 1], a
	ld [wLoadedMonSpecies + 1], a
	ld [wEvoNewSpecies + 1], a
	dec hl
	ld a, MONSTER_NAME
	ld [wNameListType], a
	ld a, BANK(TrainerNames) ; bank is not used for monster names
	ld [wPredefBank], a
	call GetName
	push hl
	ld hl, IntoText
	call PrintText_NoCreatingTextBox
	ld a, SFX_GET_ITEM_2
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld c, 40
	call DelayFrames
	call ClearScreen
	call RenameEvolvedMon
	ld a, [wd11e]
	ld c, a
	ld a, [wd11e + 1]
	ld b, a
	push bc
	ld a, [wd0b5]
	ld [wd11e], a
	ld a, [wd0b5 + 1]
	ld [wd11e + 1], a
	predef IndexToPokedex
	ld a, [wd11e]
	ld e, a
	ld a, [wd11e + 1]
	ld d, a
	dec de
	ld hl, BaseStatsPointers
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de,wMonHeader
	ld a, b
	ld bc,MonBaseStatsEnd - MonBaseStats
	call FarCopyData
	ld a, [wd0b5]
	ld [wMonHIndex], a
	ld a, [wd0b5 + 1]
	ld [wMonHIndex + 1], a
	pop bc
	ld a, c
	ld [wd11e], a
	ld a, b
	ld [wd11e + 1], a
	ld hl, wLoadedMonHPExp - 1
	ld de, wLoadedMonStats
	ld b, $1
	call CalcStats
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld e, l
	ld d, h
	push hl
	push bc
	ld bc, wPartyMon1MaxHP - wPartyMon1
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wLoadedMonMaxHP + 1
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a
	ld hl, wLoadedMonHP + 1
	ld a, [hl]
	add c
	ld [hld], a
	ld a, [hl]
	adc b
	ld [hl], a
	dec hl
	dec hl
	pop bc
	call CopyData
	ld a, [wd0b5]
	ld [wd11e], a
	ld a, [wd0b5 + 1]
	ld [wd11e + 1], a
	xor a
	ld [wMonDataLocation], a
	call LearnMoveFromLevelUp
	pop hl
	predef SetPartyMonTypes
	ld a, [wIsInBattle]
	and a
	call z, Evolution_ReloadTilesetTilePatterns
	predef IndexToPokedex
	ld a, [wd11e]
	ld e, a
	ld a, [wd11e + 1]
	ld d, a
	dec de
	ld b, FLAG_SET
	ld hl, wPokedexOwned
	push bc
	push de
	call Evolution_FlagAction
	pop de
	pop bc
	ld hl, wPokedexSeen
	call Evolution_FlagAction
	pop de
	pop hl
	ld a, [wLoadedMonSpecies]
	ld [hli], a
	ld a, [wLoadedMonSpecies + 1]
	ld [hl], a
	dec hl
	push hl
	ld l, e
	ld h, d
	jp Evolution_PartyMonLoop

.nextEvoEntry3
	inc hl

.nextEvoEntry1
	inc hl

.nextEvoEntry2
	inc hl
	inc hl
	jp .evoEntryLoop

.done
	pop de
	pop bc
	pop hl
	pop af
	ld [hTilesetType], a
	ld a, [wLinkState]
	cp LINK_STATE_TRADING
	ret z
	ld a, [wIsInBattle]
	and a
	ret nz
	ld a, [wEvolutionOccurred]
	and a
	call nz, PlayDefaultMusic
	ret

RenameEvolvedMon:
; Renames the mon to its new, evolved form's standard name unless it had a
; nickname, in which case the nickname is kept.
	ld a, [wd0b5]
	ld c, a
	ld a, [wd0b5 + 1]
	ld b, a
	push bc
	ld a, [wMonHIndex]
	ld [wd0b5], a
	ld a, [wMonHIndex + 1]
	ld [wd0b5 + 1], a
	call GetName
	pop bc
	ld a, c
	ld [wd0b5], a
	ld a, b
	ld [wd0b5 + 1], a
	ld hl, wcd6d
	ld de, wcf4b
.compareNamesLoop
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	ret nz
	cp "@"
	jr nz, .compareNamesLoop
	ld a, [wWhichPokemon]
	ld bc, NAME_LENGTH
	ld hl, wPartyMonNicks
	call AddNTimes
	push hl
	call GetName
	ld hl, wcd6d
	pop de
	jp CopyData

CancelledEvolution:
	ld hl, StoppedEvolvingText
	call PrintText
	call ClearScreen
	pop hl
	call Evolution_ReloadTilesetTilePatterns
	jp Evolution_PartyMonLoop

EvolvedText:
	TX_FAR _EvolvedText
	db "@"

IntoText:
	TX_FAR _IntoText
	db "@"

StoppedEvolvingText:
	TX_FAR _StoppedEvolvingText
	db "@"

IsEvolvingText:
	TX_FAR _IsEvolvingText
	db "@"

Evolution_ReloadTilesetTilePatterns:
	ld a, [wLinkState]
	cp LINK_STATE_TRADING
	ret z
	jp ReloadTilesetTilePatterns

LearnMoveFromLevelUp:
	ld a, [wd11e] ; species
	ld [wcf91], a
	ld c, a
	ld a, [wd11e + 1] ; species
	ld [wcf91 + 1], a
	ld b, a
	dec bc
	ld hl, EvosMovesPointerTable
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]  ; Bank of EvosMoves data
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a   ; hl is pointer to EvosMoves data
	ld a, b
	ld de,wEvosMovesData
	ld bc,wEvosMovesData_End - wEvosMovesData
	call FarCopyData
	ld hl,wEvosMovesData
.skipEvolutionsLoop
	ld a,[hli]
	and a ; reached terminator?
	jr z,.learnSetLoop
	cp a,EV_ITEM
	jr nz,.notEVItem
	inc hl
.notEVItem
	inc hl
	inc hl
	inc hl
	jr .skipEvolutionsLoop
.learnSetLoop ; loop over the learn set until we reach a move that is learnt at the current level or the end of the list
	ld a, [hli]
	and a ; have we reached the end of the learn set?
	jr z, .done ; if we've reached the end of the learn set, jump
	ld b, a ; level the move is learnt at
	ld a, [wCurEnemyLVL]
	cp b ; is the move learnt at the mon's current level?
	ld a, [hli] ; move ID
	jr nz, .learnSetLoop
	ld d, a ; ID of move to learn
	ld a, [wMonDataLocation]
	and a
	jr nz, .next
; If [wMonDataLocation] is 0 (PLAYER_PARTY_DATA), get the address of the mon's
; current moves in party data. Every call to this function sets
; [wMonDataLocation] to 0 because other data locations are not supported.
; If it is not 0, this function will not work properly.
	ld hl, wPartyMon1Moves
	ld a, [wWhichPokemon]
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
.next
	ld b, NUM_MOVES
.checkCurrentMovesLoop ; check if the move to learn is already known
	ld a, [hli]
	cp d
	jr z, .done ; if already known, jump
	dec b
	jr nz, .checkCurrentMovesLoop
	ld a, d
	ld [wMoveNum], a
	ld [wd11e], a
	call GetMoveName
	call CopyStringToCF4B
	predef LearnMove
.done
	ld a, [wcf91]
	ld [wd11e], a
	ld a, [wcf91 + 1]
	ld [wd11e + 1], a
	ret

; writes the moves a mon has at level [wCurEnemyLVL] to [de]
; move slots are being filled up sequentially and shifted if all slots are full
WriteMonMoves:
	call GetPredefRegisters
	push hl
	push de
	push bc
	push de
	ld a, [wcf91]  ; cur mon ID
	ld c, a
	ld a, [wcf91 + 1]  ; cur mon ID
	ld b, a
	dec bc
	ld hl, EvosMovesPointerTable
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]  ; Bank of EvosMoves data
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a   ; hl is pointer to EvosMoves data
	ld a, b
	ld de,wEvosMovesData
	ld bc,wEvosMovesData_End - wEvosMovesData
	call FarCopyData
	pop de
	ld hl,wEvosMovesData
.skipEvolutionsLoop
	ld a,[hli]
	and a ; reached terminator?
	jr z,.firstMove
	cp a,EV_ITEM
	jr nz,.notEVItem
	inc hl
.notEVItem
	inc hl
	inc hl
	inc hl
	jr .skipEvolutionsLoop
.nextMove
	pop de
.nextMove2
	inc hl
.firstMove
	ld a, [hli]       ; read level of next move in learnset
	and a
	jp z, .done       ; end of list
	ld b, a
	ld a, [wCurEnemyLVL]
	cp b
	jp c, .done       ; mon level < move level (assumption: learnset is sorted by level)
	ld a, [wLearningMovesFromDayCare]
	and a
	jr z, .skipMinLevelCheck
	ld a, [wDayCareStartLevel]
	cp b
	jr nc, .nextMove2 ; min level >= move level

.skipMinLevelCheck

; check if the move is already known
	push de
	ld c, NUM_MOVES
.alreadyKnowsCheckLoop
	ld a, [de]
	inc de
	cp [hl]
	jr z, .nextMove
	dec c
	jr nz, .alreadyKnowsCheckLoop

; try to find an empty move slot
	pop de
	push de
	ld c, NUM_MOVES
.findEmptySlotLoop
	ld a, [de]
	and a
	jr z, .writeMoveToSlot2
	inc de
	dec c
	jr nz, .findEmptySlotLoop

; no empty move slots found
	pop de
	push de
	push hl
	ld h, d
	ld l, e
	call WriteMonMoves_ShiftMoveData ; shift all moves one up (deleting move 1)
	ld a, [wLearningMovesFromDayCare]
	and a
	jr z, .writeMoveToSlot

; shift PP as well if learning moves from day care
	push de
	ld bc, wPartyMon1PP - (wPartyMon1Moves + 3)
	add hl, bc
	ld d, h
	ld e, l
	call WriteMonMoves_ShiftMoveData ; shift all move PP data one up
	pop de

.writeMoveToSlot
	pop hl
.writeMoveToSlot2
	ld a, [hl]
	ld [de], a
	ld a, [wLearningMovesFromDayCare]
	and a
	jr z, .nextMove

; write move PP value if learning moves from day care
	push hl
	ld a, [hl]
	ld hl, wPartyMon1PP - wPartyMon1Moves
	add hl, de
	push hl
	dec a
	ld hl, Moves
	ld bc, MoveEnd - Moves
	call AddNTimes
	ld de, wBuffer
	ld a, BANK(Moves)
	call FarCopyData
	ld a, [wBuffer + 5]
	pop hl
	ld [hl], a
	pop hl
	jr .nextMove

.done
	pop bc
	pop de
	pop hl
	ret

; shifts all move data one up (freeing 4th move slot)
WriteMonMoves_ShiftMoveData:
	ld c, NUM_MOVES - 1
.loop
	inc de
	ld a, [de]
	ld [hli], a
	dec c
	jr nz, .loop
	ret

Evolution_FlagAction:
	predef_jump FlagActionPredef

INCLUDE "data/evos_moves.asm"
