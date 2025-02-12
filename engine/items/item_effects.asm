; PureRGBnote: ADDED: CHANGED: some item effects were changed or new ones were added

UseItem_::
	xor a
	ld [wListMenuHoverTextType], a ; PureRGBnote: ADDED: if we used an item we don't need to display TM text afterwards.
	ld a, 1
	ld [wActionResultOrTookBattleTurn], a ; initialise to success value
	ld a, [wCurItem]
	cp HM01
	jp nc, ItemUseTMHM
	ld hl, ItemUsePtrTable
	dec a
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

ItemUsePtrTable:
; entries correspond to item ids
	dw ItemUseBall       ; MASTER_BALL
	dw ItemUseBall       ; ULTRA_BALL
	dw ItemUseBall       ; GREAT_BALL
	dw ItemUseBall       ; POKE_BALL
	dw ItemUseBall    	 ; HYPER_BALL
	dw ItemUseBicycle    ; BICYCLE
	dw ItemUseSurfboard  ; SURFBOARD
	dw ItemUseBall       ; SAFARI_BALL
	dw ItemUsePokedex    ; POKEDEX
	dw ItemUseEvoStone   ; MOON_STONE
	dw ItemUseMedicine   ; ANTIDOTE
	dw ItemUseMedicine   ; BURN_HEAL
	dw ItemUseMedicine   ; ICE_HEAL
	dw ItemUseMedicine   ; AWAKENING
	dw ItemUseMedicine   ; PARLYZ_HEAL
	dw ItemUseMedicine   ; FULL_RESTORE
	dw ItemUseMedicine   ; MAX_POTION
	dw ItemUseMedicine   ; HYPER_POTION
	dw ItemUseMedicine   ; SUPER_POTION
	dw ItemUseMedicine   ; POTION
	dw ItemUseBait       ; SAFARI_BAIT
	dw ItemUseRock       ; SAFARI_ROCK
	dw ValuableItem 	 ; OLD_COIN
	dw UseTopSecretKey  ; TOPSECRETKEY
	dw UnusableItem      ; UNUSED_ITEM3
	dw UnusableItem      ; UNUSED_ITEM4
	dw UnusableItem      ; UNUSED_ITEM5
	dw UnusableItem      ; UNUSED_ITEM6
	dw ItemUseEscapeRope ; ESCAPE_ROPE
	dw ItemUseRepel      ; REPEL
	dw FossilItem        ; OLD_AMBER
	dw ItemUseEvoStone   ; FIRE_STONE
	dw ItemUseEvoStone   ; THUNDER_STONE
	dw ItemUseEvoStone   ; WATER_STONE
	dw ItemUseVitamin    ; HP_UP
	dw ItemUseVitamin    ; PROTEIN
	dw ItemUseVitamin    ; IRON
	dw ItemUseVitamin    ; CARBOS
	dw ItemUseVitamin    ; CALCIUM
	dw ItemUseVitamin    ; RARE_CANDY
	dw FossilItem        ; DOME_FOSSIL
	dw FossilItem        ; HELIX_FOSSIL
	dw UnusableItem      ; SECRET_KEY
	dw ItemUsePocketAbra ; POCKET_ABRA
	dw UnusableItem      ; BIKE_VOUCHER
	dw ItemUseXAccuracy  ; X_ACCURACY
	dw ItemUseEvoStone   ; LEAF_STONE
	dw ItemUseCardKey    ; CARD_KEY
	dw ValuableItem      ; NUGGET
	dw ItemUseApexChip   ; APEX_CHIP
	dw ItemUsePokeDoll   ; POKE_DOLL
	dw ItemUseMedicine   ; FULL_HEAL
	dw ItemUseMedicine   ; REVIVE
	dw ItemUseMedicine   ; MAX_REVIVE
	dw ItemUseGuardSpec  ; GUARD_SPEC
	dw ItemUseSuperRepel ; SUPER_REPEL
	dw ItemUseMaxRepel   ; MAX_REPEL
	dw ItemUseDireHit    ; DIRE_HIT
	dw UnusableItem      ; COIN
	dw ItemUseMedicine   ; FRESH_WATER
	dw ItemUseMedicine   ; SODA_POP
	dw ItemUseMedicine   ; LEMONADE
	dw UnusableItem      ; S_S_TICKET
	dw ItemNotYours      ; GOLD_TEETH
	dw ItemUseXStat      ; X_ATTACK
	dw ItemUseXStat      ; X_DEFEND
	dw ItemUseXStat      ; X_SPEED
	dw ItemUseXStat      ; X_SPECIAL
	dw ItemNotYours      ; LOST_WALLET (used to be coin case)
	dw ItemNotYours      ; OAKS_PARCEL
	dw ItemUseItemfinder ; ITEMFINDER
	dw UnusableItem      ; SILPH_SCOPE
	dw ItemUsePokeFlute  ; POKE_FLUTE
	dw UnusableItem      ; LIFT_KEY
	dw ItemUseBoosterChip; BOOSTER_CHIP
	dw ItemUseOldRod     ; OLD_ROD
	dw ItemUseGoodRod    ; GOOD_ROD
	dw ItemUseSuperRod   ; SUPER_ROD
	dw ItemUsePPUp       ; PP_UP
	dw ItemUsePPRestore  ; ETHER
	dw ItemUsePPRestore  ; MAX_ETHER
	dw ItemUsePPRestore  ; ELIXER
	dw ItemUsePPRestore  ; MAX_ELIXER

ItemUseBall:

; Balls can't be used out of battle.
	ld a, [wIsInBattle]
	and a
	jp z, ItemUseInBattle ; PureRGBnote: ADDED: text indicating the item should be used in battle.

; Balls can't catch trainers' Pokémon.
	dec a
	jp nz, ThrowBallAtTrainerMon

; If this is for the old man battle, skip checking if the party & box are full.
	ld a, [wBattleType]
	dec a
	jr z, .canUseBall

	ld a, [wPartyCount] ; is party full?
	cp PARTY_LENGTH
	jr nz, .canUseBall
	ld a, [wBoxCount] ; is box full?
	cp MONS_PER_BOX
	jp z, BoxFullCannotThrowBall

.canUseBall
	xor a
	ld [wCapturedMonSpecies], a

	ld a, [wBattleType]
	cp BATTLE_TYPE_SAFARI
	jr nz, .skipSafariZoneCode

.safariZone
	ld hl, wNumSafariBalls
	dec [hl] ; remove a Safari Ball

.skipSafariZoneCode
	call RunDefaultPaletteCommand

	ld a, $43 ; successful capture value
	ld [wPokeBallAnimData], a

	call LoadScreenTilesFromBuffer1
	ld hl, ItemUseText00
	rst _PrintText

; If the player is fighting an unidentified ghost, set the value that indicates
; the Pokémon can't be caught and skip the capture calculations.
	callfar IsGhostBattle
	ld b, $10 ; can't be caught value
	jp z, .setAnimData
	ld a, [wCurMap]
	cp POKEMON_TOWER_B1F ; PureRGBnote: ADDED: can't catch spirits in pokemon tower catacombs
	; b still = $10
	jp z, .setAnimData

	ld a, [wBattleType]
	dec a
	jr nz, .notOldManBattle

.oldManBattle
	ld hl, wGrassRate
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	rst _CopyData ; save the player's name in the Wild Monster data (part of the Cinnabar Island Missingno. glitch)
	jp .skipShakeCalculations

.notOldManBattle
; If the player is fighting the ghost Marowak, set the value that indicates the
; Pokémon can't be caught and skip the capture calculations.
	ld a, [wCurMap]
	cp POKEMON_TOWER_6F
	jr nz, .loop
	ld a, [wEnemyMonSpecies2]
	cp RESTLESS_SOUL
;;;;;;;;;; PureRGBnote: ADDED: ghost marowak can be caught if you have silph scope in your bag.
	jp nz, .loop
	push bc
	ld b, SILPH_SCOPE
	call IsItemInBag
	pop bc
	jr z, .loop
;;;;;;;;;;
	ld b, $10 ; can't be caught value

; Get the first random number. Let it be called Rand1.
; Rand1 must be within a certain range according the kind of ball being thrown.
; The ranges are as follows.
; Poké Ball:         [0, 255]
; Great Ball:        [0, 200]
; Ultra/Safari Ball: [0, 150]
; Loop until an acceptable number is found.

.loop
	call Random
	ld b, a

; Get the item ID.
	ld hl, wCurItem
	ld a, [hl]

; The Master Ball always succeeds.
	cp MASTER_BALL
	jp z, .skipShakeCalculations

;;;;;;;;;; PureRGBnote: ADDED: effect for the new Hyper ball item.
	cp HYPER_BALL
	jr z, .hyperBallCheck
.loopreturn	
;;;;;;;;;;

; Anything will do for the basic Poké Ball.
	cp POKE_BALL
	jr z, .checkForAilments

; If it's a Great/Ultra/Safari Ball and Rand1 is greater than 200, try again.
	ld a, 200
	cp b
	jr c, .loop

; Less than or equal to 200 is good enough for a Great Ball.
	ld a, [hl]
	cp GREAT_BALL
	jr z, .checkForAilments

; If it's an Ultra/Safari Ball and Rand1 is greater than 150, try again.
	ld a, 150
	cp b
	jr c, .loop
	jr .checkForAilments
;;;;;;;;;; PureRGBnote: ADDED: effect for the new Hyper ball item.
.hyperBallCheck
	ld a, [wEnemyMonActualCatchRate]
	cp 26 
	jp nc, .skipShakeCalculations ;Hyper Ball always captures pokemon with catch rate >25
	push hl
	push bc
	push de
	; if the catch rate is 25 or lower it will guarantee catching if the pokemon has <1/3 health.
	ld d, 3
	callfar FarCheckIfEnemyHPBelowFraction
	pop de
	pop bc
	pop hl
	jp c, .skipShakeCalculations
	ld a, HYPER_BALL
	jr .loopreturn
;;;;;;;;;;
.checkForAilments
; Pokémon can be caught more easily with a status ailment.
; Depending on the status ailment, a certain value will be subtracted from
; Rand1. Let this value be called Status.
; The larger Status is, the more easily the Pokémon can be caught.
; no status ailment:     Status = 0
; Burn/Paralysis/Poison: Status = 12
; Freeze/Sleep:          Status = 25
; If Status is greater than Rand1, the Pokémon will be caught for sure.
	ld a, [wEnemyMonStatus]
	and a
	jr z, .skipAilmentValueSubtraction ; no ailments
	and (1 << FRZ) | SLP_MASK
	ld c, 12
	jr z, .notFrozenOrAsleep
	ld c, 25
.notFrozenOrAsleep
	ld a, b
	sub c
	jp c, .skipShakeCalculations
	ld b, a

.skipAilmentValueSubtraction
	push bc ; save (Rand1 - Status)

; Calculate MaxHP * 255.
	xor a
	ldh [hMultiplicand], a
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a
	ld a, 255
	ldh [hMultiplier], a
	call Multiply

; Determine BallFactor. It's 8 for Great Balls / Hyper Balls and 12 for the others.
	ld a, [wCurItem]
	ld b, 8
	cp GREAT_BALL
	jr z, .skip1
;;;;;;;;;;; PureRGBnote: ADDED: hyper ball has the same ballfactor as great ball
	cp HYPER_BALL
	jr z, .skip1
;;;;;;;;;;;
	ld b, 12
.skip1
	ld a, b
; Note that the results of all division operations are floored.

; Calculate (MaxHP * 255) / BallFactor.
	ldh [hDivisor], a
	ld b, 4 ; number of bytes in dividend
	call Divide

; Divide the enemy's current HP by 4. HP is not supposed to exceed 999 so
; the result should fit in a. If the division results in a quotient of 0,
; change it to 1.
	ld hl, wEnemyMonHP
	ld a, [hli]
	ld b, a
	ld a, [hl]
	srl b
	rra
	srl b
	rra
	and a
	jr nz, .skip2
	inc a

.skip2
; Let W = ((MaxHP * 255) / BallFactor) / max(HP / 4, 1). Calculate W.
	ldh [hDivisor], a
	ld b, 4
	call Divide

; If W > 255, store 255 in [hQuotient + 3].
; Let X = min(W, 255) = [hQuotient + 3].
	ldh a, [hQuotient + 2]
	and a
	jr z, .skip3
	ld a, 255
	ldh [hQuotient + 3], a

.skip3
	pop bc ; b = Rand1 - Status

; If Rand1 - Status > CatchRate, the ball fails to capture the Pokémon.
	ld a, [wEnemyMonActualCatchRate]
	cp b
	jr c, .failedToCapture

; If W > 255, the ball captures the Pokémon.
	ldh a, [hQuotient + 2]
	and a
	jp nz, .skipShakeCalculations

	call Random ; Let this random number be called Rand2.

; If Rand2 > X, the ball fails to capture the Pokémon.
	ld b, a
	ldh a, [hQuotient + 3]
	cp b
	jr nc, .skipShakeCalculations

.failedToCapture
	ldh a, [hQuotient + 3]
	ld [wPokeBallCaptureCalcTemp], a ; Save X.

; Calculate CatchRate * 100.
	xor a
	ldh [hMultiplicand], a
	ldh [hMultiplicand + 1], a
	ld a, [wEnemyMonActualCatchRate]
	ldh [hMultiplicand + 2], a
	ld a, 100
	ldh [hMultiplier], a
	call Multiply

; Determine BallFactor2.
; Poké Ball:         BallFactor2 = 255
; Great Ball:        BallFactor2 = 200
; Ultra/Safari/Hyper Ball: BallFactor2 = 150
	ld a, [wCurItem]
	ld b, 255
	cp POKE_BALL
	jr z, .skip4
	ld b, 200
	cp GREAT_BALL
	jr z, .skip4
	ld b, 150
	cp ULTRA_BALL
	jr z, .skip4

.skip4
; Let Y = (CatchRate * 100) / BallFactor2. Calculate Y.
	ld a, b
	ldh [hDivisor], a
	ld b, 4
	call Divide

