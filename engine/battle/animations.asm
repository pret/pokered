; Draws a "frame block". Frame blocks are blocks of tiles that are put
; together to form frames in battle animations.
DrawFrameBlock:
	ld l, c
	ld h, b
	ld a, [hli]
	ld [wNumFBTiles], a
	ld a, [wFBDestAddr + 1]
	ld e, a
	ld a, [wFBDestAddr]
	ld d, a
	xor a
	ld [wFBTileCounter], a ; loop counter
.loop
	ld a, [wFBTileCounter]
	inc a
	ld [wFBTileCounter], a
	ld a, [wSubAnimTransform]
	dec a
	jr z, .flipHorizontalAndVertical   ; SUBANIMTYPE_HVFLIP
	dec a
	jp z, .flipHorizontalTranslateDown ; SUBANIMTYPE_HFLIP
	dec a
	jr z, .flipBaseCoords              ; SUBANIMTYPE_COORDFLIP
.noTransformation
	ld a, [wBaseCoordY]
	add [hl]
	ld [de], a ; store Y
	inc hl
	inc de
	ld a, [wBaseCoordX]
	jr .finishCopying
.flipBaseCoords
	ld a, [wBaseCoordY]
	ld b, a
	ld a, 136
	sub b ; flip Y base coordinate
	add [hl] ; Y offset
	ld [de], a ; store Y
	inc hl
	inc de
	ld a, [wBaseCoordX]
	ld b, a
	ld a, 168
	sub b ; flip X base coordinate
.finishCopying ; finish copying values to OAM (when subanimation not transformed)
	add [hl] ; X offset
	ld [de], a ; store X
	inc hl
	inc de
	ld a, [hli]
	add $31 ; base tile ID for battle animations
	ld [de], a ; store tile ID
	inc de
	ld a, [hli]
	ld [de], a ; store flags
	inc de
	jp .nextTile
.flipHorizontalAndVertical
	ld a, [wBaseCoordY]
	add [hl] ; Y offset
	ld b, a
	ld a, 136
	sub b ; flip Y coordinate
	ld [de], a ; store Y
	inc hl
	inc de
	ld a, [wBaseCoordX]
	add [hl] ; X offset
	ld b, a
	ld a, 168
	sub b ; flip X coordinate
	ld [de], a ; store X
	inc hl
	inc de
	ld a, [hli]
	add $31 ; base tile ID for battle animations
	ld [de], a ; store tile ID
	inc de
; toggle horizontal and vertical flip
	ld a, [hli] ; flags
	and a
	ld b, OAM_VFLIP | OAM_HFLIP
	jr z, .storeFlags1
	cp OAM_HFLIP
	ld b, OAM_VFLIP
	jr z, .storeFlags1
	cp OAM_VFLIP
	ld b, OAM_HFLIP
	jr z, .storeFlags1
	ld b, 0
.storeFlags1
	ld a, b
	ld [de], a
	inc de
	jp .nextTile
.flipHorizontalTranslateDown
	ld a, [wBaseCoordY]
	add [hl]
	add 40 ; translate Y coordinate downwards
	ld [de], a ; store Y
	inc hl
	inc de
	ld a, [wBaseCoordX]
	add [hl]
	ld b, a
	ld a, 168
	sub b ; flip X coordinate
	ld [de], a ; store X
	inc hl
	inc de
	ld a, [hli]
	add $31 ; base tile ID for battle animations
	ld [de], a ; store tile ID
	inc de
	ld a, [hli]
	bit 5, a ; is horizontal flip enabled?
	jr nz, .disableHorizontalFlip
.enableHorizontalFlip
	set 5, a
	jr .storeFlags2
.disableHorizontalFlip
	res 5, a
.storeFlags2
	ld [de], a
	inc de
.nextTile
	ld a, [wFBTileCounter]
	ld c, a
	ld a, [wNumFBTiles]
	cp c
	jp nz, .loop ; go back up if there are more tiles to draw
.afterDrawingTiles
	ld a, [wFBMode]
	cp FRAMEBLOCKMODE_02
	jr z, .advanceFrameBlockDestAddr ; skip delay and don't clean OAM buffer
	ld a, [wSubAnimFrameDelay]
	ld c, a
	call DelayFrames
	ld a, [wFBMode]
	cp FRAMEBLOCKMODE_03
	jr z, .advanceFrameBlockDestAddr ; skip cleaning OAM buffer
	cp FRAMEBLOCKMODE_04
	jr z, .done ; skip cleaning OAM buffer and don't advance the frame block destination address
	ld a, [wAnimationID]
	cp GROWL
	jr z, .resetFrameBlockDestAddr
	call AnimationCleanOAM
.resetFrameBlockDestAddr
	ld hl, wShadowOAM
	ld a, l
	ld [wFBDestAddr + 1], a
	ld a, h
	ld [wFBDestAddr], a ; set destination address to beginning of OAM buffer
	ret
.advanceFrameBlockDestAddr
	ld a, e
	ld [wFBDestAddr + 1], a
	ld a, d
	ld [wFBDestAddr], a
.done
	ret

PlayAnimation:
	xor a
	ldh [hROMBankTemp], a ; it looks like nothing reads this
	ld [wSubAnimTransform], a
	ld a, [wAnimationID] ; get animation number
	dec a
	ld l, a
	ld h, 0
	add hl, hl
	ld de, AttackAnimationPointers  ; animation command stream pointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
.animationLoop
	vc_hook Stop_reducing_move_anim_flashing_Thunderbolt
	ld a, [hli]
	vc_hook_red Stop_reducing_move_anim_flashing_Reflect
	vc_hook_blue Stop_reducing_move_anim_flashing_Self_Destruct
	cp -1
	vc_hook_blue Stop_reducing_move_anim_flashing_Reflect
	jr z, .AnimationOver
	cp FIRST_SE_ID ; is this subanimation or a special effect?
	jr c, .playSubanimation
.doSpecialEffect
	ld c, a
	ld de, SpecialEffectPointers
.searchSpecialEffectTableLoop
	ld a, [de]
	cp c
	jr z, .foundMatch
	inc de
	inc de
	inc de
	jr .searchSpecialEffectTableLoop
.foundMatch
	ld a, [hli]
	cp NO_MOVE - 1 ; is there a sound to play?
	jr z, .skipPlayingSound
	ld [wAnimSoundID], a ; store sound
	push hl
	push de
	call GetMoveSound
	call PlaySound
	pop de
	pop hl
.skipPlayingSound
	push hl
	inc de
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	ld de, .nextAnimationCommand
	push de
	jp hl ; jump to special effect function
.playSubanimation
	ld c, a
	and %00111111
	ld [wSubAnimFrameDelay], a
	xor a
	sla c
	rla
	sla c
	rla
	ld [wWhichBattleAnimTileset], a
	ld a, [hli] ; sound
	ld [wAnimSoundID], a ; store sound
	ld a, [hli] ; subanimation ID
	ld c, l
	ld b, h
	ld l, a
	ld h, 0
	add hl, hl
	ld de, SubanimationPointers
	add hl, de
	ld a, l
	ld [wSubAnimAddrPtr], a
	ld a, h
	ld [wSubAnimAddrPtr + 1], a
	ld l, c
	ld h, b
	push hl
	ldh a, [rOBP0]
	push af
	ld a, [wAnimPalette]
	ldh [rOBP0], a
	call LoadMoveAnimationTiles
	vc_hook Reduce_move_anim_flashing_Mega_Punch_Self_Destruct_Explosion
	call LoadSubanimation
	call PlaySubanimation
	vc_hook_red Stop_reducing_move_anim_flashing_Mega_Punch
	vc_hook_blue Stop_reducing_move_anim_flashing_Mega_Punch_Explosion
	pop af
	vc_hook_red Stop_reducing_move_anim_flashing_Blizzard
	ldh [rOBP0], a
.nextAnimationCommand
	vc_hook_red Stop_reducing_move_anim_flashing_Hyper_Beam
	vc_hook_blue Stop_reducing_move_anim_flashing_Bubblebeam_Hyper_Beam_Blizzard
	pop hl
	vc_hook Stop_reducing_move_anim_flashing_Guillotine
	jr .animationLoop
.AnimationOver
	ret

LoadSubanimation:
	vc_hook Reduce_move_anim_flashing_Guillotine
	ld a, [wSubAnimAddrPtr + 1]
	vc_hook Reduce_move_anim_flashing_Mega_Kick
	ld h, a
	vc_hook_red Reduce_move_anim_flashing_Blizzard
	ld a, [wSubAnimAddrPtr]
	vc_hook_red Reduce_move_anim_flashing_Self_Destruct
	ld l, a
	ld a, [hli]
	ld e, a
	vc_hook Reduce_move_anim_flashing_Explosion
	ld a, [hl]
	vc_hook Reduce_move_anim_flashing_Thunderbolt
	ld d, a ; de = address of subanimation
	ld a, [de]
	vc_hook_blue Reduce_move_anim_flashing_Rock_Slide
	ld b, a
	vc_hook Reduce_move_anim_flashing_Spore
	and %00011111
	vc_hook Reduce_move_anim_flashing_Bubblebeam
	ld [wSubAnimCounter], a ; number of frame blocks
	vc_hook_red Reduce_move_anim_flashing_Rock_Slide
	vc_hook_blue Reduce_move_anim_flashing_Self_Destruct
	ld a, b
	and %11100000
	cp SUBANIMTYPE_ENEMY << 5
	vc_hook_blue Reduce_move_anim_flashing_Blizzard
	jr nz, .isNotType5
