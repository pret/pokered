; PureRGBnote: FIXED: function to redraw the party menu without any bottom box text, used to avoid minor graphical glitches
EmptyPartyMenuRedraw::
	hlcoord 11, 11
	lb bc, 1, 9
	call ClearScreenArea
	ld a, EMPTY_PARTY_MENU ; new party menu text option - it just displays no text in the bottom box since we'll be writing there immediately
	ld [wPartyMenuTypeOrMessageID], a
	call RedrawPartyMenu 
	xor a ; NORMAL_PARTY_MENU
	ld [wPartyMenuTypeOrMessageID], a
	ret

; PureRGBnote: FIXED: MOVED: This code was moved from Battle Core, and now correctly redraws ghost sprites if we're facing an unidentified ghost.
; It also correctly minimizes/substitutes the opponent if they were minimized/substituted.
ReloadEnemyMonPicAfterStatusScreen::
	ld a, [wEnemyBattleStatus2]
	bit HAS_SUBSTITUTE_UP, a ; does the enemy mon have a substitute?
	ld hl, AnimationSubstituteEnemyMon
	jr nz, .doEnemyMonAnimation
; enemy mon doesn't have substitute
	ld a, [wEnemyMonMinimized]
	and a ; has the enemy mon used Minimise?
	ld hl, AnimationMinimizeEnemyMon
	jr nz, .doEnemyMonAnimation
; enemy mon isn't minimized
	call CheckShouldReloadGhostSprite
	jr c, LoadGhostSprite
; enemy mon is showing normally
	ld a, [wEnemyMonSpecies]
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	call GetMonHeader
	ld de, vFrontPic
	jp LoadMonFrontSprite
.doEnemyMonAnimation
	ld b, BANK(AnimationSubstituteEnemyMon) ; BANK(AnimationMinimizeEnemyMon)
	rst _Bankswitch
	ret ; enemy mon pic has been reloaded, so return to the party menu

; PureRGBnote: MOVED: out of core battle engine. Makes it easier to reload this pic when coming back from the status screen in the above subroutines.
LoadGhostData::
	ld a, MON_GHOST
	ld [wNamedObjectIndex], a
	call GetMonName
	ld hl, wNameBuffer
	ld de, wEnemyMonNick  ; set name to "GHOST"
	ld bc, NAME_LENGTH
	rst _CopyData
	; fall through
LoadGhostSprite:
	ld hl, wMonHSpriteDim
	ld a, $66
	ld [hli], a   ; write sprite dimensions
	ld bc, GhostPic
	ld a, c
	ld [hli], a   ; write front sprite pointer
	ld [hl], b
	ld a, [wCurPartySpecies]
	push af
	ld a, MON_GHOST
	ld [wCurPartySpecies], a
	ld de, vFrontPic
	call LoadMonFrontSprite ; load ghost sprite
	pop af
	ld [wCurPartySpecies], a
	ret

CheckShouldLoadGhostSprite::
	ld a, [wCurOpponent]
	cp RESTLESS_SOUL
	jr z, CheckShouldReloadGhostSprite.yes
	; fall through
CheckShouldReloadGhostSprite::
	callfar IsGhostBattle
	jr nz, .no
.yes
	scf
	ret
.no
	and a
	ret

; PureRGBnote: MOVED: Since this code is getting more complicated move it out of core battle engine bank.
; output:
; carry flag: whether the move gets stab or not
; [wMoveType] will contain the move's type
; de will contain the defending mon's types
ShouldMoveGetStabBoost::
; values for player turn
	ld hl, wBattleMonType
	ld a, [hli]
	ld b, a    ; b = type 1 of attacker
	ld c, [hl] ; c = type 2 of attacker
	ld hl, wEnemyMonType
	ld a, [hli]
	ld d, a    ; d = type 1 of defender
	ld e, [hl] ; e = type 2 of defender
	ld a, [wPlayerMoveType]
	ld [wMoveType], a
	ldh a, [hWhoseTurn]
	and a
	jr z, .next
; values for enemy turn
	ld hl, wEnemyMonType
	ld a, [hli]
	ld b, a    ; b = type 1 of attacker
	ld c, [hl] ; c = type 2 of attacker
	ld hl, wBattleMonType
	ld a, [hli]
	ld d, a    ; d = type 1 of defender
	ld e, [hl] ; e = type 2 of defender
	ld a, [wEnemyMoveType]
	ld [wMoveType], a
.next
	ld a, [wMoveType]
	cp b ; does the move type match type 1 of the attacker?
	jr z, .sameTypeAttackBonus
	cp c ; does the move type match type 2 of the attacker?
	jr z, .sameTypeAttackBonus
;;;;;;;;;; PureRGBnote: ADDED: some special types pokemon get STAB on other type attacks
	cp GROUND
	jr z, .checkMagmaStab
	cp ROCK
	jr z, .checkCrystalStab
	cp BONEMERANG_TYPE
	jr z, .checkGroundStab
	cp TRI
	jr nz, .skipSameTypeAttackBonus
	ld a, NORMAL ; TRI type moves get stab on normal-type pokemon (porygon)
	jr .checkAlternateStab
.checkMagmaStab
	ld a, MAGMA ; GROUND type moves get stab on magma-type pokemon (volcanic magmar)
	jr .checkAlternateStab