; If Y > 255, there are 3 shakes.
; Note that this shouldn't be possible.
; The maximum value of Y is (255 * 100) / 150 = 170.
	ldh a, [hQuotient + 2]
	and a
	ld b, $63 ; 3 shakes
	jr nz, .setAnimData

; Calculate X * Y.
	ld a, [wPokeBallCaptureCalcTemp]
	ldh [hMultiplier], a
	call Multiply

; Calculate (X * Y) / 255.
	ld a, 255
	ldh [hDivisor], a
	ld b, 4
	call Divide

; Determine Status2.
; no status ailment:     Status2 = 0
; Burn/Paralysis/Poison: Status2 = 5
; Freeze/Sleep:          Status2 = 10
	ld a, [wEnemyMonStatus]
	and a
	jr z, .skip5
	and (1 << FRZ) | SLP_MASK
	ld b, 5
	jr z, .addAilmentValue
	ld b, 10

.addAilmentValue
; If the Pokémon has a status ailment, add Status2.
	ldh a, [hQuotient + 3]
	add b
	ldh [hQuotient + 3], a

.skip5
; Finally determine the number of shakes.
; Let Z = ((X * Y) / 255) + Status2 = [hQuotient + 3].
; The number of shakes depend on the range Z is in.
; 0  ≤ Z < 10: 0 shakes (the ball misses)
; 10 ≤ Z < 30: 1 shake
; 30 ≤ Z < 70: 2 shakes
; 70 ≤ Z:      3 shakes
	ldh a, [hQuotient + 3]
	cp 10
	ld b, $20
	jr c, .setAnimData
	cp 30
	ld b, $61
	jr c, .setAnimData
	cp 70
	ld b, $62
	jr c, .setAnimData
	ld b, $63

.setAnimData
	ld a, b
	ld [wPokeBallAnimData], a

.skipShakeCalculations
	ld c, 20
	rst _DelayFrames

	; Do the animation.
	call MapBallToAnimation ; PureRGBnote: CHANGED: choose which toss animation to use before entering animation code
	call ItemEffectsDoMoveAnimation

; Determine the message to display from the animation.
	ld a, [wPokeBallAnimData]
	cp $10
	ld hl, ItemUseBallText00
	jp z, .printMessage
	cp $20
	ld hl, ItemUseBallText01
	jp z, .printMessage
	cp $61
	ld hl, ItemUseBallText02
	jp z, .printMessage
	cp $62
	ld hl, ItemUseBallText03
	jp z, .printMessage
	cp $63
	ld hl, ItemUseBallText04
	jp z, .printMessage

; Save current HP.
	ld hl, wEnemyMonHP
	ld a, [hli]
	push af
	ld a, [hli]
	push af

; Save status ailment.
	inc hl
	ld a, [hl]
	push af

	push hl

; Bug: If the Pokémon is transformed, the Pokémon is assumed to be a Ditto.
; This is a bug because a wild Pokémon could have used Transform via
; Mirror Move even though the only wild Pokémon that knows Transform is Ditto.
	ld hl, wEnemyBattleStatus3
	bit TRANSFORMED, [hl]
	jr z, .notTransformed
	ld a, DITTO
	ld [wEnemyMonSpecies2], a
	jr .skip6

.notTransformed
; If the Pokémon is not transformed, set the transformed bit and copy the
; DVs to wTransformedEnemyMonOriginalDVs so that LoadEnemyMonData won't generate
; new DVs.
	set TRANSFORMED, [hl]
	ld hl, wTransformedEnemyMonOriginalDVs
	ld a, [wEnemyMonDVs]
	ld [hli], a
	ld a, [wEnemyMonDVs + 1]
	ld [hl], a

.skip6
	ld a, [wCurPartySpecies]
	push af
	ld a, [wEnemyMonSpecies2]
	ld [wCurPartySpecies], a
	ld a, [wEnemyMonLevel]
	ld [wCurEnemyLevel], a
	callfar LoadEnemyMonData
	pop af
	ld [wCurPartySpecies], a
	pop hl
	pop af
	ld [hld], a
	dec hl
	pop af
	ld [hld], a
	pop af
	ld [hl], a
	ld a, [wEnemyMonSpecies]
	ld [wCapturedMonSpecies], a
	ld [wCurPartySpecies], a
	ld [wPokedexNum], a
	ld a, [wBattleType]
	dec a ; is this the old man battle?
	jp z, .oldManCaughtMon ; if so, don't give the player the caught Pokémon

	ld hl, ItemUseBallText05
	rst _PrintText

; Add the caught Pokémon to the Pokédex.
	predef IndexToPokedex
	ld a, [wPokedexNum]
;;;;;;;;;; PureRGBnote: ADDED: need specific behaviour when catching missingno since it has no pokedex data
	and a ; is it missingno?
	jr z, .skipShowingPokedexData ; don't mark in pokedex if so
	dec a ; pokedex is shifted by 1 because missingno is first
;;;;;;;;;;
	ld c, a
	ld b, FLAG_TEST
	ld hl, wPokedexOwned
	predef FlagActionPredef
	ld a, c
	push af
	ld a, [wPokedexNum]
	dec a
	ld c, a
	ld b, FLAG_SET
	predef FlagActionPredef
	pop af

	and a ; was the Pokémon already in the Pokédex?
	jr nz, .skipShowingPokedexData ; if so, don't show the Pokédex data

	ld hl, ItemUseBallText06
	rst _PrintText
;;;;;; PureRGBnote: FIXED: have to wait a couple of frames to ensure the next sound actually plays for pokemon with short names
	call WaitForSoundToFinish
	ld hl, ItemUseBallText06Sound
	call TextCommandProcessor
;;;;;;
	call ClearSprites
	ld a, [wEnemyMonSpecies]
	ld [wPokedexNum], a
	predef ShowPokedexData

.skipShowingPokedexData
	ld a, [wPartyCount]
	cp PARTY_LENGTH ; is party full?
	jr z, .sendToBox
;;;;;;;;;; PureRGBnote: ADDED: when in bills garden, if a pikachu is caught, skip nicknaming automatically.
	ld a, [wCurMap]
	cp BILLS_GARDEN
	ld a, 0 ; PLAYER_PARTY_DATA
	jr nz, .notBillsGarden
	ld a, [wEnemyMonSpecies]
	cp PIKACHU
	ld a, 0
	jr nz, .notBillsGarden
	ld a, %10000000 ; PLAYER_PARTY_DATA but will skip nicknaming
.notBillsGarden
	push af
;;;;;;;;;;
	ld [wMonDataLocation], a
	call ClearSprites
	call AddPartyMon
;;;;;;;;;; PureRGBnote: ADDED: when in bills garden, if a pikachu is caught, force it to have the nickname PIKABLU
	pop af
	and a
	jr z, .done
	callfar PikabluNicknameLoadQuick
	call GetReceivedMonPointer
	ld hl, wNameBuffer 
	ld bc, NAME_LENGTH
	rst _CopyData
;;;;;;;;;;
	jr .done
.sendToBox
	call ClearSprites
	call SendNewMonToBox
	ld hl, ItemUseBallText07
	CheckEvent EVENT_MET_BILL
	jr nz, .printTransferredToPCText
	ld hl, ItemUseBallText08
.printTransferredToPCText
	rst _PrintText
	call PrintRemainingBoxSpacePrompt ; PureRGBnote: ADDED: 
	jr .done

.oldManCaughtMon
	ld hl, ItemUseBallText05

.printMessage
	rst _PrintText
	call ClearSprites

.done
	ld a, [wBattleType]
	and a ; is this the old man battle?
	ret nz ; if so, don't remove a ball from the bag

; Remove a ball from the bag.
	ld hl, wNumBagItems
	inc a
	ld [wItemQuantity], a
	jp RemoveItemFromInventory

ItemUseBallText00:
;"It dodged the thrown ball!"
;"This pokemon can't be caught"
	text_far _ItemUseBallText00
	text_end
ItemUseBallText01:
;"You missed the pokemon!"
	text_far _ItemUseBallText01
	text_end
ItemUseBallText02:
;"Darn! The pokemon broke free!"
	text_far _ItemUseBallText02
	text_end
ItemUseBallText03:
;"Aww! It appeared to be caught!"
	text_far _ItemUseBallText03
	text_end
ItemUseBallText04:
;"Shoot! It was so close too!"
	text_far _ItemUseBallText04
	text_end
ItemUseBallText05:
;"All right! {MonName} was caught!"
;play sound
	text_far _ItemUseBallText05
	sound_caught_mon
	text_promptbutton
	text_end
ItemUseBallText07:
;"X was transferred to Bill's PC"
	text_far _ItemUseBallText07
	text_end
ItemUseBallText08:
;"X was transferred to someone's PC"
	text_far _ItemUseBallText08
	text_end

NoBoxSlotsLeftText:
;"0 slots left in Box X! Time to change boxes!"
	text_far _NoBoxSlotsLeftText
	text_end

BoxSlotsLeftText:
;"X slots left in box X"
	text_far _BoxSlotsLeftText
	text_end


ItemUseBallText06:
;"New DEX data will be added..."
	text_far _ItemUseBallText06
	text_end
;play sound
ItemUseBallText06Sound:	
	sound_dex_page_added
	text_promptbutton
	text_end

;;;;;;;;;; PureRGBnote: ADDED: maps item ID to which pokeball toss animation will be used.
MapBallToAnimation: 
	ld a, [wCurItem]
	ld hl, BallAnimationMap - 1
	ld c, a
	ld b, 0
	add hl, bc 
	ld a, [hl]
	ld [wAnimationID], a
	ld [wUnusedC000], a ; identifies to a couple places that we're doing a ball toss animation (and which)
	ret

BallAnimationMap: ; this uses item indices, if item indices change then this won't work
	db MASTERTOSS_ANIM
	db ULTRATOSS_ANIM
	db GREATTOSS_ANIM
	db TOSS_ANIM
	db HYPERTOSS_ANIM
	db 0
	db 0
	db SAFARITOSS_ANIM
;;;;;;;;;;

ItemUseTownMap:
	ld a, [wIsInBattle]
	and a
	jp nz, ItemUseNotTime
	farjp DisplayTownMap

;;;;;;;;;; PureRGBnote: ADDED: functions that enable the booster chip item. Makes all pokemon gain boosted EXP when turned on.
ItemUseBoosterChip:
	ld a, [wIsInBattle]
	and a
	jp nz, ItemUseNotTime
	SetEvent EVENT_BOOSTER_CHIP_ACTIVE
	ld a, SFX_SWITCH
	call PlaySoundWaitForCurrent
	ld hl, BoosterChipInstalledText
	rst _PrintText
	ld a, BOOSTER_CHIP
	ldh [hItemToRemoveID], a
	farjp RemoveItemByID

BoosterChipInstalledText::
	text_far _BoosterChipInstalledText
	sound_get_item_1
	text_promptbutton
	text_end
;;;;;;;;;;

ItemUseBicycle:
	ld a, [wIsInBattle]
	and a
	jp nz, ItemUseNotTime
	ld a, [wWalkBikeSurfState]
	ld [wWalkBikeSurfStateCopy], a
	cp 2 ; is the player surfing?
	jp z, ItemUseNotTime
	dec a ; is player already bicycling?
	jr nz, .tryToGetOnBike
.getOffBike
	call ItemUseReloadOverworldData
	xor a
	ld [wWalkBikeSurfState], a ; change player state to walking
;;;;;;;;;; PureRGBnote: ADDED: bike music can be turned off via the options.
	ld a, [wOptions2]
	bit BIT_BIKE_MUSIC, a
	call z, .playDefaultMusic ; play walking music
;;;;;;;;;;
;;;;;;;;;; PureRGBnote: CHANGED: the text telling you "got on bike" and "got off bike" each only display once per playthrough to be less annoying
	CheckEvent EVENT_SAW_GOT_OFF_BIKE_TEXT 
	jr nz, .noTextGetOff
	SetEvent EVENT_SAW_GOT_OFF_BIKE_TEXT
	ld hl, GotOffBicycleText ; this text only displays once to be less annoying
;;;;;;;;;;
	rst _PrintText
.noTextGetOff
	ld a, [wOptions2]
	bit BIT_BIKE_MUSIC, a
	jr nz, .playGetOffBikeSound
	ret
.tryToGetOnBike
	call IsBikeRidingAllowed
	jp nc, NoCyclingAllowedHere
	call ItemUseReloadOverworldData
	xor a ; no keys pressed
	ldh [hJoyHeld], a ; current joypad state
	inc a
	ld [wWalkBikeSurfState], a ; change player state to bicycling
;;;;;;;;;; PureRGBnote: ADDED: bike music can be turned off via the options.
	ld a, [wOptions2]
	bit BIT_BIKE_MUSIC, a
	call z, .playDefaultMusic ; play bike riding music
;;;;;;;;;;
;;;;;;;;;; PureRGBnote: CHANGED: the text telling you "got on bike" and "got off bike" each only display once per playthrough to be less annoying
	CheckEvent EVENT_SAW_GOT_ON_BIKE_TEXT
	jr nz, .noTextGetOn 
	SetEvent EVENT_SAW_GOT_ON_BIKE_TEXT
	ld hl, GotOnBicycleText ; this text only displays once to be less annoying
;;;;;;;;;;
	rst _PrintText
.noTextGetOn
	ld a, [wOptions2]
	bit BIT_BIKE_MUSIC, a
	jr nz, .playGetOnBikeSound
	ret
.playDefaultMusic
	ld a, [wCurMapConnections]
	bit BIT_EXTRA_MUSIC_MAP, a
	jp z, PlayDefaultMusic
	ld d, 1
	jpfar TryPlayExtraMusic
;;;;;;;;;; PureRGBnote: ADDED: small sound effects for getting on/off bike
.playGetOnBikeSound
	ld a, SFX_PRESS_AB
	rst _PlaySound
	ld a, [wAudioROMBank]
	cp BANK(SFX_Get_On_Bike_1_Ch5)
	ld de, SFX_Get_On_Bike_1_Ch5
	jr z, .overwrite5
	ld de, SFX_Get_On_Bike_3_Ch5
	jr .overwrite5