.isType5
	call GetSubanimationTransform2
	jr .saveTransformation
.isNotType5
	vc_hook Reduce_move_anim_flashing_Hyper_Beam
	call GetSubanimationTransform1
.saveTransformation
; place the upper 3 bits of a into bits 0-2 of a before storing
	srl a
	swap a
	ld [wSubAnimTransform], a
	cp SUBANIMTYPE_REVERSE
	ld hl, 0
	jr nz, .storeSubentryAddr
; if the animation is reversed, then place the initial subentry address at the end of the list of subentries
	ld a, [wSubAnimCounter]
	dec a
	ld bc, 3
.loop
	add hl, bc
	dec a
	jr nz, .loop
.storeSubentryAddr
	inc de
	add hl, de
	ld a, l
	ld [wSubAnimSubEntryAddr], a
	ld a, h
	ld [wSubAnimSubEntryAddr + 1], a
	ret

; called if the subanimation type is not SUBANIMTYPE_ENEMY
; sets the transform to SUBANIMTYPE_NORMAL if it's the player's turn
; sets the transform to the subanimation type if it's the enemy's turn
GetSubanimationTransform1:
	vc_hook Reduce_move_anim_flashing_Reflect
	ld b, a
	ldh a, [hWhoseTurn]
	and a
	ld a, b
	ret nz
	xor a ; SUBANIMTYPE_NORMAL << 5
	ret

; called if the subanimation type is SUBANIMTYPE_ENEMY
; sets the transform to SUBANIMTYPE_HFLIP if it's the player's turn
; sets the transform to SUBANIMTYPE_NORMAL if it's the enemy's turn
GetSubanimationTransform2:
	ldh a, [hWhoseTurn]
	and a
	ld a, SUBANIMTYPE_HFLIP << 5
	ret z
	xor a ; SUBANIMTYPE_NORMAL << 5
	ret

; loads tile patterns for battle animations
LoadMoveAnimationTiles:
	ld a, [wWhichBattleAnimTileset]
	add a
	add a
	ld hl, MoveAnimationTilesPointers
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld [wTempTilesetNumTiles], a ; number of tiles
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a ; de = address of tileset
	ld hl, vSprites tile $31
	ld b, BANK(MoveAnimationTiles0) ; ROM bank
	ld a, [wTempTilesetNumTiles]
	ld c, a ; number of tiles
	jp CopyVideoData ; load tileset

MACRO anim_tileset
	db \1
	dw \2
	db -1 ; padding
ENDM

MoveAnimationTilesPointers:
	; number of tiles, gfx pointer
	anim_tileset 79, MoveAnimationTiles0
	anim_tileset 79, MoveAnimationTiles1
	anim_tileset 64, MoveAnimationTiles2

MoveAnimationTiles0:
MoveAnimationTiles2:
	INCBIN "gfx/battle/move_anim_0.2bpp"

MoveAnimationTiles1:
	INCBIN "gfx/battle/move_anim_1.2bpp"

SlotMachineTiles2:
IF DEF(_RED)
	INCBIN "gfx/slots/red_slots_2.2bpp"
ENDC
IF DEF(_BLUE)
	INCBIN "gfx/slots/blue_slots_2.2bpp"
ENDC
SlotMachineTiles2End:

MoveAnimation:
	push hl
	push de
	push bc
	push af
	call WaitForSoundToFinish
	call SetAnimationPalette
	ld a, [wAnimationID]
	and a
	jr z, .animationFinished

	; if throwing a Poké Ball, skip the regular animation code
	cp TOSS_ANIM
	jr nz, .moveAnimation
	ld de, .animationFinished
	push de
	jp TossBallAnimation

.moveAnimation
	; check if battle animations are disabled in the options
	ld a, [wOptions]
	bit BIT_BATTLE_ANIMATION, a
	jr nz, .animationsDisabled
	call ShareMoveAnimations
	call PlayAnimation
	vc_hook_red Stop_reducing_move_anim_flashing_Bubblebeam_Mega_Kick
	vc_hook_blue Stop_reducing_move_anim_flashing_Spore
	jr .next4
.animationsDisabled
	ld c, 30
	call DelayFrames
.next4
	vc_hook_red Stop_reducing_move_anim_flashing
	vc_hook_blue Stop_reducing_move_anim_flashing_Rock_Slide_Dream_Eater
	call PlayApplyingAttackAnimation ; shake the screen or flash the pic in and out (to show damage)
.animationFinished
	call WaitForSoundToFinish
	xor a
	ld [wSubAnimSubEntryAddr], a
	ld [wUnusedD09B], a
	ld [wSubAnimTransform], a
	dec a ; NO_MOVE - 1
	ld [wAnimSoundID], a
	pop af
	pop bc
	pop de
	pop hl
	ret

ShareMoveAnimations:
; some moves just reuse animations from status conditions
	ldh a, [hWhoseTurn]
	and a
	ret z

	; opponent's turn

	ld a, [wAnimationID]

	cp AMNESIA
	ld b, CONF_ANIM
	jr z, .replaceAnim

	cp REST
	ld b, SLP_ANIM
	ret nz

.replaceAnim
	ld a, b
	ld [wAnimationID], a
	ret

PlayApplyingAttackAnimation:
; Generic animation that shows after the move's individual animation
; Different animation depending on whether the move has an additional effect and on whose turn it is
	ld a, [wAnimationType]
	and a
	ret z
	dec a
	add a
	ld c, a
	ld b, 0
	ld hl, AnimationTypePointerTable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

AnimationTypePointerTable:
	dw ShakeScreenVertically        ; enemy mon has used a damaging move without a side effect
	dw ShakeScreenHorizontallyHeavy ; enemy mon has used a damaging move with a side effect
	dw ShakeScreenHorizontallySlow  ; enemy mon has used a non-damaging move
	dw BlinkEnemyMonSprite          ; player mon has used a damaging move without a side effect
	dw ShakeScreenHorizontallyLight ; player mon has used a damaging move with a side effect
	dw ShakeScreenHorizontallySlow2 ; player mon has used a non-damaging move

ShakeScreenVertically:
	call PlayApplyingAttackSound
	ld b, 8
	jp AnimationShakeScreenVertically

ShakeScreenHorizontallyHeavy:
	call PlayApplyingAttackSound
	ld b, 8
	jp AnimationShakeScreenHorizontallyFast

ShakeScreenHorizontallySlow:
	lb bc, 6, 2
	jr AnimationShakeScreenHorizontallySlow

BlinkEnemyMonSprite:
	call PlayApplyingAttackSound
	jp AnimationBlinkEnemyMon

ShakeScreenHorizontallyLight:
	call PlayApplyingAttackSound
	ld b, 2
	jp AnimationShakeScreenHorizontallyFast

ShakeScreenHorizontallySlow2:
	lb bc, 3, 2

AnimationShakeScreenHorizontallySlow:
	push bc
	push bc
.loop1
	ldh a, [rWX]
	inc a
	ldh [rWX], a
	ld c, 2
	call DelayFrames
	dec b
	jr nz, .loop1
	pop bc
.loop2
	ldh a, [rWX]
	dec a
	ldh [rWX], a
	ld c, 2
	call DelayFrames
	dec b
	jr nz, .loop2
	pop bc
	dec c
	jr nz, AnimationShakeScreenHorizontallySlow
	ret

SetAnimationPalette:
	ld a, [wOnSGB]
	and a
	ld a, $e4
	jr z, .notSGB
	ld a, $f0
	ld [wAnimPalette], a
	ld b, $e4
	ld a, [wAnimationID]
	cp TRADE_BALL_DROP_ANIM
	jr c, .next
	cp TRADE_BALL_POOF_ANIM + 1
	jr nc, .next
	ld b, $f0
.next
	ld a, b
	ldh [rOBP0], a
	ld a, $6c
	ldh [rOBP1], a
	ret
.notSGB
	ld a, $e4
	ld [wAnimPalette], a
	vc_hook Reduce_move_anim_flashing_Dream_Eater
	ldh [rOBP0], a
	ld a, $6c
	ldh [rOBP1], a
	ret

PlaySubanimation:
	ld a, [wAnimSoundID]
	cp NO_MOVE - 1
	jr z, .skipPlayingSound
	call GetMoveSound
	call PlaySound
.skipPlayingSound
	ld hl, wShadowOAM
	ld a, l
	ld [wFBDestAddr + 1], a
	ld a, h
	ld [wFBDestAddr], a
	ld a, [wSubAnimSubEntryAddr + 1]
	ld h, a
	ld a, [wSubAnimSubEntryAddr]
	ld l, a
