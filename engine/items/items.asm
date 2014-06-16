UseItem_: ; d5c7 (3:55c7)
	ld a,1
	ld [wcd6a],a
	ld a,[wcf91]	;contains item_ID
	cp a,HM_01
	jp nc,ItemUseTMHM
	ld hl,ItemUsePtrTable
	dec a
	add a
	ld c,a
	ld b,0
	add hl,bc
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp [hl]

ItemUsePtrTable: ; d5e1 (3:55e1)
	dw ItemUseBall       ; MASTER_BALL
	dw ItemUseBall       ; ULTRA_BALL
	dw ItemUseBall       ; GREAT_BALL
	dw ItemUseBall       ; POKE_BALL
	dw ItemUseTownMap    ; TOWN_MAP
	dw ItemUseBicycle    ; BICYCLE
	dw ItemUseSurfboard  ; out-of-battle Surf effect
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
	dw ItemUseBait       ; BOULDERBADGE
	dw ItemUseRock       ; CASCADEBADGE
	dw UnusableItem      ; THUNDERBADGE
	dw UnusableItem      ; RAINBOWBADGE
	dw UnusableItem      ; SOULBADGE
	dw UnusableItem      ; MARSHBADGE
	dw UnusableItem      ; VOLCANOBADGE
	dw UnusableItem      ; EARTHBADGE
	dw ItemUseEscapeRope ; ESCAPE_ROPE
	dw ItemUseRepel      ; REPEL
	dw UnusableItem      ; OLD_AMBER
	dw ItemUseEvoStone   ; FIRE_STONE
	dw ItemUseEvoStone   ; THUNDER_STONE
	dw ItemUseEvoStone   ; WATER_STONE
	dw ItemUseVitamin    ; HP_UP
	dw ItemUseVitamin    ; PROTEIN
	dw ItemUseVitamin    ; IRON
	dw ItemUseVitamin    ; CARBOS
	dw ItemUseVitamin    ; CALCIUM
	dw ItemUseVitamin    ; RARE_CANDY
	dw UnusableItem      ; DOME_FOSSIL
	dw UnusableItem      ; HELIX_FOSSIL
	dw UnusableItem      ; SECRET_KEY
	dw UnusableItem
	dw UnusableItem      ; BIKE_VOUCHER
	dw ItemUseXAccuracy  ; X_ACCURACY
	dw ItemUseEvoStone   ; LEAF_STONE
	dw ItemUseCardKey    ; CARD_KEY
	dw UnusableItem      ; NUGGET
	dw UnusableItem      ; ??? PP_UP
	dw ItemUsePokedoll   ; POKE_DOLL
	dw ItemUseMedicine   ; FULL_HEAL
	dw ItemUseMedicine   ; REVIVE
	dw ItemUseMedicine   ; MAX_REVIVE
	dw ItemUseGuardSpec  ; GUARD_SPEC_
	dw ItemUseSuperRepel ; SUPER_REPL
	dw ItemUseMaxRepel   ; MAX_REPEL
	dw ItemUseDireHit    ; DIRE_HIT
	dw UnusableItem      ; COIN
	dw ItemUseMedicine   ; FRESH_WATER
	dw ItemUseMedicine   ; SODA_POP
	dw ItemUseMedicine   ; LEMONADE
	dw UnusableItem      ; S_S__TICKET
	dw UnusableItem      ; GOLD_TEETH
	dw ItemUseXStat      ; X_ATTACK
	dw ItemUseXStat      ; X_DEFEND
	dw ItemUseXStat      ; X_SPEED
	dw ItemUseXStat      ; X_SPECIAL
	dw ItemUseCoinCase   ; COIN_CASE
	dw ItemUseOaksParcel ; OAKS_PARCEL
	dw ItemUseItemfinder ; ITEMFINDER
	dw UnusableItem      ; SILPH_SCOPE
	dw ItemUsePokeflute  ; POKE_FLUTE
	dw UnusableItem      ; LIFT_KEY
	dw UnusableItem      ; EXP__ALL
	dw OldRodCode        ; OLD_ROD
	dw GoodRodCode       ; GOOD_ROD
	dw SuperRodCode      ; SUPER_ROD
	dw ItemUsePPUp       ; PP_UP (real one)
	dw ItemUsePPRestore  ; ETHER
	dw ItemUsePPRestore  ; MAX_ETHER
	dw ItemUsePPRestore  ; ELIXER
	dw ItemUsePPRestore  ; MAX_ELIXER

ItemUseBall: ; d687 (3:5687)
	ld a,[W_ISINBATTLE]
	and a
	jp z,ItemUseNotTime ; not in battle
	dec a
	jp nz,ThrowBallAtTrainerMon
	ld a,[W_BATTLETYPE]
	dec a
	jr z,.UseBall
	ld a,[wPartyCount]	;is Party full?
	cp a,6
	jr nz,.UseBall
	ld a,[W_NUMINBOX]	;is Box full?
	cp a,20
	jp z,BoxFullCannotThrowBall
.UseBall	;$56a7
;ok, you can use a ball
	xor a
	ld [wd11c],a
	ld a,[W_BATTLETYPE]
	cp a,2		;SafariBattle
	jr nz,.skipSafariZoneCode
.safariZone
	; remove a Safari Ball from inventory
	ld hl,W_NUMSAFARIBALLS
	dec [hl]
.skipSafariZoneCode	;$56b6
	call GoPAL_SET_CF1C
	ld a,$43
	ld [wd11e],a
	call LoadScreenTilesFromBuffer1	;restore screenBuffer from Backup
	ld hl,ItemUseText00
	call PrintText
	callab IsGhostBattle
	ld b,$10
	jp z,.next12
	ld a,[W_BATTLETYPE]
	dec a
	jr nz,.notOldManBattle
.oldManBattle
	ld hl,W_GRASSRATE
	ld de,wPlayerName
	ld bc,11
	call CopyData ; save the player's name in the Wild Monster data (part of the Cinnabar Island Missingno glitch)
	jp .BallSuccess	;$578b
.notOldManBattle	;$56e9
	ld a,[W_CURMAP]
	cp a,POKEMONTOWER_6
	jr nz,.loop
	ld a,[wEnemyMonSpecies2]
	cp a,MAROWAK
	ld b,$10
	jp z,.next12
; if not fighting ghost Marowak, loop until a random number in the current
; pokeball's allowed range is found
.loop	;$56fa
	call Random
	ld b,a
	ld hl,wcf91
	ld a,[hl]
	cp a,MASTER_BALL
	jp z,.BallSuccess	;$578b
	cp a,POKE_BALL
	jr z,.checkForAilments
	ld a,200
	cp b
	jr c,.loop	;get only numbers <= 200 for Great Ball
	ld a,[hl]
	cp a,GREAT_BALL
	jr z,.checkForAilments
	ld a,150	;get only numbers <= 150 for Ultra Ball
	cp b
	jr c,.loop
.checkForAilments	;$571a
; pokemon can be caught more easily with any (primary) status ailment
; Frozen/Asleep pokemon are relatively even easier to catch
; for Frozen/Asleep pokemon, any random number from 0-24 ensures a catch.
; for the others, a random number from 0-11 ensures a catch.
	ld a,[wEnemyMonStatus]	;status ailments
	and a
	jr z,.noAilments
	and a, 1 << FRZ | SLP	;is frozen and/or asleep?
	ld c,12
	jr z,.notFrozenOrAsleep
	ld c,25
.notFrozenOrAsleep	;$5728
	ld a,b
	sub c
	jp c,.BallSuccess	;$578b
	ld b,a
.noAilments	;$572e
	push bc		;save RANDOM number
	xor a
	ld [H_MULTIPLICAND],a
	ld hl,wEnemyMonMaxHP
	ld a,[hli]
	ld [H_MULTIPLICAND + 1],a
	ld a,[hl]
	ld [H_MULTIPLICAND + 2],a
	ld a,255
	ld [H_MULTIPLIER],a
	call Multiply	; MaxHP * 255
	ld a,[wcf91]
	cp a,GREAT_BALL
	ld a,12		;any other BallFactor
	jr nz,.next7
	ld a,8
.next7	;$574d
	ld [H_DIVISOR],a
	ld b,4		; number of bytes in dividend
	call Divide
	ld hl,wEnemyMonHP
	ld a,[hli]
	ld b,a
	ld a,[hl]

; explanation: we have a 16-bit value equal to [b << 8 | a].
; This number is divided by 4. The result is 8 bit (reg. a).
; Always bigger than zero.
	srl b
	rr a
	srl b
	rr a ; a = current HP / 4
	and a
	jr nz,.next8
	inc a
.next8	;$5766
	ld [H_DIVISOR],a
	ld b,4
	call Divide	; ((MaxHP * 255) / BallFactor) / (CurHP / 4)
	ld a,[H_QUOTIENT + 2]
	and a
	jr z,.next9
	ld a,255
	ld [H_QUOTIENT + 3],a
.next9	;$5776
	pop bc
	ld a,[wd007]	;enemy: Catch Rate
	cp b
	jr c,.next10
	ld a,[H_QUOTIENT + 2]
	and a
	jr nz,.BallSuccess ; if ((MaxHP * 255) / BallFactor) / (CurHP / 4) > 0x255, automatic success
	call Random
	ld b,a
	ld a,[H_QUOTIENT + 3]
	cp b
	jr c,.next10
.BallSuccess	;$578b
	jr .BallSuccess2
.next10	;$578d
	ld a,[H_QUOTIENT + 3]
	ld [wd11e],a
	xor a
	ld [H_MULTIPLICAND],a
	ld [H_MULTIPLICAND + 1],a
	ld a,[wd007]	;enemy: Catch Rate
	ld [H_MULTIPLICAND + 2],a
	ld a,100
	ld [H_MULTIPLIER],a
	call Multiply	; CatchRate * 100
	ld a,[wcf91]
	ld b,255
	cp a,POKE_BALL
	jr z,.next11
	ld b,200
	cp a,GREAT_BALL
	jr z,.next11
	ld b,150
	cp a,ULTRA_BALL
	jr z,.next11
.next11	;$57b8
	ld a,b
	ld [H_DIVISOR],a
	ld b,4
	call Divide
	ld a,[H_QUOTIENT + 2]
	and a
	ld b,$63
	jr nz,.next12
	ld a,[wd11e]
	ld [H_MULTIPLIER],a
	call Multiply
	ld a,255
	ld [H_DIVISOR],a
	ld b,4
	call Divide
	ld a,[wEnemyMonStatus]	;status ailments
	and a
	jr z,.next13
	and a, 1 << FRZ | SLP
	ld b,5
	jr z,.next14
	ld b,10
.next14	;$57e6
	ld a,[H_QUOTIENT + 3]
	add b
	ld [H_QUOTIENT + 3],a
.next13	;$57eb
	ld a,[H_QUOTIENT + 3]
	cp a,10
	ld b,$20
	jr c,.next12
	cp a,30
	ld b,$61
	jr c,.next12
	cp a,70
	ld b,$62
	jr c,.next12
	ld b,$63