.playGetOffBikeSound
	ld a, SFX_TELEPORT_ENTER_2
	rst _PlaySound
	ld a, [wAudioROMBank]
	cp BANK(SFX_Get_Off_Bike_1_Ch8)
	ld de, SFX_Get_Off_Bike_1_Ch8
	jr z, .overwrite8
	ld de, SFX_Get_Off_Bike_3_Ch8
.overwrite8
	ld hl, wChannelCommandPointers + CHAN8 * 2
.overwrite
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ret
.overwrite5
	ld hl, wChannelCommandPointers + CHAN5 * 2
	jr .overwrite
;;;;;;;;;;

; indirectly used by SURF in StartMenu_Pokemon.surf
ItemUseSurfboard:
	ld a, [wWalkBikeSurfState]
	ld [wWalkBikeSurfStateCopy], a
	cp SURFING ; is the player already surfing?
	jr z, .alreadySurfing ; don't do anything if so ; PureRGBnote: CHANGED: can't use surf to "get back on land", this feature is bugged anyway
	;jr z, .tryToStopSurfing
.tryToSurf
	call IsNextTileShoreOrWater
	jp c, SurfingAttemptFailed
	ld hl, TilePairCollisionsWater
	call CheckForTilePairCollisions
	jp c, SurfingAttemptFailed
.surf
;;;;; PureRGBnote: ADDED: only certain pokemon can surf on lava.
	ld a, [wCurMapTileset]
	cp VOLCANO
	jr nz, .notVolcano
	 ; only certain pokemon can surf on lava
	ld a, [wBattleMonSpecies2]
	cp RHYDON
	jr z, .notVolcano
	cp HARDENED_ONIX
	jr z, .notVolcano
	ld hl, LavaSurfText
	jp ItemUseFailed
.notVolcano
;;;;;
	call .makePlayerMoveForward
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld a, 2
	ld [wWalkBikeSurfState], a ; change player state to surfing
	ld a, [wCurMapTileset]
	cp VOLCANO
	call nz, PlayDefaultMusic ; play surfing music (but not in volcano)
;;;;;;;;;; PureRGBnote: ADDED: flag to indicate we are in the "able to surf" state (needed for autosurf functionality)
	ld hl, wStatusFlags1
	set BIT_AUTOSURF, [hl]
;;;;;;;;;;
	ld hl, SurfingGotOnText
	jp PrintText
.alreadySurfing
	ld hl, AlreadySurfingText
	jp PrintText
; uses a simulated button press to make the player move forward
.makePlayerMoveForward
	ld a, [wPlayerDirection] ; direction the player is going
	bit PLAYER_DIR_BIT_UP, a
	ld b, D_UP
	jr nz, .storeSimulatedButtonPress
	bit PLAYER_DIR_BIT_DOWN, a
	ld b, D_DOWN
	jr nz, .storeSimulatedButtonPress
	bit PLAYER_DIR_BIT_LEFT, a
	ld b, D_LEFT
	jr nz, .storeSimulatedButtonPress
	ld b, D_RIGHT
.storeSimulatedButtonPress
	ld a, b
	ld [wSimulatedJoypadStatesEnd], a
	ld a, 1
	ld [wSimulatedJoypadStatesIndex], a
	ret

SurfingGotOnText:
	text_far _SurfingGotOnText
	text_end

AlreadySurfingText:
	text_far _AlreadySurfingText
	text_end

LavaSurfText:
	text_far _LavaSurfingText
	text_end

ItemUsePokedex:
	predef_jump ShowPokedexMenu

ItemUseEvoStone:
	ld a, [wIsInBattle]
	and a
	jp nz, ItemUseNotTime
	ld a, [wWhichPokemon]
	push af
	ld a, [wCurItem]
	ld [wEvoStoneItemID], a
	push af
	ld a, EVO_STONE_PARTY_MENU
	ld [wPartyMenuTypeOrMessageID], a
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	call DisplayPartyMenu
	pop bc
	jr c, .canceledItemUse
	ld a, b
	ld [wCurPartySpecies], a
	ld a, TRUE
	ld [wForceEvolution], a
	ld a, SFX_HEAL_AILMENT
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	callfar TryEvolvingMon ; try to evolve pokemon
	ld a, [wEvolutionOccurred]
	and a
	jr z, .noEffect
	pop af
	ld [wWhichPokemon], a
	ld hl, wNumBagItems
	ld a, 1 ; remove 1 stone
	ld [wItemQuantity], a
	jp RemoveItemFromInventory
.noEffect
	call ItemUseNoEffect
.canceledItemUse
	xor a
	ld [wActionResultOrTookBattleTurn], a ; item not used
	pop af
	ret

ItemUseApexChip: ; PureRGBnote: ADDED: code for item that maximizes DVs of a pokemon.
	ld a, [wIsInBattle]
	and a
	jp nz, ItemUseNotTime
	jp ItemUseMedicine

ItemUseVitamin:
	ld a, [wIsInBattle]
	and a
	jp nz, ItemUseNotTime

ItemUseMedicine:
	ld a, [wPartyCount]
	and a
	jp z, .emptyParty
	ld a, [wWhichPokemon]
	push af
	ld a, [wCurItem]
	push af
	ld a, USE_ITEM_PARTY_MENU
	ld [wPartyMenuTypeOrMessageID], a
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	ld a, [wPseudoItemID]
	and a ; using Softboiled?
	jr z, .notUsingSoftboiled
; if using softboiled
	call GoBackToPartyMenu
	jr .getPartyMonDataAddress
.emptyParty
	ld hl, .emptyPartyText
	xor a
	ld [wActionResultOrTookBattleTurn], a ; item use failed
	jp PrintText
.emptyPartyText
	text "You don't have"
	line "any #MON!"
	prompt
.notUsingSoftboiled
	call DisplayPartyMenu
.getPartyMonDataAddress
	jp c, .canceledItemUse
	ld hl, wPartyMons
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wWhichPokemon]
	call AddNTimes
	ld a, [wWhichPokemon]
	ld [wUsedItemOnWhichPokemon], a
	ld d, a
	ld a, [wCurPartySpecies]
	ld e, a
	ld [wCurSpecies], a
	pop af
	ld [wCurItem], a
	pop af
	ld [wWhichPokemon], a
	ld a, [wPseudoItemID]
	and a ; using Softboiled?
	jr z, .checkItemType
; if using softboiled
	ld a, [wWhichPokemon]
	cp d ; is the pokemon trying to use softboiled on itself?
	jr z, ItemUseMedicine ; if so, force another choice
.checkItemType
	ld a, [wCurItem]
	cp REVIVE
	jp nc, .healHP ; if it's a Revive or Max Revive
	cp FULL_HEAL
	jr z, .cureStatusAilment ; if it's a Full Heal
	cp HP_UP
	jp nc, .useVitamin ; if it's a vitamin or Rare Candy
	cp FULL_RESTORE
	jr nc, .healHP ; if it's a Full Restore or one of the potions
; fall through if it's one of the status-specific healing items
.cureStatusAilment
	ld bc, wPartyMon1Status - wPartyMon1
	add hl, bc ; hl now points to status
	ld a, [wCurItem]
	lb bc, ANTIDOTE_MSG, 1 << PSN
	cp ANTIDOTE
	jr z, .checkMonStatus
	lb bc, BURN_HEAL_MSG, 1 << BRN
	cp BURN_HEAL
	jr z, .checkMonStatus
	lb bc, ICE_HEAL_MSG, 1 << FRZ
	cp ICE_HEAL
	jr z, .checkMonStatus
	lb bc, AWAKENING_MSG, SLP_MASK
	cp AWAKENING
	jr z, .checkMonStatus
	lb bc, PARALYZ_HEAL_MSG, 1 << PAR
	cp PARLYZ_HEAL
	jr z, .checkMonStatus
	lb bc, FULL_HEAL_MSG, $ff ; Full Heal
.checkMonStatus
	ld a, [hl] ; pokemon's status
	and c ; does the pokemon have a status ailment the item can cure?
	jp z, .healingItemNoEffect
; if the pokemon has a status the item can heal
	xor a
	ld [hl], a ; remove the status ailment in the party data
	ld a, b
	ld [wPartyMenuTypeOrMessageID], a ; the message to display for the item used
	ld a, [wPlayerMonNumber]
	cp d ; is pokemon the item was used on active in battle?
	call z, ClearParaBurnBattleFlagsOnHeal ; if it is active in battle clear more flags
	jp .doneHealing
.healHP
	inc hl ; hl = address of current HP
	ld a, [hli]
	ld b, a
	ld [wHPBarOldHP+1], a
	ld a, [hl]
	ld c, a
	ld [wHPBarOldHP], a ; current HP stored at wHPBarOldHP (2 bytes, big-endian)
	or b
	jr nz, .notFainted
.fainted
	ld a, [wCurItem]
	cp REVIVE
	jr z, .updateInBattleFaintedData
	cp MAX_REVIVE
	jp nz, .healingItemNoEffect
.updateInBattleFaintedData
	ld a, [wIsInBattle]
	and a
	jr z, .compareCurrentHPToMaxHP
	push hl
	push de
	push bc
	ld a, [wUsedItemOnWhichPokemon]
	ld c, a
	ld hl, wPartyFoughtCurrentEnemyFlags
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	and a
	jr z, .next
	ld a, [wUsedItemOnWhichPokemon]
	ld c, a
	ld hl, wPartyGainExpFlags
	ld b, FLAG_SET
	predef FlagActionPredef
.next
	pop bc
	pop de
	pop hl
	jr .compareCurrentHPToMaxHP
.notFainted
	ld a, [wCurItem]
	cp REVIVE
	jp z, .healingItemNoEffect
	cp MAX_REVIVE
	jp z, .healingItemNoEffect
.compareCurrentHPToMaxHP
	push hl
	push bc
	ld bc, wPartyMon1MaxHP - (wPartyMon1HP + 1)
	add hl, bc ; hl now points to max HP
	pop bc
	ld a, [hli]
	cp b
	jr nz, .skipComparingLSB ; no need to compare the LSB's if the MSB's don't match
	ld a, [hl]
	cp c
.skipComparingLSB
	pop hl
	jr nz, .notFullHP
.fullHP ; if the pokemon's current HP equals its max HP
	ld a, [wCurItem]
	cp FULL_RESTORE
	jp nz, .healingItemNoEffect
	inc hl
	inc hl
	ld a, [hld] ; status ailment
	and a ; does the pokemon have a status ailment?
	jp z, .healingItemNoEffect
	ld a, FULL_HEAL
	ld [wCurItem], a
	dec hl
	dec hl
	dec hl
	jp .cureStatusAilment
.notFullHP ; if the pokemon's current HP doesn't equal its max HP
	xor a
	ld [wLowHealthAlarm], a ;disable low health alarm
	ld [wChannelSoundIDs + CHAN5], a
	push hl
	push de
	ld bc, wPartyMon1MaxHP - (wPartyMon1HP + 1)
	add hl, bc ; hl now points to max HP
	ld a, [hli]
	ld [wHPBarMaxHP+1], a
	ld a, [hl]
	ld [wHPBarMaxHP], a ; max HP stored at wHPBarMaxHP (2 bytes, big-endian)
	ld a, [wPseudoItemID]
	and a ; using Softboiled?
	jp z, .notUsingSoftboiled2
; if using softboiled
	ld hl, wHPBarMaxHP
	ld a, [hli]
	push af
	ld a, [hli]
	push af
	ld a, [hli]
	push af
	ld a, [hl]
	push af
	ld hl, wPartyMon1MaxHP
	ld a, [wWhichPokemon]
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld a, [hli]
	ld [wHPBarMaxHP + 1], a
	ldh [hDividend], a
	ld a, [hl]
	ld [wHPBarMaxHP], a
	ldh [hDividend + 1], a
	ld a, 5
	ldh [hDivisor], a
	ld b, 2 ; number of bytes
	call Divide ; get 1/5 of max HP of pokemon that used Softboiled
	ld bc, (wPartyMon1HP + 1) - (wPartyMon1MaxHP + 1)
	add hl, bc ; hl now points to LSB of current HP of pokemon that used Softboiled
; subtract 1/5 of max HP from current HP of pokemon that used Softboiled
	ldh a, [hQuotient + 3]
	push af
	ld b, a
	ld a, [hl]
	ld [wHPBarOldHP], a
	sub b
	ld [hld], a
	ld [wHPBarNewHP], a
	ldh a, [hQuotient + 2]
	ld b, a
	ld a, [hl]
	ld [wHPBarOldHP+1], a
	sbc b
	ld [hl], a
	ld [wHPBarNewHP+1], a
	hlcoord 4, 1
	ld a, [wWhichPokemon]
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes ; calculate coordinates of HP bar of pokemon that used Softboiled
	ld a, SFX_HEAL_HP
	call PlaySoundWaitForCurrent
	ldh a, [hUILayoutFlags]
	set BIT_PARTY_MENU_HP_BAR, a
	ldh [hUILayoutFlags], a
	ld a, $02
	ld [wHPBarType], a
	predef UpdateHPBar2 ; animate HP bar decrease of pokemon that used Softboiled
	ldh a, [hUILayoutFlags]
	res BIT_PARTY_MENU_HP_BAR, a
	ldh [hUILayoutFlags], a
	pop af
	ld b, a ; store heal amount (1/5 of max HP)
	ld hl, wHPBarOldHP + 1
	pop af
	ld [hld], a
	pop af
	ld [hld], a
	pop af
	ld [hld], a
	pop af
	ld [hl], a
	jr .addHealAmount
.notUsingSoftboiled2
	ld a, [wCurItem]
	cp SODA_POP
	ld b, 60 ; Soda Pop heal amount
	jr z, .addHealAmount
	ld b, 80 ; Lemonade heal amount
	jr nc, .addHealAmount
	cp FRESH_WATER
	ld b, 50 ; Fresh Water heal amount
	jr z, .addHealAmount
	cp SUPER_POTION
	ld b, 200 ; Hyper Potion heal amount
	jr c, .addHealAmount
	ld b, 100 ; Super Potion heal amount ; PureRGBnote: CHANGED: super potion heals 100 now instead of 50
	jr z, .addHealAmount
	ld b, 50 ; Potion heal amount ; PureRGBnote: CHANGED: super potion heals 50 now instead of 20