.loop
	push hl
	ld c, [hl] ; frame block ID
	ld b, 0
	ld hl, FrameBlockPointers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	pop hl
	inc hl
	push hl
	ld e, [hl] ; base coordinate ID
	ld d, 0
	ld hl, FrameBlockBaseCoords  ; base coordinate table
	add hl, de
	add hl, de
	ld a, [hli]
	ld [wBaseCoordY], a
	ld a, [hl]
	ld [wBaseCoordX], a
	pop hl
	inc hl
	ld a, [hl] ; frame block mode
	ld [wFBMode], a
	call DrawFrameBlock
	call DoSpecialEffectByAnimationId ; run animation-specific function (if there is one)
	ld a, [wSubAnimCounter]
	dec a
	ld [wSubAnimCounter], a
	ret z
	ld a, [wSubAnimSubEntryAddr + 1]
	ld h, a
	ld a, [wSubAnimSubEntryAddr]
	ld l, a
	ld a, [wSubAnimTransform]
	cp SUBANIMTYPE_REVERSE
	ld bc, 3
	jr nz, .nextSubanimationSubentry
	ld bc, -3
.nextSubanimationSubentry
	add hl, bc
	ld a, h
	ld [wSubAnimSubEntryAddr + 1], a
	ld a, l
	ld [wSubAnimSubEntryAddr], a
	jp .loop

AnimationCleanOAM:
	push hl
	push de
	push bc
	push af
	call DelayFrame
	call ClearSprites
	pop af
	pop bc
	pop de
	pop hl
	ret

; this runs after each frame block is drawn in a subanimation
; it runs a particular special effect based on the animation ID
DoSpecialEffectByAnimationId:
	push hl
	push de
	push bc
	ld a, [wAnimationID]
	ld hl, AnimationIdSpecialEffects
	ld de, 3
	call IsInArray
	jr nc, .done
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .done
	push de
	jp hl
.done
	pop bc
	pop de
	pop hl
	ret

INCLUDE "data/battle_anims/special_effects.asm"

DoBallTossSpecialEffects:
	ld a, [wcf91]
	cp ULTRA_BALL + 1 ; is it a Master Ball or Ultra Ball?
	jr nc, .skipFlashingEffect
.flashingEffect ; do a flashing effect if it's Master Ball or Ultra Ball
	ldh a, [rOBP0]
	xor %00111100 ; complement colors 1 and 2
	ldh [rOBP0], a
.skipFlashingEffect
	ld a, [wSubAnimCounter]
	cp 11 ; is it the beginning of the subanimation?
	jr nz, .skipPlayingSound
; if it is the beginning of the subanimation, play a sound
	ld a, SFX_BALL_TOSS
	call PlaySound
.skipPlayingSound
	ld a, [wIsInBattle]
	cp 2 ; is it a trainer battle?
	jr z, .isTrainerBattle
	ld a, [wd11e]
	cp $10 ; is the enemy pokemon the Ghost Marowak?
	ret nz
; if the enemy pokemon is the Ghost Marowak, make it dodge during the last 3 frames
	ld a, [wSubAnimCounter]
	cp 3
	jr z, .moveGhostMarowakLeft
	cp 2
	jr z, .moveGhostMarowakLeft
	cp 1
	ret nz
.moveGhostMarowakLeft
	hlcoord 17, 0
	ld de, 20
	lb bc, 7, 7
.loop
	push hl
	push bc
	call AnimCopyRowRight ; move row of tiles left
	pop bc
	pop hl
	add hl, de
	dec b
	jr nz, .loop
	ld a, %00001000
	ldh [rNR10], a ; Channel 1 sweep register
	ret
.isTrainerBattle ; if it's a trainer battle, shorten the animation by one frame
	ld a, [wSubAnimCounter]
	cp 3
	ret nz
	dec a
	ld [wSubAnimCounter], a
	ret

DoBallShakeSpecialEffects:
	ld a, [wSubAnimCounter]
	cp 4 ; is it the beginning of a shake?
	jr nz, .skipPlayingSound
; if it is the beginning of a shake, play a sound and wait 2/3 of a second
	ld a, SFX_TINK
	call PlaySound
	ld c, 40
	call DelayFrames
.skipPlayingSound
	ld a, [wSubAnimCounter]
	dec a
	ret nz
; if it's the end of the ball shaking subanimation, check if more shakes are left and restart the subanimation
	ld a, [wNumShakes] ; number of shakes
	dec a ; decrement number of shakes
	ld [wNumShakes], a
	ret z
; if there are shakes left, restart the subanimation
	ld a, [wSubAnimSubEntryAddr]
	ld l, a
	ld a, [wSubAnimSubEntryAddr + 1]
	ld h, a
	ld de, -(4 * 3) ; 4 subentries and 3 bytes per subentry
	add hl, de
	ld a, l
	ld [wSubAnimSubEntryAddr], a
	ld a, h
	ld [wSubAnimSubEntryAddr + 1], a
	ld a, 5 ; number of subentries in the ball shaking subanimation plus one
	ld [wSubAnimCounter], a
	ret

; plays a sound after the second frame of the poof animation
DoPoofSpecialEffects:
	ld a, [wSubAnimCounter]
	cp 5
	ret nz
	ld a, SFX_BALL_POOF
	jp PlaySound

DoRockSlideSpecialEffects:
	ld a, [wSubAnimCounter]
	cp 12
	ret nc
	cp 8
	jr nc, .shakeScreen
	cp 1
	jp z, AnimationFlashScreen ; if it's the end of the subanimation, flash the screen
	ret
; if the subanimation counter is between 8 and 11, shake the screen horizontally and vertically
.shakeScreen
	ld b, 1
	predef PredefShakeScreenHorizontally ; shake horizontally
	ld b, 1
	predef_jump PredefShakeScreenVertically ; shake vertically

FlashScreenEveryEightFrameBlocks:
	ld a, [wSubAnimCounter]
	and 7 ; is the subanimation counter exactly 8?
	call z, AnimationFlashScreen ; if so, flash the screen
	ret

; flashes the screen if the subanimation counter is divisible by 4
FlashScreenEveryFourFrameBlocks:
	ld a, [wSubAnimCounter]
	and 3
	call z, AnimationFlashScreen
	ret

; used for Explosion and Selfdestruct
DoExplodeSpecialEffects:
	ld a, [wSubAnimCounter]
	cp 1 ; is it the end of the subanimation?
	jr nz, FlashScreenEveryFourFrameBlocks
; if it's the end of the subanimation, make the attacking pokemon disappear
	hlcoord 1, 5
	jp AnimationHideMonPic ; make pokemon disappear

; flashes the screen when subanimation counter is 1 modulo 4
DoBlizzardSpecialEffects:
	ld a, [wSubAnimCounter]
	cp 13
	jp z, AnimationFlashScreen
	cp 9
	jp z, AnimationFlashScreen
	cp 5
	jp z, AnimationFlashScreen
	cp 1
	jp z, AnimationFlashScreen
	ret

; flashes the screen at 3 points in the subanimation
; unused
FlashScreenUnused:
	ld a, [wSubAnimCounter]
	cp 14
	jp z, AnimationFlashScreen
	cp 9
	jp z, AnimationFlashScreen
	cp 2
	jp z, AnimationFlashScreen
	ret

; function to make the pokemon disappear at the beginning of the animation
TradeHidePokemon:
	ld a, [wSubAnimCounter]
	cp 6
	ret nz
	ld a, 2 * SCREEN_WIDTH + 7
	jp ClearMonPicFromTileMap ; make pokemon disappear

; function to make a shaking pokeball jump up at the end of the animation
TradeShakePokeball:
	ld a, [wSubAnimCounter]
	cp 1
	ret nz
; if it's the end of the animation, make the ball jump up
	ld de, BallMoveDistances1
.loop
	ld hl, wShadowOAM
	ld bc, 4
.innerLoop
	ld a, [de]
	cp $ff
	jr z, .done
	add [hl] ; add to Y value of OAM entry
	ld [hl], a
	add hl, bc
	ld a, l
	cp 4 * 4 ; there are 4 entries, each 4 bytes
	jr nz, .innerLoop
	inc de
	push bc
	call Delay3
	pop bc
	jr .loop
.done
	call AnimationCleanOAM
	ld a, SFX_TRADE_MACHINE
	jp PlaySound

BallMoveDistances1:
	db -12, -12, -8
	db -1 ; end

; function to make the pokeball jump up
TradeJumpPokeball:
	ld de, BallMoveDistances2
.loop
	ld hl, wShadowOAM
	ld bc, 4
.innerLoop
	ld a, [de]
	cp $ff
	jp z, ClearScreen
	add [hl]
	ld [hl], a
	add hl, bc
	ld a, l
	cp 4 * 4 ; there are 4 entries, each 4 bytes
	jr nz, .innerLoop
	inc de
	push de
	ld a, [de]
	cp 12
	jr z, .playSound
	cp $ff
	jr nz, .skipPlayingSound
.playSound ; play sound if next move distance is 12 or this is the last one
	ld a, SFX_SWAP
	call PlaySound
.skipPlayingSound
	push bc
	ld c, 5
	call DelayFrames
	pop bc
	ldh a, [hSCX] ; background scroll X
	sub 8 ; scroll to the left
	ldh [hSCX], a
	pop de
	jr .loop

BallMoveDistances2:
	db 11, 12, -12, -7, 7, 12, -8, 8
	db -1 ; end

; this function copies the current musical note graphic
; so that there are two musical notes flying towards the defending pokemon
DoGrowlSpecialEffects:
	ld hl, wShadowOAM
	ld de, wShadowOAMSprite04
	ld bc, $10
	call CopyData ; copy the musical note graphic
	ld a, [wSubAnimCounter]
	dec a
	call z, AnimationCleanOAM ; clean up at the end of the subanimation
	ret