.next12	;$5801
	ld a,b
	ld [wd11e],a
.BallSuccess2	;$5805
	ld c,20
	call DelayFrames
	ld a,TOSS_ANIM
	ld [W_ANIMATIONID],a
	xor a
	ld [$fff3],a
	ld [wcc5b],a
	ld [wd05b],a
	ld a,[wWhichPokemon]
	push af
	ld a,[wcf91]
	push af
	predef MoveAnimation
	pop af
	ld [wcf91],a
	pop af
	ld [wWhichPokemon],a
	ld a,[wd11e]
	cp a,$10
	ld hl,ItemUseBallText00
	jp z,.printText0
	cp a,$20
	ld hl,ItemUseBallText01
	jp z,.printText0
	cp a,$61
	ld hl,ItemUseBallText02
	jp z,.printText0
	cp a,$62
	ld hl,ItemUseBallText03
	jp z,.printText0
	cp a,$63
	ld hl,ItemUseBallText04
	jp z,.printText0
	ld hl,wEnemyMonHP	;current HP
	ld a,[hli]
	push af
	ld a,[hli]
	push af		;backup currentHP...
	inc hl
	ld a,[hl]
	push af		;...and status ailments
	push hl
	ld hl,W_ENEMYBATTSTATUS3
	bit 3,[hl]
	jr z,.next15
	ld a,$4c
	ld [wEnemyMonSpecies2],a
	jr .next16
.next15	;$5871
	set 3,[hl]
	ld hl,wcceb
	ld a,[wEnemyMonDVs]
	ld [hli],a
	ld a,[wEnemyMonDVs + 1]
	ld [hl],a
.next16	;$587e
	ld a,[wcf91]
	push af
	ld a,[wEnemyMonSpecies2]
	ld [wcf91],a
	ld a,[wEnemyMonLevel]
	ld [W_CURENEMYLVL],a
	callab Func_3eb01
	pop af
	ld [wcf91],a
	pop hl
	pop af
	ld [hld],a
	dec hl
	pop af
	ld [hld],a
	pop af
	ld [hl],a
	ld a,[wEnemyMonSpecies]	;enemy
	ld [wd11c],a
	ld [wcf91],a
	ld [wd11e],a
	ld a,[W_BATTLETYPE]
	dec a
	jr z,.printText1
	ld hl,ItemUseBallText05
	call PrintText
	predef IndexToPokedex
	ld a,[wd11e]
	dec a
	ld c,a
	ld b,2
	ld hl,wPokedexOwned	;Dex_own_flags (pokemon)
	predef FlagActionPredef
	ld a,c
	push af
	ld a,[wd11e]
	dec a
	ld c,a
	ld b,1
	predef FlagActionPredef
	pop af
	and a
	jr nz,.checkParty
	ld hl,ItemUseBallText06
	call PrintText
	call ClearSprites
	ld a,[wEnemyMonSpecies]	;caught mon_ID
	ld [wd11e],a
	predef ShowPokedexData
.checkParty	;$58f4
	ld a,[wPartyCount]
	cp a,6		;is party full?
	jr z,.sendToBox
	xor a
	ld [wcc49],a
	call ClearSprites
	call AddPartyMon	;add mon to Party
	jr .End
.sendToBox	;$5907
	call ClearSprites
	call Func_e7a4
	ld hl,ItemUseBallText07
	ld a,[wd7f1]
	bit 0,a		;already met Bill?
	jr nz,.sendToBox2
	ld hl,ItemUseBallText08
.sendToBox2	;$591a
	call PrintText
	jr .End
.printText1	;$591f
	ld hl,ItemUseBallText05
.printText0	;$5922
	call PrintText
	call ClearSprites
.End	;$5928
	ld a,[W_BATTLETYPE]
	and a
	ret nz
	ld hl,wNumBagItems
	inc a
	ld [wcf96],a
	jp RemoveItemFromInventory	;remove ITEM (XXX)
ItemUseBallText00: ; d937 (3:5937)
;"It dodged the thrown ball!"
;"This pokemon can't be caught"
	TX_FAR _ItemUseBallText00
	db "@"
ItemUseBallText01: ; d93c (3:593c)
;"You missed the pokemon!"
	TX_FAR _ItemUseBallText01
	db "@"
ItemUseBallText02: ; d941 (3:5941)
;"Darn! The pokemon broke free!"
	TX_FAR _ItemUseBallText02
	db "@"
ItemUseBallText03: ; d946 (3:5946)
;"Aww! It appeared to be caught!"
	TX_FAR _ItemUseBallText03
	db "@"
ItemUseBallText04: ; d94b (3:594b)
;"Shoot! It was so close too!"
	TX_FAR _ItemUseBallText04
	db "@"
ItemUseBallText05: ; d950 (3:5950)
;"All right! {MonName} was caught!"
;play sound
	TX_FAR _ItemUseBallText05
	db $12,$06
	db "@"
ItemUseBallText07: ; d957 (3:5957)
;"X was transferred to Bill's PC"
	TX_FAR _ItemUseBallText07
	db "@"
ItemUseBallText08: ; d95c (3:595c)
;"X was transferred to someone's PC"
	TX_FAR _ItemUseBallText08
	db "@"

ItemUseBallText06: ; d961 (3:5961)
;"New DEX data will be added..."
;play sound
	TX_FAR _ItemUseBallText06
	db $13,$06
	db "@"

ItemUseTownMap: ; d968 (3:5968)
	ld a,[W_ISINBATTLE]
	and a
	jp nz,ItemUseNotTime
	ld b, BANK(DisplayTownMap)
	ld hl, DisplayTownMap
	jp Bankswitch ; display Town Map

ItemUseBicycle: ; d977 (3:5977)
	ld a,[W_ISINBATTLE]
	and a
	jp nz,ItemUseNotTime
	ld a,[wd700]
	ld [wd11a],a
	cp a,2 ; is the player surfing?
	jp z,ItemUseNotTime
	dec a ; is player already bicycling?
	jr nz,.tryToGetOnBike
.getOffBike
	call ItemUseReloadOverworldData
	xor a
	ld [wd700],a ; change player state to walking
	call Func_2307 ; play walking music
	ld hl,GotOffBicycleText
	jr .printText
.tryToGetOnBike
	call IsBikeRidingAllowed
	jp nc,NoCyclingAllowedHere
	call ItemUseReloadOverworldData
	xor a ; no keys pressed
	ld [hJoyHeld],a ; current joypad state
	inc a
	ld [wd700],a ; change player state to bicycling
	ld hl,GotOnBicycleText
	call Func_2307 ; play bike riding music
.printText
	jp PrintText

; used for Surf out-of-battle effect
ItemUseSurfboard: ; d9b4 (3:59b4)
	ld a,[wd700]
	ld [wd11a],a
	cp a,2 ; is the player already surfing?
	jr z,.tryToStopSurfing
.tryToSurf
	call IsNextTileShoreOrWater
	jp c,SurfingAttemptFailed
	ld hl,TilePairCollisionsWater
	call CheckForTilePairCollisions
	jp c,SurfingAttemptFailed
.surf
	call .makePlayerMoveForward
	ld hl,wd730
	set 7,[hl]
	ld a,2
	ld [wd700],a ; change player state to surfing
	call Func_2307 ; play surfing music
	ld hl,SurfingGotOnText
	jp PrintText
.tryToStopSurfing
	xor a
	ld [$ff8c],a
	ld d,16 ; talking range in pixels (normal range)
	call IsSpriteInFrontOfPlayer2
	res 7,[hl]
	ld a,[$ff8c]
	and a ; is there a sprite in the way?
	jr nz,.cannotStopSurfing
	ld hl,TilePairCollisionsWater
	call CheckForTilePairCollisions
	jr c,.cannotStopSurfing
	ld hl,W_TILESETCOLLISIONPTR ; pointer to list of passable tiles
	ld a,[hli]
	ld h,[hl]
	ld l,a ; hl now points to passable tiles
	ld a,[wcfc6] ; tile in front of the player
	ld b,a
.passableTileLoop
	ld a,[hli]
	cp b
	jr z,.stopSurfing
	cp a,$ff
	jr nz,.passableTileLoop
.cannotStopSurfing
	ld hl,SurfingNoPlaceToGetOffText
	jp PrintText
.stopSurfing
	call .makePlayerMoveForward
	ld hl,wd730
	set 7,[hl]
	xor a
	ld [wd700],a ; change player state to walking
	dec a
	ld [wJoyIgnore],a
	call Func_2307 ; play walking music
	jp LoadWalkingPlayerSpriteGraphics
; uses a simulated button press to make the player move forward
.makePlayerMoveForward
	ld a,[wd52a] ; direction the player is going
	bit 3,a
	ld b,%01000000 ; Up key
	jr nz,.storeSimulatedButtonPress
	bit 2,a
	ld b,%10000000 ; Down key
	jr nz,.storeSimulatedButtonPress
	bit 1,a
	ld b,%00100000 ; Left key
	jr nz,.storeSimulatedButtonPress
	ld b,%00010000 ; Right key
.storeSimulatedButtonPress
	ld a,b
	ld [wccd3],a ; base address of simulated button presses
	xor a
	ld [wcd39],a
	inc a
	ld [wcd38],a ; index of current simulated button press
	ret

SurfingGotOnText: ; da4c (3:5a4c)
	TX_FAR _SurfingGotOnText
	db "@"

SurfingNoPlaceToGetOffText: ; da51 (3:5a51)
	TX_FAR _SurfingNoPlaceToGetOffText
	db "@"

ItemUsePokedex: ; da56 (3:5a56)
	predef_jump ShowPokedexMenu

ItemUseEvoStone: ; da5b (3:5a5b)
	ld a,[W_ISINBATTLE]
	and a
	jp nz,ItemUseNotTime
	ld a,[wWhichPokemon]
	push af
	ld a,[wcf91]
	ld [wd156],a
	push af
	ld a,$05 ; evolution stone party menu
	ld [wd07d],a
	ld a,$ff
	ld [wcfcb],a
	call DisplayPartyMenu
	pop bc
	jr c,.canceledItemUse
	ld a,b
	ld [wcf91],a
	ld a,$01
	ld [wccd4],a
	ld a,(SFX_02_3e - SFX_Headers_02) / 3
	call PlaySoundWaitForCurrent ; play sound
	call WaitForSoundToFinish ; wait for sound to end
	callab Func_3ad0e ; try to evolve pokemon
	ld a,[wd121]
	and a
	jr z,.noEffect
	pop af
	ld [wWhichPokemon],a
	ld hl,wNumBagItems
	ld a,1 ; remove 1 stone
	ld [wcf96],a
	jp RemoveItemFromInventory
.noEffect
	call ItemUseNoEffect
.canceledItemUse
	xor a
	ld [wcd6a],a
	pop af
	ret

ItemUseVitamin: ; dab4 (3:5ab4)
	ld a,[W_ISINBATTLE]
	and a
	jp nz,ItemUseNotTime