.addHealAmount
	pop de
	pop hl
	ld a, [hl]
	add b
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [hl]
	ld [wHPBarNewHP+1], a
	jr nc, .noCarry
	inc [hl]
	ld a, [hl]
	ld [wHPBarNewHP + 1], a
.noCarry
	push de
	inc hl
	ld d, h
	ld e, l ; de now points to current HP
	ld hl, (wPartyMon1MaxHP + 1) - (wPartyMon1HP + 1)
	add hl, de ; hl now points to max HP
	ld a, [wCurItem]
	cp REVIVE
	jr z, .setCurrentHPToHalfMaxHP
	ld a, [hld]
	ld b, a
	ld a, [de]
	sub b
	dec de
	ld b, [hl]
	ld a, [de]
	sbc b
	jr nc, .setCurrentHPToMaxHp ; if current HP exceeds max HP after healing
	ld a, [wCurItem]
	cp HYPER_POTION
	jr c, .setCurrentHPToMaxHp ; if using a Full Restore or Max Potion
	cp MAX_REVIVE
	jr z, .setCurrentHPToMaxHp ; if using a Max Revive
	jr .updateInBattleData
.setCurrentHPToHalfMaxHP
	dec hl
	dec de
	ld a, [hli]
	srl a
	ld [de], a
	ld [wHPBarNewHP+1], a
	ld a, [hl]
	rra
	inc de
	ld [de], a
	ld [wHPBarNewHP], a
	dec de
	jr .doneHealingPartyHP
.setCurrentHPToMaxHp
	ld a, [hli]
	ld [de], a
	ld [wHPBarNewHP+1], a
	inc de
	ld a, [hl]
	ld [de], a
	ld [wHPBarNewHP], a
	dec de
.doneHealingPartyHP ; done updating the pokemon's current HP in the party data structure
	ld a, [wCurItem]
	cp FULL_RESTORE
	jr nz, .updateInBattleData
	ld bc, wPartyMon1Status - (wPartyMon1MaxHP + 1)
	add hl, bc
	xor a
	ld [hl], a ; remove the status ailment in the party data
	ld h, d
	ld l, e
	pop de
	ld a, [wPlayerMonNumber]
	cp d ; is pokemon the item was used on active in battle?
	call z, ClearParaBurnBattleFlagsOnHeal ; clear additional flags if so
	jr .updateInBattleData2
.updateInBattleData
	ld h, d
	ld l, e
	pop de
.updateInBattleData2
	ld a, [wPlayerMonNumber]
	cp d ; is pokemon the item was used on active in battle?
	jr nz, .calculateHPBarCoords
; copy party HP to in-battle HP
	ld a, [hli]
	ld [wBattleMonHP], a
	ld a, [hld]
	ld [wBattleMonHP + 1], a
	ld a, [wCurItem]
	cp FULL_RESTORE
	jr nz, .calculateHPBarCoords
	xor a
	ld [wBattleMonStatus], a ; remove the status ailment in the in-battle pokemon data
.calculateHPBarCoords
	hlcoord 4, -1
	ld bc, 2 * SCREEN_WIDTH
	inc d
.calculateHPBarCoordsLoop
	add hl, bc
	dec d
	jr nz, .calculateHPBarCoordsLoop
	jr .doneHealing
.healingItemNoEffect
	call ItemUseNoEffect
	jp .done
.doneHealing
	ld a, [wPseudoItemID]
	and a ; using Softboiled?
	jr nz, .skipRemovingItem ; no item to remove if using Softboiled
	push hl
	call RemoveUsedItem
	pop hl
.skipRemovingItem
	ld a, [wCurItem]
	cp FULL_RESTORE
	jr c, .playStatusAilmentCuringSound
	cp FULL_HEAL
	jr z, .playStatusAilmentCuringSound
	ld a, SFX_HEAL_HP
	call PlaySoundWaitForCurrent
	ldh a, [hUILayoutFlags]
	set BIT_PARTY_MENU_HP_BAR, a
	ldh [hUILayoutFlags], a
	ld a, $02
	ld [wHPBarType], a
	predef UpdateHPBar2 ; animate the HP bar lengthening
	ldh a, [hUILayoutFlags]
	res BIT_PARTY_MENU_HP_BAR, a
	ldh [hUILayoutFlags], a
	ld a, REVIVE_MSG
	ld [wPartyMenuTypeOrMessageID], a
	ld a, [wCurItem]
	cp REVIVE
	jr z, .showHealingItemMessage
	cp MAX_REVIVE
	jr z, .showHealingItemMessage
	ld a, POTION_MSG
	ld [wPartyMenuTypeOrMessageID], a
	jr .showHealingItemMessage
.playStatusAilmentCuringSound
	ld a, SFX_HEAL_AILMENT
	call PlaySoundWaitForCurrent
.showHealingItemMessage
	xor a
	ldh [hAutoBGTransferEnabled], a
	call ClearScreen
	dec a
	ld [wUpdateSpritesEnabled], a
	call RedrawPartyMenu ; redraws the party menu and displays the message
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	ld c, 50
	rst _DelayFrames
	call WaitForTextScrollButtonPress
	jr .done
.canceledItemUse
	xor a
	ld [wActionResultOrTookBattleTurn], a ; item use failed
	pop af
	pop af
.done
	ld a, [wPseudoItemID]
	and a ; using Softboiled?
	ret nz ; if so, return
	call GBPalWhiteOut
	call z, RunDefaultPaletteCommand
	ld a, [wIsInBattle]
	and a
	ret nz
	jp ReloadMapData
.useVitamin
	push hl
	ld a, [hl]
	ld [wCurSpecies], a
	ld [wPokedexNum], a
	ld bc, wPartyMon1Level - wPartyMon1
	add hl, bc ; hl now points to level
	ld a, [hl] ; a = level
	ld [wCurEnemyLevel], a ; store level
	call GetMonHeader
	push de
	ld a, d
	ld hl, wPartyMonNicks
	call GetPartyMonName
	pop de
	pop hl
	ld a, [wCurItem]
	cp RARE_CANDY
	jp z, .useRareCandy
	cp APEX_CHIP
	jp z, .useApexChip ; PureRGBnote: ADDED: specific code for using an apex chip
	push hl
	sub HP_UP
	add a
	ld bc, wPartyMon1HPExp - wPartyMon1
	add hl, bc
	add l
	ld l, a
	jr nc, .noCarry2
	inc h
.noCarry2
	ld a, 34 ; 10 ; PureRGBnote: CHANGED: vitamins are ~3.4 times as effective
	ld b, a
	ld a, [hl] ; a = MSB of stat experience of the appropriate stat
	cp 100 ; is there already at least 25600 (256 * 100) stat experience?
	jr nc, .vitaminNoEffect ; if so, vitamins can't add any more
	add b ; add ; PureRGBnote: CHANGED: now 8704 EXP (256*34) stat experience OLD: 2560 (256 * 10) 
	jr nc, .noCarry3 ; a carry should be impossible here, so this will always jump
	ld a, 255
.noCarry3
	ld [hl], a
	pop hl
	call .recalculateStats
	ld hl, VitaminStats
	ld a, [wCurItem]
	sub HP_UP - 1
	ld c, a
.statNameLoop ; loop to get the address of the name of the stat the vitamin increases
	dec c
	jr z, .gotStatName
.statNameInnerLoop
	ld a, [hli]
	ld b, a
	ld a, $50
	cp b
	jr nz, .statNameInnerLoop
	jr .statNameLoop
.gotStatName
	ld de, wStringBuffer
	ld bc, 10
	rst _CopyData ; copy the stat's name to wStringBuffer
	ld a, SFX_HEAL_AILMENT
	rst _PlaySound
	ld hl, VitaminStatRoseText
	rst _PrintText
	jp RemoveUsedItem
;;;;;;;;;; PureRGBnote: CHANGED: text for rare candy and vitamin "had no effect" differ now, with the vitamin one indicating it can't be raised further via items specifically.
.rareCandyNoEffect
	pop hl
	ld hl, RareCandyNoEffectText
	jr .printNoEffect
.vitaminNoEffect
	pop hl
	ld hl, VitaminNoEffectText
.printNoEffect
;;;;;;;;;;
	rst _PrintText
	jp GBPalWhiteOut
.recalculateStats
	ld bc, wPartyMon1Stats - wPartyMon1
	add hl, bc
	ld d, h
	ld e, l ; de now points to stats
	ld bc, (wPartyMon1Exp + 2) - wPartyMon1Stats
	add hl, bc ; hl now points to LSB of experience
	ld b, 1
	jp CalcStats ; recalculate stats
.useRareCandy
	push hl
	ld bc, wPartyMon1Level - wPartyMon1
	add hl, bc ; hl now points to level
	ld a, [hl] ; a = level
	cp MAX_LEVEL
	jr z, .rareCandyNoEffect ; can't raise level above 100
	inc a
	ld [hl], a ; store incremented level
	ld [wCurEnemyLevel], a
	push hl
	push de
	ld d, a
	callfar CalcExperience ; calculate experience for next level and store it at hExperience
	pop de
	pop hl
	ld bc, wPartyMon1Exp - wPartyMon1Level
	add hl, bc ; hl now points to MSB of experience
; update experience to minimum for new level
	ldh a, [hExperience]
	ld [hli], a
	ldh a, [hExperience + 1]
	ld [hli], a
	ldh a, [hExperience + 2]
	ld [hl], a
	pop hl
	ld a, [wWhichPokemon]
	push af
	ld a, [wCurItem]
	push af
	push de
	push hl
	ld bc, wPartyMon1MaxHP - wPartyMon1
	add hl, bc ; hl now points to MSB of max HP
	ld a, [hli]
	ld b, a
	ld c, [hl]
	pop hl
	push bc
	push hl
	call .recalculateStats
	pop hl
	ld bc, (wPartyMon1MaxHP + 1) - wPartyMon1
	add hl, bc ; hl now points to LSB of max HP
	pop bc
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a ; bc = the amount of max HP gained from leveling up
; add the amount gained to the current HP
	ld de, (wPartyMon1HP + 1) - wPartyMon1MaxHP
	add hl, de ; hl now points to LSB of current HP
	ld a, [hl]
	add c
	ld [hld], a
	ld a, [hl]
	adc b
	ld [hl], a
	ld a, RARE_CANDY_MSG
	ld [wPartyMenuTypeOrMessageID], a
	call RedrawPartyMenu
	pop de
	ld a, d
	ld [wWhichPokemon], a
	ld a, e
	ld [wPokedexNum], a
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	call LoadMonData
	ld d, $01
	callfar PrintStatsBox ; display new stats text box
	call WaitForTextScrollButtonPress ; wait for button press
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	predef LearnMoveFromLevelUp ; learn level up move, if any
	xor a
	ld [wForceEvolution], a
	callfar TryEvolvingMon ; evolve pokemon, if appropriate
	ld a, $01
	ld [wUpdateSpritesEnabled], a
	pop af
	ld [wCurItem], a
	pop af
	ld [wWhichPokemon], a
	jp RemoveUsedItem
;;;;;;;;;; PureRGBnote: ADDED: code for maximizing DVs after using an apex chip and displaying the usage text.
.useApexChip	
	push hl
	ld bc, wPartyMon1DVs - wPartyMon1
	add hl, bc ; hl now points to DVs
	ld a, $FF
	cp [hl] ; is the first byte of their DVs maxed
	jr nz, .setDVs
	inc hl
	cp [hl] ; is the second byte of their DVs maxed
	jr z, .alreadyUsedApex ; if so, assume we already used an apex chip on the pokemon
	dec hl
.setDVs
	ld [hli], a ; set first byte of DVs to max
	ld [hl], a  ; set second byte of DVs to max
	pop hl
	push hl
	call .recalculateStats
	pop hl
	ld bc, (wPartyMon1MaxHP) - wPartyMon1
	add hl, bc ; hl now points to MSB of recalculated max HP
	ld a, [hli]
	ld b, a
	ld a, [hld]
	ld c, a
	
	; set current hp to new max hp
	ld de, (wPartyMon1HP) - wPartyMon1MaxHP
	add hl, de ; hl now points to MSB of current HP
	ld a, b
	ld [hli], a
	ld a, c
	ld [hld], a

	ld hl, ApexChipPutOnPokeballText
	rst _PrintText
	ld hl, ApexChipDVsMaxedText
	rst _PrintText
	jp RemoveUsedItem
.alreadyUsedApex
	pop hl
	ld hl, ApexChipAlreadyUsedText
	rst _PrintText
	jp GBPalWhiteOut

ApexChipPutOnPokeballText:
	text_far _ApexChipPutOnPokeballText
	text_end

ApexChipDVsMaxedText:
	text_far _ApexChipDVsMaxedText
	text_end

ApexChipAlreadyUsedText:
	text_far _ApexChipAlreadyUsedText
	text_end
;;;;;;;;;;

VitaminStatRoseText:
	text_far _VitaminStatRoseText
	text_end

VitaminNoEffectText:
	text_far _VitaminNoEffectText
	text_end

RareCandyNoEffectText:
	text_far _RareCandyNoEffectText
	text_end

INCLUDE "data/battle/stat_names.asm"

; for BOULDERBADGE when used from the
; ITEM window, which corresponds to
; SAFARI_BAIT during Safari Game encounters
ItemUseBait:
	ld hl, ThrewBaitText
	rst _PrintText
	ld hl, wEnemyMonActualCatchRate ; catch rate
	srl [hl] ; halve catch rate
	ld a, BAIT_ANIM
	ld hl, wSafariBaitFactor ; bait factor
	ld de, wSafariEscapeFactor ; escape factor
	jr BaitRockCommon

; for CASCADEBADGE when used from the
; ITEM window, which corresponds to
; SAFARI_ROCK during Safari Game encounters
ItemUseRock:
	ld hl, ThrewRockText
	rst _PrintText
	ld hl, wEnemyMonActualCatchRate ; catch rate
	ld a, [hl]
	add a ; double catch rate
	jr nc, .noCarry
	ld a, $ff
