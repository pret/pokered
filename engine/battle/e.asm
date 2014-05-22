Func_39680: ; 39680 (e:5680)
	ld a, [H_WHOSETURN] ; $fff3
	and a
	ld a, [$d060]
	ld hl, $d026
	jr z, .asm_39691
	ld a, [$d065]
	ld hl, $cff7
.asm_39691
	ld c, $4
	ld b, a
.asm_39694
	srl b
	call c, Func_3969f
	inc hl
	inc hl
	dec c
	ret z
	jr .asm_39694

Func_3969f: ; 3969f (e:569f)
	ld a, [hl]
	add a
	ld [hld], a
	ld a, [hl]
	rl a
	ld [hli], a
	ret

Func_396a7: ; 396a7 (e:56a7)
	ld a, [H_WHOSETURN] ; $fff3
	and a
	ld a, [$d061]
	ld hl, W_PLAYERMONATK
	jr z, .asm_396b8
	ld a, [$d066]
	ld hl, W_ENEMYMONATTACK
.asm_396b8
	ld c, $4
	ld b, a
.asm_396bb
	srl b
	call c, Func_396c6
	inc hl
	inc hl
	dec c
	ret z
	jr .asm_396bb

Func_396c6: ; 396c6 (e:56c6)
	ld a, [hl]
	srl a
	ld [hli], a
	rr [hl]
	or [hl]
	jr nz, .asm_396d1
	ld [hl], $1
.asm_396d1
	dec hl
	ret

_ScrollTrainerPicAfterBattle: ; 396d3 (e:56d3)
; Load the enemy trainer's pic and scrolls it into
; the screen from the right.
	xor a
	ld [W_ENEMYMONID], a
	ld b, $1
	call GoPAL_SET
	callab _LoadTrainerPic
	FuncCoord 19, 0 ; $c3b3
	ld hl, Coord
	ld c, $0
.asm_396e9
	inc c
	ld a, c
	cp $7
	ret z
	ld d, $0
	push bc
	push hl
.asm_396f2
	call Func_39707
	inc hl
	ld a, $7
	add d
	ld d, a
	dec c
	jr nz, .asm_396f2
	ld c, $4
	call DelayFrames
	pop hl
	pop bc
	dec hl
	jr .asm_396e9

Func_39707: ; 39707 (e:5707)
	push hl
	push de
	push bc
	ld e, $7
.asm_3970c
	ld [hl], d
	ld bc, $14
	add hl, bc
	inc d
	dec e
	jr nz, .asm_3970c
	pop bc
	pop de
	pop hl
	ret

; creates a set of moves that may be used and returns its address in hl
; unused slots are filled with 0, all used slots may be chosen with equal probability
AIEnemyTrainerChooseMoves: ; 39719 (e:5719)
	ld a, $a
	ld hl, $cee9  ; init temporary move selection array. Only the moves with the lowest numbers are chosen in the end
	ld [hli], a   ; move 1
	ld [hli], a   ; move 2
	ld [hli], a   ; move 3
	ld [hl], a    ; move 4
	ld a, [W_ENEMYDISABLEDMOVE] ; forbid disabled move (if any)
	swap a
	and $f
	jr z, .noMoveDisabled
	ld hl, $cee9
	dec a
	ld c, a
	ld b, $0
	add hl, bc    ; advance pointer to forbidden move
	ld [hl], $50  ; forbid (highly discourage) disabled move
.noMoveDisabled
	ld hl, TrainerClassMoveChoiceModifications ; 589B
	ld a, [W_TRAINERCLASS]
	ld b, a
.loopTrainerClasses
	dec b
	jr z, .readTrainerClassData
.loopTrainerClassData
	ld a, [hli]
	and a
	jr nz, .loopTrainerClassData
	jr .loopTrainerClasses
.readTrainerClassData
	ld a, [hl]
	and a
	jp z, .useOriginalMoveSet
	push hl
.nextMoveChoiceModification
	pop hl
	ld a, [hli]
	and a
	jr z, .loopFindMinimumEntries
	push hl
	ld hl, AIMoveChoiceModificationFunctionPointers ; $57a3
	dec a
	add a
	ld c, a
	ld b, $0
	add hl, bc    ; skip to pointer
	ld a, [hli]   ; read pointer into hl
	ld h, [hl]
	ld l, a
	ld de, .nextMoveChoiceModification  ; set return address
	push de
	jp [hl]       ; execute modification function
.loopFindMinimumEntries ; all entries will be decremented sequentially until one of them is zero
	ld hl, $cee9  ; temp move selection array
	ld de, W_ENEMYMONMOVES  ; enemy moves
	ld c, $4
.loopDecrementEntries
	ld a, [de]
	inc de
	and a
	jr z, .loopFindMinimumEntries
	dec [hl]
	jr z, .minimumEntriesFound
	inc hl
	dec c
	jr z, .loopFindMinimumEntries
	jr .loopDecrementEntries
.minimumEntriesFound
	ld a, c
.loopUndoPartialIteration ; undo last (partial) loop iteration
	inc [hl]
	dec hl
	inc a
	cp $5
	jr nz, .loopUndoPartialIteration
	ld hl, $cee9  ; temp move selection array
	ld de, W_ENEMYMONMOVES  ; enemy moves
	ld c, $4