ItemUseMedicine: ; dabb (3:5abb)
	ld a,[wPartyCount]
	and a
	jp z,.emptyParty
	ld a,[wWhichPokemon]
	push af
	ld a,[wcf91]
	push af
	ld a,$01
	ld [wd07d],a ; item use party menu
	ld a,$ff
	ld [wcfcb],a
	ld a,[wd152]
	and a ; using Softboiled?
	jr z,.notUsingSoftboiled
; if using softboiled
	call GoBackToPartyMenu
	jr .getPartyMonDataAddress
.emptyParty
	ld hl,.emptyPartyText
	xor a
	ld [wcd6a],a ; item use failed
	jp PrintText
.emptyPartyText
	text "You don't have"
	line "any #MON!"
	prompt
.notUsingSoftboiled
	call DisplayPartyMenu
.getPartyMonDataAddress
	jp c,.canceledItemUse
	ld hl,wPartyMons
	ld bc,wPartyMon2 - wPartyMon1
	ld a,[wWhichPokemon]
	call AddNTimes
	ld a,[wWhichPokemon]
	ld [wcf06],a
	ld d,a
	ld a,[wcf91]
	ld e,a
	ld [wd0b5],a
	pop af
	ld [wcf91],a
	pop af
	ld [wWhichPokemon],a
	ld a,[wd152]
	and a ; using Softboiled?
	jr z,.checkItemType
; if using softboiled
	ld a,[wWhichPokemon]
	cp d ; is the pokemon trying to use softboiled on itself?
	jr z,ItemUseMedicine ; if so, force another choice
.checkItemType
	ld a,[wcf91]
	cp a,REVIVE
	jr nc,.healHP ; if it's a Revive or Max Revive
	cp a,FULL_HEAL
	jr z,.cureStatusAilment ; if it's a Full Heal
	cp a,HP_UP
	jp nc,.useVitamin ; if it's a vitamin or Rare Candy
	cp a,FULL_RESTORE
	jr nc,.healHP ; if it's a Full Restore or one of the potions
; fall through if it's one of the status-specifc healing items
.cureStatusAilment
	ld bc,4
	add hl,bc ; hl now points to status
	ld a,[wcf91]
	ld bc,$f008
	cp a,ANTIDOTE
	jr z,.checkMonStatus
	ld bc,$f110
	cp a,BURN_HEAL
	jr z,.checkMonStatus
	ld bc,$f220
	cp a,ICE_HEAL
	jr z,.checkMonStatus
	ld bc,$f307
	cp a,AWAKENING
	jr z,.checkMonStatus
	ld bc,$f440
	cp a,PARLYZ_HEAL
	jr z,.checkMonStatus
	ld bc,$f6ff ; Full Heal
.checkMonStatus
	ld a,[hl] ; pokemon's status
	and c ; does the pokemon have a status ailment the item can cure?
	jp z,.healingItemNoEffect
; if the pokemon has a status the item can heal
	xor a
	ld [hl],a ; remove the status ailment in the party data
	ld a,b
	ld [wd07d],a ; the message to display for the item used
	ld a,[wPlayerMonNumber]
	cp d ; is pokemon the item was used on active in battle?
	jp nz,.doneHealing
; if it is active in battle
	xor a
	ld [wBattleMonStatus],a ; remove the status ailment in the in-battle pokemon data
	push hl
	ld hl,W_PLAYERBATTSTATUS3
	res 0,[hl] ; heal Toxic status
	pop hl
	ld bc,30
	add hl,bc ; hl now points to party stats
	ld de,wBattleMonMaxHP
	ld bc,10
	call CopyData ; copy party stats to in-battle stat data
	predef Func_3ed02
	jp .doneHealing
.healHP
	inc hl ; hl = address of current HP
	ld a,[hli]
	ld b,a
	ld [wHPBarOldHP+1],a
	ld a,[hl]
	ld c,a
	ld [wHPBarOldHP],a ; current HP stored at wHPBarOldHP (2 bytes, big-endian)
	or b
	jr nz,.notFainted
.fainted
	ld a,[wcf91]
	cp a,REVIVE
	jr z,.updateInBattleFaintedData
	cp a,MAX_REVIVE
	jr z,.updateInBattleFaintedData
	jp .healingItemNoEffect
.updateInBattleFaintedData
	ld a,[W_ISINBATTLE]
	and a
	jr z,.compareCurrentHPToMaxHP
	push hl
	push de
	push bc
	ld a,[wcf06]
	ld c,a
	ld hl,wccf5
	ld b,$02
	predef FlagActionPredef
	ld a,c
	and a
	jr z,.next
	ld a,[wcf06]
	ld c,a
	ld hl,wPartyAliveFlags
	ld b,$01
	predef FlagActionPredef
.next
	pop bc
	pop de
	pop hl
	jr .compareCurrentHPToMaxHP
.notFainted
	ld a,[wcf91]
	cp a,REVIVE
	jp z,.healingItemNoEffect
	cp a,MAX_REVIVE
	jp z,.healingItemNoEffect
.compareCurrentHPToMaxHP
	push hl
	push bc
	ld bc,32
	add hl,bc ; hl now points to max HP
	pop bc
	ld a,[hli]
	cp b
	jr nz,.skipComparingLSB ; no need to compare the LSB's if the MSB's don't match
	ld a,[hl]
	cp c
.skipComparingLSB
	pop hl
	jr nz,.notFullHP
.fullHP ; if the pokemon's current HP equals its max HP
	ld a,[wcf91]
	cp a,FULL_RESTORE
	jp nz,.healingItemNoEffect
	inc hl
	inc hl
	ld a,[hld] ; status ailment
	and a ; does the pokemon have a status ailment?
	jp z,.healingItemNoEffect
	ld a,FULL_HEAL
	ld [wcf91],a
	dec hl
	dec hl
	dec hl
	jp .cureStatusAilment
.notFullHP ; if the pokemon's current HP doesn't equal its max HP
	xor a
	ld [wd083],a
	ld [wc02a],a
	push hl
	push de
	ld bc,32
	add hl,bc ; hl now points to max HP
	ld a,[hli]
	ld [wHPBarMaxHP+1],a
	ld a,[hl]
	ld [wHPBarMaxHP],a ; max HP stored at wHPBarMaxHP (2 bytes, big-endian)
	ld a,[wd152]
	and a ; using Softboiled?
	jp z,.notUsingSoftboiled2
; if using softboiled
	ld hl,wHPBarMaxHP
	ld a,[hli]
	push af
	ld a,[hli]
	push af
	ld a,[hli]
	push af
	ld a,[hl]
	push af
	ld hl,wPartyMon1MaxHP
	ld a,[wWhichPokemon]
	ld bc,wPartyMon2 - wPartyMon1
	call AddNTimes
	ld a,[hli]
	ld [wHPBarMaxHP + 1],a
	ld [H_DIVIDEND],a
	ld a,[hl]
	ld [wHPBarMaxHP],a
	ld [H_DIVIDEND + 1],a
	ld a,5
	ld [H_DIVISOR],a
	ld b,2 ; number of bytes
	call Divide ; get 1/5 of max HP of pokemon that used Softboiled
	ld bc,wPartyMon1HP - wPartyMon1MaxHP
	add hl,bc ; hl now points to LSB of current HP of pokemon that used Softboiled
; subtract 1/5 of max HP from current HP of pokemon that used Softboiled
	ld a,[H_QUOTIENT + 3]
	push af
	ld b,a
	ld a,[hl]
	ld [wHPBarOldHP],a
	sub b
	ld [hld],a
	ld [wHPBarNewHP],a
	ld a,[H_QUOTIENT + 2]
	ld b,a
	ld a,[hl]
	ld [wHPBarOldHP+1],a
	sbc b
	ld [hl],a
	ld [wHPBarNewHP+1],a
	FuncCoord 4, 1
	ld hl,Coord
	ld a,[wWhichPokemon]
	ld bc,2 * 20
	call AddNTimes ; calculate coordinates of HP bar of pokemon that used Softboiled
	ld a,(SFX_02_3d - SFX_Headers_02) / 3
	call PlaySoundWaitForCurrent ; play sound
	ld a,[$fff6]
	set 0,a
	ld [$fff6],a
	ld a,$02
	ld [wListMenuID],a
	predef UpdateHPBar2 ; animate HP bar decrease of pokemon that used Softboiled
	ld a,[$fff6]
	res 0,a
	ld [$fff6],a
	pop af
	ld b,a ; store heal amount (1/5 of max HP)
	ld hl,wHPBarOldHP + 1
	pop af
	ld [hld],a
	pop af
	ld [hld],a
	pop af
	ld [hld],a
	pop af
	ld [hl],a
	jr .addHealAmount
.notUsingSoftboiled2
	ld a,[wcf91]
	cp a,SODA_POP
	ld b,60 ; Soda Pop heal amount
	jr z,.addHealAmount
	ld b,80 ; Lemonade heal amount
	jr nc,.addHealAmount
	cp a,FRESH_WATER
	ld b,50 ; Fresh Water heal amount
	jr z,.addHealAmount
	cp a,SUPER_POTION
	ld b,200 ; Hyper Potion heal amount
	jr c,.addHealAmount
	ld b,50 ; Super Potion heal amount
	jr z,.addHealAmount
	ld b,20 ; Potion heal amount
.addHealAmount
	pop de
	pop hl
	ld a,[hl]
	add b
	ld [hld],a
	ld [wHPBarNewHP],a
	ld a,[hl]
	ld [wHPBarNewHP+1],a
	jr nc,.noCarry
	inc [hl]
	ld a,[hl]
	ld [wHPBarNewHP + 1],a
.noCarry
	push de
	inc hl
	ld d,h
	ld e,l ; de now points to current HP
	ld hl,33
	add hl,de ; hl now points to max HP
	ld a,[wcf91]
	cp a,REVIVE
	jr z,.setCurrentHPToHalfMaxHP
	ld a,[hld]
	ld b,a
	ld a,[de]
	sub b
	dec de
	ld b,[hl]
	ld a,[de]
	sbc b
	jr nc,.setCurrentHPToMaxHp ; if current HP exceeds max HP after healing
	ld a,[wcf91]
	cp a,HYPER_POTION
	jr c,.setCurrentHPToMaxHp ; if using a Full Restore or Max Potion
	cp a,MAX_REVIVE
	jr z,.setCurrentHPToMaxHp ; if using a Max Revive
	jr .updateInBattleData
.setCurrentHPToHalfMaxHP
	dec hl
	dec de
	ld a,[hli]
	srl a
	ld [de],a
	ld [wHPBarNewHP+1],a
	ld a,[hl]
	rr a
	inc de
	ld [de],a
	ld [wHPBarNewHP],a
	dec de
	jr .doneHealingPartyHP
.setCurrentHPToMaxHp
	ld a,[hli]
	ld [de],a
	ld [wHPBarNewHP+1],a
	inc de
	ld a,[hl]
	ld [de],a
	ld [wHPBarNewHP],a
	dec de
