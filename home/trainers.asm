; PureRGBnote: MOVED: a bunch of code was moved from this file to other banks or commented out since it was unused.

; stores hl in [wTrainerHeaderPtr]
StoreTrainerHeaderPointer::
	ld a, h
	ld [wTrainerHeaderPtr], a
	ld a, l
	ld [wTrainerHeaderPtr+1], a
	ret

; executes the current map script from the function pointer array provided in de.
; a: map script index to execute (unless overridden by [wStatusFlags7] BIT_USE_CUR_MAP_SCRIPT)
; hl: trainer header pointer
ExecuteCurMapScriptInTable::
	push af
	push de
	call StoreTrainerHeaderPointer
	pop hl
	pop af
	push hl
	ld hl, wStatusFlags7
	bit BIT_USE_CUR_MAP_SCRIPT, [hl]
	res BIT_USE_CUR_MAP_SCRIPT, [hl]
	jr z, .useProvidedIndex   ; test if map script index was overridden manually
	ld a, [wCurMapScript]
.useProvidedIndex
	pop hl
	ld [wCurMapScript], a
	call CallFunctionInTable
	ld a, [wCurMapScript]
	ret

; PureRGBnote: CHANGED: removed this function because it's a waste of wram space when it can be loaded right when reading gym statues
;LoadGymLeaderAndCityName::
;	push de
;	ld de, wGymCityName
;	ld bc, $11
;	rst _CopyData   ; load city name
;	pop hl
;	ld de, wGymLeaderName
;	ld bc, NAME_LENGTH
;	rst _CopyData     ; load gym leader name
;	ret

; reads specific information from trainer header (pointed to at wTrainerHeaderPtr)
; a: offset in header data
;    0 -> flag's bit (into wTrainerHeaderFlagBit)
;    2 -> flag's byte ptr (into hl)
;    4 -> before battle text (into hl)
;    6 -> after battle text (into hl)
;    8 -> end battle text (into hl)
ReadTrainerHeaderInfo::
	push de
	push af
	ld d, $0
	ld e, a
	ld hl, wTrainerHeaderPtr
	ld a, [hli]
	ld l, [hl]
	ld h, a
	add hl, de
	pop af
	and a
	jr nz, .nonZeroOffset
	ld a, [hl]
	ld [wTrainerHeaderFlagBit], a  ; store flag's bit
	jr .done
.nonZeroOffset
	cp $2
	jr z, .readPointer ; read flag's byte ptr
	cp $4
	jr z, .readPointer ; read before battle text
	cp $6
	jr z, .readPointer ; read after battle text
	cp $8
	jr nz, .done 
;   jr z, .readPointer
;	cp $a
;	jr nz, .done
;	ld a, [hli]        ; read end battle text (2) but override the result afterwards (XXX why, bug?)
;	ld d, [hl]
;	ld e, a
;	jr .done
.readPointer ; read end battle text
	call GetAddressFromPointer
.done
	pop de
	ret

; PureRGBnote: CHANGED: this function was optimized a bit.
TalkToTrainer::
	call StoreTrainerHeaderPointer
	xor a
	call ReadTrainerHeaderInfo     ; read flag's bit
	call TrainerFlagActionTest      ; read trainer's flag
	ld a, c
	and a
	jr z, .trainerNotYetFought     ; test trainer's flag
	ld a, $6
	call ReadTrainerHeaderInfo     ; print after battle text
	rst _PrintText
	ret
.trainerNotYetFought
	ld a, $4
	call ReadTrainerHeaderInfo     ; print before battle text
	rst _PrintText
	;ld a, $a
	;call ReadTrainerHeaderInfo     ; (?) does nothing apparently (maybe bug in ReadTrainerHeaderInfo)
	push de
	ld a, $8
	call ReadTrainerHeaderInfo     ; read end battle text
	pop de
	call SaveEndBattleTextPointers
	ld hl, wStatusFlags7
	set BIT_USE_CUR_MAP_SCRIPT, [hl] ; activate map script index override (index is set below)
	ld hl, wMiscFlags
	bit BIT_SEEN_BY_TRAINER, [hl]  ; test if player is already engaging the trainer (because the trainer saw the player)
	ret nz