.filterMinimalEntries ; all minimal entries now have value 1. All other slots will be disabled (move set to 0)
	ld a, [de]
	and a
	jr nz, .moveExisting ; 0x3978a $1
	ld [hl], a
.moveExisting
	ld a, [hl]
	dec a
	jr z, .slotWithMinimalValue
	xor a
	ld [hli], a     ; disable move slot
	jr .next
.slotWithMinimalValue
	ld a, [de]
	ld [hli], a     ; enable move slot
.next
	inc de
	dec c
	jr nz, .filterMinimalEntries
	ld hl, $cee9    ; use created temporary array as move set
	ret
.useOriginalMoveSet
	ld hl, W_ENEMYMONMOVES    ; use original move set
	ret

AIMoveChoiceModificationFunctionPointers: ; 397a3 (e:57a3)
	dw AIMoveChoiceModification1
	dw AIMoveChoiceModification2
	dw AIMoveChoiceModification3
	dw AIMoveChoiceModification4 ; unused, does nothing

; discourages moves that cause no damage but only a status ailment if player's mon already has one
AIMoveChoiceModification1: ; 397ab (e:57ab)
	ld a, [W_PLAYERMONSTATUS]
	and a
	ret z       ; return if no status ailment on player's mon
	ld hl, $cee8  ; temp move selection array (-1 byte offest)
	ld de, W_ENEMYMONMOVES  ; enemy moves
	ld b, $5
.nextMove
	dec b
	ret z         ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z         ; no more moves in move set
	inc de
	call ReadMove
	ld a, [W_ENEMYMOVEPOWER]
	and a
	jr nz, .nextMove
	ld a, [W_ENEMYMOVEEFFECT]
	push hl
	push de
	push bc
	ld hl, StatusAilmentMoveEffects
	ld de, $0001
	call IsInArray
	pop bc
	pop de
	pop hl
	jr nc, .nextMove
	ld a, [hl]
	add $5       ; discourage move
	ld [hl], a
	jr .nextMove

StatusAilmentMoveEffects ; 57e2
	db $01 ; some sleep effect?
	db SLEEP_EFFECT
	db POISON_EFFECT
	db PARALYZE_EFFECT
	db $FF

; slightly encourage moves with specific effects
AIMoveChoiceModification2: ; 397e7 (e:57e7)
	ld a, [$ccd5]
	cp $1
	ret nz
	ld hl, $cee8  ; temp move selection array (-1 byte offest)
	ld de, W_ENEMYMONMOVES  ; enemy moves
	ld b, $5
.nextMove
	dec b
	ret z         ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z         ; no more moves in move set
	inc de
	call ReadMove
	ld a, [W_ENEMYMOVEEFFECT]
	cp ATTACK_UP1_EFFECT
	jr c, .nextMove
	cp BIDE_EFFECT
	jr c, .preferMove
	cp ATTACK_UP2_EFFECT
	jr c, .nextMove
	cp POISON_EFFECT
	jr c, .preferMove
	jr .nextMove
.preferMove
	dec [hl]       ; slighly encourage this move
	jr .nextMove

; encourages moves that are effective against the player's mon
AIMoveChoiceModification3: ; 39817 (e:5817)
	ld hl, $cee8  ; temp move selection array (-1 byte offest)
	ld de, W_ENEMYMONMOVES  ; enemy moves
	ld b, $5
.nextMove
	dec b
	ret z         ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z         ; no more moves in move set
	inc de
	call ReadMove
	push hl
	push bc
	push de
	callab AIGetTypeEffectiveness
	pop de
	pop bc
	pop hl
	ld a, [$d11e]
	cp $10
	jr z, .nextMove
	jr c, .notEffectiveMove
	dec [hl]       ; slighly encourage this move
	jr .nextMove
.notEffectiveMove  ; discourages non-effective moves if better moves are available
	push hl
	push de
	push bc
	ld a, [W_ENEMYMOVETYPE]
	ld d, a
	ld hl, W_ENEMYMONMOVES  ; enemy moves
	ld b, $5
	ld c, $0
.loopMoves
	dec b
	jr z, .done
	ld a, [hli]
	and a
	jr z, .done
	call ReadMove
	ld a, [W_ENEMYMOVEEFFECT]
	cp SUPER_FANG_EFFECT
	jr z, .betterMoveFound      ; Super Fang is considered to be a better move
	cp SPECIAL_DAMAGE_EFFECT
	jr z, .betterMoveFound      ; any special damage moves are considered to be better moves
	cp FLY_EFFECT
	jr z, .betterMoveFound      ; Fly is considered to be a better move
	ld a, [W_ENEMYMOVETYPE]
	cp d
	jr z, .loopMoves
	ld a, [W_ENEMYMOVEPOWER]
	and a
	jr nz, .betterMoveFound      ; damaging moves of a different type are considered to be better moves
	jr .loopMoves
.betterMoveFound
	ld c, a
.done
	ld a, c
	pop bc
	pop de
	pop hl
	and a
	jr z, .nextMove
	inc [hl]       ; slighly discourage this move
	jr .nextMove
AIMoveChoiceModification4: ; 39883 (e:5883)
	ret

ReadMove: ; 39884 (e:5884)
	push hl
	push de
	push bc
	dec a
	ld hl,Moves
	ld bc,6
	call AddNTimes
	ld de,$CFCC
	call CopyData
	pop bc
	pop de
	pop hl
	ret