; this is associated with Tail Whip, but Tail Whip doesn't use any subanimations
TailWhipAnimationUnused:
	ld a, 1
	ld [wSubAnimCounter], a
	ld c, 20
	jp DelayFrames

INCLUDE "data/battle_anims/special_effect_pointers.asm"

AnimationDelay10:
	ld c, 10
	jp DelayFrames

; calls a function with the turn flipped from player to enemy or vice versa
; input - hl - address of function to call
CallWithTurnFlipped:
	ldh a, [hWhoseTurn]
	push af
	xor 1
	ldh [hWhoseTurn], a
	ld de, .returnAddress
	push de
	jp hl
.returnAddress
	pop af
	ldh [hWhoseTurn], a
	ret

; flashes the screen for an extended period (48 frames)
AnimationFlashScreenLong:
	ld a, 3 ; cycle through the palettes 3 times
	ld [wFlashScreenLongCounter], a
	ld a, [wOnSGB] ; running on SGB?
	and a
	ld hl, FlashScreenLongMonochrome
	jr z, .loop
	ld hl, FlashScreenLongSGB
.loop
	push hl
.innerLoop
	ld a, [hli]
	cp $01 ; is it the end of the palettes?
	jr z, .endOfPalettes
	ldh [rBGP], a
	call FlashScreenLongDelay
	jr .innerLoop
.endOfPalettes
	ld a, [wFlashScreenLongCounter]
	dec a
	ld [wFlashScreenLongCounter], a
	pop hl
	jr nz, .loop
	vc_hook_red Stop_reducing_move_anim_flashing_Psychic
	ret

; BG palettes
FlashScreenLongMonochrome:
	db %11111001 ; 3, 3, 2, 1
	db %11111110 ; 3, 3, 3, 2
	db %11111111 ; 3, 3, 3, 3
	db %11111110 ; 3, 3, 3, 2
	db %11111001 ; 3, 3, 2, 1
	db %11100100 ; 3, 2, 1, 0
	db %10010000 ; 2, 1, 0, 0
	db %01000000 ; 1, 0, 0, 0
	db %00000000 ; 0, 0, 0, 0
	db %01000000 ; 1, 0, 0, 0
	db %10010000 ; 2, 1, 0, 0
	db %11100100 ; 3, 2, 1, 0
	db $01 ; terminator

; BG palettes
FlashScreenLongSGB:
	db %11111000 ; 3, 3, 2, 0
	db %11111100 ; 3, 3, 3, 0
	db %11111111 ; 3, 3, 3, 3
	db %11111100 ; 3, 3, 3, 0
	db %11111000 ; 3, 3, 2, 0
	db %11100100 ; 3, 2, 1, 0
	db %10010000 ; 2, 1, 0, 0
	db %01000000 ; 1, 0, 0, 0
	db %00000000 ; 0, 0, 0, 0
	db %01000000 ; 1, 0, 0, 0
	db %10010000 ; 2, 1, 0, 0
	db %11100100 ; 3, 2, 1, 0
	db $01 ; terminator

; causes a delay of 2 frames for the first cycle
; causes a delay of 1 frame for the second and third cycles
FlashScreenLongDelay:
	ld a, [wFlashScreenLongCounter]
	cp 4 ; never true since [wFlashScreenLongCounter] starts at 3
	ld c, 4
	jr z, .delayFrames
	cp 3
	ld c, 2
	jr z, .delayFrames
	cp 2 ; nothing is done with this
	ld c, 1
.delayFrames
	jp DelayFrames

AnimationFlashScreen:
	ldh a, [rBGP]
	push af ; save initial palette
	ld a, %00011011 ; 0, 1, 2, 3 (inverted colors)
	ldh [rBGP], a
	ld c, 2
	call DelayFrames
	xor a ; white out background
	ldh [rBGP], a
	ld c, 2
	call DelayFrames
	pop af
	ldh [rBGP], a ; restore initial palette
	ret

AnimationDarkScreenPalette:
; Changes the screen's palette to a dark palette.
	lb bc, $6f, $6f
	jr SetAnimationBGPalette

AnimationDarkenMonPalette:
; Darkens the mon sprite's palette.
	lb bc, $f9, $f4
	jr SetAnimationBGPalette

AnimationUnusedPalette1:
	lb bc, $fe, $f8
	jr SetAnimationBGPalette

AnimationUnusedPalette2:
	lb bc, $ff, $ff
	jr SetAnimationBGPalette

AnimationResetScreenPalette:
; Restores the screen's palette to the normal palette.
	lb bc, $e4, $e4
	jr SetAnimationBGPalette

AnimationUnusedPalette3:
	lb bc, $00, $00
	jr SetAnimationBGPalette

AnimationLightScreenPalette:
; Changes the screen to use a palette with light colors.
	lb bc, $90, $90
	jr SetAnimationBGPalette

AnimationUnusedPalette4:
	lb bc, $40, $40

SetAnimationBGPalette:
	ld a, [wOnSGB]
	and a
	ld a, b
	jr z, .next
	ld a, c
.next
	ldh [rBGP], a
	ret

	ld b, $5

AnimationShakeScreenVertically:
	predef_jump PredefShakeScreenVertically

AnimationShakeScreen:
; Shakes the screen for a while. Used in Earthquake/Fissure/etc. animations.
	ld b, $8

AnimationShakeScreenHorizontallyFast:
	predef_jump PredefShakeScreenHorizontally

AnimationWaterDropletsEverywhere:
; Draws water droplets all over the screen and makes them
; scroll. It's hard to describe, but it's the main animation
; in Surf/Mist/Toxic.
	xor a
	ld [wWhichBattleAnimTileset], a
	call LoadMoveAnimationTiles
	ld d, 32
	ld a, -16
	ld [wBaseCoordX], a
	ld a, $71
	ld [wDropletTile], a
.loop
	ld a, 16
	ld [wBaseCoordY], a
	ld a, 0
	ld [wUnusedD08A], a
	call _AnimationWaterDroplets
	ld a, 24
	ld [wBaseCoordY], a
	ld a, 32
	ld [wUnusedD08A], a
	call _AnimationWaterDroplets
	dec d
	jr nz, .loop
	ret

_AnimationWaterDroplets:
	ld hl, wShadowOAM
.loop
	ld a, [wBaseCoordY]
	ld [hli], a ; Y
	ld a, [wBaseCoordX]
	add 27
	ld [wBaseCoordX], a
	ld [hli], a ; X
	ld a, [wDropletTile]
	ld [hli], a ; tile
	xor a
	ld [hli], a ; attribute
	ld a, [wBaseCoordX]
	cp 144
	jr c, .loop
	sub 168
	ld [wBaseCoordX], a
	ld a, [wBaseCoordY]
	add 16
	ld [wBaseCoordY], a
	cp 112
	jr c, .loop
	call AnimationCleanOAM
	jp DelayFrame

AnimationSlideMonUp:
; Slides the mon's sprite upwards.
	ld c, 7
	ldh a, [hWhoseTurn]
	and a
	hlcoord 1, 6
	decoord 1, 5
	ld a, $30
	jr z, .next
	hlcoord 12, 1
	decoord 12, 0
	ld a, $ff
.next
	ld [wSlideMonUpBottomRowLeftTile], a
	jp _AnimationSlideMonUp

AnimationSlideMonDown:
; Slides the mon's sprite down out of the screen.
	xor a ; TILEMAP_MON_PIC
	call GetTileIDList
.loop
	call GetMonSpriteTileMapPointerFromRowCount
	push bc
	push de
	call CopyPicTiles
	call Delay3
	call AnimationHideMonPic
	pop de
	pop bc
	dec b
	jr nz, .loop
	ret

AnimationSlideMonOff:
; Slides the mon's sprite off the screen horizontally.
	ld e, 8
	ld a, 3
	ld [wSlideMonDelay], a
	jp _AnimationSlideMonOff

AnimationSlideEnemyMonOff:
; Slides the enemy mon off the screen horizontally.
	ld hl, AnimationSlideMonOff
	jp CallWithTurnFlipped

_AnimationSlideMonUp:
	push de
	push hl
	push bc

; In each iteration, slide up all rows but the top one (which is overwritten).
	ld b, 6
.slideLoop
	push bc
	push de
	push hl
	ld bc, 7
	call CopyData
; Note that de and hl are popped in the same order they are pushed, swapping
; their values. When CopyData is called, hl points to a tile 1 row below
; the one de points to. To maintain this relationship, after swapping, we add 2
; rows to hl so that it is 1 row below again.
	pop de
	pop hl
	ld bc, SCREEN_WIDTH * 2
	add hl, bc
	pop bc
	dec b
	jr nz, .slideLoop

; Fill in the bottom row of the mon pic with the next row's tile IDs.
	ldh a, [hWhoseTurn]
	and a
	hlcoord 1, 11
	jr z, .next
	hlcoord 12, 6
.next
	ld a, [wSlideMonUpBottomRowLeftTile]
	inc a
	ld [wSlideMonUpBottomRowLeftTile], a
	ld c, 7
.fillBottomRowLoop
	ld [hli], a
	add 7
	dec c
	jr nz, .fillBottomRowLoop

	ld c, 2
	call DelayFrames
	pop bc
	pop hl
	pop de
	dec c
	jr nz, _AnimationSlideMonUp
	ret