.doneHealingPartyHP ; done updating the pokemon's current HP in the party data structure
	ld a,[wcf91]
	cp a,FULL_RESTORE
	jr nz,.updateInBattleData
	ld bc,-31
	add hl,bc
	xor a
	ld [hl],a ; remove the status ailment in the party data
.updateInBattleData
	ld h,d
	ld l,e
	pop de
	ld a,[wPlayerMonNumber]
	cp d ; is pokemon the item was used on active in battle?
	jr nz,.calculateHPBarCoords
; copy party HP to in-battle HP
	ld a,[hli]
	ld [wBattleMonHP],a
	ld a,[hld]
	ld [wBattleMonHP + 1],a
	ld a,[wcf91]
	cp a,FULL_RESTORE
	jr nz,.calculateHPBarCoords
	xor a
	ld [wBattleMonStatus],a ; remove the status ailment in the in-battle pokemon data
.calculateHPBarCoords
	ld hl,wOAMBuffer + $90
	ld bc,2 * 20
	inc d
.calculateHPBarCoordsLoop
	add hl,bc
	dec d
	jr nz,.calculateHPBarCoordsLoop
	jr .doneHealing
.healingItemNoEffect
	call ItemUseNoEffect
	jp .done
.doneHealing
	ld a,[wd152]
	and a ; using Softboiled?
	jr nz,.skipRemovingItem ; no item to remove if using Softboiled
	push hl
	call RemoveUsedItem
	pop hl
.skipRemovingItem
	ld a,[wcf91]
	cp a,FULL_RESTORE
	jr c,.playStatusAilmentCuringSound
	cp a,FULL_HEAL
	jr z,.playStatusAilmentCuringSound
	ld a,(SFX_02_3d - SFX_Headers_02) / 3 ; HP healing sound
	call PlaySoundWaitForCurrent ; play sound
	ld a,[$fff6]
	set 0,a
	ld [$fff6],a
	ld a,$02
	ld [wListMenuID],a
	predef UpdateHPBar2 ; animate the HP bar lengthening
	ld a,[$fff6]
	res 0,a
	ld [$fff6],a
	ld a,$f7 ; revived message
	ld [wd07d],a
	ld a,[wcf91]
	cp a,REVIVE
	jr z,.showHealingItemMessage
	cp a,MAX_REVIVE
	jr z,.showHealingItemMessage
	ld a,$f5 ; standard HP healed message
	ld [wd07d],a
	jr .showHealingItemMessage
.playStatusAilmentCuringSound
	ld a,(SFX_02_3e - SFX_Headers_02) / 3 ; status ailment curing sound
	call PlaySoundWaitForCurrent ; play sound
.showHealingItemMessage
	xor a
	ld [H_AUTOBGTRANSFERENABLED],a
	call ClearScreen
	dec a
	ld [wcfcb],a
	call RedrawPartyMenu ; redraws the party menu and displays the message
	ld a,1
	ld [H_AUTOBGTRANSFERENABLED],a
	ld c,50
	call DelayFrames
	call WaitForTextScrollButtonPress ; wait for a button press
	jr .done
.canceledItemUse
	xor a
	ld [wcd6a],a ; item use failed
	pop af
	pop af
.done
	ld a,[wd152]
	and a ; using Softboiled?
	ret nz ; if so, return
	call GBPalWhiteOut
	call z,GoPAL_SET_CF1C
	ld a,[W_ISINBATTLE]
	and a
	ret nz
	jp ReloadMapData ; restore saved screen
.useVitamin
	push hl
	ld a,[hl]
	ld [wd0b5],a
	ld [wd11e],a
	ld bc,33
	add hl,bc ; hl now points to level
	ld a,[hl] ; a = level
	ld [W_CURENEMYLVL],a ; store level
	call GetMonHeader
	push de
	ld a,d
	ld hl,wPartyMonNicks
	call GetPartyMonName
	pop de
	pop hl
	ld a,[wcf91]
	cp a,RARE_CANDY
	jp z,.useRareCandy
	push hl
	sub a,HP_UP
	add a
	ld bc,17
	add hl,bc
	add l
	ld l,a
	jr nc,.noCarry2
	inc h
.noCarry2
	ld a,10
	ld b,a
	ld a,[hl] ; a = MSB of stat experience of the appropriate stat
	cp a,100 ; is there already at least 25600 (256 * 100) stat experience?
	jr nc,.vitaminNoEffect ; if so, vitamins can't add any more
	add b ; add 2560 (256 * 10) stat experience
	jr nc,.noCarry3 ; a carry should be impossible here, so this will always jump
	ld a,255
.noCarry3
	ld [hl],a
	pop hl
	call .recalculateStats
	ld hl,VitaminText
	ld a,[wcf91]
	sub a,HP_UP - 1
	ld c,a
.statNameLoop ; loop to get the address of the name of the stat the vitamin increases
	dec c
	jr z,.gotStatName
.statNameInnerLoop
	ld a,[hli]
	ld b,a
	ld a,$50
	cp b
	jr nz,.statNameInnerLoop
	jr .statNameLoop
.gotStatName
	ld de,wcf4b
	ld bc,10
	call CopyData ; copy the stat's name to wcf4b
	ld a,(SFX_02_3e - SFX_Headers_02) / 3
	call PlaySound ; play sound
	ld hl,VitaminStatRoseText
	call PrintText
	jp RemoveUsedItem
.vitaminNoEffect
	pop hl
	ld hl,VitaminNoEffectText
	call PrintText
	jp GBPalWhiteOut
.recalculateStats
	ld bc,34
	add hl,bc
	ld d,h
	ld e,l ; de now points to stats
	ld bc,-18
	add hl,bc ; hl now points to byte 3 of experience
	ld b,1
	jp CalcStats ; recalculate stats
.useRareCandy
	push hl
	ld bc,33
	add hl,bc ; hl now points to level
	ld a,[hl] ; a = level
	cp a, MAX_LEVEL
	jr z,.vitaminNoEffect ; can't raise level above 100
	inc a
	ld [hl],a ; store incremented level
	ld [W_CURENEMYLVL],a
	push hl
	push de
	ld d,a
	callab CalcExperience ; calculate experience for next level and store it at $ff96
	pop de
	pop hl
	ld bc,-19
	add hl,bc ; hl now points to experience
; update experience to minimum for new level
	ld a,[$ff96]
	ld [hli],a
	ld a,[$ff97]
	ld [hli],a
	ld a,[$ff98]
	ld [hl],a
	pop hl
	ld a,[wWhichPokemon]
	push af
	ld a,[wcf91]
	push af
	push de
	push hl
	ld bc,34
	add hl,bc ; hl now points to MSB of max HP
	ld a,[hli]
	ld b,a
	ld c,[hl]
	pop hl
	push bc
	push hl
	call .recalculateStats
	pop hl
	ld bc,35 ; hl now points to LSB of max HP
	add hl,bc
	pop bc
	ld a,[hld]
	sub c
	ld c,a
	ld a,[hl]
	sbc b
	ld b,a ; bc = the amount of max HP gained from leveling up
; add the amount gained to the current HP
	ld de,-32
	add hl,de ; hl now points to MSB of current HP
	ld a,[hl]
	add c
	ld [hld],a
	ld a,[hl]
	adc b
	ld [hl],a
	ld a,$f8 ; level up message
	ld [wd07d],a
	call RedrawPartyMenu
	pop de
	ld a,d
	ld [wWhichPokemon],a
	ld a,e
	ld [wd11e],a
	xor a
	ld [wcc49],a ; load from player's party
	call LoadMonData
	ld d,$01
	callab PrintStatsBox ; display new stats text box
	call WaitForTextScrollButtonPress ; wait for button press
	xor a
	ld [wcc49],a
	predef Func_3af5b ; learn level up move, if any
	xor a
	ld [wccd4],a
	callab Func_3ad0e ; evolve pokemon, if appropriate
	ld a,$01
	ld [wcfcb],a
	pop af
	ld [wcf91],a
	pop af
	ld [wWhichPokemon],a
	jp RemoveUsedItem

VitaminStatRoseText: ; df24 (3:5f24)
	TX_FAR _VitaminStatRoseText
	db "@"

VitaminNoEffectText: ; df29 (3:5f29)
	TX_FAR _VitaminNoEffectText
	db "@"

VitaminText: ; df2e (3:5f2e)
	db "HEALTH@"
	db "ATTACK@"
	db "DEFENSE@"
	db "SPEED@"
	db "SPECIAL@"

ItemUseBait: ; df52 (3:5f52)
	ld hl,ThrewBaitText
	call PrintText
	ld hl,wd007 ; catch rate
	srl [hl] ; halve catch rate
	ld a,BAIT_ANIM
	ld hl,wcce9 ; bait factor
	ld de,wcce8 ; escape factor
	jr BaitRockCommon

ItemUseRock: ; df67 (3:5f67)
	ld hl,ThrewRockText
	call PrintText
	ld hl,wd007 ; catch rate
	ld a,[hl]
	add a ; double catch rate
	jr nc,.noCarry
	ld a,$ff
.noCarry
	ld [hl],a
	ld a,ROCK_ANIM
	ld hl,wcce8 ; escape factor
	ld de,wcce9 ; bait factor

BaitRockCommon: ; df7f (3:5f7f)
	ld [W_ANIMATIONID],a
	xor a
	ld [wcc5b],a
	ld [H_WHOSETURN],a
	ld [de],a ; zero escape factor (for bait), zero bait factor (for rock)
.randomLoop ; loop until a random number less than 5 is generated
	call Random
	and a,7
	cp a,5
	jr nc,.randomLoop
	inc a ; increment the random number, giving a range from 1 to 5 inclusive
	ld b,a
	ld a,[hl]
	add b ; increase bait factor (for bait), increase escape factor (for rock)
	jr nc,.noCarry
	ld a,$ff
.noCarry
	ld [hl],a
	predef MoveAnimation ; do animation
	ld c,70
	jp DelayFrames

ThrewBaitText: ; dfa5 (3:5fa5)
	TX_FAR _ThrewBaitText
	db "@"

ThrewRockText: ; dfaa (3:5faa)
	TX_FAR _ThrewRockText
	db "@"

; also used for Dig out-of-battle effect
ItemUseEscapeRope: ; dfaf (3:5faf)
	ld a,[W_ISINBATTLE]
	and a
	jr nz,.notUsable
	ld a,[W_CURMAP]
	cp a,AGATHAS_ROOM
	jr z,.notUsable
	ld a,[W_CURMAPTILESET]
	ld b,a
	ld hl,EscapeRopeTilesets
.loop
	ld a,[hli]
	cp a,$ff
	jr z,.notUsable
	cp b
	jr nz,.loop
	ld hl,wd732
	set 3,[hl]
	set 6,[hl]
	ld hl,wd72e
	res 4,[hl]
	ld hl,wd790
	res 7,[hl] ; unset Safari Zone bit
	xor a
	ld [W_NUMSAFARIBALLS],a
	ld [W_SAFARIZONEENTRANCECURSCRIPT],a
	inc a
	ld [wd078],a
	ld [wcd6a],a ; item used
	ld a,[wd152]
	and a ; using Dig?
	ret nz ; if so, return
	call ItemUseReloadOverworldData
	ld c,30
	call DelayFrames
	jp RemoveUsedItem