; move choice modification methods that are applied for each trainer class
; 0 is sentinel value
TrainerClassMoveChoiceModifications: ; 3989b (e:589b)
	db 0      ; YOUNGSTER
	db 1,0    ; BUG CATCHER
	db 1,0    ; LASS
	db 1,3,0  ; SAILOR
	db 1,0    ; JR__TRAINER_M
	db 1,0    ; JR__TRAINER_F
	db 1,2,3,0; POKEMANIAC
	db 1,2,0  ; SUPER_NERD
	db 1,0    ; HIKER
	db 1,0    ; BIKER
	db 1,3,0  ; BURGLAR
	db 1,0    ; ENGINEER
	db 1,2,0  ; JUGGLER_X
	db 1,3,0  ; FISHER
	db 1,3,0  ; SWIMMER
	db 0      ; CUE_BALL
	db 1,0    ; GAMBLER
	db 1,3,0  ; BEAUTY
	db 1,2,0  ; PSYCHIC_TR
	db 1,3,0  ; ROCKER
	db 1,0    ; JUGGLER
	db 1,0    ; TAMER
	db 1,0    ; BIRD_KEEPER
	db 1,0    ; BLACKBELT
	db 1,0    ; SONY1
	db 1,3,0  ; PROF_OAK
	db 1,2,0  ; CHIEF
	db 1,2,0  ; SCIENTIST
	db 1,3,0  ; GIOVANNI
	db 1,0    ; ROCKET
	db 1,3,0  ; COOLTRAINER_M
	db 1,3,0  ; COOLTRAINER_F
	db 1,0    ; BRUNO
	db 1,0    ; BROCK
	db 1,3,0  ; MISTY
	db 1,3,0  ; LT__SURGE
	db 1,3,0  ; ERIKA
	db 1,3,0  ; KOGA
	db 1,3,0  ; BLAINE
	db 1,3,0  ; SABRINA
	db 1,2,0  ; GENTLEMAN
	db 1,3,0  ; SONY2
	db 1,3,0  ; SONY3
	db 1,2,3,0; LORELEI
	db 1,0    ; CHANNELER
	db 1,0    ; AGATHA
	db 1,3,0  ; LANCE

TrainerPicAndMoneyPointers: ; 39914 (e:5914)
; trainer pic pointers and base money.
; money received after battle = base money × level of highest-level enemy mon
	dw YoungsterPic
	db 0,$15,0

	dw BugCatcherPic
	db 0,$10,0

	dw LassPic
	db 0,$15,0

	dw SailorPic
	db 0,$30,0

	dw JrTrainerMPic
	db 0,$20,0

	dw JrTrainerFPic
	db 0,$20,0

	dw PokemaniacPic
	db 0,$50,0

	dw SuperNerdPic
	db 0,$25,0

	dw HikerPic
	db 0,$35,0

	dw BikerPic
	db 0,$20,0

	dw BurglarPic
	db 0,$90,0

	dw EngineerPic
	db 0,$50,0

	dw JugglerPic
	db 0,$35,0

	dw FisherPic
	db 0,$35,0

	dw SwimmerPic
	db 0,$05,0

	dw CueBallPic
	db 0,$25,0

	dw GamblerPic
	db 0,$70,0

	dw BeautyPic
	db 0,$70,0

	dw PsychicPic
	db 0,$10,0

	dw RockerPic
	db 0,$25,0

	dw JugglerPic
	db 0,$35,0

	dw TamerPic
	db 0,$40,0

	dw BirdKeeperPic
	db 0,$25,0

	dw BlackbeltPic
	db 0,$25,0

	dw Rival1Pic
	db 0,$35,0

	dw ProfOakPic
	db 0,$99,0

	dw ChiefPic
	db 0,$30,0

	dw ScientistPic
	db 0,$50,0

	dw GiovanniPic
	db 0,$99,0

	dw RocketPic
	db 0,$30,0

	dw CooltrainerMPic
	db 0,$35,0

	dw CooltrainerFPic
	db 0,$35,0

	dw BrunoPic
	db 0,$99,0

	dw BrockPic
	db 0,$99,0

	dw MistyPic
	db 0,$99,0

	dw LtSurgePic
	db 0,$99,0

	dw ErikaPic
	db 0,$99,0

	dw KogaPic
	db 0,$99,0

	dw BlainePic
	db 0,$99,0

	dw SabrinaPic
	db 0,$99,0

	dw GentlemanPic
	db 0,$70,0

	dw Rival2Pic
	db 0,$65,0

	dw Rival3Pic
	db 0,$99,0

	dw LoreleiPic
	db 0,$99,0

	dw ChannelerPic
	db 0,$30,0

	dw AgathaPic
	db 0,$99,0

	dw LancePic
	db 0,$99,0

INCLUDE "text/trainer_names.asm"

Func_39b87: ; 39b87 (e:5b87)
	ld hl, $d0dc
	ld de, $d0e1
	ld b, $0
.asm_39b8f
	ld a, [hli]
	and a
	jr z, .asm_39bc1
	push hl
	ld [$d0b5], a
	ld a, $2c
	ld [$d0b7], a
	ld a, MOVE_NAME
	ld [W_LISTTYPE], a
	call GetName
	ld hl, $cd6d
