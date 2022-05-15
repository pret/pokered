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
	jr z, .iterateTrainer
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
.iterateTrainer
	ld a, [hli]
	cp $FF ; is the trainer special?
	jr z, .specialTrainer ; if so, check for special moves
	ld [wCurEnemyLVL], a
.loopTrainerData
	ld a, [hli]
	and a ; have we reached the end of the trainer data?
	jr z, .finishUp
	ld [wcf91], a ; write species somewhere (XXX why?)
	ld a, ENEMY_PARTY_DATA
	ld [wMonDataLocation], a
	push hl
	call AddPartyMon
	pop hl
	jr .loopTrainerData
.specialTrainer
; if this code is being run:
; - each pokemon has a specific level
;      (as opposed to the whole team being of the same level)
; - if [wLoneAttackNo] != 0, one pokemon on the team has a special move
	ld a, [hli]
	and a ; have we reached the end of the trainer data?
	jr z, .addLoneMove
	ld [wCurEnemyLVL], a
	ld a, [hli]
	ld [wcf91], a
	ld a, ENEMY_PARTY_DATA
	ld [wMonDataLocation], a
	push hl
	call AddPartyMon
	pop hl
	jr .specialTrainer
.addLoneMove
; does the trainer have a single monster with a different move?
	ld a, [wLoneAttackNo] ; Brock is 01, Misty is 02, Erika is 04, etc
	and a
	jr z, .addTeamMove
	dec a
	add a
	ld c, a
	ld b, 0
	ld hl, LoneMoves
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld hl, wEnemyMon1Moves + 2
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld [hl], d
	jr .finishUp
.addTeamMove
; check if our trainer's team has special moves

; get trainer class number
	ld a, [wCurOpponent]
	sub OPP_ID_OFFSET
	ld b, a
	ld hl, TeamMoves

; iterate through entries in TeamMoves, checking each for our trainer class
.iterateTeamMoves
	ld a, [hli]
	cp b
	jr z, .giveTeamMoves ; is there a match?
	inc hl ; if not, go to the next entry
	inc a
	jr nz, .iterateTeamMoves

; no matches found. is this trainer champion rival?
	ld a, b
	cp RIVAL3
	jr z, .championRival
	jr .finishUp ; nope
.giveTeamMoves
	ld a, [hl]
	ld [wEnemyMon5Moves + 2], a
	jr .finishUp
.championRival ; give moves to his team

; pidgeot
	ld a, SKY_ATTACK
	ld [wEnemyMon1Moves + 2], a

; starter
	ld a, [wRivalStarter]
	cp STARTER3
	ld b, MEGA_DRAIN
	jr z, .giveStarterMove
	cp STARTER1
	ld b, FIRE_BLAST
	jr z, .giveStarterMove
	ld b, BLIZZARD ; must be squirtle
.giveStarterMove
	ld a, b
	ld [wEnemyMon6Moves + 2], a
.finishUp
; clear wAmountMoneyWon addresses
	xor a
	ld de, wAmountMoneyWon
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	ld a, [wCurEnemyLVL]
	ld b, a
.lastLoop
; update wAmountMoneyWon addresses (money to win) based on enemy's level
	ld hl, wTrainerBaseMoney + 1
	ld c, 2 ; wAmountMoneyWon is a 3-byte number
	push bc
	predef AddBCDPredef
	pop bc
	inc de
	inc de
	dec b
	jr nz, .lastLoop ; repeat wCurEnemyLVL times
	ret