; if the player talked to the trainer of his own volition
	call EngageMapTrainer
	ld hl, wCurMapScript
	inc [hl]      ; increment map script index before StartTrainerBattle increments it again (next script function is usually EndTrainerBattle)
	jp StartTrainerBattle

; checks if any trainers are seeing the player and wanting to fight
CheckFightingMapTrainers::
IF DEF(_DEBUG)
	call DebugPressedOrHeldB
	jr nz, .trainerNotEngaging
ENDC
	call CheckForEngagingTrainers
	ld a, [wSpriteIndex]
	cp $ff
	jr nz, .trainerEngaging
IF DEF(_DEBUG)
.trainerNotEngaging
ENDC
	xor a
	ld [wSpriteIndex], a
	ld [wTrainerHeaderFlagBit], a
	ret
.trainerEngaging
	ld hl, wStatusFlags7
	set BIT_TRAINER_BATTLE, [hl]
	ld [wEmotionBubbleSpriteIndex], a
	xor a ; EXCLAMATION_BUBBLE
	ld [wWhichEmotionBubble], a
	predef EmotionBubble
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	xor a
	ldh [hJoyHeld], a
	call TrainerWalkUpToPlayer_Bank0
	ld hl, wCurMapScript
	inc [hl]      ; increment map script index (next script function is usually DisplayEnemyTrainerTextAndStartBattle)
	ret

; display the before battle text after the enemy trainer has walked up to the player's sprite
DisplayEnemyTrainerTextAndStartBattle::
	ld a, [wStatusFlags5]
	and 1 << BIT_SCRIPTED_NPC_MOVEMENT
	ret nz ; return if the enemy trainer hasn't finished walking to the player's sprite
	ld [wJoyIgnore], a
	ld a, [wSpriteIndex]
	ldh [hSpriteIndex], a
	call DisplayTextID
	; fall through

StartTrainerBattle::
	xor a
	ld [wJoyIgnore], a
	call InitBattleEnemyParameters
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, wStatusFlags4
	set BIT_UNKNOWN_4_1, [hl]
	ld hl, wCurMapScript
	inc [hl]        ; increment map script index (next script function is usually EndTrainerBattle)
	ret

EndTrainerBattle::
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]
	set BIT_CUR_MAP_LOADED_2, [hl]
	ld hl, wStatusFlags3
	res BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, wMiscFlags
	res BIT_SEEN_BY_TRAINER, [hl] ; player is no longer engaged by any trainer
	ld a, [wIsInBattle]
	cp $ff
	jp z, ResetButtonPressedAndMapScript
	ld b, FLAG_SET
	call TrainerFlagAction   ; flag trainer as fought
	ld a, [wEnemyMonOrTrainerClass]
	cp OPP_ID_OFFSET
	jr nc, .skipRemoveSprite    ; test if trainer was fought (in that case skip removing the corresponding sprite)
	; code that removes overworld pokemon like articuno, mewtwo, snorlax, etc. when defeated
	; TODO: hide extra object if in extra map???
	ld hl, wMissableObjectList
	ld de, FLAG_TEST
	ld a, [wSpriteIndex]
	call IsInArray              ; search for sprite ID
	inc hl
	ld a, [hl]
	ld [wMissableObjectIndex], a               ; load corresponding missable object index and remove it
	predef HideObject
.skipRemoveSprite
	ld hl, wStatusFlags5
	bit BIT_UNKNOWN_5_4, [hl]
	res BIT_UNKNOWN_5_4, [hl]
	ret nz

ResetButtonPressedAndMapScript::
	xor a
	ld [wJoyIgnore], a
	ldh [hJoyHeld], a
	ldh [hJoyPressed], a
	ldh [hJoyReleased], a
	ld [wCurMapScript], a               ; reset battle status
	ret

; calls TrainerWalkUpToPlayer
TrainerWalkUpToPlayer_Bank0::
	farjp TrainerWalkUpToPlayer

; sets opponent type and mon set/lvl based on the engaging trainer data
InitBattleEnemyParameters::
	ld a, [wEngagedTrainerClass]
	ld [wCurOpponent], a
	ld [wEnemyMonOrTrainerClass], a
	cp OPP_ID_OFFSET
	ld a, [wEngagedTrainerSet]
	jr c, .noTrainer
	ld [wTrainerNo], a
	ret
.noTrainer
	ld [wCurEnemyLevel], a
	ret