.asm_39ba7
	ld a, [hli]
	cp $50
	jr z, .asm_39bb0
	ld [de], a
	inc de
	jr .asm_39ba7
.asm_39bb0
	ld a, b
	ld [$cd6c], a
	inc b
	ld a, $4e
	ld [de], a
	inc de
	pop hl
	ld a, b
	cp $4
	jr z, .asm_39bd1
	jr .asm_39b8f
.asm_39bc1
	ld a, "-"
	ld [de], a
	inc de
	inc b
	ld a, b
	cp $4
	jr z, .asm_39bd1
	ld a, $4e
	ld [de], a
	inc de
	jr .asm_39bc1
.asm_39bd1
	ld a, "@"
	ld [de], a
	ret

Func_39bd5: ; 39bd5 (e:5bd5)
	ld a, [$d11b]
	cp $1
	jr nz, .asm_39be6
	ld hl, wEnemyPartyCount ; $d89c
	ld de, W_ENEMYMON1OT ; $d9ac OT names of other player
	ld a, $6
	jr .asm_39c18
.asm_39be6
	cp $4
	jr nz, .calcAttackStat4
	ld hl, W_NUMINPARTY ; $d163
	ld de, W_PARTYMON1OT ; $d273
	ld a, $5
	jr .asm_39c18
.calcAttackStat4
	cp $5
	jr nz, .asm_39c02
	ld hl, $cf7b
	ld de, MonsterNames ; $421e
	ld a, $1
	jr .asm_39c18
.asm_39c02
	cp $2
	jr nz, .asm_39c10
	ld hl, wNumBagItems ; $d31d
	ld de, ItemNames ; $472b
	ld a, $4
	jr .asm_39c18
.asm_39c10
	ld hl, $cf7b
	ld de, ItemNames ; $472b
	ld a, ITEM_NAME
.asm_39c18
	ld [W_LISTTYPE], a
	ld a, l
	ld [$cf8b], a
	ld a, h
	ld [$cf8c], a
	ld a, e
	ld [$cf8d], a
	ld a, d
	ld [$cf8e], a
	ld bc, ItemPrices ; $4608
	ld a, c
	ld [$cf8f], a
	ld a, b
	ld [$cf90], a
	ret

Func_39c37: ; 39c37 (e:5c37)
	ld hl, W_PARTYMON1 ; $d164
	ld a, [$cc49]
	and a
	jr z, .asm_39c4b
	dec a
	jr z, .asm_39c48
	ld hl, $da81
	jr .asm_39c4b
.asm_39c48
	ld hl, $d89d
.asm_39c4b
	ld d, $0
	add hl, de
	ld a, [hl]
	ld [$cf91], a
	ret

ReadTrainer: ; 39c53 (e:5c53)

; don't change any moves in a link battle
	ld a,[W_ISLINKBATTLE]
	and a
	ret nz

; set [wEnemyPartyCount] to 0, [$D89D] to FF
; XXX first is total enemy pokemon?
; XXX second is species of first pokemon?
	ld hl,wEnemyPartyCount
	xor a
	ld [hli],a
	dec a
	ld [hl],a

; get the pointer to trainer data for this class
	ld a,[W_CUROPPONENT]
	sub $C9 ; convert value from pokemon to trainer
	add a,a
	ld hl,TrainerDataPointers
	ld c,a
	ld b,0
	add hl,bc ; hl points to trainer class
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld a,[W_TRAINERNO]
	ld b,a
; At this point b contains the trainer number,
; and hl points to the trainer class.
; Our next task is to iterate through the trainers,
; decrementing b each time, until we get to the right one.
.outer
	dec b
	jr z,.IterateTrainer
.inner
	ld a,[hli]
	and a
	jr nz,.inner
	jr .outer

; if the first byte of trainer data is FF,
; - each pokemon has a specific level
;      (as opposed to the whole team being of the same level)
; - if [W_LONEATTACKNO] != 0, one pokemon on the team has a special move
; else the first byte is the level of every pokemon on the team
.IterateTrainer
	ld a,[hli]
	cp $FF ; is the trainer special?
	jr z,.SpecialTrainer ; if so, check for special moves
	ld [W_CURENEMYLVL],a
.LoopTrainerData
	ld a,[hli]
	and a ; have we reached the end of the trainer data?
	jr z,.FinishUp
	ld [$CF91],a ; write species somewhere (XXX why?)
	ld a,1
	ld [$CC49],a
	push hl
	call AddPokemonToParty
	pop hl
	jr .LoopTrainerData
.SpecialTrainer
; if this code is being run:
; - each pokemon has a specific level
;      (as opposed to the whole team being of the same level)
; - if [W_LONEATTACKNO] != 0, one pokemon on the team has a special move
	ld a,[hli]
	and a ; have we reached the end of the trainer data?
	jr z,.AddLoneMove
	ld [W_CURENEMYLVL],a
	ld a,[hli]
	ld [$CF91],a
	ld a,1
	ld [$CC49],a
	push hl
	call AddPokemonToParty
	pop hl
	jr .SpecialTrainer