ShakeEnemyHUD_WritePlayerMonPicOAM:
; Writes the OAM entries for a copy of the player mon's pic in OAM.
; The top 5 rows are reproduced in OAM, although only 2 are actually needed.
	ld a, $10
	ld [wBaseCoordX], a
	ld a, $30
	ld [wBaseCoordY], a
	ld hl, wShadowOAM
	ld d, 0
	ld c, 7
.loop
	ld a, [wBaseCoordY]
	ld e, a
	ld b, 5
.innerLoop
	call BattleAnimWriteOAMEntry
	inc d
	dec b
	jr nz, .innerLoop
	dec c
	ret z
	inc d
	inc d
	ld a, [wBaseCoordX]
	add 8
	ld [wBaseCoordX], a
	jr .loop

BattleAnimWriteOAMEntry:
; Y coordinate = e (increased by 8 each call, before the write to OAM)
; X coordinate = [wBaseCoordX]
; tile = d
; attributes = 0
	ld a, e
	add 8
	ld e, a
	ld [hli], a
	ld a, [wBaseCoordX]
	ld [hli], a
	ld a, d
	ld [hli], a
	xor a
	ld [hli], a
	ret

AdjustOAMBlockXPos:
	ld l, e
	ld h, d

AdjustOAMBlockXPos2:
	ld de, 4
.loop
	ld a, [wCoordAdjustmentAmount]
	ld b, a
	ld a, [hl]
	add b
	cp 168
	jr c, .skipPuttingEntryOffScreen
; put off-screen if X >= 168
	dec hl
	ld a, 160
	ld [hli], a
.skipPuttingEntryOffScreen
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret

AdjustOAMBlockYPos:
	ld l, e
	ld h, d

AdjustOAMBlockYPos2:
	ld de, 4
.loop
	ld a, [wCoordAdjustmentAmount]
	ld b, a
	ld a, [hl]
	add b
	cp 112
	jr c, .skipSettingPreviousEntrysAttribute
	dec hl
	ld a, 160 ; bug, sets previous OAM entry's attribute
	ld [hli], a
.skipSettingPreviousEntrysAttribute
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret

AnimationBlinkEnemyMon:
; Make the enemy mon's sprite blink on and off for a second or two
	ld hl, AnimationBlinkMon
	jp CallWithTurnFlipped

AnimationBlinkMon:
; Make the mon's sprite blink on and off for a second or two.
	push af
	ld c, 6
.loop
	push bc
	call AnimationHideMonPic
	ld c, 5
	call DelayFrames
	call AnimationShowMonPic
	ld c, 5
	call DelayFrames
	pop bc
	dec c
	jr nz, .loop
	pop af
	ret

AnimationFlashMonPic:
; Flashes the mon's sprite on and off
	ld a, [wBattleMonSpecies]
	ld [wChangeMonPicPlayerTurnSpecies], a
	ld a, [wEnemyMonSpecies]
	ld [wChangeMonPicEnemyTurnSpecies], a
	jp ChangeMonPic

AnimationFlashEnemyMonPic:
; Flashes the enemy mon's sprite on and off
	ld hl, AnimationFlashMonPic
	jp CallWithTurnFlipped

AnimationShowMonPic:
	xor a ; TILEMAP_MON_PIC
	call GetTileIDList
	call GetMonSpriteTileMapPointerFromRowCount
	call CopyPicTiles
	jp Delay3

AnimationShowEnemyMonPic:
; Shows the enemy mon's front sprite. Used in animations like Seismic Toss
; to make the mon's sprite reappear after disappears offscreen.
	ld hl, AnimationShowMonPic
	jp CallWithTurnFlipped

AnimationShakeBackAndForth:
; Shakes the mon's sprite back and forth rapidly. This is used in Double Team.
; The mon's sprite disappears after this animation.
	ldh a, [hWhoseTurn]
	and a
	hlcoord 0, 5
	decoord 2, 5
	jr z, .next
	hlcoord 11, 0
	decoord 13, 0

.next
	xor a ; TILEMAP_MON_PIC
	ld c, $10
.loop
	push af
	push bc
	push de
	push hl
	push hl
	push de
	push af
	push hl
	push hl
	call GetTileIDList
	pop hl
	call CopyPicTiles
	call Delay3
	pop hl
	lb bc, 7, 9
	call ClearScreenArea
	pop af
	call GetTileIDList
	pop hl
	call CopyPicTiles
	call Delay3
	pop hl
	lb bc, 7, 9
	call ClearScreenArea
	pop hl
	pop de
	pop bc
	pop af
	dec c
	jr nz, .loop
	ret

AnimationMoveMonHorizontally:
; Shifts the mon's sprite horizontally to a fixed location. Used by lots of
; animations like Tackle/Body Slam.
	call AnimationHideMonPic
	ldh a, [hWhoseTurn]
	and a
	hlcoord 2, 5
	jr z, .next
	hlcoord 11, 0
.next
	xor a ; TILEMAP_MON_PIC
	push hl
	call GetTileIDList
	pop hl
	call CopyPicTiles
	ld c, 3
	jp DelayFrames

AnimationResetMonPosition:
; Resets the mon's sprites to be located at the normal coordinates.
	ldh a, [hWhoseTurn]
	and a
	ld a, 5 * SCREEN_WIDTH + 2
	jr z, .next
	ld a, 11
.next
	call ClearMonPicFromTileMap
	jp AnimationShowMonPic

AnimationSpiralBallsInward:
; Creates an effect that looks like energy balls spiralling into the
; player mon's sprite.  Used in Focus Energy, for example.
	ldh a, [hWhoseTurn]
	and a
	jr z, .playerTurn
	ld a, -40
	ld [wSpiralBallsBaseY], a
	ld a, 80
	ld [wSpiralBallsBaseX], a
	jr .next
.playerTurn
	xor a
	ld [wSpiralBallsBaseY], a
	ld [wSpiralBallsBaseX], a
.next
	ld d, $7a ; ball tile
	ld c, 3 ; number of balls
	xor a
	call InitMultipleObjectsOAM
	ld hl, SpiralBallAnimationCoordinates
.loop
	push hl
	ld c, 3
	ld de, wShadowOAM
.innerLoop
	ld a, [hl]
	cp $ff
	jr z, .done
	ld a, [wSpiralBallsBaseY]
	add [hl]
	ld [de], a ; Y
	inc de
	inc hl
	ld a, [wSpiralBallsBaseX]
	add [hl]
	ld [de], a ; X
	inc hl
	inc de
	inc de
	inc de
	dec c
	jr nz, .innerLoop
	ld c, 5
	call DelayFrames
	pop hl
	inc hl
	inc hl
	jr .loop
.done
	pop hl
	call AnimationCleanOAM
	jp AnimationFlashScreen

SpiralBallAnimationCoordinates:
; y, x pairs
; This is the sequence of screen coordinates that the spiralling
; balls are positioned at.
	db $38, $28
	db $40, $18
	db $50, $10
	db $60, $18
	db $68, $28
	db $60, $38
	db $50, $40
	db $40, $38
	db $40, $28
	db $46, $1E
	db $50, $18
	db $5B, $1E
	db $60, $28
	db $5B, $32
	db $50, $38
	db $46, $32
	db $48, $28
	db $50, $20
	db $58, $28
	db $50, $30
	db $50, $28
	db -1 ; end

AnimationSquishMonPic:
; Squishes the mon's sprite horizontally making it
; disappear. Used by Teleport/Sky Attack animations.
	ld c, 4
.loop
	push bc
	ldh a, [hWhoseTurn]
	and a
	jr z, .playerTurn
	hlcoord 16, 0
	decoord 14, 0
	jr .next
.playerTurn
	hlcoord 5, 5
	decoord 3, 5
.next
	push de
	xor a ; left
	ld [wSquishMonCurrentDirection], a
	call _AnimationSquishMonPic
	pop hl
	ld a, 1 ; right
	ld [wSquishMonCurrentDirection], a
	call _AnimationSquishMonPic
	pop bc
	dec c
	jr nz, .loop
	call AnimationHideMonPic
	ld c, 2
	jp DelayFrame

_AnimationSquishMonPic:
	ld c, 7
.loop
	push bc
	push hl
	ld c, 3
	ld a, [wSquishMonCurrentDirection]
	cp 0
	jr nz, .right
	call AnimCopyRowLeft
	dec hl
	jr .next
.right
	call AnimCopyRowRight
	inc hl
.next
	ld [hl], " "
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop bc
	dec c
	jr nz, .loop
	jp Delay3

AnimationShootBallsUpward:
; Shoots one pillar of "energy" balls upwards. Used in Teleport/Sky Attack
; animations.
	ldh a, [hWhoseTurn]
	and a
	jr z, .playerTurn
	lb bc, 0, 16 * 8
	jr .next
.playerTurn
	lb bc, 6 * 8, 5 * 8
.next
	ld a, b
	ld [wBaseCoordY], a
	ld a, c
	ld [wBaseCoordX], a
	lb bc, 5, 1
	call _AnimationShootBallsUpward
	jp AnimationCleanOAM