.notUsable
	jp ItemUseNotTime

EscapeRopeTilesets: ; dffd (3:5ffd)
	db FOREST, CEMETERY, CAVERN, FACILITY, INTERIOR
	db $ff ; terminator

ItemUseRepel: ; e003 (3:6003)
	ld b,100

ItemUseRepelCommon: ; e005 (3:6005)
	ld a,[W_ISINBATTLE]
	and a
	jp nz,ItemUseNotTime
	ld a,b
	ld [wd0db],a
	jp PrintItemUseTextAndRemoveItem

; handles X Accuracy item
ItemUseXAccuracy: ; e013 (3:6013)
	ld a,[W_ISINBATTLE]
	and a
	jp z,ItemUseNotTime
	ld hl,W_PLAYERBATTSTATUS2
	set 0,[hl] ; X Accuracy bit
	jp PrintItemUseTextAndRemoveItem

; This function is bugged and never works. It always jumps to ItemUseNotTime.
; The Card Key is handled in a different way.
ItemUseCardKey: ; e022 (3:6022)
	xor a
	ld [wd71f],a
	call Func_c586
	ld a,[Func_c586] ; $4586
	cp a,$18
	jr nz,.next0
	ld hl,CardKeyTable1
	jr .next1
.next0
	cp a,$24
	jr nz,.next2
	ld hl,CardKeyTable2
	jr .next1
.next2
	cp a,$5e
	jp nz,ItemUseNotTime
	ld hl,CardKeyTable3
.next1
	ld a,[W_CURMAP]
	ld b,a
.loop
	ld a,[hli]
	cp a,$ff
	jp z,ItemUseNotTime
	cp b
	jr nz,.nextEntry1
	ld a,[hli]
	cp d
	jr nz,.nextEntry2
	ld a,[hli]
	cp e
	jr nz,.nextEntry3
	ld a,[hl]
	ld [wd71f],a
	jr .done
.nextEntry1
	inc hl
.nextEntry2
	inc hl
.nextEntry3
	inc hl
	jr .loop
.done
	ld hl,ItemUseText00
	call PrintText
	ld hl,wd728
	set 7,[hl]
	ret

; These tables are probably supposed to be door locations in Silph Co.,
; but they are unused.
; The reason there are 3 tables is unknown.

; Format:
; 00: Map ID
; 01: Y
; 02: X
; 03: ID?

CardKeyTable1: ; e072 (3:6072)
	db  SILPH_CO_2F,$04,$04,$00
	db  SILPH_CO_2F,$04,$05,$01
	db  SILPH_CO_4F,$0C,$04,$02
	db  SILPH_CO_4F,$0C,$05,$03
	db  SILPH_CO_7F,$06,$0A,$04
	db  SILPH_CO_7F,$06,$0B,$05
	db  SILPH_CO_9F,$04,$12,$06
	db  SILPH_CO_9F,$04,$13,$07
	db SILPH_CO_10F,$08,$0A,$08
	db SILPH_CO_10F,$08,$0B,$09
	db $ff

CardKeyTable2: ; e09b (3:609b)
	db SILPH_CO_3F,$08,$09,$0A
	db SILPH_CO_3F,$09,$09,$0B
	db SILPH_CO_5F,$04,$07,$0C
	db SILPH_CO_5F,$05,$07,$0D
	db SILPH_CO_6F,$0C,$05,$0E
	db SILPH_CO_6F,$0D,$05,$0F
	db SILPH_CO_8F,$08,$07,$10
	db SILPH_CO_8F,$09,$07,$11
	db SILPH_CO_9F,$08,$03,$12
	db SILPH_CO_9F,$09,$03,$13
	db $ff

CardKeyTable3: ; e0c4 (3:60c4)
	db SILPH_CO_11F,$08,$09,$14
	db SILPH_CO_11F,$09,$09,$15
	db $ff

ItemUsePokedoll: ; e0cd (3:60cd)
	ld a,[W_ISINBATTLE]
	dec a
	jp nz,ItemUseNotTime
	ld a,$01
	ld [wd078],a
	jp PrintItemUseTextAndRemoveItem

ItemUseGuardSpec: ; e0dc (3:60dc)
	ld a,[W_ISINBATTLE]
	and a
	jp z,ItemUseNotTime
	ld hl,W_PLAYERBATTSTATUS2
	set 1,[hl] ; Mist bit
	jp PrintItemUseTextAndRemoveItem

ItemUseSuperRepel: ; e0eb (3:60eb)
	ld b,200
	jp ItemUseRepelCommon

ItemUseMaxRepel: ; e0f0 (3:60f0)
	ld b,250
	jp ItemUseRepelCommon

ItemUseDireHit: ; e0f5 (3:60f5)
	ld a,[W_ISINBATTLE]
	and a
	jp z,ItemUseNotTime
	ld hl,W_PLAYERBATTSTATUS2
	set 2,[hl] ; Focus Energy bit
	jp PrintItemUseTextAndRemoveItem

ItemUseXStat: ; e104 (3:6104)
	ld a,[W_ISINBATTLE]
	and a
	jr nz,.inBattle
	call ItemUseNotTime
	ld a,2
	ld [wcd6a],a ; item not used
	ret
.inBattle
	ld hl,W_PLAYERMOVENUM
	ld a,[hli]
	push af ; save [W_PLAYERMOVENUM]
	ld a,[hl]
	push af ; save [W_PLAYERMOVEEFFECT]
	push hl
	ld a,[wcf91]
	sub a,X_ATTACK - ATTACK_UP1_EFFECT
	ld [hl],a ; store player move effect
	call PrintItemUseTextAndRemoveItem
	ld a,XSTATITEM_ANIM ; X stat item animation ID
	ld [W_PLAYERMOVENUM],a
	call LoadScreenTilesFromBuffer1 ; restore saved screen
	call Delay3
	xor a
	ld [H_WHOSETURN],a ; set turn to player's turn
	callba StatModifierUpEffect ; do stat increase move
	pop hl
	pop af
	ld [hld],a ; restore [W_PLAYERMOVEEFFECT]
	pop af
	ld [hl],a ; restore [W_PLAYERMOVENUM]
	ret

ItemUsePokeflute: ; e140 (3:6140)
	ld a,[W_ISINBATTLE]
	and a
	jr nz,.inBattle
; if not in battle
	call ItemUseReloadOverworldData
	ld a,[W_CURMAP]
	cp a,ROUTE_12
	jr nz,.notRoute12
	ld a,[wd7d8]
	bit 7,a ; has the player beaten Route 12 Snorlax yet?
	jr nz,.noSnorlaxToWakeUp
; if the player hasn't beaten Route 12 Snorlax
	ld hl,Route12SnorlaxFluteCoords
	call ArePlayerCoordsInArray
	jr nc,.noSnorlaxToWakeUp
	ld hl,PlayedFluteHadEffectText
	call PrintText
	ld hl,wd7d8
	set 6,[hl] ; trigger Snorlax fight (handled by map script)
	ret
.notRoute12
	cp a,ROUTE_16
	jr nz,.noSnorlaxToWakeUp
	ld a,[wd7e0]
	bit 1,a ; has the player beaten Route 16 Snorlax yet?
	jr nz,.noSnorlaxToWakeUp
; if the player hasn't beaten Route 16 Snorlax
	ld hl,Route16SnorlaxFluteCoords
	call ArePlayerCoordsInArray
	jr nc,.noSnorlaxToWakeUp
	ld hl,PlayedFluteHadEffectText
	call PrintText
	ld hl,wd7e0
	set 0,[hl] ; trigger Snorlax fight (handled by map script)
	ret
.noSnorlaxToWakeUp
	ld hl,PlayedFluteNoEffectText
	jp PrintText
.inBattle
	xor a
	ld [wWhichTrade],a ; initialize variable that indicates if any pokemon were woken up to zero
	ld b,~SLP & $FF
	ld hl,wPartyMon1Status
	call WakeUpEntireParty
	ld a,[W_ISINBATTLE]
	dec a ; is it a trainer battle?
	jr z,.skipWakingUpEnemyParty
; if it's a trainer battle
	ld hl,wEnemyMon1Status
	call WakeUpEntireParty
.skipWakingUpEnemyParty
	ld hl,wBattleMonStatus
	ld a,[hl]
	and b ; remove Sleep status
	ld [hl],a
	ld hl,wEnemyMonStatus
	ld a,[hl]
	and b ; remove Sleep status
	ld [hl],a
	call LoadScreenTilesFromBuffer2 ; restore saved screen
	ld a,[wWhichTrade]
	and a ; were any pokemon asleep before playing the flute?
	ld hl,PlayedFluteNoEffectText
	jp z,PrintText ; if no pokemon were asleep
; if some pokemon were asleep
	ld hl,PlayedFluteHadEffectText
	call PrintText
	ld a,[wd083]
	and a,$80
	jr nz,.skipMusic
	call WaitForSoundToFinish ; wait for sound to end
	callba Music_PokeFluteInBattle ; play in-battle pokeflute music
.musicWaitLoop ; wait for music to finish playing
	ld a,[wc02c]
	and a ; music off?
	jr nz,.musicWaitLoop
.skipMusic
	ld hl,FluteWokeUpText
	jp PrintText

; wakes up all party pokemon
; INPUT:
; hl must point to status of first pokemon in party (player's or enemy's)
; b must equal ~SLP
; [wWhichTrade] should be initialized to 0
; OUTPUT:
; [wWhichTrade]: set to 1 if any pokemon were asleep
WakeUpEntireParty: ; e1e5 (3:61e5)
	ld de,44
	ld c,6
.loop
	ld a,[hl]
	push af
	and a,SLP ; is pokemon asleep?
	jr z,.notAsleep
	ld a,1
	ld [wWhichTrade],a ; indicate that a pokemon had to be woken up
.notAsleep
	pop af
	and b ; remove Sleep status
	ld [hl],a
	add hl,de
	dec c
	jr nz,.loop
	ret

; Format:
; 00: Y
; 01: X
Route12SnorlaxFluteCoords: ; e1fd (3:61fd)
	db 62,9  ; one space West of Snorlax
	db 61,10 ; one space North of Snorlax
	db 63,10 ; one space South of Snorlax
	db 62,11 ; one space East of Snorlax
	db $ff ; terminator

; Format:
; 00: Y
; 01: X
Route16SnorlaxFluteCoords: ; e206 (3:6206)
	db 10,27 ; one space East of Snorlax
	db 10,25 ; one space West of Snorlax
	db $ff ; terminator

PlayedFluteNoEffectText: ; e20b (3:620b)
	TX_FAR _PlayedFluteNoEffectText
	db "@"