.AddLoneMove
; does the trainer have a single monster with a different move
	ld a,[W_LONEATTACKNO] ; Brock is 01, Misty is 02, Erika is 04, etc
	and a
	jr z,.AddTeamMove
	dec a
	add a,a
	ld c,a
	ld b,0
	ld hl,LoneMoves
	add hl,bc
	ld a,[hli]
	ld d,[hl]
	ld hl,W_ENEMYMON1MOVE3
	ld bc,W_ENEMYMON2MOVE3 - W_ENEMYMON1MOVE3
	call AddNTimes
	ld [hl],d
	jr .FinishUp
.AddTeamMove
; check if our trainer's team has special moves

; get trainer class number
	ld a,[W_CUROPPONENT]
	sub $C8
	ld b,a
	ld hl,TeamMoves

; iterate through entries in TeamMoves, checking each for our trainer class
.IterateTeamMoves
	ld a,[hli]
	cp b
	jr z,.GiveTeamMoves ; is there a match?
	inc hl ; if not, go to the next entry
	inc a
	jr nz,.IterateTeamMoves

	; no matches found. is this trainer champion rival?
	ld a,b
	cp SONY3
	jr z,.ChampionRival
	jr .FinishUp ; nope
.GiveTeamMoves
	ld a,[hl]
	ld [$D95E],a
	jr .FinishUp
.ChampionRival ; give moves to his team

; pidgeot
	ld a,SKY_ATTACK
	ld [W_ENEMYMON1MOVE3],a

; starter
	ld a,[W_RIVALSTARTER]
	cp STARTER3
	ld b,MEGA_DRAIN
	jr z,.GiveStarterMove
	cp STARTER1
	ld b,FIRE_BLAST
	jr z,.GiveStarterMove
	ld b,BLIZZARD ; must be squirtle
.GiveStarterMove
	ld a,b
	ld [W_ENEMYMON6MOVE3],a
.FinishUp ; XXX this needs documenting
	xor a       ; clear D079-D07B
	ld de,$D079
	ld [de],a
	inc de
	ld [de],a
	inc de
	ld [de],a
	ld a,[W_CURENEMYLVL]
	ld b,a
.LastLoop
	ld hl,$D047
	ld c,2
	push bc
	ld a,$B
	call Predef
	pop bc
	inc de
	inc de
	dec b
	jr nz,.LastLoop
	ret

INCLUDE "data/trainer_moves.asm"

INCLUDE "data/trainer_parties.asm"

TrainerAI: ; 3a52e (e:652e)
;XXX called at 34964, 3c342, 3c398
	and a
	ld a,[W_ISINBATTLE]
	dec a
	ret z ; if not a trainer, we're done here
	ld a,[W_ISLINKBATTLE]
	cp 4
	ret z
	ld a,[W_TRAINERCLASS] ; what trainer class is this?
	dec a
	ld c,a
	ld b,0
	ld hl,TrainerAIPointers
	add hl,bc
	add hl,bc
	add hl,bc
	ld a,[wAICount]
	and a
	ret z ; if no AI uses left, we're done here
	inc hl
	inc a
	jr nz,.getpointer
	dec hl
	ld a,[hli]
	ld [wAICount],a
.getpointer
	ld a,[hli]
	ld h,[hl]
	ld l,a
	call GenRandom
	jp [hl]

TrainerAIPointers: ; 3a55c (e:655c)
; one entry per trainer class
; first byte, number of times (per Pokémon) it can occur
; next two bytes, pointer to AI subroutine for trainer class
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,JugglerAI ; juggler_x
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,JugglerAI ; juggler
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 2,BlackbeltAI ; blackbelt
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 1,GenericAI ; chief
	dbw 3,GenericAI
	dbw 1,GiovanniAI ; giovanni
	dbw 3,GenericAI
	dbw 2,CooltrainerMAI ; cooltrainerm
	dbw 1,CooltrainerFAI ; cooltrainerf
	dbw 2,BrunoAI ; bruno
	dbw 5,BrockAI ; brock
	dbw 1,MistyAI ; misty
	dbw 1,LtSurgeAI ; surge
	dbw 1,ErikaAI ; erika
	dbw 2,KogaAI ; koga
	dbw 2,BlaineAI ; blaine
	dbw 1,SabrinaAI ; sabrina
	dbw 3,GenericAI
	dbw 1,Sony2AI ; sony2
	dbw 1,Sony3AI ; sony3
	dbw 2,LoreleiAI ; lorelei
	dbw 3,GenericAI
	dbw 2,AgathaAI ; agatha
	dbw 1,LanceAI ; lance

JugglerAI: ; 3a5e9 (e:65e9)
	cp $40
	ret nc
	jp Func_3a72a

BlackbeltAI: ; 3a5ef (e:65ef)
	cp $20
	ret nc
	jp AIUseXAttack

GiovanniAI: ; 3a5f5 (e:65f5)
	cp $40
	ret nc
	jp AIUseGuardSpec

CooltrainerMAI: ; 3a5fb (e:65fb)
	cp $40
	ret nc
	jp AIUseXAttack

CooltrainerFAI: ; 3a601 (e:6601)
	cp $40
	ld a,$A
	call Func_3a7cf
	jp c,AIUseHyperPotion
	ld a,5
	call Func_3a7cf
	ret nc
	jp Func_3a72a

BrockAI: ; 3a614 (e:6614)
; if his active monster has a status condition, use a full heal
	ld a,[W_ENEMYMONSTATUS]
	and a
	ret z
	jp AIUseFullHeal

MistyAI: ; 3a61c (e:661c)
	cp $40
	ret nc
	jp AIUseXDefend