.noCarry
	ld [hl], a
	ld a, ROCK_ANIM
	ld hl, wSafariEscapeFactor ; escape factor
	ld de, wSafariBaitFactor ; bait factor

BaitRockCommon:
	ld [wAnimationID], a
	xor a
	ld [wAnimationType], a
	ldh [hWhoseTurn], a
	ld [de], a ; zero escape factor (for bait), zero bait factor (for rock)
.randomLoop ; loop until a random number less than 5 is generated
	call Random
	and 7
	cp 5
	jr nc, .randomLoop
	inc a ; increment the random number, giving a range from 1 to 5 inclusive
	ld b, a
	ld a, [hl]
	add b ; increase bait factor (for bait), increase escape factor (for rock)
	jr nc, .noCarry
	ld a, $ff
.noCarry
	ld [hl], a
	predef MoveAnimation ; do animation
	ld c, 70
	jp DelayFrames

ThrewBaitText:
	text_far _ThrewBaitText
	text_end

ThrewRockText:
	text_far _ThrewRockText
	text_end

;;;;;;;;;; PureRGBnote: CHANGED: this was separated off into a separate function for reusability
IsEscapeRopeUsable:
	ld a, [wIsInBattle]
	and a
	jr nz, .notUsable
	ld a, [wCurMap]
	cp AGATHAS_ROOM
	jr z, .notUsable
	ld a, [wCurMapTileset]
	ld b, a
	ld hl, EscapeRopeTilesets
.loop
	ld a, [hli]
	cp $ff
	jr z, .notUsable
	cp b
	jr nz, .loop
	inc a ; makes a not zero when it reaches here
	ret
.notUsable
	xor a
	ret
;;;;;;;;;;

; indirectly used by DIG in StartMenu_Pokemon.dig
ItemUseEscapeRope:
	call IsEscapeRopeUsable
	jp z, ItemUseNotTime
;;;;;;;;;; PureRGBnote: ADDED: ask before using dig / escape rope to escape the dungeon
	xor a
	ld [wActionResultOrTookBattleTurn], a ; item initialized to not used
	ld hl, .escapeText
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ret nz
;;;;;;;;;;
	ld hl, wStatusFlags6
	set BIT_FLY_WARP, [hl]
	set BIT_ESCAPE_WARP, [hl]
	ld hl, wStatusFlags4
	res BIT_NO_BATTLES, [hl]
	callfar ClearSafariFlags ; PureRGBnote: CHANGED: new function to clear safari flags on warping or flying out of it
	ld a, 1
	ld [wActionResultOrTookBattleTurn], a ; item used
	ld a, [wPseudoItemID]
	and a ; using Dig?
	ret nz ; if so, return
	call ItemUseReloadOverworldData
	ld c, 30
	rst _DelayFrames
	jp RemoveUsedItem
.escapeText
	text_far _EscapeText
	text_far _ToLastPkmnCenterText
	text_end


INCLUDE "data/tilesets/escape_rope_tilesets.asm"

; PureRGBnote: ADDED: code for teleporting via the pocket abra item. Has some unique text including the abra's nickname and sound effects.
ItemUsePocketAbra:
	ld a, [wIsInBattle]
	and a
	jp nz, ItemUseNotTime
;;;;; PureRGBnote: ADDED: can't teleport when lava flood happening
	callfar LavaRoomCheck
	jp z, ItemUseNotTime 
;;;;;
	ld hl, .wantToTeleportText
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr z, .yes
.no
	ld hl, .pocketAbraNo
	rst _PrintText
	ret
.yes
	ld hl, wStatusFlags6
	set BIT_FLY_WARP, [hl]
	set BIT_ESCAPE_WARP, [hl]
	ld hl, wStatusFlags4
	set BIT_UNKNOWN_4_1, [hl]
	res BIT_NO_BATTLES, [hl]
	callfar ClearSafariFlags
	call ItemUseReloadOverworldData
	call Random
	cp 200
	jr nc, .flavor1
	cp 150
	jr nc, .flavor2
	cp 100
	jr nc, .flavor3
	cp 50
	jr nc, .flavor4
	ld hl, .pocketAbraFlavorText5
.done
	rst _PrintText
	call StopMusic
	ld a, ABRA
	jp PlayCry
.flavor1
	ld hl, .pocketAbraFlavorText1
	jr .done
.flavor2
	ld hl, .pocketAbraFlavorText2
	jr .done
.flavor3
	ld hl, .pocketAbraFlavorText3
	jr .done
.flavor4
	ld hl, .pocketAbraFlavorText4
	jr .done
.wantToTeleportText
	text_far _WarpText
	text_far _ToLastPkmnCenterText
	text_end
.pocketAbraNo
	text_far _PocketAbraNo
	text_end
.pocketAbraFlavorText1
	text_far _PocketAbraFlavorText1
	text_end
.pocketAbraFlavorText2
	text_far _PocketAbraFlavorText2
	text_end
.pocketAbraFlavorText3
	text_far _PocketAbraFlavorText3
	text_end
.pocketAbraFlavorText4
	text_far _PocketAbraFlavorText4
	text_end
.pocketAbraFlavorText5
	text_far _PocketAbraFlavorText5
	text_end

ItemUseRepel:
	ld b, 100

ItemUseRepelCommon:
	ld a, [wIsInBattle]
	and a
	jp nz, ItemUseNotTime
	ld a, b
	ld [wRepelRemainingSteps], a
	jp PrintItemUseTextAndRemoveItem

; handles X Accuracy item
ItemUseXAccuracy:
	ld a, [wIsInBattle]
	and a
	jp z, ItemUseInBattle ; PureRGBnote: CHANGED: text that displays when using out of battle indicates it's for use in battle
	ld hl, wPlayerBattleStatus2
	set USING_X_ACCURACY, [hl] ; X Accuracy bit
	jp PrintItemUseTextAndRemoveItem

; This function is bugged and never works. It always jumps to ItemUseNotTime.
; The Card Key is handled in a different way. ; PureRGBnote: CHANGED: remove pointless code
ItemUseCardKey:
	jp ItemUseNotTime

ItemUsePokeDoll:
	ld a, [wIsInBattle]
	dec a
	jp nz, ItemUseOnWildMons ; PureRGBnote: CHANGED: text that indicates to use it on wild pokemon only
	ld a, [wEnemyMonSpecies]
	cp SPIRIT_THE_MAW
	jp z, NoPokeDollsOnSpirits
;;;;;; PureRGBnote: CHANGED: now it has an animation when used in battle
	call LoadScreenTilesFromBuffer1 ; restore saved screen
	call Delay3
	ld hl, ItemUseText00
	rst _PrintText
	ld a, SFX_HEAL_AILMENT
	rst _PlaySound
	call RemoveUsedItem
	call WaitForSoundToFinish
	ld c, 10
	rst _DelayFrames
	ld a, POKE_DOLL_ANIM
	ld [wAnimationID], a
	call ItemEffectsDoMoveAnimation
	ld c, 30
	rst _DelayFrames
	ld a, $01
	ld [wEscapedFromBattle], a
	ret
;;;;;;

ItemUseGuardSpec:
	ld a, [wIsInBattle]
	and a
	jp z, ItemUseInBattle ; PureRGBnote: CHANGED: text that displays when using out of battle indicates it's for use in battle
	ld hl, wPlayerBattleStatus2
	set STAT_DOWN_IMMUNITY, [hl] ; Mist bit
	jp PrintItemUseTextAndRemoveItem

ItemUseSuperRepel:
	ld b, 200
	jp ItemUseRepelCommon

ItemUseMaxRepel:
	ld b, 250
	jp ItemUseRepelCommon

ItemUseDireHit:
	ld a, [wIsInBattle]
	and a
	jp z, ItemUseInBattle ; PureRGBnote: CHANGED: text that displays when using out of battle indicates it's for use in battle
	ld hl, wPlayerBattleStatus2
	set GETTING_PUMPED, [hl] ; Focus Energy bit
	jp PrintItemUseTextAndRemoveItem

ItemUseXStat:
	ld a, [wIsInBattle]
	and a
	jr nz, .inBattle
	call ItemUseInBattle ; PureRGBnote: CHANGED: text that displays when using out of battle indicates it's for use in battle
	ld a, 2
	ld [wActionResultOrTookBattleTurn], a ; item not used
	ret
.inBattle
	ld hl, wPlayerMoveNum
	ld a, [hli]
	push af ; save [wPlayerMoveNum]
	ld a, [hl]
	push af ; save [wPlayerMoveEffect]
	push hl
	ld a, [wCurItem]
	sub X_ATTACK - ATTACK_UP1_EFFECT
	ld [hl], a ; store player move effect
	call PrintItemUseTextAndRemoveItem
	ld a, XSTATITEM_ANIM ; X stat item animation ID
	ld [wPlayerMoveNum], a
	call LoadScreenTilesFromBuffer1 ; restore saved screen
	call Delay3
	xor a
	ldh [hWhoseTurn], a ; set turn to player's turn
	farcall StatModifierUpEffect ; do stat increase move
	pop hl
	pop af
	ld [hld], a ; restore [wPlayerMoveEffect]
	pop af
	ld [hl], a ; restore [wPlayerMoveNum]
	ret

ItemUsePokeFlute:
	ld a, [wIsInBattle]
	and a
	jr nz, .inBattle
; if not in battle
	call ItemUseReloadOverworldData
	ld a, [wCurMap]
	cp ROUTE_12
	jr nz, .notRoute12
	CheckEvent EVENT_BEAT_ROUTE12_SNORLAX
	jr nz, .noSnorlaxToWakeUp
; if the player hasn't beaten Route 12 Snorlax
	ld hl, Route12SnorlaxFluteCoords
	call ArePlayerCoordsInArray
	jr nc, .noSnorlaxToWakeUp
	ld hl, PlayedFluteHadEffectText
	rst _PrintText
	SetEvent EVENT_FIGHT_ROUTE12_SNORLAX
	ret
.notRoute12
	cp ROUTE_16
	jr nz, .noSnorlaxToWakeUp
	CheckEvent EVENT_BEAT_ROUTE16_SNORLAX
	jr nz, .noSnorlaxToWakeUp
; if the player hasn't beaten Route 16 Snorlax
	ld hl, Route16SnorlaxFluteCoords
	call ArePlayerCoordsInArray
	jr nc, .noSnorlaxToWakeUp
	ld hl, PlayedFluteHadEffectText
	rst _PrintText
	SetEvent EVENT_FIGHT_ROUTE16_SNORLAX
	ret
.noSnorlaxToWakeUp
	ld hl, PlayedFluteNoEffectText
	jp PrintText
.inBattle
;;;;;;;;;; PureRGBnote: ADDED: prevents AI from instantly preferring reapplying sleep after having healed it
	ld a, [wBattleMonStatus]
	ld [wAITargetMonStatus], a
;;;;;;;;;;
	xor a
	ld [wWereAnyMonsAsleep], a
	ld b, ~SLP_MASK
	ld hl, wPartyMon1Status
	call WakeUpEntireParty
	ld a, [wIsInBattle]
	dec a ; is it a trainer battle?
	jr z, .skipWakingUpEnemyParty
; if it's a trainer battle
	ld hl, wEnemyMon1Status
	call WakeUpEntireParty
;;;;;;;;;; PureRGBnote: ADDED: prevents AI from instantly preferring reapplying sleep after having healed it
	ld a, 1
	ld [wAIMoveSpamAvoider], a ; load this value so the AI doesn't spam status moves right after you heal them
;;;;;;;;;;
.skipWakingUpEnemyParty
	ld hl, wBattleMonStatus
	ld a, [hl]
	and b ; remove Sleep status
	ld [hl], a
	ld hl, wEnemyMonStatus
	ld a, [hl]

;;;;;;;;;; shinpokerednote: FIXED: There is an oversight here. 
;;;;;;;;;; wWereAnyMonsAsleep can never get set off of a wild pokemon.
;;;;;;;;;; As a result, the wrong message plays when only the wild pokemon is woken up.
;;;;;;;;;; Need to check and set wWereAnyMonsAsleep here in order to fix it.
	push af
	and SLP_MASK ; is pokemon asleep?
	jr z, .notAsleep
	ld a, 1
	ld [wWereAnyMonsAsleep], a ; indicate that a pokemon had to be woken up
.notAsleep
	pop af
;;;;;;;;;;
	and b ; remove Sleep status
	ld [hl], a
	call LoadScreenTilesFromBuffer2 ; restore saved screen
	ld a, [wWereAnyMonsAsleep]
	and a ; were any pokemon asleep before playing the flute?
	ld hl, PlayedFluteNoEffectText
	jp z, PrintText ; if no pokemon were asleep
; if some pokemon were asleep
	ld hl, PlayedFluteHadEffectText
	rst _PrintText
	ld a, [wLowHealthTonePairs]
	bit 7, a ; set if low health alarm sound is currently playing
	jr nz, .skipMusic
	call WaitForSoundToFinish ; wait for sound to end
;;;;;;;;;; PureRGBnote: ADDED: pause music here to make music work better when playing out-of-bank battle music
	ld a, 1
	ld [wMuteAudioAndPauseMusic], a
;;;;;;;;;; 
	farcall Music_PokeFluteInBattle ; play in-battle pokeflute music
.musicWaitLoop ; wait for music to finish playing
	ld a, [wChannelSoundIDs + CHAN7]
	and a ; music off?
	jr nz, .musicWaitLoop
;;;;;;;;;; PureRGBnote: ADDED: resume music here to make music work better when playing out-of-bank battle music
	; a = 0 here
	ld [wMuteAudioAndPauseMusic], a
;;;;;;;;;;
.skipMusic
	ld hl, FluteWokeUpText
	jp PrintText

; wakes up all party pokemon
; INPUT:
; hl must point to status of first pokemon in party (player's or enemy's)
; b must equal ~SLP
; [wWereAnyMonsAsleep] should be initialized to 0
; OUTPUT:
; [wWereAnyMonsAsleep]: set to 1 if any pokemon were asleep
WakeUpEntireParty:
	ld de, 44
	ld c, 6
.loop
	ld a, [hl]
	push af
	and SLP_MASK
	jr z, .notAsleep
	ld a, 1
	ld [wWereAnyMonsAsleep], a ; indicate that a pokemon had to be woken up
