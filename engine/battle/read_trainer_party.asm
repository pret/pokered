ReadTrainer:

; don't change any moves in a link battle
	ld a, [wLinkState]
	and a
	ret nz

; set [wEnemyPartyCount] to 0, [wEnemyPartySpecies] to FF
; XXX first is total enemy pokemon?
; XXX second is species of first pokemon?
	ld hl, wEnemyPartyCount
	xor a
	ld [wIsAltPalettePkmnData], a ; PureRGBnote: ADDED: NPC trainers by default have normal palette pokemon, only specific party types can have alt palettes
	ld [hli], a
	dec a
	ld [hl], a

; get the pointer to trainer data for this class
	ld a, [wCurOpponent]
	sub OPP_ID_OFFSET + 1 ; convert value from pokemon to trainer
	add a
	ld hl, TrainerDataPointers
	ld c, a
	ld b, 0
	add hl, bc ; hl points to trainer class
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wTrainerNo]
	ld b, a
; At this point b contains the trainer number,
; and hl points to the trainer class.
; Our next task is to iterate through the trainers,
; decrementing b each time, until we get to the right one.
.outer
	dec b
	jr z, .IterateTrainer
.inner
	ld a, [hli]
	and a
	jr nz, .inner
	jr .outer

; if the first byte of trainer data is FF,
; - each pokemon has a specific level
;      (as opposed to the whole team being of the same level)
; - if [wLoneAttackNo] != 0, one pokemon on the team has a special move
; else the first byte is the level of every pokemon on the team
.IterateTrainer
	ld a, [hli]
	cp $FF ; is the trainer special?
	jr z, .SpecialTrainer ; if so, check for special moves
;;;;;;;;;; PureRGBnote: ADDED: parties that start with $FE are considered alt palette teams.
	cp $FE ; is the trainer special with alt palettes?
	jr z, .SpecialTrainer ; if so, load their alt palette flags as well as levels
;;;;;;;;;;
	cp $FD
	jr z, .CustomMovesetTrainer
	ld [wCurEnemyLVL], a
.LoopTrainerData
	ld a, [hli]
	and a ; have we reached the end of the trainer data?
	jp z, .FinishUp
	ld [wcf91], a ; write species somewhere (XXX why?)
	ld a, ENEMY_PARTY_DATA
	ld [wMonDataLocation], a
	push hl
	call AddPartyMon
	pop hl
	jr .LoopTrainerData
.SpecialTrainer
	call .SpecialTrainerLoop
	jr .AddLoneMove
;;;;;;;;;; PureRGBnote: ADDED: code that facilitates assigning custom moves to pokemon
.CustomMovesetTrainer
	ld a, [hli] ; which moveset will be used
	push af
	call .SpecialTrainerLoop
	pop af
	ld d, a
	callfar LoadTrainerMoveSet
	jr .FinishUp
;;;;;;;;;;
.SpecialTrainerLoop
; if this code is being run:
; - each pokemon has a specific level stored in the first byte
;      (as opposed to the whole team being of the same level)
; - the level byte's last bit indicates whether the pokemon uses alternate palette
;   bit 7 (the final bit) of the level byte is only possible to be set if the level is above 127. 
;   Since max is 100, we'll never set it. So we can use it to indicate whether the pokemon is using an alternate palette.
; - if [wLoneAttackNo] != 0, one pokemon on the team has a special move
	ld a, [hli]
	and a ; have we reached the end of the trainer data?
	ret z
;;;;;;;;;; PureRGBnote: ADDED: final bit of "pokemon level" in special parties is used to indicate pokemon having alternate palette.
	bit 7, a 
	push af
	ld a, 0
	jr z, .noAltPalette
	ld a, 1 
.noAltPalette
	ld [wIsAltPalettePkmnData], a
	pop af
	and %01111111
;;;;;;;;;;
	ld [wCurEnemyLVL], a
	ld a, [hli]
	ld [wcf91], a
	ld a, ENEMY_PARTY_DATA
	ld [wMonDataLocation], a
	push hl
	call AddPartyMon
	pop hl
	jr .SpecialTrainer
.AddLoneMove
; does the trainer have a single monster with a different move?
	ld a, [wLoneAttackNo] ; Brock is 01, Misty is 02, Erika is 04, etc
	and a
	jr z, .AddTeamMove
;;;;;;;;;; PureRGBnote: CHANGED: gym leader special moves can have custom indices instead of hardcoded to replace move 2 of the given pokemon.
	dec a ; indices start at 0, wLoneAttackNo starts at 1
	ld b, a
	add b ; double the index value 
	add b ; triple the index value (each entry is 3 bytes)
	ld c, a
	ld b, 0
	ld hl, LoneMoves 
	add hl, bc ; select the correct entry from LoneMoves
	ld a, [hli] ; pokemon index
	ld c, [hl] ; move index for the above pokemon
	inc hl
	ld d, [hl] ; move to be given
	ld hl, wEnemyMon1Moves
	add hl, bc ; select which move will be replaced based on c
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes ; select the correct pokemon to modify
	ld [hl], d ; modify the move at the given slot to be the given move
;;;;;;;;;;
	jr .FinishUp
.AddTeamMove
; check if our trainer's team has special moves

; get trainer class number
	ld a, [wCurOpponent]
	sub OPP_ID_OFFSET
	ld b, a
	ld hl, TeamMoves

; iterate through entries in TeamMoves, checking each for our trainer class
.IterateTeamMoves
	ld a, [hli]
	cp b
	jr z, .GiveTeamMoves ; is there a match?
	inc hl ; if not, go to the next entry
	inc a
	jr nz, .IterateTeamMoves

; no matches found. is this trainer champion rival?
	ld a, b
	cp RIVAL3
	jr z, .ChampionRival
	jr .FinishUp ; nope
.GiveTeamMoves
	ld a, [hl]
	ld [wEnemyMon6Moves + 1], a ; PureRGBnote: CHANGED: elite four trainers replace their 6th pokemon's 2nd move with their special moves.
	jr .FinishUp
.ChampionRival ; give moves to his team
; PureRGBnote: CHANGED: not necessary because champion's team already has good moves at such high level from their learnset.

; pidgeot
;	ld a, SKY_ATTACK
;	ld [wEnemyMon1Moves + 2], a

; starter
;	ld a, [wRivalStarter]
;	cp STARTER3
;	ld b, MEGA_DRAIN
;	jr z, .GiveStarterMove
;	cp STARTER1
;	ld b, FIRE_BLAST
;	jr z, .GiveStarterMove
;	ld b, BLIZZARD ; must be squirtle
;.GiveStarterMove
;	ld a, b
;	ld [wEnemyMon6Moves + 2], a
.FinishUp
; clear wAmountMoneyWon addresses
	xor a
;;;;;;;;;; PureRGBnote: ADDED: can't have alt palette pokemon at this point.
	ld [wIsAltPalettePkmnData], a
;;;;;;;;;;
	ld de, wAmountMoneyWon
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	ld a, [wCurEnemyLVL]
	ld b, a
.LastLoop
; update wAmountMoneyWon addresses (money to win) based on enemy's level
	ld hl, wTrainerBaseMoney + 1
	ld c, 2 ; wAmountMoneyWon is a 3-byte number
	push bc
	predef AddBCDPredef
	pop bc
	inc de
	inc de
	dec b
	jr nz, .LastLoop ; repeat wCurEnemyLVL times
	ret