LtSurgeAI: ; 3a622 (e:6622)
	cp $40
	ret nc
	jp AIUseXSpeed

ErikaAI: ; 3a628 (e:6628)
	cp $80
	ret nc
	ld a,$A
	call Func_3a7cf
	ret nc
	jp AIUseSuperPotion

KogaAI: ; 3a634 (e:6634)
	cp $40
	ret nc
	jp AIUseXAttack

BlaineAI: ; 3a63a (e:663a)
	cp $40
	ret nc
	jp AIUseSuperPotion

SabrinaAI: ; 3a640 (e:6640)
	cp $40
	ret nc
	ld a,$A
	call Func_3a7cf
	ret nc
	jp AIUseHyperPotion

Sony2AI: ; 3a64c (e:664c)
	cp $20
	ret nc
	ld a,5
	call Func_3a7cf
	ret nc
	jp AIUsePotion

Sony3AI: ; 3a658 (e:6658)
	cp $20
	ret nc
	ld a,5
	call Func_3a7cf
	ret nc
	jp AIUseFullRestore

LoreleiAI: ; 3a664 (e:6664)
	cp $80
	ret nc
	ld a,5
	call Func_3a7cf
	ret nc
	jp AIUseSuperPotion

BrunoAI: ; 3a670 (e:6670)
	cp $40
	ret nc
	jp AIUseXDefend

AgathaAI: ; 3a676 (e:6676)
	cp $14
	jp c,Func_3a72a
	cp $80
	ret nc
	ld a,4
	call Func_3a7cf
	ret nc
	jp AIUseSuperPotion

LanceAI: ; 3a687 (e:6687)
	cp $80
	ret nc
	ld a,5
	call Func_3a7cf
	ret nc
	jp AIUseHyperPotion

GenericAI: ; 3a693 (e:6693)
	and a ; clear carry
	ret

; end of individual trainer AI routines

DecrementAICount: ; 3a695 (e:6695)
	ld hl,wAICount
	dec [hl]
	scf
	ret

Func_3a69b: ; 3a69b (e:669b)
	ld a,(SFX_08_3e - SFX_Headers_08) / 3
	jp PlaySoundWaitForCurrent

AIUseFullRestore: ; 3a6a0 (e:66a0)
	call AICureStatus
	ld a,FULL_RESTORE
	ld [$CF05],a
	ld de,wHPBarOldHP
	ld hl,$CFE7
	ld a,[hld]
	ld [de],a
	inc de
	ld a,[hl]
	ld [de],a
	inc de
	ld hl,$CFF5
	ld a,[hld]
	ld [de],a
	inc de
	ld [wHPBarMaxHP],a
	ld [$CFE7],a
	ld a,[hl]
	ld [de],a
	ld [wHPBarMaxHP+1],a
	ld [W_ENEMYMONCURHP],a
	jr Func_3a718

AIUsePotion: ; 3a6ca (e:66ca)
; enemy trainer heals his monster with a potion
	ld a,POTION
	ld b,20
	jr AIRecoverHP

AIUseSuperPotion: ; 3a6d0 (e:66d0)
; enemy trainer heals his monster with a super potion
	ld a,SUPER_POTION
	ld b,50
	jr AIRecoverHP

AIUseHyperPotion: ; 3a6d6 (e:66d6)
; enemy trainer heals his monster with a hyper potion
	ld a,HYPER_POTION
	ld b,200
	; fallthrough

AIRecoverHP: ; 3a6da (e:66da)
; heal b HP and print "trainer used $(a) on pokemon!"
	ld [$CF05],a
	ld hl,$CFE7
	ld a,[hl]
	ld [wHPBarOldHP],a
	add b
	ld [hld],a
	ld [wHPBarNewHP],a
	ld a,[hl]
	ld [wHPBarOldHP+1],a
	ld [wHPBarNewHP+1],a
	jr nc,.next
	inc a
	ld [hl],a
	ld [wHPBarNewHP+1],a
.next
	inc hl
	ld a,[hld]
	ld b,a
	ld de,$CFF5
	ld a,[de]
	dec de
	ld [wHPBarMaxHP],a
	sub b
	ld a,[hli]
	ld b,a
	ld a,[de]
	ld [wHPBarMaxHP+1],a
	sbc b
	jr nc,Func_3a718
	inc de
	ld a,[de]
	dec de
	ld [hld],a
	ld [wHPBarNewHP],a
	ld a,[de]
	ld [hl],a
	ld [wHPBarNewHP+1],a
	; fallthrough

Func_3a718: ; 3a718 (e:6718)
	call AIPrintItemUse_
	FuncCoord 2, 2 ; $c3ca
	ld hl,Coord
	xor a
	ld [$CF94],a
	ld a,$48
	call Predef
	jp DecrementAICount

Func_3a72a: ; 3a72a (e:672a)
	ld a,[wEnemyPartyCount]
	ld c,a
	ld hl,W_ENEMYMON1HP

	ld d,0 ; keep count of unfainted monsters

	; count how many monsters haven't fainted yet
.loop
	ld a,[hli]
	ld b,a
	ld a,[hld]
	or b
	jr z,.Fainted ; has monster fainted?
	inc d