.notAsleep
	pop af
	and b ; remove Sleep status
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret

Route12SnorlaxFluteCoords:
	dbmapcoord  9, 62 ; one space West of Snorlax
	dbmapcoord 10, 61 ; one space North of Snorlax
	dbmapcoord 10, 63 ; one space South of Snorlax
	dbmapcoord 11, 62 ; one space East of Snorlax
	db -1 ; end

Route16SnorlaxFluteCoords:
	dbmapcoord 27, 10 ; one space East of Snorlax
	dbmapcoord 25, 10 ; one space West of Snorlax
	db -1 ; end

PlayedFluteNoEffectText:
	text_far _PlayedFluteNoEffectText
	text_end

FluteWokeUpText:
	text_far _FluteWokeUpText
	text_end

PlayedFluteHadEffectText:
	text_far _PlayedFluteHadEffectText
	text_promptbutton
	text_asm
	ld a, [wIsInBattle]
	and a
	jr nz, .done
; play out-of-battle pokeflute music
	call StopAllMusic
	ld a, SFX_POKEFLUTE
	ld c, BANK(SFX_Pokeflute)
	call PlayMusic
.musicWaitLoop ; wait for music to finish playing
	ld a, [wChannelSoundIDs + CHAN3]
	cp SFX_POKEFLUTE
	jr z, .musicWaitLoop
.done
	rst TextScriptEnd ; end text

ItemUseCoinCase:
	ld a, [wIsInBattle]
	and a
	jp nz, ItemUseNotTime
	ld hl, CoinCaseNumCoinsText
	jp PrintText

CoinCaseNumCoinsText:
	text_far _CoinCaseNumCoinsText
	text_end

; PureRGBnote: CHANGED: now has 50% chance of landing goldeen and 50% chance of landing magikarp.
ItemUseOldRod: 
	call FishingInit
	jp c, ItemUseNotTime
	call Random
	and 1
	jr z, .goldeen
	lb bc, 10, MAGIKARP
	jr .done
.goldeen
	lb bc, 10, GOLDEEN
.done
	ld a, $1 ; set bite
	jp RodResponse

; PureRGBnote: CHANGED: now lands a different set of pokemon depending if you're fishing in a lake/pond/river or the ocean.
ItemUseGoodRod: 
	call FishingInit
	jp c, ItemUseNotTime
	call Random
	and %11
	jp z, RodResponse ;25% chance of no bite
	; choose which good rod pokemon table
	ld a, [wCurMap]
	ld c, a
	call IsMapOceanMap
	jr c, .ocean
	ld hl, GoodRodMons
	jr .gotMons
.ocean
	ld hl, GoodRodMonsOcean	
.gotMons
	; now choose which pokemon in the table
	call Random
	and %11
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	inc hl
	ld c, [hl]
	and a
	ld a, 1
	jr RodResponse

INCLUDE "data/wild/good_rod.asm"
INCLUDE "data/maps/ocean_maps.asm"

; PureRGBnote: ADDED: super rod can land alternate palette pokemon depending on where you fish.
ItemUseSuperRod:
	call FishingInit
	jp c, ItemUseNotTime
	call ReadSuperRodData
	ld a, e
RodResponse:
	ld [wRodResponse], a

	dec a ; is there a bite?
	jr nz, .next
	; if yes, store level and species data
	ld a, 1
	ld [wMoveMissed], a
	ld a, b ; level
	ld [wCurEnemyLevel], a
	ld a, c ; species
	ld [wCurOpponent], a
	; store fishing item index so we can reload it next time we open the item menu outside battle
	ld a, [wBagSavedMenuItem]
	ld [wSavedFishingItem], a
	ld a, [wListScrollOffset]
	ld [wSavedFishingItemOffset], a
	ld a, 2
	ld [wExtraSavedStartMenuIndex], a ; ITEM menu saved index saved for use after battle

.next
	ld hl, wWalkBikeSurfState
	ld a, [hl] ; store the value in a
	push af
	push hl
	ld [hl], 0
	farcall FishingAnim
	pop hl
	pop af
	ld [hl], a
	ret

; checks if fishing is possible and if so, runs initialization code common to all rods
; unsets carry if fishing is possible, sets carry if not
FishingInit:
	ld a, [wCurMapTileset]
	cp VOLCANO
	jr z, .cantFish ; no volcano fishing
	ld a, [wIsInBattle]
	and a
	jr z, .notInBattle
.cantFish
	scf ; can't fish during battle
	ret
.notInBattle
	call IsNextTileShoreOrWater
	ret c
	ld a, [wWalkBikeSurfState]
	cp 2 ; Surfing?
	jr z, .surfing
	call ItemUseReloadOverworldData
	ld hl, ItemUseText00
	rst _PrintText
	ld a, SFX_HEAL_AILMENT
	rst _PlaySound
	ld c, 20 ; PureRGBnote: CHANGED: reduce the artificial delay on initiating fishing.
	rst _DelayFrames
	and a
	ret
.surfing
	scf ; can't fish when surfing
	ret

ItemNotYours:
	jp ItemUseNotYoursToUse

; PureRGBnote: CHANGED: ADDED: itemfinder will make you face in the direction of the item it detected. 
ItemUseItemfinder:
	ld a, [wIsInBattle]
	and a
	jp nz, ItemUseNotTime
	call ItemUseReloadOverworldData
	farcall HiddenItemNear ; check for hidden items
	ld hl, ItemfinderFoundNothingText
	jr nc, .printText ; if no hidden items
	call Delay3
	ld c, 4
	ld a, [wItemFinderItemDirection]
	and a ; a = 0 means we're on top of the item
	jr z, .loop2
.loop
	; default audio effect for itemfinder
	ld a, SFX_HEALING_MACHINE
	call PlaySoundWaitForCurrent
	ld a, SFX_PURCHASE
	call PlaySoundWaitForCurrent
	dec c
	jr nz, .loop
	jr .doneLoop
.loop2
	; audio effect if right on top of the hidden item
	ld a, SFX_PURCHASE
	call PlaySoundWaitForCurrent
	dec c
	jr nz, .loop2
.doneLoop
	; say itemfinder found an item if we haven't seen this text yet
	ld hl, wNewInGameFlags
	bit 2, [hl]
	set 2, [hl]
	jr nz, .doDirectionFacing ; already have seen the text since restarting the cartridge
	ld hl, ItemfinderFoundItemText
	rst _PrintText
.doDirectionFacing
	ld a, [wItemFinderItemDirection]
	and a ; a = 0 means we're on top of the item
	jr z, .onTopOfItem2
	; if we're not on top of the item, face the best direction to indicate where it is
	ld [wPlayerMovingDirection], a
	ld a, SFX_ARROW_TILES
	call PlaySoundWaitForCurrent
	xor a
	ld [wEmotionBubbleSpriteIndex], a
	ld a, QUESTION_BUBBLE
  	ld [wWhichEmotionBubble], a
	predef_jump EmotionBubbleQuick
.onTopOfItem2
	; if we're on top of the item, show an exclamation bubble
	ld a, SFX_SWAP
	call PlaySoundWaitForCurrent
	ld a, EXCLAMATION_BUBBLE
  	ld [wWhichEmotionBubble], a
	xor a
	ld [wEmotionBubbleSpriteIndex], a
	predef_jump EmotionBubble
.printText
	rst _PrintText
	ret

ItemfinderFoundItemText:
	text_far _ItemfinderFoundItemText
	text_end

ItemfinderFoundNothingText:
	text_far _ItemfinderFoundNothingText
	text_end

ItemUsePPUp:
	ld a, [wIsInBattle]
	and a
	jp nz, ItemUseNotTime

ItemUsePPRestore:
	ld a, [wWhichPokemon]
	push af
	ld a, [wCurItem]
	ld [wPPRestoreItem], a
.chooseMon
	xor a
	ld [wUpdateSpritesEnabled], a
	ld a, USE_ITEM_PARTY_MENU
	ld [wPartyMenuTypeOrMessageID], a
	call DisplayPartyMenu
	jp c, .itemNotUsed
.chooseMove
	ld a, [wPPRestoreItem]
	cp ELIXER
	jp nc, .useElixir ; if Elixir or Max Elixir
	ld a, $02
	ld [wMoveMenuType], a
	ld hl, RaisePPWhichTechniqueText
	ld a, [wPPRestoreItem]
	cp ETHER ; is it a PP Up?
	jr c, .printWhichTechniqueMessage ; if so, print the raise PP message
	ld hl, RestorePPWhichTechniqueText ; otherwise, print the restore PP message
.printWhichTechniqueMessage
	rst _PrintText
	xor a
	ld [wPlayerMoveListIndex], a
	callfar MoveSelectionMenu ; move selection menu
	ld a, 0
	ld [wPlayerMoveListIndex], a
	jr nz, .chooseMon
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2 - wPartyMon1
	call GetSelectedMoveOffset
	push hl
	ld a, [hl]
	ld [wNamedObjectIndex], a
	call GetMoveName
	call CopyToStringBuffer
	pop hl
	ld a, [wPPRestoreItem]
	cp ETHER
	jr nc, .useEther ; if Ether or Max Ether
.usePPUp
	ld bc, wPartyMon1PP - wPartyMon1Moves
	add hl, bc
	ld a, [hl] ; move PP
	cp 3 << 6 ; have 3 PP Ups already been used?
	jr c, .PPNotMaxedOut
	ld hl, PPMaxedOutText
	rst _PrintText
	jr .chooseMove
.PPNotMaxedOut
	ld a, [hl]
	add 3 << 6 ; increase PP Up count by 3 (maximizes PP) ; PureRGBnote: CHANGED: PP up maximizes PP on a move in one usage
	ld [hl], a
	ld a, 1 ; 1 PP Up used
	ld [wUsingPPUp], a
	call RestoreBonusPP ; add the bonus PP to current PP
	ld hl, PPIncreasedText
	rst _PrintText
.done
	pop af
	ld [wWhichPokemon], a
	call GBPalWhiteOut
	call RunDefaultPaletteCommand
	jp RemoveUsedItem
.afterRestoringPP ; after using a (Max) Ether/Elixir
	ld a, [wWhichPokemon]
	ld b, a
	ld a, [wPlayerMonNumber]
	cp b ; is the pokemon whose PP was restored active in battle?
	jr nz, .skipUpdatingInBattleData
	ld hl, wPartyMon1PP
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld de, wBattleMonPP
	ld bc, 4
	rst _CopyData ; copy party data to in-battle data
.skipUpdatingInBattleData
	ld a, SFX_HEAL_AILMENT
	rst _PlaySound
	ld hl, PPRestoredText
	rst _PrintText
	jr .done
.useEther
	call .restorePP
	jr nz, .afterRestoringPP
	jp .noEffect
; unsets zero flag if PP was restored, sets zero flag if not
; however, this is bugged for Max Ethers and Max Elixirs (see below)
.restorePP
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	call GetMaxPP
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2 - wPartyMon1
	call GetSelectedMoveOffset
	ld bc, wPartyMon1PP - wPartyMon1Moves
	add hl, bc ; hl now points to move's PP
	ld a, [wMaxPP]
	ld b, a
	ld a, [wPPRestoreItem]
	cp MAX_ETHER
	jr z, .fullyRestorePP
	ld a, [hl] ; move PP
	and %00111111 ; lower 6 bit bits store current PP
	cp b ; does current PP equal max PP?
	ret z ; if so, return
	add 10 ; increase current PP by 10
; b holds the max PP amount and b will hold the new PP amount.
; So, if the new amount meets or exceeds the max amount,
; cap the amount to the max amount by leaving b unchanged.
; Otherwise, store the new amount in b.
	cp b ; does the new amount meet or exceed the maximum?
	jr nc, .storeNewAmount
	ld b, a
.storeNewAmount
	ld a, [hl] ; move PP
	and %11000000 ; PP Up counter bits
	add b
	ld [hl], a
	ret
.fullyRestorePP
	ld a, [hl] ; move PP
; Bug: This code doesn't mask out the upper two bits, which are used to count
; how many PP Ups have been used on the move.
; So, Max Ethers and Max Elixirs will not be detected as having no effect on
; a move with full PP if the move has had any PP Ups used on it.
	cp b ; does current PP equal max PP?
	ret z
	jr .storeNewAmount
.useElixir
; decrement the item ID so that ELIXER becomes ETHER and MAX_ELIXER becomes MAX_ETHER
	ld hl, wPPRestoreItem
	dec [hl]
	dec [hl]
	xor a
	ld hl, wCurrentMenuItem
	ld [hli], a
	ld [hl], a ; zero the counter for number of moves that had their PP restored
	ld b, 4
; loop through each move and restore PP
.elixirLoop
	push bc
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2 - wPartyMon1
	call GetSelectedMoveOffset
	ld a, [hl]
	and a ; does the current slot have a move?
	jr z, .nextMove
	call .restorePP
	jr z, .nextMove
; if some PP was restored
	ld hl, wTileBehindCursor ; counter for number of moves that had their PP restored
	inc [hl]
.nextMove
	ld hl, wCurrentMenuItem
	inc [hl]
	pop bc
	dec b
	jr nz, .elixirLoop
	ld a, [wTileBehindCursor]
	and a ; did any moves have their PP restored?
	jp nz, .afterRestoringPP
.noEffect
	call ItemUseNoEffect
.itemNotUsed
	call GBPalWhiteOut
	call RunDefaultPaletteCommand
	pop af
	xor a
	ld [wActionResultOrTookBattleTurn], a ; item use failed
	ret

RaisePPWhichTechniqueText:
	text_far _RaisePPWhichTechniqueText
	text_end

RestorePPWhichTechniqueText:
	text_far _RestorePPWhichTechniqueText
	text_end

PPMaxedOutText:
	text_far _PPMaxedOutText
	text_end

PPIncreasedText:
	text_far _PPIncreasedText
	text_end

PPRestoredText:
	text_far _PPRestoredText
	text_end

; for items that can't be used from the Item menu
UnusableItem:
	jp ItemUseNotTime