FluteWokeUpText: ; e210 (3:6210)
	TX_FAR _FluteWokeUpText
	db "@"

PlayedFluteHadEffectText: ; e215 (3:6215)
	TX_FAR _PlayedFluteHadEffectText
	db $06
	db $08
	ld a,[W_ISINBATTLE]
	and a
	jr nz,.done
; play out-of-battle pokeflute music
	ld a,$ff
	call PlaySound ; turn off music
	ld a, (SFX_02_5e - SFX_Headers_02) / 3
	ld c, BANK(SFX_02_5e)
	call PlayMusic ; play music
.musicWaitLoop ; wait for music to finish playing
	ld a,[wc028]
	cp a,$b8
	jr z,.musicWaitLoop
	call Func_2307 ; start playing normal music again
.done
	jp TextScriptEnd ; end text

ItemUseCoinCase: ; e23a (3:623a)
	ld a,[W_ISINBATTLE]
	and a
	jp nz,ItemUseNotTime
	ld hl,CoinCaseNumCoinsText
	jp PrintText

CoinCaseNumCoinsText: ; e247 (3:6247)
	TX_FAR _CoinCaseNumCoinsText
	db "@"

OldRodCode: ; e24c (3:624c)
	call FishingInit
	jp c, ItemUseNotTime
	ld bc, (5 << 8) | MAGIKARP
	ld a, $1 ; set bite
	jr RodResponse ; 0xe257 $34

GoodRodCode: ; e259 (3:6259)
	call FishingInit
	jp c,ItemUseNotTime
.RandomLoop
	call Random
	srl a
	jr c, .SetBite
	and %11
	cp 2
	jr nc, .RandomLoop
	; choose which monster appears
	ld hl,GoodRodMons
	add a,a
	ld c,a
	ld b,0
	add hl,bc
	ld b,[hl]
	inc hl
	ld c,[hl]
	and a
.SetBite
	ld a,0
	rla
	xor 1
	jr RodResponse

INCLUDE "data/good_rod.asm"

SuperRodCode: ; e283 (3:6283)
	call FishingInit
	jp c, ItemUseNotTime
	call ReadSuperRodData ; 0xe8ea
	ld a, e
RodResponse: ; e28d (3:628d)
	ld [wWhichTrade], a

	dec a ; is there a bite?
	jr nz, .next
	; if yes, store level and species data
	ld a, 1
	ld [W_MOVEMISSED], a
	ld a, b ; level
	ld [W_CURENEMYLVL], a
	ld a, c ; species
	ld [W_CUROPPONENT], a

.next
	ld hl, wd700
	ld a, [hl] ; store the value in a
	push af
	push hl
	ld [hl], 0
	callba Func_707b6
	pop hl
	pop af
	ld [hl], a
	ret

; checks if fishing is possible and if so, runs initialization code common to all rods
; unsets carry if fishing is possible, sets carry if not
FishingInit: ; e2b4 (3:62b4)
	ld a,[W_ISINBATTLE]
	and a
	jr z,.notInBattle
	scf ; can't fish during battle
	ret
.notInBattle
	call IsNextTileShoreOrWater
	ret c
	ld a,[wd700]
	cp a,2 ; Surfing?
	jr z,.surfing
	call ItemUseReloadOverworldData
	ld hl,ItemUseText00
	call PrintText
	ld a,(SFX_02_3e - SFX_Headers_02) / 3
	call PlaySound ; play sound
	ld c,80
	call DelayFrames
	and a
	ret
.surfing
	scf ; can't fish when surfing
	ret

ItemUseOaksParcel: ; e2de (3:62de)
	jp ItemUseNotYoursToUse

ItemUseItemfinder: ; e2e1 (3:62e1)
	ld a,[W_ISINBATTLE]
	and a
	jp nz,ItemUseNotTime
	call ItemUseReloadOverworldData
	callba HiddenItemNear ; check for hidden items
	ld hl,ItemfinderFoundNothingText
	jr nc,.printText ; if no hidden items
	ld c,4
.loop
	ld a,(SFX_02_4a - SFX_Headers_02) / 3
	call PlaySoundWaitForCurrent ; play sound
	ld a,(SFX_02_5a - SFX_Headers_02) / 3
	call PlaySoundWaitForCurrent ; play sound
	dec c
	jr nz,.loop
	ld hl,ItemfinderFoundItemText
.printText
	jp PrintText

ItemfinderFoundItemText: ; e30d (3:630d)
	TX_FAR _ItemfinderFoundItemText
	db "@"

ItemfinderFoundNothingText: ; e312 (3:6312)
	TX_FAR _ItemfinderFoundNothingText
	db "@"

ItemUsePPUp: ; e317 (3:6317)
	ld a,[W_ISINBATTLE]
	and a
	jp nz,ItemUseNotTime

ItemUsePPRestore: ; e31e (3:631e)
	ld a,[wWhichPokemon]
	push af
	ld a,[wcf91]
	ld [wWhichTrade],a
.chooseMon
	xor a
	ld [wcfcb],a
	ld a,$01 ; item use party menu
	ld [wd07d],a
	call DisplayPartyMenu
	jr nc,.chooseMove
	jp .itemNotUsed
.chooseMove
	ld a,[wWhichTrade]
	cp a,ELIXER
	jp nc,.useElixir ; if Elixir or Max Elixir
	ld a,$02
	ld [wMoveMenuType],a
	ld hl,RaisePPWhichTechniqueText
	ld a,[wWhichTrade]
	cp a,ETHER ; is it a PP Up?
	jr c,.printWhichTechniqueMessage ; if so, print the raise PP message
	ld hl,RestorePPWhichTechniqueText ; otherwise, print the restore PP message
.printWhichTechniqueMessage
	call PrintText
	xor a
	ld [wPlayerMoveListIndex],a
	callab MoveSelectionMenu ; move selection menu
	ld a,0
	ld [wPlayerMoveListIndex],a
	jr nz,.chooseMon
	ld hl,wPartyMon1Moves
	ld bc,44
	call GetSelectedMoveOffset
	push hl
	ld a,[hl]
	ld [wd11e],a
	call GetMoveName
	call CopyStringToCF4B ; copy name to wcf4b
	pop hl
	ld a,[wWhichTrade]
	cp a,ETHER
	jr nc,.useEther ; if Ether or Max Ether
.usePPUp
	ld bc,21
	add hl,bc
	ld a,[hl] ; move PP
	cp a,3 << 6 ; have 3 PP Ups already been used?
	jr c,.PPNotMaxedOut
	ld hl,PPMaxedOutText
	call PrintText
	jr .chooseMove
.PPNotMaxedOut
	ld a,[hl]
	add a,1 << 6 ; increase PP Up count by 1
	ld [hl],a
	ld a,1 ; 1 PP Up used
	ld [wd11e],a
	call RestoreBonusPP ; add the bonus PP to current PP
	ld hl,PPIncreasedText
	call PrintText
.done
	pop af
	ld [wWhichPokemon],a
	call GBPalWhiteOut
	call GoPAL_SET_CF1C
	jp RemoveUsedItem
.afterRestoringPP ; after using a (Max) Ether/Elixir
	ld a,[wWhichPokemon]
	ld b,a
	ld a,[wPlayerMonNumber]
	cp b ; is the pokemon whose PP was restored active in battle?
	jr nz,.skipUpdatingInBattleData
	ld hl,wPartyMon1PP
	ld bc,44
	call AddNTimes
	ld de,wBattleMonPP
	ld bc,4
	call CopyData ; copy party data to in-battle data
.skipUpdatingInBattleData
	ld a,(SFX_02_3e - SFX_Headers_02) / 3
	call PlaySound
	ld hl,PPRestoredText
	call PrintText
	jr .done
.useEther
	call .restorePP
	jr nz,.afterRestoringPP
	jp .noEffect
; unsets zero flag if PP was restored, sets zero flag if not
; however, this is bugged for Max Ethers and Max Elixirs (see below)
.restorePP
	xor a
	ld [wcc49],a ; party pokemon
	call GetMaxPP
	ld hl,wPartyMon1Moves
	ld bc,44
	call GetSelectedMoveOffset
	ld bc,21
	add hl,bc ; hl now points to move's PP
	ld a,[wd11e]
	ld b,a ; b = max PP
	ld a,[wWhichTrade]
	cp a,MAX_ETHER
	jr z,.fullyRestorePP
	ld a,[hl] ; move PP
	and a,%00111111 ; lower 6 bit bits store current PP
	cp b ; does current PP equal max PP?
	ret z ; if so, return
	add a,10 ; increase current PP by 10
; b holds the max PP amount and b will hold the new PP amount.
; So, if the new amount meets or exceeds the max amount,
; cap the amount to the max amount by leaving b unchanged.
; Otherwise, store the new amount in b.
	cp b ; does the new amount meet or exceed the maximum?
	jr nc,.storeNewAmount
	ld b,a
.storeNewAmount
	ld a,[hl] ; move PP
	and a,%11000000 ; PP Up counter bits
	add b
	ld [hl],a
	ret
.fullyRestorePP
	ld a,[hl] ; move PP
; Note that this code has a bug. It doesn't mask out the upper two bits, which
; are used to count how many PP Ups have been used on the move. So, Max Ethers
; and Max Elixirs will not be detected as having no effect on a move with full
; PP if the move has had any PP Ups used on it.
	cp b ; does current PP equal max PP?
	ret z
	jr .storeNewAmount
.useElixir
; decrement the item ID so that ELIXER becomes ETHER and MAX_ELIXER becomes MAX_ETHER
	ld hl,wWhichTrade
	dec [hl]
	dec [hl]
	xor a
	ld hl,wCurrentMenuItem
	ld [hli],a
	ld [hl],a ; zero the counter for number of moves that had their PP restored
	ld b,4
; loop through each move and restore PP
.elixirLoop
	push bc
	ld hl,wPartyMon1Moves
	ld bc,44
	call GetSelectedMoveOffset
	ld a,[hl]
	and a ; does the current slot have a move?
	jr z,.nextMove
	call .restorePP
	jr z,.nextMove
; if some PP was restored
	ld hl,wTileBehindCursor ; counter for number of moves that had their PP restored
	inc [hl]
.nextMove
	ld hl,wCurrentMenuItem
	inc [hl]
	pop bc
	dec b
	jr nz,.elixirLoop
	ld a,[wTileBehindCursor]
	and a ; did any moves have their PP restored?
	jp nz,.afterRestoringPP
.noEffect
	call ItemUseNoEffect
.itemNotUsed
	call GBPalWhiteOut
	call GoPAL_SET_CF1C
	pop af
	xor a
	ld [wcd6a],a ; item use failed
	ret

RaisePPWhichTechniqueText: ; e45d (3:645d)
	TX_FAR _RaisePPWhichTechniqueText
	db "@"

RestorePPWhichTechniqueText: ; e462 (3:6462)
	TX_FAR _RestorePPWhichTechniqueText
	db "@"

PPMaxedOutText: ; e467 (3:6467)
	TX_FAR _PPMaxedOutText
	db "@"