.Fainted
	push bc
	ld bc,$2C
	add hl,bc
	pop bc
	dec c
	jr nz,.loop

	ld a,d ; how many available monsters are there?
	cp 2 ; don't bother if only 1 or 2
	jp nc,Func_3a74b
	and a
	ret

Func_3a74b: ; 3a74b (e:674b)

; prepare to withdraw the active monster: copy hp, number, and status to roster

	ld a,[W_ENEMYMONNUMBER]
	ld hl,W_ENEMYMON1HP
	ld bc,$2C
	call AddNTimes
	ld d,h
	ld e,l
	ld hl,W_ENEMYMONCURHP
	ld bc,4
	call CopyData

	ld hl, AIBattleWithdrawText
	call PrintText

	ld a,1
	ld [$D11D],a
	callab EnemySendOut
	xor a
	ld [$D11D],a

	ld a,[W_ISLINKBATTLE]
	cp 4
	ret z
	scf
	ret

AIBattleWithdrawText: ; 3a781 (e:6781)
	TX_FAR _AIBattleWithdrawText
	db "@"

AIUseFullHeal: ; 3a786 (e:6786)
	call Func_3a69b
	call AICureStatus
	ld a,FULL_HEAL
	jp AIPrintItemUse

AICureStatus: ; 3a791 (e:6791)
; cures the status of enemy's active pokemon
	ld a,[W_ENEMYMONNUMBER]
	ld hl,$D8A8
	ld bc,$2C
	call AddNTimes
	xor a
	ld [hl],a ; clear status in enemy team roster
	ld [W_ENEMYMONSTATUS],a ; clear status of active enemy
	ld hl,$D069
	res 0,[hl]
	ret

AIUseXAccuracy: ; 0x3a7a8 unused
	call Func_3a69b
	ld hl,$D068
	set 0,[hl]
	ld a,X_ACCURACY
	jp AIPrintItemUse

AIUseGuardSpec: ; 3a7b5 (e:67b5)
	call Func_3a69b
	ld hl,$D068
	set 1,[hl]
	ld a,GUARD_SPEC_
	jp AIPrintItemUse

AIUseDireHit: ; 0x3a7c2 unused
	call Func_3a69b
	ld hl,$D068
	set 2,[hl]
	ld a,DIRE_HIT
	jp AIPrintItemUse

Func_3a7cf: ; 3a7cf (e:67cf)
	ld [H_DIVISOR],a
	ld hl,$CFF4
	ld a,[hli]
	ld [H_DIVIDEND],a
	ld a,[hl]
	ld [H_DIVIDEND + 1],a
	ld b,2
	call Divide
	ld a,[H_QUOTIENT + 3]
	ld c,a
	ld a,[H_QUOTIENT + 2]
	ld b,a
	ld hl,$CFE7
	ld a,[hld]
	ld e,a
	ld a,[hl]
	ld d,a
	ld a,d
	sub b
	ret nz
	ld a,e
	sub c
	ret

AIUseXAttack: ; 3a7f2 (e:67f2)
	ld b,$A
	ld a,X_ATTACK
	jr AIIncreaseStat

AIUseXDefend: ; 3a7f8 (e:67f8)
	ld b,$B
	ld a,X_DEFEND
	jr AIIncreaseStat

AIUseXSpeed: ; 3a7fe (e:67fe)
	ld b,$C
	ld a,X_SPEED
	jr AIIncreaseStat

AIUseXSpecial: ; 3a804 (e:6804)
	ld b,$D
	ld a,X_SPECIAL
	; fallthrough

AIIncreaseStat: ; 3a808 (e:6808)
	ld [$CF05],a
	push bc
	call AIPrintItemUse_
	pop bc
	ld hl,$CFCD
	ld a,[hld]
	push af
	ld a,[hl]
	push af
	push hl
	ld a,$AF
	ld [hli],a
	ld [hl],b
	callab StatModifierUpEffect
	pop hl
	pop af
	ld [hli],a
	pop af
	ld [hl],a
	jp DecrementAICount

AIPrintItemUse: ; 3a82c (e:682c)
	ld [$CF05],a
	call AIPrintItemUse_
	jp DecrementAICount

AIPrintItemUse_: ; 3a835 (e:6835)
; print "x used [$CF05] on z!"
	ld a,[$CF05]
	ld [$D11E],a
	call GetItemName
	ld hl, AIBattleUseItemText
	jp PrintText

AIBattleUseItemText: ; 3a844 (e:6844)
	TX_FAR _AIBattleUseItemText
	db "@"

DrawAllPokeballs: ; 3a849 (e:6849)
	call LoadPartyPokeballGfx
	call SetupOwnPartyPokeballs
	ld a, [W_ISINBATTLE] ; $d057
	dec a
	ret z ; return if wild pokémon
	jp SetupEnemyPartyPokeballs

DrawEnemyPokeballs: ; 0x3a857
	call LoadPartyPokeballGfx
	jp SetupEnemyPartyPokeballs

LoadPartyPokeballGfx: ; 3a85d (e:685d)
	ld de, PokeballTileGraphics ; $697e
	ld hl, $8310
	ld bc, (BANK(PokeballTileGraphics) << 8) + $04
	jp CopyVideoData