_AnimationShootBallsUpward:
	push bc
	xor a
	ld [wWhichBattleAnimTileset], a
	call LoadMoveAnimationTiles
	pop bc
	ld d, $7a ; ball tile
	ld hl, wShadowOAM
	push bc
	ld a, [wBaseCoordY]
	ld e, a
.initOAMLoop
	call BattleAnimWriteOAMEntry
	dec b
	jr nz, .initOAMLoop
	call DelayFrame
	pop bc
	ld a, b
	ld [wNumShootingBalls], a
.loop
	push bc
	ld hl, wShadowOAM
.innerLoop
	ld a, [wBaseCoordY]
	add 8
	ld e, a
	ld a, [hl]
	cp e ; has the ball reached the top?
	jr z, .reachedTop
	add -4 ; ball hasn't reached the top. move it up 4 pixels
	ld [hl], a
	jr .next
.reachedTop
; remove the ball once it has reached the top
	ld [hl], 0 ; put it off-screen
	ld a, [wNumShootingBalls]
	dec a
	ld [wNumShootingBalls], a
.next
	ld de, 4
	add hl, de ; next OAM entry
	dec b
	jr nz, .innerLoop
	call DelayFrames
	pop bc
	ld a, [wNumShootingBalls]
	and a
	jr nz, .loop
	ret

AnimationShootManyBallsUpward:
; Shoots several pillars of "energy" balls upward.
	ldh a, [hWhoseTurn]
	and a
	ld hl, UpwardBallsAnimXCoordinatesPlayerTurn
	ld a, $50 ; y coordinate for "energy" ball pillar
	jr z, .player
	ld hl, UpwardBallsAnimXCoordinatesEnemyTurn
	ld a, $28 ; y coordinate for "energy" ball pillar
.player
	ld [wSavedY], a
.loop
	ld a, [wSavedY]
	ld [wBaseCoordY], a
	ld a, [hli]
	cp $ff
	jp z, AnimationCleanOAM
	ld [wBaseCoordX], a
	lb bc, 4, 1
	push hl
	call _AnimationShootBallsUpward
	pop hl
	jr .loop

UpwardBallsAnimXCoordinatesPlayerTurn:
; List of x coordinates for each pillar of "energy" balls in the
; AnimationShootManyBallsUpward animation. It's unused in the game.
	db $10, $40, $28, $18, $38, $30
	db -1 ; end

UpwardBallsAnimXCoordinatesEnemyTurn:
; List of x coordinates for each pillar of "energy" balls in the
; AnimationShootManyBallsUpward animation. It's unused in the game.
	db $60, $90, $78, $68, $88, $80
	db -1 ; end

AnimationMinimizeMon:
; Changes the mon's sprite to a mini black sprite. Used by the
; Minimize animation.
	ld hl, wTempPic
	push hl
	xor a
	ld bc, 7 * 7 * $10
	call FillMemory
	pop hl
	ld de, 7 * 3 * $10 + 4 * $10 + 4
	add hl, de
	ld de, MinimizedMonSprite
	ld c, MinimizedMonSpriteEnd - MinimizedMonSprite
.loop
	ld a, [de]
	ld [hli], a
	ld [hli], a
	inc de
	dec c
	jr nz, .loop
	call CopyTempPicToMonPic
	call Delay3
	jp AnimationShowMonPic

MinimizedMonSprite:
; 8x5 partial tile graphic
pusho
opt b.X ; . = 0, X = 1
	db %...XX...
	db %..XXXX..
	db %.XXXXXX.
	db %..XXXX..
	db %..X..X..
popo
MinimizedMonSpriteEnd:

AnimationSlideMonDownAndHide:
; Slides the mon's sprite down and disappears. Used in Acid Armor.
	ld a, TILEMAP_SLIDE_DOWN_MON_PIC_7X5
	ld c, 2
.loop
	push bc
	push af
	call AnimationHideMonPic
	pop af
	push af
	call GetTileIDList
	call GetMonSpriteTileMapPointerFromRowCount
	call CopyPicTiles
	ld c, 8
	call DelayFrames
	pop af
	inc a
	pop bc
	dec c
	jr nz, .loop
	call AnimationHideMonPic
	ld hl, wTempPic
	ld bc, 7 * 7 tiles
	xor a
	call FillMemory
	jp CopyTempPicToMonPic

_AnimationSlideMonOff:
; Slides the mon's sprite off the screen horizontally by e tiles and waits
; [wSlideMonDelay] V-blanks each time the pic is slid by one tile.
	ldh a, [hWhoseTurn]
	and a
	jr z, .playerTurn
	hlcoord 12, 0
	jr .next
.playerTurn
	hlcoord 0, 5
.next
	ld d, 8 ; d's value is unused
.slideLoop ; iterates once for each time the pic slides by one tile
	push hl
	ld b, 7
.rowLoop ; iterates once for each row
	ld c, 8
.tileLoop ; iterates once for each tile in the row
	ldh a, [hWhoseTurn]
	and a
	jr z, .playerTurn2
	call .EnemyNextTile
	jr .next2
.playerTurn2
	call .PlayerNextTile
.next2
	ld [hli], a
	dec c
	jr nz, .tileLoop
	push de
	ld de, SCREEN_WIDTH - 8
	add hl, de
	pop de
	dec b
	jr nz, .rowLoop
	ld a, [wSlideMonDelay]
	ld c, a
	call DelayFrames
	pop hl
	dec d
	dec e
	jr nz, .slideLoop
	ret

; Since mon pic tile numbers go from top to bottom, left to right in order,
; adding the height of the mon pic in tiles to a tile number gives the tile
; number of the tile one column to the right (and thus subtracting the height
; gives the reverse). If the next tile would be past the edge of the pic, the 2
; functions below catch it by checking if the tile number is within the valid
; range and if not, replacing it with a blank tile.

.PlayerNextTile
	ld a, [hl]
	add 7
; This is a bug. The lower right corner tile of the mon back pic is blanked
; while the mon is sliding off the screen. It should compare with the max tile
; plus one instead.
	cp $61
	ret c
	ld a, " "
	ret

.EnemyNextTile
	ld a, [hl]
	sub 7
; This has the same problem as above, but it has no visible effect because
; the lower right tile is in the first column to slide off the screen.
	cp $30
	ret c
	ld a, " "
	ret

AnimationSlideMonHalfOff:
; Slides the mon's sprite halfway off the screen. It's used in Softboiled.
	ld e, 4
	ld a, 4
	ld [wSlideMonDelay], a
	call _AnimationSlideMonOff
	jp Delay3

CopyTempPicToMonPic:
	ldh a, [hWhoseTurn]
	and a
	ld hl, vBackPic ; player turn
	jr z, .next
	ld hl, vFrontPic ; enemy turn
.next
	ld de, wTempPic
	ld bc, 7 * 7
	jp CopyVideoData

AnimationWavyScreen:
; used in Psywave/Psychic etc.
	ld hl, vBGMap0
	call BattleAnimCopyTileMapToVRAM
	call Delay3
	xor a
	ldh [hAutoBGTransferEnabled], a
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	ld d, $80 ; terminator
	ld e, SCREEN_HEIGHT_PX - 1
	ld c, $ff
	ld hl, WavyScreenLineOffsets
.loop
	push hl
.innerLoop
	call WavyScreen_SetSCX
	ldh a, [rLY]
	cp e ; is it the last visible line in the frame?
	jr nz, .innerLoop ; keep going if not
	pop hl
	inc hl
	ld a, [hl]
	cp d ; have we reached the end?
	jr nz, .next
	ld hl, WavyScreenLineOffsets ; go back to the beginning if so
.next
	dec c
	jr nz, .loop
	xor a
	ldh [hWY], a
	call SaveScreenTilesToBuffer2
	call ClearScreen
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	call LoadScreenTilesFromBuffer2
	ld hl, vBGMap1
	call BattleAnimCopyTileMapToVRAM
	ret

WavyScreen_SetSCX:
	ldh a, [rSTAT]
	and $3 ; is it H-blank?
	jr nz, WavyScreen_SetSCX ; wait until it's H-blank
	ld a, [hl]
	ldh [rSCX], a
	inc hl
	ld a, [hl]
	cp d ; have we reached the end?
	ret nz
	ld hl, WavyScreenLineOffsets ; go back to the beginning if so
	ret

WavyScreenLineOffsets:
; Sequence of horizontal line pixel offsets for the wavy screen animation.
; This sequence vaguely resembles a sine wave.
	db 0, 0, 0, 0, 0,  1,  1,  1,  2,  2,  2,  2,  2,  1,  1,  1
	db 0, 0, 0, 0, 0, -1, -1, -1, -2, -2, -2, -2, -2, -1, -1, -1
	db $80 ; terminator

AnimationSubstitute:
; Changes the pokemon's sprite to the mini sprite
	ld hl, wTempPic
	xor a
	ld bc, $310
	call FillMemory
	ldh a, [hWhoseTurn]
	and a
	jr z, .playerTurn
	ld hl, MonsterSprite tile 0 ; facing down sprite
	ld de, wTempPic + $120
	call CopyMonsterSpriteData
	ld hl, MonsterSprite tile 1
	ld de, wTempPic + $120 + $70
	call CopyMonsterSpriteData
	ld hl, MonsterSprite tile 2
	ld de, wTempPic + $120 + $10
	call CopyMonsterSpriteData
	ld hl, MonsterSprite tile 3
	ld de, wTempPic + $120 + $10 + $70
	call CopyMonsterSpriteData
	jr .next