PPIncreasedText: ; e46c (3:646c)
	TX_FAR _PPIncreasedText
	db "@"

PPRestoredText: ; e471 (3:6471)
	TX_FAR _PPRestoredText
	db "@"

; for items that can't be used from the Item menu
UnusableItem: ; e476 (3:6476)
	jp ItemUseNotTime

ItemUseTMHM: ; e479 (3:6479)
	ld a,[W_ISINBATTLE]
	and a
	jp nz,ItemUseNotTime
	ld a,[wcf91]
	sub a,TM_01
	push af
	jr nc,.skipAdding
	add a,55 ; if item is an HM, add 55
.skipAdding
	inc a
	ld [wd11e],a
	predef TMToMove ; get move ID from TM/HM ID
	ld a,[wd11e]
	ld [wd0e0],a
	call GetMoveName
	call CopyStringToCF4B ; copy name to wcf4b
	pop af
	ld hl,BootedUpTMText
	jr nc,.printBootedUpMachineText
	ld hl,BootedUpHMText
.printBootedUpMachineText
	call PrintText
	ld hl,TeachMachineMoveText
	call PrintText
	FuncCoord 14,7
	ld hl,Coord
	ld bc,$080f
	ld a,$14
	ld [wd125],a
	call DisplayTextBoxID ; yes/no menu
	ld a,[wCurrentMenuItem]
	and a
	jr z,.useMachine
	ld a,2
	ld [wcd6a],a ; item not used
	ret
.useMachine
	ld a,[wWhichPokemon]
	push af
	ld a,[wcf91]
	push af
.chooseMon
	ld hl,wcf4b
	ld de,wd036
	ld bc,14
	call CopyData
	ld a,$ff
	ld [wcfcb],a
	ld a,$03 ; teach TM/HM party menu
	ld [wd07d],a
	call DisplayPartyMenu
	push af
	ld hl,wd036
	ld de,wcf4b
	ld bc,14
	call CopyData
	pop af
	jr nc,.checkIfAbleToLearnMove
; if the player canceled teaching the move
	pop af
	pop af
	call GBPalWhiteOutWithDelay3
	call ClearSprites
	call GoPAL_SET_CF1C
	jp LoadScreenTilesFromBuffer1 ; restore saved screen
.checkIfAbleToLearnMove
	predef CanLearnTM ; check if the pokemon can learn the move
	push bc
	ld a,[wWhichPokemon]
	ld hl,wPartyMonNicks
	call GetPartyMonName
	pop bc
	ld a,c
	and a ; can the pokemon learn the move?
	jr nz,.checkIfAlreadyLearnedMove
; if the pokemon can't learn the move
	ld a,(SFX_02_51 - SFX_Headers_02) / 3
	call PlaySoundWaitForCurrent ; play sound
	ld hl,MonCannotLearnMachineMoveText
	call PrintText
	jr .chooseMon
.checkIfAlreadyLearnedMove
	callab CheckIfMoveIsKnown ; check if the pokemon already knows the move
	jr c,.chooseMon
	predef LearnMove ; teach move
	pop af
	ld [wcf91],a
	pop af
	ld [wWhichPokemon],a
	ld a,b
	and a
	ret z
	ld a,[wcf91]
	call IsItemHM
	ret c
	jp RemoveUsedItem

BootedUpTMText: ; e54f (3:654f)
	TX_FAR _BootedUpTMText
	db "@"

BootedUpHMText: ; e554 (3:6554)
	TX_FAR _BootedUpHMText
	db "@"

TeachMachineMoveText: ; e559 (3:6559)
	TX_FAR _TeachMachineMoveText
	db "@"

MonCannotLearnMachineMoveText: ; e55e (3:655e)
	TX_FAR _MonCannotLearnMachineMoveText
	db "@"

PrintItemUseTextAndRemoveItem: ; e563 (3:6563)
	ld hl,ItemUseText00
	call PrintText
	ld a,(SFX_02_3e - SFX_Headers_02) / 3
	call PlaySound ; play sound
	call WaitForTextScrollButtonPress ; wait for button press

RemoveUsedItem: ; e571 (3:6571)
	ld hl,wNumBagItems
	ld a,1 ; one item
	ld [wcf96],a ; store quantity
	jp RemoveItemFromInventory

ItemUseNoEffect: ; e57c (3:657c)
	ld hl,ItemUseNoEffectText
	jr ItemUseFailed

ItemUseNotTime: ; e581 (3:6581)
	ld hl,ItemUseNotTimeText
	jr ItemUseFailed

ItemUseNotYoursToUse: ; e586 (3:6586)
	ld hl,ItemUseNotYoursToUseText
	jr ItemUseFailed

ThrowBallAtTrainerMon: ; e58b (3:658b)
	call GoPAL_SET_CF1C
	call LoadScreenTilesFromBuffer1 ; restore saved screen
	call Delay3
	ld a,TOSS_ANIM
	ld [W_ANIMATIONID],a
	predef MoveAnimation ; do animation
	ld hl,ThrowBallAtTrainerMonText1
	call PrintText
	ld hl,ThrowBallAtTrainerMonText2
	call PrintText
	jr RemoveUsedItem

NoCyclingAllowedHere: ; e5ac (3:65ac)
	ld hl,NoCyclingAllowedHereText
	jr ItemUseFailed

BoxFullCannotThrowBall: ; e5b1 (3:65b1)
	ld hl,BoxFullCannotThrowBallText
	jr ItemUseFailed

SurfingAttemptFailed: ; e5b6 (3:65b6)
	ld hl,NoSurfingHereText

ItemUseFailed: ; e5b9 (3:65b9)
	xor a
	ld [wcd6a],a ; item use failed
	jp PrintText

ItemUseNotTimeText: ; e5c0 (3:65c0)
	TX_FAR _ItemUseNotTimeText
	db "@"

ItemUseNotYoursToUseText: ; e5c5 (3:65c5)
	TX_FAR _ItemUseNotYoursToUseText
	db "@"

ItemUseNoEffectText: ; e5ca (3:65ca)
	TX_FAR _ItemUseNoEffectText
	db "@"

ThrowBallAtTrainerMonText1: ; e5cf (3:65cf)
	TX_FAR _ThrowBallAtTrainerMonText1
	db "@"

ThrowBallAtTrainerMonText2: ; e5d4 (3:65d4)
	TX_FAR _ThrowBallAtTrainerMonText2
	db "@"

NoCyclingAllowedHereText: ; e5d9 (3:65d9)
	TX_FAR _NoCyclingAllowedHereText
	db "@"

NoSurfingHereText: ; e5de (3:65de)
	TX_FAR _NoSurfingHereText
	db "@"

BoxFullCannotThrowBallText: ; e5e3 (3:65e3)
	TX_FAR _BoxFullCannotThrowBallText
	db "@"

ItemUseText00: ; e5e8 (3:65e8)
	TX_FAR _ItemUseText001
	db $05
	TX_FAR _ItemUseText002
	db "@"

GotOnBicycleText: ; e5f2 (3:65f2)
	TX_FAR _GotOnBicycleText1
	db $05
	TX_FAR _GotOnBicycleText2
	db "@"

GotOffBicycleText: ; e5fc (3:65fc)
	TX_FAR _GotOffBicycleText1
	db $05
	TX_FAR _GotOffBicycleText2
	db "@"

; restores bonus PP (from PP Ups) when healing at a pokemon center
; also, when a PP Up is used, it increases the current PP by one PP Up bonus
; INPUT:
; [wWhichPokemon] = index of pokemon in party
; [wd11e] = mode
; 0: Pokemon Center healing
; 1: using a PP Up
; [wCurrentMenuItem] = index of move (when using a PP Up)
RestoreBonusPP: ; e606 (3:6606)
	ld hl,wPartyMon1Moves
	ld bc,44
	ld a,[wWhichPokemon]
	call AddNTimes
	push hl
	ld de,wcd78 - 1
	predef LoadMovePPs ; loads the normal max PP of each of the pokemon's moves to wcd78
	pop hl
	ld c,21
	ld b,0
	add hl,bc ; hl now points to move 1 PP
	ld de,wcd78
	ld b,0 ; initialize move counter to zero
; loop through the pokemon's moves
.loop
	inc b
	ld a,b
	cp a,5 ; reached the end of the pokemon's moves?
	ret z ; if so, return
	ld a,[wd11e]
	dec a ; using a PP Up?
	jr nz,.skipMenuItemIDCheck
; if using a PP Up, check if this is the move it's being used on
	ld a,[wCurrentMenuItem]
	inc a
	cp b
	jr nz,.nextMove
.skipMenuItemIDCheck
	ld a,[hl]
	and a,%11000000 ; have any PP Ups been used?
	call nz,AddBonusPP ; if so, add bonus PP
.nextMove
	inc hl
	inc de
	jr .loop

; adds bonus PP from PP Ups to current PP
; 1/5 of normal max PP (capped at 7) is added for each PP Up
; INPUT:
; [de] = normal max PP
; [hl] = move PP
; [wd11e] = max number of times to add bonus
; set to 1 when using a PP Up, set to 255 otherwise
AddBonusPP: ; e642 (3:6642)
	push bc
	ld a,[de] ; normal max PP of move
	ld [H_DIVIDEND + 3],a
	xor a
	ld [H_DIVIDEND],a
	ld [H_DIVIDEND + 1],a
	ld [H_DIVIDEND + 2],a
	ld a,5
	ld [H_DIVISOR],a
	ld b,4
	call Divide
	ld a,[hl] ; move PP
	ld b,a
	swap a
	and a,%00001111
	srl a
	srl a
	ld c,a ; c = number of PP Ups used
.loop
	ld a,[H_QUOTIENT + 3]
	cp a,8 ; is the amount greater than or equal to 8?
	jr c,.addAmount
	ld a,7 ; cap the amount at 7
.addAmount
	add b
	ld b,a
	ld a,[wd11e]
	dec a
	jr z,.done
	dec c
	jr nz,.loop
.done
	ld [hl],b
	pop bc
	ret

; gets max PP of a pokemon's move (including PP from PP Ups)
; INPUT:
; [wWhichPokemon] = index of pokemon within party/box
; [wcc49] = pokemon source
; 00: player's party
; 01: enemy's party
; 02: current box
; 03: daycare
; 04: player's in-battle pokemon
; [wCurrentMenuItem] = move index
; OUTPUT:
; [wd11e] = max PP
GetMaxPP: ; e677 (3:6677)
	ld a,[wcc49]
	and a
	ld hl,wPartyMon1Moves
	ld bc,wPartyMon2 - wPartyMon1
	jr z,.sourceWithMultipleMon
	ld hl,wEnemyMon1Moves
	dec a
	jr z,.sourceWithMultipleMon
	ld hl,wBoxMon1Moves
	ld bc,wBoxMon2 - wBoxMon1
	dec a
	jr z,.sourceWithMultipleMon
	ld hl,wDayCareMonMoves
	dec a
	jr z,.sourceWithOneMon
	ld hl,wBattleMonMoves ; player's in-battle pokemon