SetupOwnPartyPokeballs: ; 3a869 (e:6869)
	call PlacePlayerHUDTiles
	ld hl, W_PARTYMON1DATA
	ld de, W_NUMINPARTY ; $d163
	call SetupPokeballs
	ld a, $60
	ld hl, W_BASECOORDX ; $d081
	ld [hli], a
	ld [hl], a
	ld a, $8
	ld [$cd3e], a
	ld hl, wOAMBuffer
	jp Func_3a8e1

SetupEnemyPartyPokeballs: ; 3a887 (e:6887)
	call PlaceEnemyHUDTiles
	ld hl, wEnemyMons
	ld de, wEnemyPartyCount ; $d89c
	call SetupPokeballs
	ld hl, W_BASECOORDX ; $d081
	ld a, $48
	ld [hli], a
	ld [hl], $20
	ld a, $f8
	ld [$cd3e], a
	ld hl, $c318
	jp Func_3a8e1

SetupPokeballs: ; 0x3a8a6
	ld a, [de]
	push af
	ld de, wBuffer
	ld c, $6 ; max num of partymons
	ld a, $34 ; empty pokeball
.emptyloop
	ld [de], a
	inc de
	dec c
	jr nz, .emptyloop ; 0x3a8b2 $fb
	pop af
	ld de, wBuffer
.monloop
	push af
	call PickPokeball
	inc de
	pop af
	dec a
	jr nz, .monloop
	ret

PickPokeball: ; 3a8c2 (e:68c2)
	inc hl
	ld a, [hli]
	and a
	jr nz, .alive
	ld a, [hl]
	and a
	ld b, $33 ; crossed ball (fainted)
	jr z, .done_fainted
.alive
	inc hl
	inc hl
	ld a, [hl] ; status
	and a
	ld b, $32 ; black ball (status)
	jr nz, .done
	dec b ; regular ball
	jr .done
.done_fainted
	inc hl
	inc hl
.done
	ld a, b
	ld [de], a
	ld bc, $0028 ; rest of mon struct
	add hl, bc
	ret

Func_3a8e1: ; 3a8e1 (e:68e1)
	ld de, $cee9
	ld c, $6
.asm_3a8e6
	ld a, [W_BASECOORDY] ; $d082
	ld [hli], a
	ld a, [W_BASECOORDX] ; $d081
	ld [hli], a
	ld a, [de]
	ld [hli], a
	xor a
	ld [hli], a
	ld a, [W_BASECOORDX] ; $d081
	ld b, a
	ld a, [$cd3e]
	add b
	ld [W_BASECOORDX], a ; $d081
	inc de
	dec c
	jr nz, .asm_3a8e6
	ret

PlacePlayerHUDTiles: ; 3a902 (e:6902)
	ld hl, PlayerBattleHUDGraphicsTiles ; $6916
	ld de, $cd3f
	ld bc, $3
	call CopyData
	FuncCoord 18, 10 ; $c47a
	ld hl, Coord
	ld de, rIE ; $ffff
	jr PlaceHUDTiles

PlayerBattleHUDGraphicsTiles: ; 3a916 (e:6916)
; The tile numbers for specific parts of the battle display for the player's pokemon
	db $73 ; unused ($73 is hardcoded into the routine that uses these bytes)
	db $77 ; lower-right corner tile of the HUD
	db $6F ; lower-left triangle tile of the HUD

PlaceEnemyHUDTiles: ; 3a919 (e:6919)
	ld hl, EnemyBattleHUDGraphicsTiles ; $692d
	ld de, $cd3f
	ld bc, $3
	call CopyData
	FuncCoord 1, 2 ; $c3c9
	ld hl, Coord
	ld de, $1
	jr PlaceHUDTiles

EnemyBattleHUDGraphicsTiles: ; 3a92d (e:692d)
; The tile numbers for specific parts of the battle display for the enemy
	db $73 ; unused ($73 is hardcoded in the routine that uses these bytes)
	db $74 ; lower-left corner tile of the HUD
	db $78 ; lower-right triangle tile of the HUD

PlaceHUDTiles: ; 3a930 (e:6930)
	ld [hl], $73
	ld bc, $14
	add hl, bc
	ld a, [$cd40]
	ld [hl], a
	ld a, $8
.asm_3a93c
	add hl, de
	ld [hl], $76
	dec a
	jr nz, .asm_3a93c
	add hl, de
	ld a, [$cd41]
	ld [hl], a
	ret

SetupPlayerAndEnemyPokeballs: ; 3a948 (e:6948)
	call LoadPartyPokeballGfx
	ld hl, W_PARTYMON1_NUM ; $d16b (aliases: W_PARTYMON1DATA)
	ld de, W_NUMINPARTY ; $d163
	call SetupPokeballs
	ld hl, W_BASECOORDX ; $d081
	ld a, $50
	ld [hli], a
	ld [hl], $40
	ld a, $8
	ld [$cd3e], a
	ld hl, wOAMBuffer
	call Func_3a8e1
	ld hl, wEnemyMons ; $d8a4
	ld de, wEnemyPartyCount ; $d89c
	call SetupPokeballs
	ld hl, W_BASECOORDX ; $d081
	ld a, $50
	ld [hli], a
	ld [hl], $68
	ld hl, $c318
	jp Func_3a8e1

; four tiles: pokeball, black pokeball (status ailment), crossed out pokeball (faited) and pokeball slot (no mon)
PokeballTileGraphics:: ; 3a97e (e:697e)
	INCBIN "gfx/pokeball.2bpp"