.playerTurn
	ld hl, MonsterSprite tile 4 ; facing up sprite
	ld de, wTempPic + $120 + $70
	call CopyMonsterSpriteData
	ld hl, MonsterSprite tile 5
	ld de, wTempPic + $120 + $e0
	call CopyMonsterSpriteData
	ld hl, MonsterSprite tile 6
	ld de, wTempPic + $120 + $80
	call CopyMonsterSpriteData
	ld hl, MonsterSprite tile 7
	ld de, wTempPic + $120 + $f0
	call CopyMonsterSpriteData
.next
	call CopyTempPicToMonPic
	jp AnimationShowMonPic

CopyMonsterSpriteData:
	ld bc, 1 tiles
	ld a, BANK(MonsterSprite)
	jp FarCopyData2

HideSubstituteShowMonAnim:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMonMinimized
	ld a, [wPlayerBattleStatus2]
	jr z, .next1
	ld hl, wEnemyMonMinimized
	ld a, [wEnemyBattleStatus2]
.next1
	push hl
; if the substitute broke, slide it down, else slide it offscreen horizontally
	bit HAS_SUBSTITUTE_UP, a
	jr nz, .substituteStillUp
	call AnimationSlideMonDown
	jr .next2
.substituteStillUp
	call AnimationSlideMonOff
.next2
	pop hl
	ld a, [hl]
	and a
	jp nz, AnimationMinimizeMon
	call AnimationFlashMonPic
	jp AnimationShowMonPic

ReshowSubstituteAnim:
	call AnimationSlideMonOff
	call AnimationSubstitute
	jp AnimationShowMonPic

AnimationBoundUpAndDown:
; Bounces the mon's sprite up and down several times. It is used
; by Splash's animation.
	ld c, 5
.loop
	push bc
	call AnimationSlideMonDown
	pop bc
	dec c
	jr nz, .loop
	jp AnimationShowMonPic

AnimationTransformMon:
; Redraws this mon's sprite as the back/front sprite of the opposing mon.
; Used in Transform.
	ld a, [wEnemyMonSpecies]
	ld [wChangeMonPicPlayerTurnSpecies], a
	ld a, [wBattleMonSpecies]
	ld [wChangeMonPicEnemyTurnSpecies], a

ChangeMonPic:
	ldh a, [hWhoseTurn]
	and a
	jr z, .playerTurn
	ld a, [wChangeMonPicEnemyTurnSpecies]
	ld [wcf91], a
	ld [wd0b5], a
	xor a
	ld [wSpriteFlipped], a
	call GetMonHeader
	hlcoord 12, 0
	call LoadFrontSpriteByMonIndex
	jr .done
.playerTurn
	ld a, [wBattleMonSpecies2]
	push af
	ld a, [wChangeMonPicPlayerTurnSpecies]
	ld [wBattleMonSpecies2], a
	ld [wd0b5], a
	call GetMonHeader
	predef LoadMonBackPic
	xor a ; TILEMAP_MON_PIC
	call GetTileIDList
	call GetMonSpriteTileMapPointerFromRowCount
	call CopyPicTiles
	pop af
	ld [wBattleMonSpecies2], a
.done
	ld b, SET_PAL_BATTLE
	jp RunPaletteCommand

AnimationHideEnemyMonPic:
; Hides the enemy mon's sprite
	xor a
	ldh [hAutoBGTransferEnabled], a
	ld hl, AnimationHideMonPic
	call CallWithTurnFlipped
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	jp Delay3

InitMultipleObjectsOAM:
; Writes c OAM entries with tile d.
; Sets their Y coordinates to sequential multiples of 8, starting from 0.
; Sets their X coordinates to 0.
; Loads animation tileset a.
	push bc
	push de
	ld [wWhichBattleAnimTileset], a
	call LoadMoveAnimationTiles
	pop de
	pop bc
	xor a
	ld e, a
	ld [wBaseCoordX], a
	ld hl, wShadowOAM
.loop
	call BattleAnimWriteOAMEntry
	dec c
	jr nz, .loop
	ret

AnimationHideMonPic:
; Hides the mon's sprite.
	ldh a, [hWhoseTurn]
	and a
	jr z, .playerTurn
	ld a, 12
	jr ClearMonPicFromTileMap
.playerTurn
	ld a, 5 * SCREEN_WIDTH + 1

ClearMonPicFromTileMap:
	push hl
	push de
	push bc
	ld e, a
	ld d, 0
	hlcoord 0, 0
	add hl, de
	lb bc, 7, 7
	call ClearScreenArea
	pop bc
	pop de
	pop hl
	ret

; puts the tile map destination address of a mon sprite in hl, given the row count in b
; The usual row count is 7, but it may be smaller when sliding a mon sprite in/out,
; in order to show only a portion of the mon sprite.
GetMonSpriteTileMapPointerFromRowCount:
	push de
	ldh a, [hWhoseTurn]
	and a
	jr nz, .enemyTurn
	ld a, 20 * 5 + 1
	jr .next
.enemyTurn
	ld a, 12
.next
	hlcoord 0, 0
	ld e, a
	ld d, 0
	add hl, de
	ld a, 7
	sub b
	and a
	jr z, .done
	ld de, 20
.loop
	add hl, de
	dec a
	jr nz, .loop
.done
	pop de
	ret

; Input:
; a = tile ID list index
; Output:
; de = tile ID list pointer
; b = number of rows
; c = number of columns
GetTileIDList:
	ld hl, TileIDListPointerTable
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld b, a
	and $f
	ld c, a
	ld a, b
	swap a
	and $f
	ld b, a
	ret

AnimCopyRowLeft:
; copy a row of c tiles 1 tile left
	ld a, [hld]
	ld [hli], a
	inc hl
	dec c
	jr nz, AnimCopyRowLeft
	ret

AnimCopyRowRight:
; copy a row of c tiles 1 tile right
	ld a, [hli]
	ld [hld], a
	dec hl
	dec c
	jr nz, AnimCopyRowRight
	ret

; get the sound of the move id in b
GetMoveSoundB:
	ld a, b
	call GetMoveSound
	ld b, a
	ret

GetMoveSound:
	ld hl, MoveSoundTable
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld b, a
	call IsCryMove
	jr nc, .NotCryMove
	ldh a, [hWhoseTurn]
	and a
	jr nz, .next
	ld a, [wBattleMonSpecies] ; get number of current monster
	jr .Continue
.next
	ld a, [wEnemyMonSpecies]
.Continue
	push hl
	call GetCryData
	ld b, a
	pop hl
	ld a, [wFrequencyModifier]
	add [hl]
	ld [wFrequencyModifier], a
	inc hl
	ld a, [wTempoModifier]
	add [hl]
	ld [wTempoModifier], a
	jr .done
.NotCryMove
	ld a, [hli]
	ld [wFrequencyModifier], a
	ld a, [hli]
	ld [wTempoModifier], a
.done
	ld a, b
	ret

IsCryMove:
; set carry if the move animation involves playing a monster cry
	ld a, [wAnimationID]
	cp GROWL
	jr z, .CryMove
	cp ROAR
	jr z, .CryMove
	and a ; clear carry
	ret
.CryMove
	scf
	ret

INCLUDE "data/moves/sfx.asm"

CopyPicTiles:
	ldh a, [hWhoseTurn]
	and a
	ld a, $31 ; base tile ID of player mon sprite
	jr z, .next
; enemy turn
	xor a ; base tile ID of enemy mon sprite
.next
	ldh [hBaseTileID], a
	jr CopyTileIDs_NoBGTransfer

; copy the tiles used when a mon is being sent out of or into a pokeball
CopyDownscaledMonTiles:
	call GetPredefRegisters
	ld a, [wDownscaledMonSize]
	and a
	jr nz, .smallerSize
	ld de, DownscaledMonTiles_5x5
	jr CopyTileIDs_NoBGTransfer
.smallerSize
	ld de, DownscaledMonTiles_3x3
; fall through

CopyTileIDs_NoBGTransfer:
	xor a
	ldh [hAutoBGTransferEnabled], a
; fall through

; b = number of rows
; c = number of columns
CopyTileIDs:
	push hl
.rowLoop
	push bc
	push hl
	ldh a, [hBaseTileID]
	ld b, a
.columnLoop
	ld a, [de]
	add b
	inc de
	ld [hli], a
	dec c
	jr nz, .columnLoop
	pop hl
	ld bc, 20
	add hl, bc
	pop bc
	dec b
	jr nz, .rowLoop
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	pop hl
	ret

INCLUDE "data/tilemaps.asm"

AnimationLeavesFalling:
; Makes leaves float down from the top of the screen. This is used
; in Razor Leaf's animation.
	ldh a, [rOBP0]
	push af
	ld a, [wAnimPalette]
	ldh [rOBP0], a
	ld d, $37 ; leaf tile
	ld a, 3 ; number of leaves
	ld [wNumFallingObjects], a
	call AnimationFallingObjects
	pop af
	ldh [rOBP0], a
	ret