.sourceWithOneMon
	call GetSelectedMoveOffset2
	jr .next
.sourceWithMultipleMon
	call GetSelectedMoveOffset
.next
	ld a,[hl]
	dec a
	push hl
	ld hl,Moves
	ld bc,6
	call AddNTimes
	ld de,wcd6d
	ld a,BANK(Moves)
	call FarCopyData
	ld de,wcd72
	ld a,[de]
	ld b,a ; b = normal max PP
	pop hl
	push bc
	ld bc,21 ; PP offset if not player's in-battle pokemon data
	ld a,[wcc49]
	cp a,4 ; player's in-battle pokemon?
	jr nz,.addPPOffset
	ld bc,17 ; PP offset if player's in-battle pokemon data
.addPPOffset
	add hl,bc
	ld a,[hl] ; a = current PP
	and a,%11000000 ; get PP Up count
	pop bc
	or b ; place normal max PP in 6 lower bits of a
	ld h,d
	ld l,e
	inc hl ; hl = wcd73
	ld [hl],a
	xor a
	ld [wd11e],a ; no limit on PP Up amount
	call AddBonusPP ; add bonus PP from PP Ups
	ld a,[hl]
	and a,%00111111 ; mask out the PP Up count
	ld [wd11e],a ; store max PP
	ret

GetSelectedMoveOffset: ; e6e3 (3:66e3)
	ld a,[wWhichPokemon]
	call AddNTimes

GetSelectedMoveOffset2: ; e6e9 (3:66e9)
	ld a,[wCurrentMenuItem]
	ld c,a
	ld b,0
	add hl,bc
	ret

; confirms the item toss and then tosses the item
; INPUT:
; hl = address of inventory (either wNumBagItems or wNumBoxItems)
; [wcf91] = item ID
; [wWhichPokemon] = index of item within inventory
; [wcf96] = quantity to toss
; OUTPUT:
; clears carry flag if the item is tossed, sets carry flag if not
TossItem_: ; e6f1 (3:66f1)
	push hl
	ld a,[wcf91]
	call IsItemHM
	pop hl
	jr c,.tooImportantToToss
	push hl
	call IsKeyItem_
	ld a,[wd124]
	pop hl
	and a
	jr nz,.tooImportantToToss
	push hl
	ld a,[wcf91]
	ld [wd11e],a
	call GetItemName
	call CopyStringToCF4B ; copy name to wcf4b
	ld hl,IsItOKToTossItemText
	call PrintText
	FuncCoord 14,7
	ld hl,Coord
	ld bc,$080f
	ld a,$14
	ld [wd125],a
	call DisplayTextBoxID ; yes/no menu
	ld a,[wd12e]
	cp a,2
	pop hl
	scf
	ret z
; if the player chose Yes
	push hl
	ld a,[wWhichPokemon]
	call RemoveItemFromInventory
	ld a,[wcf91]
	ld [wd11e],a
	call GetItemName
	call CopyStringToCF4B ; copy name to wcf4b
	ld hl,ThrewAwayItemText
	call PrintText
	pop hl
	and a
	ret
.tooImportantToToss
	push hl
	ld hl,TooImportantToTossText
	call PrintText
	pop hl
	scf
	ret

ThrewAwayItemText: ; e755 (3:6755)
	TX_FAR _ThrewAwayItemText
	db "@"

IsItOKToTossItemText: ; e75a (3:675a)
	TX_FAR _IsItOKToTossItemText
	db "@"

TooImportantToTossText: ; e75f (3:675f)
	TX_FAR _TooImportantToTossText
	db "@"

; checks if an item is a key item
; INPUT:
; [wcf91] = item ID
; OUTPUT:
; [wd124] = result
; 00: item is not key item
; 01: item is key item
IsKeyItem_: ; e764 (3:6764)
	ld a,$01
	ld [wd124],a
	ld a,[wcf91]
	cp a,HM_01 ; is the item an HM or TM?
	jr nc,.checkIfItemIsHM
; if the item is not an HM or TM
	push af
	ld hl,KeyItemBitfield
	ld de,wHPBarMaxHP
	ld bc,15 ; only 11 bytes are actually used
	call CopyData
	pop af
	dec a
	ld c,a
	ld hl,wHPBarMaxHP
	ld b,$02 ; test bit
	predef FlagActionPredef ; bitfield operation function
	ld a,c
	and a
	ret nz
.checkIfItemIsHM
	ld a,[wcf91]
	call IsItemHM
	ret c
	xor a
	ld [wd124],a
	ret

INCLUDE "data/key_items.asm"

Func_e7a4: ; e7a4 (3:67a4)
	ld de, W_NUMINBOX ; wda80
	ld a, [de]
	inc a
	ld [de], a
	ld a, [wcf91]
	ld [wd0b5], a
	ld c, a
.asm_e7b1
	inc de
	ld a, [de]
	ld b, a
	ld a, c
	ld c, b
	ld [de], a
	cp $ff
	jr nz, .asm_e7b1
	call GetMonHeader
	ld hl, wBoxMonOT
	ld bc, $b
	ld a, [W_NUMINBOX] ; wda80
	dec a
	jr z, .asm_e7ee
	dec a
	call AddNTimes
	push hl
	ld bc, $b
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld a, [W_NUMINBOX] ; wda80
	dec a
	ld b, a
.asm_e7db
	push bc
	push hl
	ld bc, $b
	call CopyData
	pop hl
	ld d, h
	ld e, l
	ld bc, $fff5
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_e7db
.asm_e7ee
	ld hl, wPlayerName ; wd158
	ld de, wBoxMonOT
	ld bc, $b
	call CopyData
	ld a, [W_NUMINBOX] ; wda80
	dec a
	jr z, .asm_e82a
	ld hl, wBoxMonNicks
	ld bc, $b
	dec a
	call AddNTimes
	push hl
	ld bc, $b
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld a, [W_NUMINBOX] ; wda80
	dec a
	ld b, a
.asm_e817
	push bc
	push hl
	ld bc, $b
	call CopyData
	pop hl
	ld d, h
	ld e, l
	ld bc, $fff5
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_e817
.asm_e82a
	ld hl, wBoxMonNicks
	ld a, $2
	ld [wd07d], a
	predef AskName
	ld a, [W_NUMINBOX] ; wda80
	dec a
	jr z, .asm_e867
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
	ld a, [W_NUMINBOX] ; wda80
	dec a
	ld b, a
.asm_e854
	push bc
	push hl
	ld bc, wBoxMon2 - wBoxMon1
	call CopyData
	pop hl
	ld d, h
	ld e, l
	ld bc, $ffdf
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_e854
.asm_e867
	ld a, [wEnemyMonLevel] ; wEnemyMonLevel
	ld [wEnemyMonBoxLevel], a
	ld hl, wEnemyMon
	ld de, wBoxMon1
	ld bc, $c
	call CopyData
	ld hl, wPlayerID ; wPlayerID
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	push de
	ld a, [W_CURENEMYLVL] ; W_CURENEMYLVL
	ld d, a
	callab CalcExperience
	pop de
	ld a, [H_NUMTOPRINT] ; $ff96 (aliases: H_MULTIPLICAND)
	ld [de], a
	inc de
	ld a, [$ff97]
	ld [de], a
	inc de
	ld a, [$ff98]
	ld [de], a
	inc de
	xor a
	ld b, $a
.asm_e89f
	ld [de], a
	inc de
	dec b
	jr nz, .asm_e89f
	ld hl, wEnemyMonDVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld hl, wEnemyMonPP ; wcffe
	ld b, $4
.asm_e8b1
	ld a, [hli]
	inc de
	ld [de], a
	dec b
	jr nz, .asm_e8b1
	ret

; checks if the tile in front of the player is a shore or water tile
; used for surfing and fishing
; unsets carry if it is, sets carry if not
IsNextTileShoreOrWater: ; e8b8 (3:68b8)
	ld a, [W_CURMAPTILESET]
	ld hl, WaterTilesets
	ld de,1
	call IsInArray
	jr nc, .notShoreOrWater
	ld a, [W_CURMAPTILESET]
	cp SHIP_PORT ; Vermilion Dock tileset
	ld a, [wcfc6] ; tile in front of player
	jr z, .skipShoreTiles ; if it's the Vermilion Dock tileset
	cp $48 ; eastern shore tile in Safari Zone
	jr z, .shoreOrWater
	cp $32 ; usual eastern shore tile
	jr z, .shoreOrWater
.skipShoreTiles
	cp $14 ; water tile
	jr z, .shoreOrWater
.notShoreOrWater
	scf
	ret
.shoreOrWater
	and a
	ret

; tilesets with water
WaterTilesets: ; e8e0 (3:68e0)
	db OVERWORLD, FOREST, DOJO, GYM, SHIP, SHIP_PORT, CAVERN, FACILITY, PLATEAU
	db $ff ; terminator

ReadSuperRodData: ; e8ea (3:68ea)
; return e = 2 if no fish on this map
; return e = 1 if a bite, bc = level,species
; return e = 0 if no bite
	ld a, [W_CURMAP]
	ld de, 3 ; each fishing group is three bytes wide
	ld hl, SuperRodData
	call IsInArray
	jr c, .ReadFishingGroup
	ld e, $2 ; $2 if no fishing groups found
	ret

.ReadFishingGroup ; 0xe8f6
; hl points to the fishing group entry in the index
	inc hl ; skip map id

	; read fishing group address
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld b, [hl] ; how many mons in group
	inc hl ; point to data
	ld e, $0 ; no bite yet

.RandomLoop ; 0xe90c
	call Random
	srl a
	ret c ; 50% chance of no battle

	and %11 ; 2-bit random number
	cp b
	jr nc, .RandomLoop ; if a is greater than the number of mons, regenerate

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

INCLUDE "data/super_rod.asm"

; reloads map view and processes sprite data
; for items that cause the overworld to be displayed
ItemUseReloadOverworldData: ; e9c5 (3:69c5)
	call LoadCurrentMapView
	jp UpdateSprites

Func_e9cb: ; e9cb (3:69cb)
	ld hl, WildDataPointers ; $4eeb
	ld de, wHPBarMaxHP
	ld c, $0
.asm_e9d3
	inc hl
	ld a, [hld]
	inc a
	jr z, .asm_e9ec
	push hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	and a
	call nz, Func_e9f0
	ld a, [hli]
	and a
	call nz, Func_e9f0
	pop hl
	inc hl
	inc hl
	inc c
	jr .asm_e9d3
.asm_e9ec
	ld a, $ff
	ld [de], a
	ret

Func_e9f0: ; e9f0 (3:69f0)
	inc hl
	ld b, $a
.asm_e9f3
	ld a, [wd11e]
	cp [hl]
	jr nz, .asm_e9fc
	ld a, c
	ld [de], a
	inc de
.asm_e9fc
	inc hl
	inc hl
	dec b
	jr nz, .asm_e9f3
	dec hl
	ret