; PureRGBnote: ADDED: text for items that should be sold and have no other use
ValuableItem:
	ld hl, ItemUseValuableText
	jp ItemUseFailed

; PureRGBnote: ADDED: text for fossils indicating they may be better deposited into the PC until a use for them is found.
FossilItem:
	ld hl, ItemUseFossilText
	jp ItemUseFailed

ItemUseTMHM:
	ld a, [wIsInBattle]
	and a
	jp nz, ItemUseNotTime
	ld a, [wCurItem]
	sub TM01 ; underflows below 0 for HM items (before TM items)
	push af
	jr nc, .skipAdding
	add NUM_TMS + NUM_HMS ; adjust HM IDs to come after TM IDs
.skipAdding
	inc a
	ld [wTempTMHM], a
	predef TMToMove ; get move ID from TM/HM ID
	ld a, [wTempTMHM]
	ld [wMoveNum], a
	call GetMoveName
	call CopyToStringBuffer
	pop af
	ld hl, BootedUpTMText
;;;;;;;;;; PureRGBnote: ADDED: booting up a TM or HM both have a little sound effect now
	jr nc, .playTMSound
	ld hl, BootedUpHMText
.playHMSound
	push hl
	ld a, SFX_ENTER_PC
	jr .printBootedUpMachineText
.playTMSound
	push hl
	ld a, SFX_59
.printBootedUpMachineText
	call PlaySoundWaitForCurrent ; play a sound for booting up a HM
	call WaitForSoundToFinish
	ld a, SFX_LEDGE
	call PlaySoundWaitForCurrent 
	pop hl
;;;;;;;;;;
	rst _PrintText
	ld hl, TeachMachineMoveText
	rst _PrintText
	hlcoord 14, 7
	lb bc, 8, 15
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID ; yes/no menu
	ld a, [wCurrentMenuItem]
	and a
	jr z, .useMachine
;;;;;;;;;; Vimescarrotnote: FIXED: fixes a rare bug where booting up a TM and then going back can freeze up the game on booting up another
    ld a, ITEM_NAME
    ld [wNameListType], a; if you decide not to use the machine, change the list type back to item list.
;;;;;;;;;;
	ld a, 2
	ld [wActionResultOrTookBattleTurn], a ; item not used
	ret
.useMachine
	ld a, [wWhichPokemon]
	push af
	ld a, [wCurItem]
	push af
.chooseMon
	ld hl, wStringBuffer
	ld de, wTempMoveNameBuffer
	ld bc, 14
	rst _CopyData ; save the move name because DisplayPartyMenu will overwrite it
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	ld a, TMHM_PARTY_MENU
	ld [wPartyMenuTypeOrMessageID], a
	call DisplayPartyMenu
	push af
	ld hl, wTempMoveNameBuffer
	ld de, wStringBuffer
	ld bc, 14
	rst _CopyData
	pop af
	jr nc, .checkIfAbleToLearnMove
; if the player canceled teaching the move
	pop af
	pop af
	call GBPalWhiteOutWithDelay3
	call ClearSprites
	call RunDefaultPaletteCommand
	jp LoadScreenTilesFromBuffer1 ; restore saved screen
.checkIfAbleToLearnMove
	predef CanLearnTM ; check if the pokemon can learn the move
	push bc
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	pop bc
	ld a, c
	and a ; can the pokemon learn the move?
	jr nz, .checkIfAlreadyLearnedMove
; if the pokemon can't learn the move
	ld a, SFX_DENIED
	call PlaySoundWaitForCurrent
	ld hl, MonCannotLearnMachineMoveText
	rst _PrintText
	jr .chooseMon
.checkIfAlreadyLearnedMove
	callfar CheckIfMoveIsKnown ; check if the pokemon already knows the move
	jr c, .chooseMon
	SetEvent FLAG_LEARNING_TM_MOVE
	predef LearnMove ; teach move
	pop af
	ld [wCurItem], a
	pop af
	ld [wWhichPokemon], a
	ld a, b
	and a
	ret z
	ld a, [wCurItem]
	call IsItemHM
	ret c
	jp RemoveUsedItem

BootedUpTMText:
	text_far _BootedUpTMText
	text_end

BootedUpHMText:
	text_far _BootedUpHMText
	text_end

TeachMachineMoveText:
	text_far _TeachMachineMoveText
	text_end

MonCannotLearnMachineMoveText:
	text_far _MonCannotLearnMachineMoveText
	text_end

PrintItemUseTextAndRemoveItem:
	ld hl, ItemUseText00
	rst _PrintText
	ld a, SFX_HEAL_AILMENT
	rst _PlaySound
	call WaitForTextScrollButtonPress ; wait for button press

RemoveUsedItem:
	ld hl, wNumBagItems
	ld a, 1 ; one item
	ld [wItemQuantity], a
	jp RemoveItemFromInventory

ItemUseNoEffect:
	ld hl, ItemUseNoEffectText
	jr ItemUseFailed

ItemUseNotTime:
	ld hl, ItemUseNotTimeText
	jr ItemUseFailed

; PureRGBnote: ADDED: text for items that are meant for use in battle indicating that
ItemUseInBattle:
	ld hl, ItemUseInBattleText
	jr ItemUseFailed

ItemUseOnWildMons:
	ld hl, ItemUseWildMonText
	jr ItemUseFailed

NoPokeDollsOnSpirits::
	ld hl, NoPokeDollsOnSpiritsText
	jr ItemUseFailed
;

ItemUseNotYoursToUse:
	ld hl, ItemUseNotYoursToUseText
	jr ItemUseFailed

ThrowBallAtTrainerMon:
	call RunDefaultPaletteCommand
	call LoadScreenTilesFromBuffer1 ; restore saved screen
	call Delay3
	; PureRGBnote: ADDED: choose which toss animation to use before entering the animation code
	call MapBallToAnimation
	predef MoveAnimation ; do animation
	ld hl, ThrowBallAtTrainerMonText1
	rst _PrintText
	ld hl, ThrowBallAtTrainerMonText2
	rst _PrintText
	jr RemoveUsedItem

NoCyclingAllowedHere:
	ld hl, NoCyclingAllowedHereText
	jr ItemUseFailed

BoxFullCannotThrowBall:
	ld hl, BoxFullCannotThrowBallText
	jr ItemUseFailed

SurfingAttemptFailed:
	ld hl, NoSurfingHereText

ItemUseFailed:
	xor a
	ld [wActionResultOrTookBattleTurn], a ; item use failed
	jp PrintText

ItemUseNotTimeText:
	text_far _ItemUseNotTimeText
	text_end

ItemUseValuableText:
	text_far _ItemUseValuableText
	text_end

ItemUseFossilText:
	text_far _ItemUseFossilText
	text_end

ItemUseInBattleText:
	text_far _ItemUseInBattleText
	text_end

ItemUseWildMonText:
	text_far _ItemUseWildMonText
	text_end

NoPokeDollsOnSpiritsText:
	text_far _NoPokeDollsOnSpiritsText
	text_end

ItemUseNotYoursToUseText:
	text_far _ItemUseNotYoursToUseText
	text_end

ItemUseNoEffectText:
	text_far _ItemUseNoEffectText
	text_end

ThrowBallAtTrainerMonText1:
	text_far _ThrowBallAtTrainerMonText1
	text_end

ThrowBallAtTrainerMonText2:
	text_far _ThrowBallAtTrainerMonText2
	text_end

NoCyclingAllowedHereText:
	text_far _NoCyclingAllowedHereText
	text_end

NoSurfingHereText:
	text_far _NoSurfingHereText
	text_end

BoxFullCannotThrowBallText:
	text_far _BoxFullCannotThrowBallText
	text_end

ItemUseText00:
	text_far _ItemUseText001
	text_low
	text_far _ItemUseText002
	text_end

GotOnBicycleText:
	text_far _GotOnBicycleText1
	text_low
	text_far _GotOnBicycleText2
	text_end

GotOffBicycleText:
	text_far _GotOffBicycleText1
	text_low
	text_far _GotOffBicycleText2
	text_end

; restores bonus PP (from PP Ups) when healing at a pokemon center
; also, when a PP Up is used, it increases the current PP by one PP Up bonus
; INPUT:
; [wWhichPokemon] = index of pokemon in party
; [wCurrentMenuItem] = index of move (when using a PP Up)
RestoreBonusPP:
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2 - wPartyMon1
	ld a, [wWhichPokemon]
	call AddNTimes
	push hl
	ld de, wNormalMaxPPList - 1
	predef LoadMovePPs ; loads the normal max PP of each of the pokemon's moves to wNormalMaxPPList
	pop hl
	lb bc, 0, wPartyMon1PP - wPartyMon1Moves
	add hl, bc ; hl now points to move 1 PP
	ld de, wNormalMaxPPList
	ld b, 0 ; initialize move counter to zero
; loop through the pokemon's moves
.loop
	inc b
	ld a, b
	cp 5 ; reached the end of the pokemon's moves?
	ret z ; if so, return
	ld a, [wUsingPPUp]
	dec a ; using a PP Up?
	jr nz, .skipMenuItemIDCheck
; if using a PP Up, check if this is the move it's being used on
	ld a, [wCurrentMenuItem]
	inc a
	cp b
	jr nz, .nextMove
.skipMenuItemIDCheck
	ld a, [hl]
	and %11000000 ; have any PP Ups been used?
	call nz, AddBonusPP ; if so, add bonus PP
.nextMove
	inc hl
	inc de
	jr .loop

; adds bonus PP from PP Ups to current PP
; 1/5 of normal max PP (capped at 7) is added for each PP Up
; INPUT:
; [de] = normal max PP
; [hl] = move PP
AddBonusPP:
	push bc
	ld a, [de] ; normal max PP of move
	ldh [hDividend + 3], a
	xor a
	ldh [hDividend], a
	ldh [hDividend + 1], a
	ldh [hDividend + 2], a
	ld a, 5
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ld a, [hl] ; move PP
	ld b, a
	swap a
	and %00001111
	srl a
	srl a
	ld c, a ; c = number of PP Ups used
.loop
	ldh a, [hQuotient + 3]
	cp 8 ; is the amount greater than or equal to 8?
	jr c, .addAmount
	ld a, 7 ; cap the amount at 7
.addAmount
	add b
	ld b, a
	;ld a, [wUsingPPUp] ; PureRGBnote: CHANGED: PP UPs max out PP in one go
	;dec a ; is the player using a PP Up right now?
	;jr z, .ppUP ; if so, only add the bonus three times
	dec c
	jr nz, .loop
.done
	ld [hl], b
	pop bc
	ret

; gets max PP of a pokemon's move (including PP from PP Ups)
; INPUT:
; [wWhichPokemon] = index of pokemon within party/box
; [wMonDataLocation] = pokemon source
; 00: player's party
; 01: enemy's party
; 02: current box
; 03: daycare
; 04: player's in-battle pokemon
; [wCurrentMenuItem] = move index
; OUTPUT:
; [wMaxPP] = max PP
GetMaxPP:
	ld a, [wMonDataLocation]
	and a
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2 - wPartyMon1
	jr z, .sourceWithMultipleMon
	ld hl, wEnemyMon1Moves
	dec a
	jr z, .sourceWithMultipleMon
	ld hl, wBoxMon1Moves
	ld bc, wBoxMon2 - wBoxMon1
	dec a
	jr z, .sourceWithMultipleMon
	ld hl, wDayCareMonMoves
	dec a
	jr z, .sourceWithOneMon
	ld hl, wBattleMonMoves ; player's in-battle pokemon
.sourceWithOneMon
	call GetSelectedMoveOffset2
	jr .next
.sourceWithMultipleMon
	call GetSelectedMoveOffset
.next
	ld a, [hl]
	dec a
	push hl
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, wMoveData
	ld a, BANK(Moves)
	call FarCopyData
	ld de, wMoveData + MOVE_PP
	ld a, [de]
	ld b, a ; b = normal max PP
	pop hl
	push bc
	ld bc, wPartyMon1PP - wPartyMon1Moves ; PP offset if not player's in-battle pokemon data
	ld a, [wMonDataLocation]
	cp 4 ; player's in-battle pokemon?
	jr nz, .addPPOffset
	ld bc, wBattleMonPP - wBattleMonMoves ; PP offset if player's in-battle pokemon data
.addPPOffset
	add hl, bc
	ld a, [hl] ; a = current PP
	and %11000000 ; get PP Up count
	pop bc
	or b ; place normal max PP in 6 lower bits of a
	ASSERT wMoveData + MOVE_PP + 1 == wPPUpCountAndMaxPP
	ld h, d
	ld l, e
	inc hl ; hl = wPPUpCountAndMaxPP
	ld [hl], a
	xor a ; add the bonus for the existing PP Up count
	ld [wUsingPPUp], a
	call AddBonusPP ; add bonus PP from PP Ups
	ld a, [hl]
	and %00111111 ; mask out the PP Up count
	ld [wMaxPP], a ; store max PP
	ret

GetSelectedMoveOffset:
	ld a, [wWhichPokemon]
	call AddNTimes

GetSelectedMoveOffset2:
	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, 0
	add hl, bc
	ret