AnimationPetalsFalling:
; Makes lots of petals fall down from the top of the screen. It's used in
; the animation for Petal Dance.
	ld d, $71 ; petal tile
	ld a, 20 ; number of petals
	ld [wNumFallingObjects], a
	call AnimationFallingObjects
	jp ClearSprites

AnimationFallingObjects:
	ld c, a
	ld a, 1
	call InitMultipleObjectsOAM
	call FallingObjects_InitXCoords
	call FallingObjects_InitMovementData
	ld hl, wShadowOAM
	ld [hl], 0
.loop
	ld hl, wFallingObjectsMovementData
	ld de, 0
	ld a, [wNumFallingObjects]
	ld c, a
.innerLoop
	push bc
	push hl
	push de
	ld a, [hl]
	ld [wFallingObjectMovementByte], a
	call FallingObjects_UpdateMovementByte
	call FallingObjects_UpdateOAMEntry
	pop de
	ld hl, 4
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [wFallingObjectMovementByte]
	ld [hli], a
	pop bc
	dec c
	jr nz, .innerLoop
	call Delay3
	ld hl, wShadowOAM
	ld a, [hl] ; Y
	cp 104 ; has the top falling object reached 104 yet?
	jr nz, .loop ; keep moving the falling objects down until it does
	ret

FallingObjects_UpdateOAMEntry:
; Increases Y by 2 pixels and adjusts X and X flip based on the falling object's
; movement byte.
	ld hl, wShadowOAM
	add hl, de
	ld a, [hl]
	inc a
	inc a
	cp 112
	jr c, .next
	ld a, 160 ; if Y >= 112, put it off-screen
.next
	ld [hli], a ; Y
	ld a, [wFallingObjectMovementByte]
	ld b, a
	ld de, FallingObjects_DeltaXs
	and $7f
	add e
	jr nc, .noCarry
	inc d
.noCarry
	ld e, a
	ld a, b
	and $80
	jr nz, .movingLeft
; moving right
	ld a, [de]
	add [hl]
	ld [hli], a ; X
	inc hl
	xor a ; no horizontal flip
	jr .next2
.movingLeft
	ld a, [de]
	ld b, a
	ld a, [hl]
	sub b
	ld [hli], a ; X
	inc hl
	ld a, (1 << OAM_X_FLIP)
.next2
	ld [hl], a ; attribute
	ret

FallingObjects_DeltaXs:
	db 0, 1, 3, 5, 7, 9, 11, 13, 15

FallingObjects_UpdateMovementByte:
	ld a, [wFallingObjectMovementByte]
	inc a
	ld b, a
	and $7f
	cp 9 ; have we reached the end of the delta-Xs?
	ld a, b
	jr nz, .next
; We've reached the end of the delta-Xs, so wrap to the start and change
; direction from right to left or vice versa.
	and $80
	xor $80
.next
	ld [wFallingObjectMovementByte], a
	ret

FallingObjects_InitXCoords:
	ld hl, wShadowOAMSprite00XCoord
	ld de, FallingObjects_InitialXCoords
	ld a, [wNumFallingObjects]
	ld c, a
.loop
	ld a, [de]
	ld [hli], a
	inc hl
	inc hl
	inc hl
	inc de
	dec c
	jr nz, .loop
	ret

FallingObjects_InitialXCoords:
	db $38, $40, $50, $60, $70, $88, $90, $56, $67, $4A, $77, $84, $98, $32, $22, $5C, $6C, $7D, $8E, $99

FallingObjects_InitMovementData:
	ld hl, wFallingObjectsMovementData
	ld de, FallingObjects_InitialMovementData
	ld a, [wNumFallingObjects]
	ld c, a
.loop
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop
	ret

FallingObjects_InitialMovementData:
	db $00, $84, $06, $81, $02, $88, $01, $83, $05, $89, $09, $80, $07, $87, $03, $82, $04, $85, $08, $86

AnimationShakeEnemyHUD:
; Shakes the enemy HUD.

; Make a copy of the back pic's tile patterns in sprite tile pattern VRAM.
	ld de, vBackPic
	ld hl, vSprites
	ld bc, 7 * 7
	call CopyVideoData

	xor a
	ldh [hSCX], a

; Copy wTileMap to BG map 0. The regular BG (not the window) is set to use
; map 0 and can be scrolled with SCX, which allows a shaking effect.
	ld hl, vBGMap0
	call BattleAnimCopyTileMapToVRAM

; Now that the regular BG is showing the same thing the window was, move the
; window off the screen so that we can modify its contents below.
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a

; Copy wTileMap to VRAM such that the row below the enemy HUD (in wTileMap) is
; lined up with row 0 of the window.
	ld hl, vBGMap1 - $20 * 7
	call BattleAnimCopyTileMapToVRAM

; Move the window so that the row below the enemy HUD (in BG map 0) lines up
; with the top row of the window on the screen. This makes it so that the window
; covers everything below the enemy HD with a copy that looks just like what
; was there before.
	ld a, 7 * 8
	ldh [hWY], a

; Write OAM entries so that the copy of the back pic from the top of this
; function shows up on screen. We need this because the back pic's Y coordinates
; range overlaps with that of the enemy HUD and we don't want to shake the top
; of the back pic when we shake the enemy HUD. The OAM copy won't be affected
; by SCX.
	call ShakeEnemyHUD_WritePlayerMonPicOAM

	ld hl, vBGMap0
	call BattleAnimCopyTileMapToVRAM

; Remove the back pic from the BG map.
	call AnimationHideMonPic
	call Delay3

; Use SCX to shake the regular BG. The window and the back pic OAM copy are
; not affected.
	lb de, 2, 8
	call ShakeEnemyHUD_ShakeBG

; Restore the original graphics.
	call AnimationShowMonPic
	call ClearSprites
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	ld hl, vBGMap1
	call BattleAnimCopyTileMapToVRAM
	xor a
	ldh [hWY], a
	call SaveScreenTilesToBuffer1
	ld hl, vBGMap0
	call BattleAnimCopyTileMapToVRAM
	call ClearScreen
	call Delay3
	call LoadScreenTilesFromBuffer1
	ld hl, vBGMap1
	jp BattleAnimCopyTileMapToVRAM

; b = tile ID list index
; c = base tile ID
CopyTileIDsFromList:
	call GetPredefRegisters
	ld a, c
	ldh [hBaseTileID], a
	ld a, b
	push hl
	call GetTileIDList
	pop hl
	jp CopyTileIDs

ShakeEnemyHUD_ShakeBG:
	ldh a, [hSCX]
	ld [wTempSCX], a
.loop
	ld a, [wTempSCX]
	add d
	ldh [hSCX], a
	ld c, 2
	call DelayFrames
	ld a, [wTempSCX]
	sub d
	ldh [hSCX], a
	ld c, 2
	call DelayFrames
	dec e
	jr nz, .loop
	ld a, [wTempSCX]
	ldh [hSCX], a
	ret

BattleAnimCopyTileMapToVRAM:
	ld a, h
	ldh [hAutoBGTransferDest + 1], a
	ld a, l
	ldh [hAutoBGTransferDest], a
	jp Delay3

TossBallAnimation:
	ld a, [wIsInBattle]
	cp 2
	jr z, .BlockBall ; if in trainer battle, play different animation
	ld a, [wPokeBallAnimData]
	ld b, a

	; upper nybble: how many animations (from PokeBallAnimations) to play
	; this will be 4 for successful capture, 6 for breakout
	and $F0
	swap a
	ld c, a

	; lower nybble: number of shakes
	; store these for later
	ld a, b
	and $F
	ld [wNumShakes], a

	ld hl, .PokeBallAnimations
	; choose which toss animation to use
	ld a, [wcf91]
	cp POKE_BALL
	ld b, TOSS_ANIM
	jr z, .done
	cp GREAT_BALL
	ld b, GREATTOSS_ANIM
	jr z, .done
	ld b, ULTRATOSS_ANIM
.done
	ld a, b
.PlayNextAnimation
	ld [wAnimationID], a
	push bc
	push hl
	call PlayAnimation
	pop hl
	ld a, [hli]
	pop bc
	dec c
	jr nz, .PlayNextAnimation
	ret

.PokeBallAnimations:
; sequence of animations that make up the Poké Ball toss
	db POOF_ANIM, HIDEPIC_ANIM, SHAKE_ANIM, POOF_ANIM, SHOWPIC_ANIM

.BlockBall
	ld a, TOSS_ANIM
	ld [wAnimationID], a
	call PlayAnimation
	ld a, SFX_FAINT_THUD
	call PlaySound
	ld a, BLOCKBALL_ANIM
	ld [wAnimationID], a
	jp PlayAnimation

PlayApplyingAttackSound:
; play a different sound depending if move is not very effective, neutral, or super-effective
; don't play any sound at all if move is ineffective
	call WaitForSoundToFinish
	ld a, [wDamageMultipliers]
	and $7f
	ret z
	cp 10
	ld a, $20
	ld b, $30
	ld c, SFX_DAMAGE
	jr z, .playSound
	ld a, $e0
	ld b, $ff
	ld c, SFX_SUPER_EFFECTIVE
	jr nc, .playSound
	ld a, $50
	ld b, $1
	ld c, SFX_NOT_VERY_EFFECTIVE
.playSound
	ld [wFrequencyModifier], a
	ld a, b
	ld [wTempoModifier], a
	ld a, c
	jp PlaySound
