; try to evolve the mon in [wWhichPokemon]
TryEvolvingMon: ; 3ad0e (e:6d0e)
	ld hl, wccd3
	xor a
	ld [hl], a
	ld a, [wWhichPokemon]
	ld c, a
	ld b, $1
	call Evolution_FlagAction

; this is only called after battle
; it is supposed to do level up evolutions, though there is a bug that allows item evolutions to occur
EvolutionAfterBattle: ; 3ad1c (e:6d1c)
	ld a, [hTilesetType]
	push af
	xor a
	ld [wd121], a
	dec a
	ld [wWhichPokemon], a
	push hl
	push bc
	push de
	ld hl, wPartyCount
	push hl

Evolution_PartyMonLoop: ; loop over party mons
	ld hl, wWhichPokemon
	inc [hl]
	pop hl
	inc hl
	ld a, [hl]
	cp $ff ; have we reached the end of the party?
	jp z, .done
	ld [wHPBarMaxHP], a
	push hl
	ld a, [wWhichPokemon]
	ld c, a
	ld hl, wccd3
	ld b, $2
	call Evolution_FlagAction
	ld a, c
	and a ; is the mon's bit set?
	jp z, Evolution_PartyMonLoop ; if not, go to the next mon
	ld a, [wHPBarMaxHP]
	dec a
	ld b, 0
	ld hl, EvosMovesPointerTable
	add a
	rl b
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld a, [wcf91]
	push af
	xor a
	ld [wcc49], a
	call LoadMonData
	pop af
	ld [wcf91], a
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
	ld a, [wccd4]
	and a
	jr nz, Evolution_PartyMonLoop
	ld a, b
	cp EV_LEVEL
	jr z, .checkLevel
.checkTradeEvo
	ld a, [wLinkState]
	cp LINK_STATE_TRADING
	jp nz, .nextEvoEntry1 ; if not trading, go to the next evolution entry
	ld a, [hli] ; level requirement
	ld b, a
	ld a, [wLoadedMonLevel]
	cp b ; is the mon's level greater than the evolution requirement?
	jp c, Evolution_PartyMonLoop ; if so, go the next mon
	jr .asm_3adb6
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
.asm_3adb6
	ld [W_CURENEMYLVL], a
	ld a, $1
	ld [wd121], a
	push hl
	ld a, [hl]
	ld [wHPBarMaxHP + 1], a
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	call CopyStringToCF4B
	ld hl, IsEvolvingText
	call PrintText
	ld c, $32
	call DelayFrames
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	ld hl, wTileMap
	ld bc, $c14
	call ClearScreenArea
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	call ClearSprites
	callab Func_7bde9
	jp c, CancelledEvolution
	ld hl, EvolvedText
	call PrintText
	pop hl
	ld a, [hl]
	ld [wd0b5], a
	ld [wLoadedMonSpecies], a
	ld [wHPBarMaxHP + 1], a
	ld a, MONSTER_NAME
	ld [wNameListType], a
	ld a, BANK(TrainerNames) ; bank is not used for monster names
	ld [wPredefBank], a
	call GetName
	push hl
	ld hl, IntoText
	call Func_3c59
	ld a, (SFX_02_3b - SFX_Headers_02) / 3
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld c, $28
	call DelayFrames
	call ClearScreen
	call RenameEvolvedMon
	ld a, [wd11e]
	push af
	ld a, [wd0b5]
	ld [wd11e], a
	predef IndexToPokedex
	ld a, [wd11e]
	dec a
	ld hl, BaseStats
	ld bc, $1c
	call AddNTimes
	ld de, W_MONHEADER
	call CopyData
	ld a, [wd0b5]
	ld [W_MONHDEXNUM], a
	pop af
	ld [wd11e], a
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
	pop bc
	call CopyData
	ld a, [wd0b5]
	ld [wd11e], a
	xor a
	ld [wcc49], a
	call LearnMoveFromLevelUp
	pop hl
	predef SetPartyMonTypes
	ld a, [W_ISINBATTLE]
	and a
	call z, Evolution_ReloadTilesetTilePatterns
	predef IndexToPokedex
	ld a, [wd11e]
	dec a
	ld c, a
	ld b, $1
	ld hl, wPokedexOwned
	push bc
	call Evolution_FlagAction
	pop bc
	ld hl, wPokedexSeen
	call Evolution_FlagAction
	pop de
	pop hl
	ld a, [wLoadedMonSpecies]
	ld [hl], a
	push hl
	ld l, e
	ld h, d
	jr .nextEvoEntry2

.nextEvoEntry1
	inc hl

.nextEvoEntry2
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
	ld a, [W_ISINBATTLE]
	and a
	ret nz
	ld a, [wd121]
	and a
	call nz, PlayDefaultMusic
	ret

; checks if the evolved mon's name is different from the standard name (i.e. it has a nickname)
; if so, rename it to is evolved form's standard name
RenameEvolvedMon: ; 3aef7 (e:6ef7)
	ld a, [wd0b5]
	push af
	ld a, [W_MONHDEXNUM]
	ld [wd0b5], a
	call GetName
	pop af
	ld [wd0b5], a
	ld hl, wcd6d
	ld de, wcf4b