GetSpritePosition1::
	ld hl, _GetSpritePosition1
	jr SpritePositionBankswitch

GetSpritePosition2::
	ld hl, _GetSpritePosition2
	jr SpritePositionBankswitch

SetSpritePosition1::
	ld hl, _SetSpritePosition1
	jr SpritePositionBankswitch

SetSpritePosition2::
	ld hl, _SetSpritePosition2
SpritePositionBankswitch::
	ld b, BANK("Trainer Sight")
	rst _Bankswitch
	ret

CheckForEngagingTrainers::
	xor a
	call ReadTrainerHeaderInfo       ; read trainer flag's bit (unused)
	ld d, h                          ; store trainer header address in de
	ld e, l
.trainerLoop
	call StoreTrainerHeaderPointer   ; set trainer header pointer to current trainer
	ld a, [de]
	ld [wSpriteIndex], a                     ; store trainer flag's bit
	ld [wTrainerHeaderFlagBit], a
	cp -1
	ret z
	call TrainerFlagActionTest        ; read trainer flag
	ld a, c
	and a ; has the trainer already been defeated?
	jr nz, .continue
	push hl
	push de
	push hl
	xor a
	call ReadTrainerHeaderInfo       ; get trainer header pointer
	inc hl
	ld a, [hl]                       ; read trainer engage distance
	pop hl
	ld [wTrainerEngageDistance], a
	ld a, [wSpriteIndex]
	swap a
	ld [wTrainerSpriteOffset], a
	predef TrainerEngage
	pop de
	pop hl
	ld a, [wTrainerSpriteOffset]
	and a
	ret nz        ; break if the trainer is engaging
.continue
	ld hl, $c
	add hl, de
	ld d, h
	ld e, l
	jr .trainerLoop

; hl = text if the player wins
; de = text if the player loses
SaveEndBattleTextPointers::
	ldh a, [hLoadedROMBank]
	ld [wEndBattleTextRomBank], a
	ld a, h
	ld [wEndBattleWinTextPointer], a
	ld a, l
	ld [wEndBattleWinTextPointer + 1], a
	ld a, d
	ld [wEndBattleLoseTextPointer], a
	ld a, e
	ld [wEndBattleLoseTextPointer + 1], a
	ret

; loads data of some trainer on the current map and plays pre-battle music
; [wSpriteIndex]: sprite ID of trainer who is engaged
EngageMapTrainer::
	ld hl, wMapSpriteExtraData
	ld d, $0
	ld a, [wSpriteIndex]
	dec a
	add a
	ld e, a
	add hl, de     ; seek to engaged trainer data
	ld a, [hli]    ; load trainer class
	ld [wEngagedTrainerClass], a
	ld a, [hl]     ; load trainer mon set
	ld [wEngagedTrainerSet], a
	jpfar PlayTrainerMusic ; PureRGBnote: MOVED: playtrainermusic was moved to another bank

PrintEndBattleText::
	push hl
	ld hl, wStatusFlags3
	bit BIT_PRINT_END_BATTLE_TEXT, [hl]
	res BIT_PRINT_END_BATTLE_TEXT, [hl]
	pop hl
	ret z
	ldh a, [hLoadedROMBank]
	push af
	ld a, [wEndBattleTextRomBank]
	call SetCurBank
	push hl
	farcall SaveTrainerName
	ld hl, TrainerEndBattleText
	rst _PrintText
	pop hl
	pop af
	call SetCurBank
	farcall SetEnemyTrainerToStayAndFaceAnyDirection
	jp WaitForSoundToFinish

GetSavedEndBattleTextPointer::
	ld a, [wBattleResult]
	and a
; won battle
	jr nz, .lostBattle
	hl_deref_reverse wEndBattleWinTextPointer
	ret
.lostBattle
	hl_deref_reverse wEndBattleLoseTextPointer
	ret

TrainerEndBattleText::
	text_far _TrainerNameText
	text_asm
	call GetSavedEndBattleTextPointer
	call TextCommandProcessor
	rst TextScriptEnd

TrainerFlagActionTest::
	ld b, FLAG_TEST
	; fall through
TrainerFlagAction::
	ld a, $2
	call ReadTrainerHeaderInfo     ; read flag's byte ptr (does not change b register)
	ld a, [wTrainerHeaderFlagBit]
	ld c, a
	predef_jump FlagActionPredef