; confirms the item toss and then tosses the item
; INPUT:
; hl = address of inventory (either wNumBagItems or wNumBoxItems)
; [wCurItem] = item ID
; [wWhichPokemon] = index of item within inventory
; [wItemQuantity] = quantity to toss
; OUTPUT:
; clears carry flag if the item is tossed, sets carry flag if not
TossItem_::
	push hl
	ld a, [wCurItem]
	call IsItemHM
	pop hl
	jr c, .tooImportantToToss
	push hl
	call IsKeyItem_
	ld a, [wIsKeyItem]
	pop hl
	and a
	jr nz, .tooImportantToToss
	push hl
	ld a, [wCurItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	call CopyToStringBuffer
	ld hl, IsItOKToTossItemText
	rst _PrintText
	hlcoord 14, 7
	lb bc, 8, 15
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID ; yes/no menu
	ld a, [wMenuExitMethod]
	cp CHOSE_SECOND_ITEM
	pop hl
	scf
	ret z ; return if the player chose No
; if the player chose Yes
	push hl
	ld a, [wWhichPokemon]
	call RemoveItemFromInventory
	ld a, [wCurItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	call CopyToStringBuffer
;;;;;;;;;; PureRGBnote: ADDED: sound effect when throwing away an item
	ld a, SFX_TELEPORT_ENTER_2
	rst _PlaySound
;;;;;;;;;;
	ld hl, ThrewAwayItemText
	rst _PrintText
	pop hl
	and a
	ret
.tooImportantToToss
	push hl
	ld hl, TooImportantToTossText
	rst _PrintText
	pop hl
	scf
	ret

ThrewAwayItemText:
	text_far _ThrewAwayItemText
	text_end

IsItOKToTossItemText:
	text_far _IsItOKToTossItemText
	text_end

TooImportantToTossText:
	text_far _TooImportantToTossText
	text_end

; checks if an item is a key item
; INPUT:
; [wCurItem] = item ID
; OUTPUT:
; [wIsKeyItem] = result
; 00: item is not key item
; 01: item is key item
IsKeyItem_::
	ld a, $01
	ld [wIsKeyItem], a
	ld a, [wCurItem]
	cp HM01 ; is the item an HM or TM?
	jr nc, .checkIfItemIsHM
; if the item is not an HM or TM
	push af
	ld hl, KeyItemFlags
	ld de, wBuffer
	ld bc, 15 ; only 11 bytes are actually used
	ASSERT 15 >= (NUM_ITEMS + 7) / 8
	rst _CopyData
	pop af
	dec a
	ld c, a
	ld hl, wBuffer
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	and a
	ret nz
.checkIfItemIsHM
	ld a, [wCurItem]
	call IsItemHM
	ret c
	xor a
	ld [wIsKeyItem], a
	ret

INCLUDE "data/items/key_items.asm"

SendNewMonToBox:
	ld de, wBoxCount
	ld a, [de]
	inc a
	ld [de], a
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	ld c, a
.loop
	inc de
	ld a, [de]
	ld b, a
	ld a, c
	ld c, b
	ld [de], a
	cp $ff
	jr nz, .loop
	call GetMonHeader
	ld hl, wBoxMonOT
	ld bc, NAME_LENGTH
	ld a, [wBoxCount]
	dec a
	jr z, .skip
	dec a
	call AddNTimes
	push hl
	ld bc, NAME_LENGTH
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld a, [wBoxCount]
	dec a
	ld b, a
.loop2
	push bc
	push hl
	ld bc, NAME_LENGTH
	rst _CopyData
	pop hl
	ld d, h
	ld e, l
	ld bc, -NAME_LENGTH
	add hl, bc
	pop bc
	dec b
	jr nz, .loop2
.skip
	ld hl, wPlayerName
	ld de, wBoxMonOT
	ld bc, NAME_LENGTH
	rst _CopyData
	ld a, [wBoxCount]
	dec a
	jr z, .skip2
	ld hl, wBoxMonNicks
	ld bc, NAME_LENGTH
	dec a
	call AddNTimes
	push hl
	ld bc, NAME_LENGTH
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld a, [wBoxCount]
	dec a
	ld b, a
.loop3
	push bc
	push hl
	ld bc, NAME_LENGTH
	rst _CopyData
	pop hl
	ld d, h
	ld e, l
	ld bc, -NAME_LENGTH
	add hl, bc
	pop bc
	dec b
	jr nz, .loop3
.skip2
;;;;;;;;;; PureRGBnote: ADDED: when in bills garden, if a pikachu is caught, skip nicknaming automatically.
	ld a, [wCurMap]
	cp BILLS_GARDEN
	jr nz, .notBillsGarden
	callfar PikabluNicknameLoad
	jr nz, .notBillsGarden
	push de
	ld de, wBoxMonNicks
	callfar ForceLoadNickname
	pop de
	jr .skipAskName
.notBillsGarden
;;;;;;;;;;
	ld hl, wBoxMonNicks
	ld a, NAME_MON_SCREEN
	ld [wNamingScreenType], a
	predef AskName
.skipAskName
	ld a, [wBoxCount]
	dec a
	jr z, .skip3
	ld hl, wBoxMons
	ld bc, wBoxMon2 - wBoxMon1
	dec a
	call AddNTimes
	push hl
	ld bc, wBoxMon2 - wBoxMon1
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld a, [wBoxCount]
	dec a
	ld b, a
.loop4
	push bc
	push hl
	ld bc, wBoxMon2 - wBoxMon1
	rst _CopyData
	pop hl
	ld d, h
	ld e, l
	ld bc, wBoxMon1 - wBoxMon2
	add hl, bc
	pop bc
	dec b
	jr nz, .loop4
.skip3
;;;;;;;;;; PureRGBnote: Reset the enemy pokemon's types in case they were remapped during battle
	ld a, [wMonHType1]
	ld [wEnemyMonType1], a
	ld a, [wMonHType2]
	ld [wEnemyMonType2], a
;;;;;;;;;;
	ld a, [wEnemyMonLevel]
	ld [wEnemyMonBoxLevel], a
	ld hl, wEnemyMon
	ld de, wBoxMon1
	ld bc, wEnemyMonDVs - wEnemyMon
	rst _CopyData
	ld hl, wPlayerID
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	push de
	ld a, [wCurEnemyLevel]
	ld d, a
	callfar CalcExperience
	pop de
	ldh a, [hExperience]
	ld [de], a
	inc de
	ldh a, [hExperience + 1]
	ld [de], a
	inc de
	ldh a, [hExperience + 2]
	ld [de], a
	inc de
	xor a
	ld b, NUM_STATS * 2
.loop5
	ld [de], a
	inc de
	dec b
	jr nz, .loop5
	ld hl, wEnemyMonDVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld hl, wEnemyMonPP
	ld b, NUM_MOVES
.loop6
	ld a, [hli]
	inc de
	ld [de], a
	dec b
	jr nz, .loop6
	ret

; checks if the tile in front of the player is a shore or water tile
; used for surfing and fishing
; unsets carry if it is, sets carry if not
IsNextTileShoreOrWater::
	ld a, [wCurMapTileset]
	ld hl, WaterTilesets
	ld de, 1
	call IsInArray
	jr nc, WaterTileSetIsNextTileShoreOrWater.notShoreOrWater
	; fall through
WaterTileSetIsNextTileShoreOrWater::
	ld a, [wCurMapTileset]
	cp CAVERN ; PureRGBnote: ADDED: fixes an issue with the unused tiles in the cavern tileset causing surf incorrectly (they are used now)
	jr z, .cavern
	cp SHIP_PORT ; Vermilion Dock tileset
	jr z, .skipShoreTiles ; if it's the Vermilion Dock tileset
	cp FACILITY
	jr z, .skipShoreTiles
	cp VOLCANO
	jr z, .volcanoTiles
	ld a, [wTileInFrontOfPlayer] ; tile in front of player
	cp $48 ; eastern shore tile in Safari Zone
	jr z, .shoreOrWater
	cp $32 ; usual eastern shore tile
	jr z, .shoreOrWater
.skipShoreTiles
	ld a, [wTileInFrontOfPlayer] ; tile in front of player
	cp $14 ; water tile
	jr z, .shoreOrWater
.notShoreOrWater
	scf
	ret
.shoreOrWater
	and a
	ret
.volcanoTiles
	push hl
	push de
	push bc
	ld hl, .volcanoCheck
	call hl_caller
	pop bc
	pop de
	pop hl
	ret
.volcanoCheck
	ld a, [wCurMap]
	cp CINNABAR_VOLCANO
	ld a, [wYCoord]
	jr z, .cinnabarVolcano
	; west cinnabar volcano
	cp 8
	jr c, .volcanoTileCheck
.cinnabarVolcano
	cp 53
	jr nc, .volcanoTileCheck ; can lava surf on bottom floor
	ld de, VolcanoMainRoomRange
	callfar FarArePlayerCoordsInRange
	jr nc, .notShoreOrWater
.volcanoTileCheck
	ld a, [wTileInFrontOfPlayer]
	ld de, 1
	ld hl, LavaSurfTiles
	call IsInArray
	jr c, .shoreOrWater
	jr .notShoreOrWater
.cavern
	ld a, [wCurMap]
	cp SEAFOAM_ISLANDS_B3F
	jr z, .currentTiles
	cp SEAFOAM_ISLANDS_B4F
	jr z, .currentTiles
	jr .skipShoreTiles
.currentTiles
	; seafoam islands has water current tiles
	ld a, [wTileInFrontOfPlayer]
	cp $30
	jr z, .shoreOrWater
	cp $3B
	jr z, .shoreOrWater
	cp $42
	jr z, .shoreOrWater
	jr .skipShoreTiles

LavaSurfTiles::
	db $06, $14, $21, $23, $24, $25, $26, -1

INCLUDE "data/tilesets/water_tilesets.asm"

ReadSuperRodData:
; return e = 2 if no fish on this map
; return e = 1 if a bite, bc = level,species
; return e = 0 if no bite
	ld a, [wCurMap]
	ld de, 3 ; each fishing group is three bytes wide
	ld hl, SuperRodData
	call IsInArray
	jr c, .ReadFishingGroup
	ld e, $2 ; $2 if no fishing groups found
	ret

.ReadFishingGroup
; hl points to the fishing group entry in the index
	inc hl ; skip map id

	; read fishing group address
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [hli]
	ld b, a ; how many mons in group
	ld e, $0 ; no bite yet

	call Random
;;;;;;;;;; PureRGBnote: CHANGED: fishing rods now have a hard 1/4 chance of not catching a pokemon instead of a repeated 1/2 chance.
	and %11 ; 2-bit random number
	ret z ; 25% chance of no battle (25% chance of 2 bits being 00)
;;;;;;;;;;

;;;;;;;;;; PureRGBnote: ADDED: alt palette pokemon can show up when fishing in places with the super rod.
.RandomLoop
	call Random
	and %11 ; 2-bit random number
	cp b
	jr nc, .RandomLoop ; if a is greater than the number of mons, regenerate

	ld b, a
	push hl
	push af
	ld a, b
	add 20 ; fishing group indices start at bit 20 of the palette flag array
	ld [wIsAltPalettePkmn], a ; index from 20 to 23 to indicate which palette flag to check
	callfar CheckWildPokemonPalettes ; stores the palette flag if the given pokemon should be alt palette
	pop af
	pop hl
;;;;;;;;;;
	; get the mon
	add a
	ld c, a
	ld b, $0
	add hl, bc
	ld b, [hl] ; level
	inc hl
	ld c, [hl] ; species
	ld e, $1 ; $1 if there's a bite
	ret

INCLUDE "data/wild/super_rod.asm"

; reloads map view and processes sprite data
; for items that cause the overworld to be displayed
ItemUseReloadOverworldData:
	call LoadCurrentMapView
	jp UpdateSprites

;;;;;;;;;; pureRGBnote: ADDED: text indicating your box is full or how much is left
PrintRemainingBoxSpacePrompt:
	call PrintRemainingBoxSpace
	jp DisplayTextPromptButton

PrintRemainingBoxSpace:
	ld hl, wBoxNumString
	ld a, [wCurrentBoxNum]
	and %01111111 ; last bit of wCurrentBoxNum is used as a flag and should be ignored
	inc a ; wCurrentBoxNum starts at 0 but we want 1
	call Load2DigitNumberBelow20
	ld a, [wBoxCount]
	cp MONS_PER_BOX
	jr nz, .notFullBox
	ld hl, NoBoxSlotsLeftText
	rst _PrintText
	ret
.notFullBox
	n_sub_a MONS_PER_BOX
	ld hl, w2CharStringBuffer
	call Load2DigitNumberBelow20
	ld hl, BoxSlotsLeftText
	rst _PrintText
	ret

Load2DigitNumberBelow20:
	cp 10
	jr c, .singleDigit
	sub 10
	ld [hl], "1"
	inc hl
.singleDigit
	add NUMBER_CHAR_OFFSET
	ld [hli], a
	ld [hl], "@"
	ret
;;;;;;;;;;

GetReceivedMonPointer:
	ld hl, wPartyMonNicks
	ld bc, NAME_LENGTH
	ld a, [wPartyCount]
	dec a
	call AddNTimes
	ld d, h
	ld e, l
	ret

; PureRGBnote: ADDED: text topsecretkey (small hint)
UseTopSecretKey:
	ld hl, TopSecretKeyText
	jp ItemUseFailed

TopSecretKeyText:
	text_far _TopSecretKeyText
	text_end

ClearParaBurnBattleFlagsOnHeal:
;;;;;;;;;; shinpokerednote: FIXED: reset burn and paralyze stat drops on healing via full restore
;;;;;;;;;; PureRGBnote: ADDED: code that helps make the trainer AI not predict healing statuses perfectly and reapplying the same turn.
	ld a, [wIsInBattle]
	and a
	ret z
	push hl
	push de
	; store active mon's status before being healed for AI purposes
	ld a, [wBattleMonStatus]
	ld [wAITargetMonStatus], a
	; reset toxic and "extra firewall damage" flags in active mon status flags
	ld hl, wPlayerBattleStatus3
	res BADLY_POISONED, [hl]
	res BOOSTED_FIREWALL, [hl]
	ldh a, [hWhoseTurn]
	push af
	xor a	;forcibly set it to the player's turn
	ldh [hWhoseTurn], a
	callfar UndoBurnParStats	;undo brn/par stat changes
	pop af
	ldh [hWhoseTurn], a
	; remove the status ailment in the in-battle pokemon data (have to do this after undoburnparstats)
	xor a
	ld [wBattleMonStatus], a 
	ld [wPlayerToxicCounter], a	; shinpokerednote: FIXED: clear toxic counter
	inc a
	ld [wAIMoveSpamAvoider], a
	pop de
	pop hl
	ret
;;;;;;;;;;

ItemEffectsDoMoveAnimation:
	xor a
	ldh [hWhoseTurn], a
	ld [wAnimationType], a
	ld [wDamageMultipliers], a
	ld a, [wWhichPokemon]
	push af
	ld a, [wCurItem]
	push af
	predef MoveAnimation
	pop af
	ld [wCurItem], a
	pop af
	ld [wWhichPokemon], a
	ret
	