.compareNamesLoop
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	ret nz
	cp $50
	jr nz, .compareNamesLoop
	ld a, [wWhichPokemon]
	ld bc, $b
	ld hl, wPartyMonNicks
	call AddNTimes
	push hl
	call GetName
	ld hl, wcd6d
	pop de
	jp CopyData

CancelledEvolution: ; 3af2e (e:6f2e)
	ld hl, StoppedEvolvingText
	call PrintText
	call ClearScreen
	pop hl
	call Evolution_ReloadTilesetTilePatterns
	jp Evolution_PartyMonLoop

EvolvedText: ; 3af3e (e:6f3e)
	TX_FAR _EvolvedText
	db "@"

IntoText: ; 3af43 (e:6f43)
	TX_FAR _IntoText
	db "@"

StoppedEvolvingText: ; 3af48 (e:6f48)
	TX_FAR _StoppedEvolvingText
	db "@"

IsEvolvingText: ; 3af4d (e:6f4d)
	TX_FAR _IsEvolvingText
	db "@"

Evolution_ReloadTilesetTilePatterns: ; 3af52 (e:6f52)
	ld a, [wLinkState]
	cp LINK_STATE_TRADING
	ret z
	jp ReloadTilesetTilePatterns

LearnMoveFromLevelUp: ; 3af5b (e:6f5b)
	ld hl, EvosMovesPointerTable
	ld a, [wd11e] ; species
	ld [wcf91], a
	dec a
	ld bc, 0
	ld hl, EvosMovesPointerTable
	add a
	rl b
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.skipEvolutionDataLoop ; loop to skip past the evolution data, which comes before the move data
	ld a, [hli]
	and a ; have we reached the end of the evolution data?
	jr nz, .skipEvolutionDataLoop ; if not, jump back up
.learnSetLoop ; loop over the learn set until we reach a move that is learnt at the current level or the end of the list
	ld a, [hli]
	and a ; have we reached the end of the learn set?
	jr z, .done ; if we've reached the end of the learn set, jump
	ld b, a ; level the move is learnt at
	ld a, [W_CURENEMYLVL]
	cp b ; is the move learnt at the mon's current level?
	ld a, [hli] ; move ID
	jr nz, .learnSetLoop
	ld d, a ; ID of move to learn
	ld a, [wcc49]
	and a
	jr nz, .next
; if [wcc49] is 0, get the address of the mon's current moves
; there is no reason to make this conditional because the code wouldn't work properly without doing this
; every call to this function sets [wcc49] to 0
	ld hl, wPartyMon1Moves
	ld a, [wWhichPokemon]
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
.next
	ld b, $4
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
	ret

; writes the moves a mon has at level [W_CURENEMYLVL] to [de]
; move slots are being filled up sequentially and shifted if all slots are full
; [wHPBarMaxHP]: (?)
WriteMonMoves: ; 3afb8 (e:6fb8)
	call GetPredefRegisters
	push hl
	push de
	push bc
	ld hl, EvosMovesPointerTable
	ld b, $0
	ld a, [wcf91]  ; cur mon ID
	dec a
	add a
	rl b
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.skipEvoEntriesLoop
	ld a, [hli]
	and a
	jr nz, .skipEvoEntriesLoop
	jr .firstMove
.nextMove
	pop de
.nextMove2
	inc hl
.firstMove
	ld a, [hli]       ; read level of next move in learnset
	and a
	jp z, .done       ; end of list
	ld b, a
	ld a, [W_CURENEMYLVL] ; W_CURENEMYLVL
	cp b
	jp c, .done       ; mon level < move level (assumption: learnset is sorted by level)
	ld a, [wHPBarMaxHP]
	and a
	jr z, .skipMinLevelCheck
	ld a, [wWhichTrade] ; wWhichTrade (min move level)
	cp b
	jr nc, .nextMove2 ; min level >= move level
.skipMinLevelCheck
	push de
	ld c, $4
.moveAlreadyLearnedCheckLoop
	ld a, [de]
	inc de
	cp [hl]
	jr z, .nextMove
	dec c
	jr nz, .moveAlreadyLearnedCheckLoop
	pop de
	push de
	ld c, $4
.findEmptySlotLoop
	ld a, [de]
	and a
	jr z, .writeMoveToSlot2
	inc de
	dec c
	jr nz, .findEmptySlotLoop
	pop de                        ; no empty move slots found
	push de
	push hl
	ld h, d
	ld l, e
	call WriteMonMoves_ShiftMoveData ; shift all moves one up (deleting move 1)
	ld a, [wHPBarMaxHP]
	and a
	jr z, .writeMoveToSlot
	push de
	ld bc, $12
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
	ld a, [wHPBarMaxHP]
	and a
	jr z, .nextMove
	push hl            ; write move PP value
	ld a, [hl]
	ld hl, $15
	add hl, de
	push hl
	dec a
	ld hl, Moves
	ld bc, $6
	call AddNTimes
	ld de, wHPBarMaxHP
	ld a, BANK(Moves)
	call FarCopyData
	ld a, [wHPBarNewHP + 1]
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
WriteMonMoves_ShiftMoveData: ; 3b04e (e:704e)
	ld c, $3
.asm_3b050
	inc de
	ld a, [de]
	ld [hli], a
	dec c
	jr nz, .asm_3b050
	ret

Evolution_FlagAction: ; 3b057 (e:7057)
	predef_jump FlagActionPredef

INCLUDE "data/evos_moves.asm"