.checkCrystalStab
	ld a, CRYSTAL ; ROCK type moves still get STAB for CRYSTAL type pokemon (hardened onix)
	jr .checkAlternateStab
.checkGroundStab
	ld a, GROUND ; bonemerang-type moves get STAB on ground pokemon (only used with bonemerang)
.checkAlternateStab
	cp b ; does a match type 1 of the attacker?
	jr z, .sameTypeAttackBonus
	cp c ; does a match type 2 of the attacker?
	jr nz, .skipSameTypeAttackBonus
;;;;;;;;;;;

.sameTypeAttackBonus
	scf
	ret
.skipSameTypeAttackBonus
	and a
	ret



	const_def
	const RED_BACK_PIC
	const OLD_MAN_BACK_PIC
	const LAVA_SUIT_BACK_PIC
	const SCUBA_SUIT_BACK_PIC

; PureRGBnote: MOVED: CHANGED: Moved out of core battle engine bank and simplified the code with a jump table. 
; loads either red back pic or old man back pic
; also writes OAM data and loads tile patterns for the Red or Old Man back sprite's head
; (for use when scrolling the player sprite and enemy's silhouettes on screen)
LoadPlayerBackPic::
;;;;;;;;;; PureRGBnote: ADDED: choose between the original back sprite for the player or the high res one
	ld a, [wSpriteOptions2]
	bit BIT_BACK_SPRITES, a
	ld hl, OriginalBackPicTable
	jr z, .gotSpriteTable
	ld hl, SpaceworldBackPicTable
.gotSpriteTable
	ld a, [wCurMapTileset]
	cp VOLCANO
	ld a, LAVA_SUIT_BACK_PIC
	jr z, .getBackSpriteData
	CheckEvent EVENT_DRAGONAIR_EVENT_BATTLING_CLOYSTER
	ld a, SCUBA_SUIT_BACK_PIC
	jr nz, .getBackSpriteData
	ld a, [wBattleType]
	dec a ; is it the old man tutorial?
	ld a, OLD_MAN_BACK_PIC
	jr z, .getBackSpriteData
	ld a, RED_BACK_PIC
.getBackSpriteData
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	add hl, de
	de_deref
	inc hl	
	ld a, [hl]
	call UncompressSpriteFromDE
	ld a, [wSpriteOptions2]
	bit BIT_BACK_SPRITES, a
	jr nz, .uncompressed
.doubleSpriteSize
	predef ScaleSpriteByTwo
	jr .next
.uncompressed
	callfar LoadBackSpriteUnzoomed
.next
	ld hl, wShadowOAM
	xor a
	ldh [hOAMTile], a ; initial tile number
	ld b, $7 ; 7 columns
	ld e, $a0 ; X for the left-most column
.loop ; each loop iteration writes 3 OAM entries in a vertical column
	ld c, $3 ; 3 tiles per column
	ld d, $38 ; Y for the top of each column
.innerLoop ; each loop iteration writes 1 OAM entry in the column
	ld a, d
	ld [hli], a ; OAM Y
	ld [hl], e ; OAM X
	ld a, $8 ; height of tile
	add d ; increase Y by height of tile
	ld d, a
	inc hl
	ldh a, [hOAMTile]
	ld [hli], a ; OAM tile number
	inc a ; increment tile number
	ldh [hOAMTile], a
	;;;;; shinpokerednote: gbcnote: load correct palette for hat object
	ld a, 2
	ld [hli], a
	;;;;;
	dec c
	jr nz, .innerLoop
	ldh a, [hOAMTile]
	add $4 ; increase tile number by 4
	ldh [hOAMTile], a
	ld a, $8 ; width of tile
	add e ; increase X by width of tile
	ld e, a
	dec b
	jr nz, .loop
;;;;;;;;;; PureRGBnote: ADDED: in the case of high res sprites we dont need to run the interlace code
	ld a, [wSpriteOptions2]
	bit BIT_BACK_SPRITES, a
	jr nz, .nextFinish
.ogSpriteRoutine
;;;;;;;;;;
	ld de, vBackPic
	call InterlaceMergeSpriteBuffers
.nextFinish
	ld a, $a
	ld [MBC1SRamEnable], a
	xor a
	ld [MBC1SRamBank], a
	ld hl, vSprites
	ld de, sSpriteBuffer1
	ldh a, [hLoadedROMBank]
	ld b, a
	ld c, 7 * 7
	call CopyVideoData
	xor a
	ld [MBC1SRamEnable], a
	ld a, $31
	ldh [hStartTileID], a
	hlcoord 1, 5
	predef_jump CopyUncompressedPicToTilemap

SpaceworldBackPicTable:
	dwb RedPicBackSW, BANK(RedPicBackSW)
	dwb OldManPicBackSW, BANK(OldManPicBackSW)
	dwb LavaSuitBattlePicSW, BANK(LavaSuitBattlePicSW)
	dwb ScubaSuitBattlePicSW, BANK(ScubaSuitBattlePicSW)

OriginalBackPicTable:
	dwb RedPicBack, BANK(RedPicBack)
	dwb OldManPicBack, BANK(OldManPicBack)
	dwb LavaSuitBattlePic, BANK(LavaSuitBattlePic)
	dwb ScubaSuitBattlePic, BANK(ScubaSuitBattlePic)
