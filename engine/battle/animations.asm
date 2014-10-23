; Draws a "frame block". Frame blocks are blocks of tiles that are put
; together to form frames in battle animations.
DrawFrameBlock: ; 78000 (1e:4000)
	ld l,c
	ld h,b
	ld a,[hli]
	ld [W_NUMFBTILES],a
	ld a,[W_FBDESTADDR + 1]
	ld e,a
	ld a,[W_FBDESTADDR]
	ld d,a
	xor a
	ld [W_FBTILECOUNTER],a ; loop counter
.loop
	ld a,[W_FBTILECOUNTER]
	inc a
	ld [W_FBTILECOUNTER],a
	ld a,[W_SUBANIMTRANSFORM]
	dec a
	jr z,.flipHorizontalAndVertical   ; 1
	dec a
	jp z,.flipHorizontalTranslateDown ; 2
	dec a
	jr z,.flipBaseCoords              ; 3
.noTransformation
	ld a,[W_BASECOORDY]
	add [hl]
	ld [de],a ; store Y
	inc hl
	inc de
	ld a,[W_BASECOORDX]
	jr .finishCopying
.flipBaseCoords
	ld a,[W_BASECOORDY]
	ld b,a
	ld a,136
	sub b ; flip Y base coordinate
	add [hl] ; Y offset
	ld [de],a ; store Y
	inc hl
	inc de
	ld a,[W_BASECOORDX]
	ld b,a
	ld a,168
	sub b ; flip X base coordinate
.finishCopying ; finish copying values to OAM (when [W_SUBANIMTRANSFORM] not 1 or 2)
	add [hl] ; X offset
	ld [de],a ; store X
	inc hl
	inc de
	ld a,[hli]
	add a,$31 ; base tile ID for battle animations
	ld [de],a ; store tile ID
	inc de
	ld a,[hli]
	ld [de],a ; store flags
	inc de
	jp .nextTile
.flipHorizontalAndVertical
	ld a,[W_BASECOORDY]
	add [hl] ; Y offset
	ld b,a
	ld a,136
	sub b ; flip Y coordinate
	ld [de],a ; store Y
	inc hl
	inc de
	ld a,[W_BASECOORDX]
	add [hl] ; X offset
	ld b,a
	ld a,168
	sub b ; flip X coordinate
	ld [de],a ; store X
	inc hl
	inc de
	ld a,[hli]
	add a,$31 ; base tile ID for battle animations
	ld [de],a ; store tile ID
	inc de
; toggle horizontal and vertical flip
	ld a,[hli] ; flags
	and a
	ld b,OAM_VFLIP | OAM_HFLIP
	jr z,.storeFlags1
	cp a,OAM_HFLIP
	ld b,OAM_VFLIP
	jr z,.storeFlags1
	cp a,OAM_VFLIP
	ld b,OAM_HFLIP
	jr z,.storeFlags1
	ld b,0
.storeFlags1
	ld a,b
	ld [de],a
	inc de
	jp .nextTile
.flipHorizontalTranslateDown
	ld a,[W_BASECOORDY]
	add [hl]
	add a,40 ; translate Y coordinate downwards
	ld [de],a ; store Y
	inc hl
	inc de
	ld a,[W_BASECOORDX]
	add [hl]
	ld b,a
	ld a,168
	sub b ; flip X coordinate
	ld [de],a ; store X
	inc hl
	inc de
	ld a,[hli]
	add a,$31 ; base tile ID for battle animations
	ld [de],a ; store tile ID
	inc de
	ld a,[hli]
	bit 5,a ; is horizontal flip enabled?
	jr nz,.disableHorizontalFlip
.enableHorizontalFlip
	set 5,a
	jr .storeFlags2
.disableHorizontalFlip
	res 5,a
.storeFlags2
	ld [de],a
	inc de
.nextTile
	ld a,[W_FBTILECOUNTER]
	ld c,a
	ld a,[W_NUMFBTILES]
	cp c
	jp nz,.loop ; go back up if there are more tiles to draw
.afterDrawingTiles
	ld a,[W_FBMODE]
	cp a,2
	jr z,.advanceFrameBlockDestAddr; skip delay and don't clean OAM buffer
	ld a,[W_SUBANIMFRAMEDELAY]
	ld c,a
	call DelayFrames
	ld a,[W_FBMODE]
	cp a,3
	jr z,.advanceFrameBlockDestAddr ; skip cleaning OAM buffer
	cp a,4
	jr z,.done ; skip cleaning OAM buffer and don't advance the frame block destination address
	ld a,[W_ANIMATIONID]
	cp a,GROWL
	jr z,.resetFrameBlockDestAddr
	call AnimationCleanOAM
.resetFrameBlockDestAddr
	ld hl,wOAMBuffer ; OAM buffer
	ld a,l
	ld [W_FBDESTADDR + 1],a
	ld a,h
	ld [W_FBDESTADDR],a ; set destination address to beginning of OAM buffer
	ret
.advanceFrameBlockDestAddr
	ld a,e
	ld [W_FBDESTADDR + 1],a
	ld a,d
	ld [W_FBDESTADDR],a
.done
	ret

PlayAnimation: ; 780f1 (1e:40f1)
	xor a
	ld [$FF8B],a
	ld [W_SUBANIMTRANSFORM],a
	ld a,[W_ANIMATIONID] ; get animation number
	dec a
	ld l,a
	ld h,0
	add hl,hl
	ld de,AttackAnimationPointers  ; $607d ; animation command stream pointers
	add hl,de
	ld a,[hli]
	ld h,[hl]
	ld l,a
.animationLoop
	ld a,[hli]
	cp a,$FF
	jr z,.AnimationOver
	cp a,$C0 ; is this subanimation or a special effect?
	jr c,.playSubanimation
.doSpecialEffect
	ld c,a
	ld de,SpecialEffectPointers
.searchSpecialEffectTableLoop
	ld a,[de]
	cp c
	jr z,.foundMatch
	inc de
	inc de
	inc de
	jr .searchSpecialEffectTableLoop
.foundMatch
	ld a,[hli]
	cp a,$FF ; is there a sound to play?
	jr z,.skipPlayingSound
	ld [wAnimSoundID],a ; store sound
	push hl
	push de
	call Func_7986f
	call PlaySound
	pop de
	pop hl
.skipPlayingSound
	push hl
	inc de
	ld a,[de]
	ld l,a
	inc de
	ld a,[de]
	ld h,a
	ld de,.nextAnimationCommand
	push de
	jp [hl] ; jump to special effect function
.playSubanimation
	ld c,a
	and a,%00111111
	ld [W_SUBANIMFRAMEDELAY],a
	xor a
	sla c
	rla
	sla c
	rla
	ld [wd09f],a ; tile select
	ld a,[hli] ; sound
	ld [wAnimSoundID],a ; store sound
	ld a,[hli] ; subanimation ID
	ld c,l
	ld b,h
	ld l,a
	ld h,0
	add hl,hl
	ld de,SubanimationPointers
	add hl,de
	ld a,l
	ld [W_SUBANIMADDRPTR],a
	ld a,h
	ld [W_SUBANIMADDRPTR + 1],a
	ld l,c
	ld h,b
	push hl
	ld a,[rOBP0]
	push af
	ld a,[wcc79]
	ld [rOBP0],a
	call LoadAnimationTileset
	call LoadSubanimation
	call PlaySubanimation
	pop af
	ld [rOBP0],a
.nextAnimationCommand
	pop hl
	jr .animationLoop
.AnimationOver ; 417B
	ret

LoadSubanimation: ; 7817c (1e:417c)
	ld a,[W_SUBANIMADDRPTR + 1]
	ld h,a
	ld a,[W_SUBANIMADDRPTR]
	ld l,a
	ld a,[hli]
	ld e,a
	ld a,[hl]
	ld d,a ; de = address of subanimation
	ld a,[de]
	ld b,a
	and a,31
	ld [W_SUBANIMCOUNTER],a ; number of frame blocks
	ld a,b
	and a,%11100000
	cp a,5 << 5 ; is subanimation type 5?
	jr nz,.isNotType5
.isType5
	call GetSubanimationTransform2
	jr .saveTransformation
.isNotType5
	call GetSubanimationTransform1
.saveTransformation
; place the upper 3 bits of a into bits 0-2 of a before storing
	srl a
	swap a
	ld [W_SUBANIMTRANSFORM],a
	cp a,4 ; is the animation reversed?
	ld hl,0
	jr nz,.storeSubentryAddr
; if the animation is reversed, then place the initial subentry address at the end of the list of subentries
	ld a,[W_SUBANIMCOUNTER]
	dec a
	ld bc,3
.loop
	add hl,bc
	dec a
	jr nz,.loop
.storeSubentryAddr
	inc de
	add hl,de
	ld a,l
	ld [W_SUBANIMSUBENTRYADDR],a
	ld a,h
	ld [W_SUBANIMSUBENTRYADDR + 1],a
	ret

; called if the subanimation type is not 5
; sets the transform to 0 (i.e. no transform) if it's the player's turn
; sets the transform to the subanimation type if it's the enemy's turn
GetSubanimationTransform1: ; 781c2 (1e:41c2)
	ld b,a
	ld a,[H_WHOSETURN]
	and a
	ld a,b
	ret nz
	xor a
	ret

; called if the subanimation type is 5
; sets the transform to 2 (i.e. horizontal and vertical flip) if it's the player's turn
; sets the transform to 0 (i.e. no transform) if it's the enemy's turn
GetSubanimationTransform2: ; 781ca (1e:41ca)
	ld a,[H_WHOSETURN]
	and a
	ld a,2 << 5
	ret z
	xor a
	ret

; loads tile patterns for battle animations
LoadAnimationTileset: ; 781d2 (1e:41d2)
	ld a,[wd09f] ; tileset select
	add a
	add a
	ld hl,AnimationTilesetPointers
	ld e,a
	ld d,0
	add hl,de
	ld a,[hli]
	ld [wd07d],a ; number of tiles
	ld a,[hli]
	ld e,a
	ld a,[hl]
	ld d,a ; de = address of tileset
	ld hl,vSprites + $310
	ld b, BANK(AnimationTileset1) ; ROM bank
	ld a,[wd07d]
	ld c,a ; number of tiles
	jp CopyVideoData ; load tileset

AnimationTilesetPointers: ; 781f2 (1e:41f2)
	db 79 ; number of tiles
	dw AnimationTileset1
	db $FF

	db 79 ; number of tiles
	dw AnimationTileset2
	db $FF

	db 64 ; number of tiles
	dw AnimationTileset1
	db $FF

AnimationTileset1: ; 781fe (1e:41fe)
	INCBIN "gfx/attack_anim_1.2bpp"

AnimationTileset2: ; 786ee (1e:46ee)
	INCBIN "gfx/attack_anim_2.2bpp"

SlotMachineTiles2: ; 78bde (1e:4bde)
IF DEF(_RED)
	INCBIN "gfx/red/slotmachine2.2bpp"
ENDC
IF DEF(_BLUE)
	INCBIN "gfx/blue/slotmachine2.2bpp"
ENDC
IF DEF(_YELLOW)
	INCBIN "gfx/yellow/slotmachine2.2bpp"
ENDC

MoveAnimation: ; 78d5e (1e:4d5e)
	push hl
	push de
	push bc
	push af
	call WaitForSoundToFinish
	call Func_78e23
	ld a,[W_ANIMATIONID]
	and a
	jr z,.AnimationFinished

	; if throwing a Poké Ball, skip the regular animation code
	cp a,TOSS_ANIM
	jr nz,.MoveAnimation
	ld de,.AnimationFinished
	push de
	jp TossBallAnimation

.MoveAnimation
	; check if battle animations are disabled in the options
	ld a,[W_OPTIONS]
	bit 7,a
	jr nz,.AnimationsDisabled
	call ShareMoveAnimations
	call PlayAnimation
	jr .next4
.AnimationsDisabled
	ld c,30
	call DelayFrames
.next4
	call Func_78dbd ; reload pic and flash the pic in and out (to show damage)
.AnimationFinished
	call WaitForSoundToFinish
	xor a
	ld [W_SUBANIMSUBENTRYADDR],a
	ld [wd09b],a
	ld [W_SUBANIMTRANSFORM],a
	dec a
	ld [wAnimSoundID],a
	pop af
	pop bc
	pop de
	pop hl
	ret

ShareMoveAnimations: ; 78da6 (1e:4da6)
; some moves just reuse animations from status conditions
	ld a,[H_WHOSETURN]
	and a
	ret z

	; opponent’s turn

	ld a,[W_ANIMATIONID]

	cp a,AMNESIA
	ld b,CONF_ANIM
	jr z,.Replace

	cp a,REST
	ld b,SLP_ANIM
	ret nz

.Replace
	ld a,b
	ld [W_ANIMATIONID],a
	ret

Func_78dbd: ; 78dbd (1e:4dbd)
	ld a,[wcc5b]
	and a
	ret z
	dec a
	add a
	ld c,a
	ld b,0
	ld hl,PointerTable_78dcf
	add hl,bc
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp [hl]

PointerTable_78dcf: ; 78dcf (1e:4dcf)
	dw Func_78ddb
	dw Func_78de3
	dw Func_78deb
	dw Func_78df0
	dw Func_78df6
	dw Func_78dfe

Func_78ddb: ; 78ddb (1e:4ddb)
	call Func_79e6a
	ld b, $8
	jp Func_79209

Func_78de3: ; 78de3 (1e:4de3)
	call Func_79e6a
	ld b, $8
	jp Func_79210

Func_78deb: ; 78deb (1e:4deb)
	ld bc, $602
	jr Func_78e01

Func_78df0: ; 78df0 (1e:4df0)
	call Func_79e6a
	jp AnimationBlinkEnemyMon

Func_78df6: ; 78df6 (1e:4df6)
	call Func_79e6a
	ld b, $2
	jp Func_79210

Func_78dfe: ; 78dfe (1e:4dfe)
	ld bc, $302

Func_78e01: ; 78e01 (1e:4e01)
	push bc
	push bc
.asm_78e03
	ld a, [rWX] ; $ff4b
	inc a
	ld [rWX], a ; $ff4b
	ld c, $2
	call DelayFrames
	dec b
	jr nz, .asm_78e03
	pop bc
.asm_78e11
	ld a, [rWX] ; $ff4b
	dec a
	ld [rWX], a ; $ff4b
	ld c, $2
	call DelayFrames
	dec b
	jr nz, .asm_78e11
	pop bc
	dec c
	jr nz, Func_78e01
	ret

Func_78e23: ; 78e23 (1e:4e23)
	ld a, [wOnSGB]
	and a
	ld a, $e4
	jr z, .asm_78e47
	ld a, $f0
	ld [wcc79], a
	ld b, $e4
	ld a, [W_ANIMATIONID] ; W_ANIMATIONID
	cp ANIM_AA
	jr c, .asm_78e3f
	cp ANIM_AD + 1
	jr nc, .asm_78e3f
	ld b, $f0
.asm_78e3f
	ld a, b
	ld [rOBP0], a ; $ff48
	ld a, $6c
	ld [rOBP1], a ; $ff49
	ret
.asm_78e47
	ld a, $e4
	ld [wcc79], a
	ld [rOBP0], a ; $ff48
	ld a, $6c
	ld [rOBP1], a ; $ff49
	ret

PlaySubanimation: ; 78e53 (1e:4e53)
	ld a,[wAnimSoundID]
	cp a,$FF
	jr z,.skipPlayingSound
	call Func_7986f
	call PlaySound ; play sound effect
.skipPlayingSound
	ld hl,wOAMBuffer ; base address of OAM buffer
	ld a,l
	ld [W_FBDESTADDR + 1],a
	ld a,h
	ld [W_FBDESTADDR],a
	ld a,[W_SUBANIMSUBENTRYADDR + 1]
	ld h,a
	ld a,[W_SUBANIMSUBENTRYADDR]
	ld l,a
.loop
	push hl
	ld c,[hl] ; frame block ID
	ld b,0
	ld hl,FrameBlockPointers
	add hl,bc
	add hl,bc
	ld a,[hli]
	ld c,a
	ld a,[hli]
	ld b,a
	pop hl
	inc hl
	push hl
	ld e,[hl] ; base coordinate ID
	ld d,0
	ld hl,FrameBlockBaseCoords  ; $7c85 ; base coordinate table
	add hl,de
	add hl,de
	ld a,[hli]
	ld [W_BASECOORDY],a
	ld a,[hl]
	ld [W_BASECOORDX],a
	pop hl
	inc hl
	ld a,[hl] ; frame block mode
	ld [W_FBMODE],a
	call DrawFrameBlock
	call DoSpecialEffectByAnimationId ; run animation-specific function (if there is one)
	ld a,[W_SUBANIMCOUNTER]
	dec a
	ld [W_SUBANIMCOUNTER],a
	ret z
	ld a,[W_SUBANIMSUBENTRYADDR + 1]
	ld h,a
	ld a,[W_SUBANIMSUBENTRYADDR]
	ld l,a
	ld a,[W_SUBANIMTRANSFORM]
	cp a,4 ; is the animation reversed?
	ld bc,3
	jr nz,.nextSubanimationSubentry
	ld bc,-3
.nextSubanimationSubentry
	add hl,bc
	ld a,h
	ld [W_SUBANIMSUBENTRYADDR + 1],a
	ld a,l
	ld [W_SUBANIMSUBENTRYADDR],a
	jp .loop

AnimationCleanOAM: ; 78ec8 (1e:4ec8)
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
DoSpecialEffectByAnimationId: ; 78ed7 (1e:4ed7)
	push hl
	push de
	push bc
	ld a,[W_ANIMATIONID]
	ld hl,AnimationIdSpecialEffects
	ld de,3
	call IsInArray
	jr nc,.done
	inc hl
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld de,.done
	push de
	jp [hl]
.done
	pop bc
	pop de
	pop hl
	ret

; Format: Animation ID (1 byte), Address (2 bytes)
AnimationIdSpecialEffects: ; 78ef5 (1e:4ef5)
	db MEGA_PUNCH
	dw AnimationFlashScreen

	db GUILLOTINE
	dw AnimationFlashScreen

	db MEGA_KICK
	dw AnimationFlashScreen

	db HEADBUTT
	dw AnimationFlashScreen

	db TAIL_WHIP
	dw Func_790d0

	db GROWL
	dw DoGrowlSpecialEffects

	db DISABLE
	dw AnimationFlashScreen

	db BLIZZARD
	dw DoBlizzardSpecialEffects

	db BUBBLEBEAM
	dw AnimationFlashScreen

	db HYPER_BEAM
	dw FlashScreenEveryFourFrameBlocks

	db THUNDERBOLT
	dw FlashScreenEveryEightFrameBlocks

	db REFLECT
	dw AnimationFlashScreen

	db SELFDESTRUCT
	dw DoExplodeSpecialEffects

	db SPORE
	dw AnimationFlashScreen

	db EXPLOSION
	dw DoExplodeSpecialEffects

	db ROCK_SLIDE
	dw DoRockSlideSpecialEffects

	db ANIM_AA
	dw Func_79041

	db ANIM_AB
	dw Func_7904c

	db ANIM_AC
	dw Func_7907c

	db TOSS_ANIM
	dw DoBallTossSpecialEffects

	db SHAKE_ANIM
	dw DoBallShakeSpecialEffects

	db POOF_ANIM
	dw DoPoofSpecialEffects

	db GREATTOSS_ANIM
	dw DoBallTossSpecialEffects

	db ULTRATOSS_ANIM
	dw DoBallTossSpecialEffects

	db $FF ; terminator

DoBallTossSpecialEffects: ; 78f3e (1e:4f3e)
	ld a,[wcf91]
	cp a,3 ; is it a Master Ball or Ultra Ball?
	jr nc,.skipFlashingEffect
.flashingEffect ; do a flashing effect if it's Master Ball or Ultra Ball
	ld a,[rOBP0]
	xor a,%00111100 ; complement colors 1 and 2
	ld [rOBP0],a
.skipFlashingEffect
	ld a,[W_SUBANIMCOUNTER]
	cp a,11 ; is it the beginning of the subanimation?
	jr nz,.skipPlayingSound
; if it is the beginning of the subanimation, play a sound
	ld a,(SFX_08_41 - SFX_Headers_08) / 3
	call PlaySound ; play sound
.skipPlayingSound
	ld a,[W_ISINBATTLE]
	cp a,02 ; is it a trainer battle?
	jr z,.isTrainerBattle
	ld a,[wd11e]
	cp a,$10 ; is the enemy pokemon the Ghost Marowak?
	ret nz
; if the enemy pokemon is the Ghost Marowak, make it dodge during the last 3 frames
	ld a,[W_SUBANIMCOUNTER]
	cp a,3
	jr z,.moveGhostMarowakLeft
	cp a,2
	jr z,.moveGhostMarowakLeft
	cp a,1
	ret nz
.moveGhostMarowakLeft
	hlCoord 17, 0
	ld de,20
	ld bc,$0707 ; 7 rows and 7 columns
.loop
	push hl
	push bc
	call Func_79862 ; move row of tiles left
	pop bc
	pop hl
	add hl,de
	dec b
	jr nz,.loop
	ld a,%00001000
	ld [$ff10],a ; Channel 1 sweep register
	ret
.isTrainerBattle ; if it's a trainer battle, shorten the animation by one frame
	ld a,[W_SUBANIMCOUNTER]
	cp a,3
	ret nz
	dec a
	ld [W_SUBANIMCOUNTER],a
	ret

DoBallShakeSpecialEffects: ; 78f96 (1e:4f96)
	ld a,[W_SUBANIMCOUNTER]
	cp a,4 ; is it the beginning of a shake?
	jr nz,.skipPlayingSound
; if it is the beginning of a shake, play a sound and wait 2/3 of a second
	ld a,(SFX_08_3c - SFX_Headers_08) / 3
	call PlaySound ; play sound
	ld c,40
	call DelayFrames
.skipPlayingSound
	ld a,[W_SUBANIMCOUNTER]
	dec a
	ret nz
; if it's the end of the ball shaking subanimation, check if more shakes are left and restart the subanimation
	ld a,[wWhichTrade] ; number of shakes
	dec a ; decrement number of shakes
	ld [wWhichTrade],a
	ret z
; if there are shakes left, restart the subanimation
	ld a,[W_SUBANIMSUBENTRYADDR]
	ld l,a
	ld a,[W_SUBANIMSUBENTRYADDR + 1]
	ld h,a
	ld de,-(4 * 3) ; 4 subentries and 3 bytes per subentry
	add hl,de
	ld a,l
	ld [W_SUBANIMSUBENTRYADDR],a
	ld a,h
	ld [W_SUBANIMSUBENTRYADDR + 1],a
	ld a,5 ; number of subentries in the ball shaking subanimation plus one
	ld [W_SUBANIMCOUNTER],a
	ret

; plays a sound after the second frame of the poof animation
DoPoofSpecialEffects: ; 78fce (1e:4fce)
	ld a,[W_SUBANIMCOUNTER]
	cp a,5
	ret nz
	ld a,(SFX_08_42 - SFX_Headers_08) / 3
	jp PlaySound

DoRockSlideSpecialEffects: ; 78fd9 (1e:4fd9)
	ld a,[W_SUBANIMCOUNTER]
	cp a,12
	ret nc
	cp a,8
	jr nc,.shakeScreen
	cp a,1
	jp z,AnimationFlashScreen ; if it's the end of the subanimation, flash the screen
	ret
; if the subaninmation counter is between 8 and 11, shake the screen horizontally and vertically
.shakeScreen
	ld b,1
	predef Func_48125 ; shake horizontally
	ld b,1
	predef_jump Func_480ff ; shake vertically

FlashScreenEveryEightFrameBlocks: ; 78ff7 (1e:4ff7)
	ld a,[W_SUBANIMCOUNTER]
	and a,7 ; is the subanimation counter exactly 8?
	call z,AnimationFlashScreen ; if so, flash the screen
	ret

; flashes the screen if the subanimation counter is divisible by 4
FlashScreenEveryFourFrameBlocks: ; 79000 (1e:5000)
	ld a,[W_SUBANIMCOUNTER]
	and a,3
	call z,AnimationFlashScreen
	ret

; used for Explosion and Selfdestruct
DoExplodeSpecialEffects: ; 79009 (1e:5009)
	ld a,[W_SUBANIMCOUNTER]
	cp a,1 ; is it the end of the subanimation?
	jr nz,FlashScreenEveryFourFrameBlocks
; if it's the end of the subanimation, make the attacking pokemon disappear
	hlCoord 1, 5
	jp AnimationHideMonPic ; make pokemon disappear

; flashes the screen when subanimation counter is 1 modulo 4
DoBlizzardSpecialEffects: ; 79016 (1e:5016)
	ld a,[W_SUBANIMCOUNTER]
	cp a,13
	jp z,AnimationFlashScreen
	cp a,9
	jp z,AnimationFlashScreen
	cp a,5
	jp z,AnimationFlashScreen
	cp a,1
	jp z,AnimationFlashScreen
	ret

; flashes the screen at 3 points in the subanimation
; XXX is this unused?
Func_7902e: ; 7902e (1e:502e)
	ld a,[W_SUBANIMCOUNTER]
	cp a,14
	jp z,AnimationFlashScreen
	cp a,9
	jp z,AnimationFlashScreen
	cp a,2
	jp z,AnimationFlashScreen
	ret

; function to make the pokemon disappear at the beginning of the animation
; XXX probably a trade-related animation
Func_79041: ; 79041 (1e:5041)
	ld a,[W_SUBANIMCOUNTER]
	cp a,6
	ret nz
	ld a,$2F
	jp Func_7980c ; make pokemon disappear

; function to make a shaking pokeball jump up at the end of the animation
; XXX probably a trade-related animation
Func_7904c: ; 7904c (1e:504c)
	ld a,[W_SUBANIMCOUNTER]
	cp a,1
	ret nz
; if it's the end of the animation, make the ball jump up
	ld de,BallMoveDistances1
.loop
	ld hl,wOAMBuffer ; OAM buffer
	ld bc,4
.innerLoop
	ld a,[de]
	cp a,$ff
	jr z,.done
	add [hl] ; add to Y value of OAM entry
	ld [hl],a
	add hl,bc
	ld a,l
	cp a,4 * 4 ; there are 4 entries, each 4 bytes
	jr nz,.innerLoop
	inc de
	push bc
	call Delay3
	pop bc
	jr .loop
.done
	call AnimationCleanOAM
	ld a,(SFX_02_44 - SFX_Headers_02) / 3
	jp PlaySound ; play sound

BallMoveDistances1: ; 79078 (1e:5078)
	db -12,-12,-8
	db $ff ; terminator

; function to make the pokeball jump up
; XXX probably a trade-related animation
Func_7907c ; 507C
	ld de,BallMoveDistances2
.loop
	ld hl,wOAMBuffer ; OAM buffer
	ld bc,4
.innerLoop
	ld a,[de]
	cp a,$ff
	jp z,ClearScreen
	add [hl]
	ld [hl],a
	add hl,bc
	ld a,l
	cp a,4 * 4 ; there are 4 entries, each 4 bytes
	jr nz,.innerLoop
	inc de
	push de
	ld a,[de]
	cp a,12
	jr z,.playSound
	cp a,$ff
	jr nz,.skipPlayingSound
.playSound ; play sound if next move distance is 12 or this is the last one
	ld a,(SFX_08_58 - SFX_Headers_08) / 3
	call PlaySound
.skipPlayingSound
	push bc
	ld c,5
	call DelayFrames
	pop bc
	ld a,[$ffae] ; background scroll X
	sub a,8 ; scroll to the left
	ld [$ffae],a
	pop de
	jr .loop

BallMoveDistances2: ; 790b3 (1e:50b3)
	db 11,12,-12,-7,7,12,-8,8
	db $ff ; terminator

; this function copies the current musical note graphic
; so that there are two musical notes flying towards the defending pokemon
DoGrowlSpecialEffects: ; 790bc (1e:50bc)
	ld hl,wOAMBuffer ; OAM buffer
	ld de,wOAMBuffer + $10
	ld bc,$10
	call CopyData ; copy the musical note graphic
	ld a,[W_SUBANIMCOUNTER]
	dec a
	call z,AnimationCleanOAM ; clean up at the end of the subanimation
	ret

; this is associated with Tail Whip, but Tail Whip doesn't use any subanimations
Func_790d0: ; 790d0 (1e:50d0)
	ld a,1
	ld [W_SUBANIMCOUNTER],a
	ld c,20
	jp DelayFrames

; Format: Special Effect ID (1 byte), Address (2 bytes)
SpecialEffectPointers: ; 790da (1e:50da)
	db SE_DARK_SCREEN_FLASH ; $FE
	dw AnimationFlashScreen
	db SE_DARK_SCREEN_PALETTE ; $FD
	dw AnimationDarkScreenPalette
	db SE_RESET_SCREEN_PALETTE ; $FC
	dw AnimationResetScreenPalette
	db SE_SHAKE_SCREEN ; $FB
	dw AnimationShakeScreen
	db SE_WATER_DROPLETS_EVERYWHERE ; $FA
	dw AnimationWaterDropletsEverywhere
	db SE_DARKEN_MON_PALETTE ; $F9
	dw AnimationDarkenMonPalette
	db SE_FLASH_SCREEN_LONG ; $F8
	dw AnimationFlashScreenLong
	db SE_SLIDE_MON_UP ; $F7
	dw AnimationSlideMonUp
	db SE_SLIDE_MON_DOWN ; $F6
	dw AnimationSlideMonDown
	db SE_FLASH_MON_PIC ; $F5
	dw AnimationFlashMonPic
	db SE_SLIDE_MON_OUT ; $F4
	dw AnimationSlideMonOut
	db SE_BLINK_MON ; $F3
	dw AnimationBlinkMon
	db SE_MOVE_MON_HORIZONTALLY ; $F2
	dw AnimationMoveMonHorizontally
	db SE_RESET_MON_POSITION ; $F1
	dw AnimationResetMonPosition
	db SE_LIGHT_SCREEN_PALETTE ; $F0
	dw AnimationLightScreenPalette
	db SE_HIDE_MON_PIC ; $EF
	dw AnimationHideMonPic
	db SE_SQUISH_MON_PIC ; $EE
	dw AnimationSquishMonPic
	db SE_SHOOT_BALLS_UPWARD ; $ED
	dw AnimationShootBallsUpward
	db SE_SHOOT_MANY_BALLS_UPWARD ; $EC
	dw AnimationShootManyBallsUpward
	db SE_BOUNCE_UP_AND_DOWN ; $EB
	dw AnimationBoundUpAndDown
	db SE_MINIMIZE_MON ; $EA
	dw AnimationMinimizeMon
	db SE_SLIDE_MON_DOWN_AND_HIDE ; $E9
	dw AnimationSlideMonDownAndHide
	db SE_TRANSFORM_MON ; $E8
	dw AnimationTransformMon
	db SE_LEAVES_FALLING ; $E7
	dw AnimationLeavesFalling
	db SE_PETALS_FALLING ; $E6
	dw AnimationPetalsFalling
	db SE_SLIDE_MON_HALF_LEFT ; $E5
	dw AnimationSlideMonHalfLeft
	db SE_SHAKE_ENEMY_HUD ; $E4
	dw AnimationShakeEnemyHUD
	db SE_SHAKE_ENEMY_HUD_2 ; unused--same pointer as SE_SHAKE_ENEMY_HUD ($E4)
	dw AnimationShakeEnemyHUD
	db SE_SPIRAL_BALLS_INWARD ; $E2
	dw AnimationSpiralBallsInward
	db SE_DELAY_ANIMATION_10 ; $E1
	dw AnimationDelay10
	db SE_FLASH_ENEMY_MON_PIC ; unused--same as SE_FLASH_MON_PIC ($F5), but for the enemy mon
	dw AnimationFlashEnemyMonPic
	db SE_HIDE_ENEMY_MON_PIC ; $DF
	dw AnimationHideEnemyMonPic
	db SE_BLINK_ENEMY_MON ; $DE
	dw AnimationBlinkEnemyMon
	db SE_SHOW_MON_PIC ; $DD
	dw AnimationShowMonPic
	db SE_SHOW_ENEMY_MON_PIC ; $DC
	dw AnimationShowEnemyMonPic
	db SE_SLIDE_ENEMY_MON_OUT ; $DB
	dw AnimationSlideEnemyMonOut
	db SE_SHAKE_BACK_AND_FORTH ; $DA
	dw AnimationShakeBackAndForth
	db SE_SUBSTITUTE_MON ; $D9
	dw AnimationSubstitute
	db SE_WAVY_SCREEN ; $D8
	dw AnimationWavyScreen
	db $FF

AnimationDelay10: ; 79150 (1e:5150)
	ld c,10
	jp DelayFrames

; calls a function with the turn flipped from player to enemy or vice versa
; input - hl - address of function to call
CallWithTurnFlipped: ; 79155 (1e:5155)
	ld a,[H_WHOSETURN]
	push af
	xor a,1
	ld [H_WHOSETURN],a
	ld de,.returnAddress
	push de
	jp [hl]
.returnAddress
	pop af
	ld [H_WHOSETURN],a
	ret

; flashes the screen for an extended period (48 frames)
AnimationFlashScreenLong: ; 79165 (1e:5165)
	ld a,3 ; cycle through the palettes 3 times
	ld [wd08a],a
	ld a,[wOnSGB] ; running on SGB?
	and a
	ld hl,FlashScreenLongMonochrome
	jr z,.loop
	ld hl,FlashScreenLongSGB
.loop
	push hl
.innerLoop
	ld a,[hli]
	cp a,$01 ; is it the end of the palettes?
	jr z,.endOfPalettes
	ld [rBGP],a
	call FlashScreenLongDelay
	jr .innerLoop
.endOfPalettes
	ld a,[wd08a]
	dec a
	ld [wd08a],a
	pop hl
	jr nz,.loop
	ret

; BG palettes
FlashScreenLongMonochrome: ; 7918e (1e:518e)
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
FlashScreenLongSGB: ; 7919b (1e:519b)
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
FlashScreenLongDelay: ; 791a8 (1e:51a8)
	ld a,[wd08a]
	cp a,4 ; never true since [wd08a] starts at 3
	ld c,4
	jr z,.delayFrames
	cp a,3
	ld c,2
	jr z,.delayFrames
	cp a,2 ; nothing is done with this
	ld c,1
.delayFrames
	jp DelayFrames

AnimationFlashScreen: ; 791be (1e:51be)
	ld a,[rBGP]
	push af ; save initial palette
	ld a,%00011011 ; 0, 1, 2, 3 (inverted colors)
	ld [rBGP],a
	ld c,2
	call DelayFrames
	xor a ; white out background
	ld [rBGP],a
	ld c,2
	call DelayFrames
	pop af
	ld [rBGP],a ; restore initial palette
	ret

AnimationDarkScreenPalette: ; 791d6 (1e:51d6)
; Changes the screen's palette to a dark palette.
	ld bc, $6f6f
	jr Func_791fc

AnimationDarkenMonPalette: ; 791db (1e:51db)
; Darkens the mon sprite's palette.
	ld bc, $f9f4
	jr Func_791fc

Func_791e0: ; 791e0 (1e:51e0)
	ld bc, $fef8
	jr Func_791fc

Func_791e5: ; 791e5 (1e:51e5)
	ld bc, $ffff
	jr Func_791fc

AnimationResetScreenPalette: ; 791ea (1e:51ea)
; Restores the screen's palette to the normal palette.
	ld bc, $e4e4
	jr Func_791fc

Func_791ef: ; 791ef (1e:51ef)
	ld bc, $0000
	jr Func_791fc

AnimationLightScreenPalette: ; 791f4 (1e:51f4)
; Changes the screen to use a palette with light colors.
	ld bc, $9090
	jr Func_791fc

Func_791f9: ; 791f9 (1e:51f9)
	ld bc, $4040

Func_791fc: ; 791fc (1e:51fc)
	ld a, [wOnSGB]
	and a
	ld a, b
	jr z, .asm_79204
	ld a, c
.asm_79204
	ld [rBGP], a ; $ff47
	ret

	ld b, $5

Func_79209: ; 79209 (1e:5209)
	predef_jump Func_480ff

AnimationShakeScreen: ; 7920e (1e:520e)
; Shakes the screen for a while. Used in Earthquake/Fissure/etc. animations.
	ld b, $8

Func_79210: ; 79210 (1e:5210)
	predef_jump Func_48125

AnimationWaterDropletsEverywhere: ; 79215 (1e:5215)
; Draws water droplets all over the screen and makes them
; scroll. It's hard to describe, but it's the main animation
; in Surf/Mist/Toxic.
	xor a
	ld [wd09f], a
	call LoadAnimationTileset
	ld d, $20
	ld a, $f0
	ld [W_BASECOORDX], a ; wd081
	ld a, $71
	ld [wd09f], a
.asm_79228
	ld a, $10
	ld [W_BASECOORDY], a ; wd082
	ld a, $0
	ld [wd08a], a
	call Func_79246
	ld a, $18
	ld [W_BASECOORDY], a ; wd082
	ld a, $20
	ld [wd08a], a
	call Func_79246
	dec d
	jr nz, .asm_79228
	ret

Func_79246: ; 79246 (1e:5246)
	ld hl, wOAMBuffer
.asm_79249
	ld a, [W_BASECOORDY] ; wd082
	ld [hli], a
	ld a, [W_BASECOORDX] ; wd081
	add $1b
	ld [W_BASECOORDX], a ; wd081
	ld [hli], a
	ld a, [wd09f]
	ld [hli], a
	xor a
	ld [hli], a
	ld a, [W_BASECOORDX] ; wd081
	cp $90
	jr c, .asm_79249
	sub $a8
	ld [W_BASECOORDX], a ; wd081
	ld a, [W_BASECOORDY] ; wd082
	add $10
	ld [W_BASECOORDY], a ; wd082
	cp $70
	jr c, .asm_79249
	call AnimationCleanOAM
	jp DelayFrame

AnimationSlideMonUp: ; 7927a (1e:527a)
; Slides the mon's sprite upwards.
	ld c, $7
	ld a, [H_WHOSETURN]
	and a
	ld hl, wTileMap + $79
	ld de, wTileMap + $65
	ld a, $30
	jr z, .asm_79291
	ld hl, wTileMap + $20
	ld de, wTileMap + $c
	ld a, $ff
.asm_79291
	ld [wd09f], a
	jp Func_792bf

AnimationSlideMonDown: ; 79297 (1e:5297)
; Slides the mon's sprite down out of the screen.
	xor a
	call Func_79842
.asm_7929b
	call Func_79820
	push bc
	push de
	call Func_79aae
	call Delay3
	call AnimationHideMonPic
	pop de
	pop bc
	dec b
	jr nz, .asm_7929b
	ret

AnimationSlideMonOut: ; 792af (1e:52af)
; Slides the mon's sprite out of the screen horizontally.
	ld e, $8
	ld a, $3
	ld [W_SUBANIMTRANSFORM], a ; W_SUBANIMTRANSFORM
	jp Func_795f8

AnimationSlideEnemyMonOut: ; 792b9 (1e:52b9)
; Slides the enemy mon out of the screen horizontally.
	ld hl, AnimationSlideMonOut ; $52af
	jp CallWithTurnFlipped

Func_792bf: ; 792bf (1e:52bf)
	push de
	push hl
	push bc
	ld b, $6
.asm_792c4
	push bc
	push de
	push hl
	ld bc, $0007
	call CopyData
	pop de
	pop hl
	ld bc, $0028
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_792c4
	ld a, [H_WHOSETURN]
	and a
	ld hl, wTileMap + $dd
	jr z, .asm_792e2
	ld hl, wTileMap + $84
.asm_792e2
	ld a, [wd09f]
	inc a
	ld [wd09f], a
	ld c, $7
.asm_792eb
	ld [hli], a
	add $7
	dec c
	jr nz, .asm_792eb
	ld c, $2
	call DelayFrames
	pop bc
	pop hl
	pop de
	dec c
	jr nz, Func_792bf
	ret

Func_792fd: ; 792fd (1e:52fd)
	ld a, $10
	ld [W_BASECOORDX], a
	ld a, $30
	ld [W_BASECOORDY], a
	ld hl, wOAMBuffer
	ld d, $0
	ld c, $7
.asm_7930e
	ld a, [W_BASECOORDY]
	ld e, a
	ld b, $5
.asm_79314
	call Func_79329
	inc d
	dec b
	jr nz, .asm_79314
	dec c
	ret z
	inc d
	inc d
	ld a, [W_BASECOORDX]
	add $8
	ld [W_BASECOORDX], a
	jr .asm_7930e

Func_79329: ; 79329 (1e:5329)
	ld a, e
	add $8
	ld e, a
	ld [hli], a
	ld a, [W_BASECOORDX] ; wd081
	ld [hli], a
	ld a, d
	ld [hli], a
	xor a
	ld [hli], a
	ret

AdjustOAMBlockXPos: ; 79337 (1e:5337)
	ld l, e
	ld h, d

AdjustOAMBlockXPos2: ; 79339 (1e:5339)
	ld de, $4
.loop
	ld a, [wd08a]
	ld b, a
	ld a, [hl]
	add b
	cp $a8
	jr c, .skipPuttingEntryOffScreen
	dec hl
	ld a, $a0
	ld [hli], a
.skipPuttingEntryOffScreen
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret

AdjustOAMBlockYPos: ; 79350 (1e:5350)
	ld l, e
	ld h, d

AdjustOAMBlockYPos2: ; 79352 (1e:5352)
	ld de, $4
.loop
	ld a, [wd08a]
	ld b, a
	ld a, [hl]
	add b
	cp $70
	jr c, .skipSettingPreviousEntrysAttribute
	dec hl
	ld a, $a0 ; bug, sets previous OAM entry's attribute
	ld [hli], a
.skipSettingPreviousEntrysAttribute
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret

AnimationBlinkEnemyMon: ; 79369 (1e:5369)
; Make the enemy mon's sprite blink on and off for a second or two
	ld hl, AnimationBlinkMon ; $536f
	jp CallWithTurnFlipped

AnimationBlinkMon: ; 7936f (1e:536f)
; Make the mon's sprite blink on and off for a second or two.
	push af
	ld c, $6
.asm_79372
	push bc
	call AnimationHideMonPic
	ld c, $5
	call DelayFrames
	call AnimationShowMonPic
	ld c, $5
	call DelayFrames
	pop bc
	dec c
	jr nz, .asm_79372
	pop af
	ret

AnimationFlashMonPic: ; 79389 (1e:5389)
; Flashes the mon's sprite on and off
	ld a, [wBattleMonSpecies]
	ld [wHPBarMaxHP + 1], a
	ld a, [wEnemyMonSpecies]
	ld [wHPBarMaxHP], a
	jp Func_79793

AnimationFlashEnemyMonPic: ; 79398 (1e:5398)
; Flashes the enemy mon's sprite on and off
	ld hl, AnimationFlashMonPic
	jp CallWithTurnFlipped

AnimationShowMonPic: ; 7939e (1e:539e)
	xor a
	call Func_79842
	call Func_79820
	call Func_79aae
	jp Delay3

AnimationShowEnemyMonPic: ; 793ab (1e:53ab)
; Shows the emenmy mon's front sprite. Used in animations like Seismic Toss
; to make the mon's sprite reappear after disappears offscreen.
	ld hl, AnimationShowMonPic
	jp CallWithTurnFlipped

AnimationShakeBackAndForth: ; 793b1 (1e:53b1)
; Shakes the mon's sprite back and forth rapidly. This is used in Double Team.
; The mon's sprite disappears after this animation.
	ld a, [H_WHOSETURN]
	and a
	ld hl, wTileMap + $64
	ld de, wTileMap + $66
	jr z, .asm_793c2
	ld hl, wTileMap + $b
	ld de, wTileMap + $d

.asm_793c2
	xor a
	ld c, $10
.asm_793c5
	push af
	push bc
	push de
	push hl
	push hl
	push de
	push af
	push hl
	push hl
	call Func_79842
	pop hl
	call Func_79aae
	call Delay3
	pop hl
	ld bc, $0709
	call ClearScreenArea
	pop af
	call Func_79842
	pop hl
	call Func_79aae
	call Delay3
	pop hl
	ld bc, $0709
	call ClearScreenArea
	pop hl
	pop de
	pop bc
	pop af
	dec c
	jr nz, .asm_793c5
	ret

AnimationMoveMonHorizontally: ; 793f9 (1e:53f9)
; Shifts the mon's sprite horizontally to a fixed location. Used by lots of
; animations like Tackle/Body Slam.
	call AnimationHideMonPic
	ld a, [H_WHOSETURN] ; $fff3
	and a
	hlCoord 2, 5
	jr z, .asm_79407
	hlCoord 11, 0
.asm_79407
	xor a
	push hl
	call Func_79842
	pop hl
	call Func_79aae
	ld c, $3
	jp DelayFrames

AnimationResetMonPosition: ; 79415 (1e:5415)
; Resets the mon's sprites to be located at the normal coordinates.
	ld a, [H_WHOSETURN] ; $fff3
	and a
	ld a, $66
	jr z, .asm_7941e
	ld a, $b
.asm_7941e
	call Func_7980c
	jp AnimationShowMonPic

AnimationSpiralBallsInward: ; 79424 (1e:5424)
; Creates an effect that looks like energy balls sprialing into the
; player mon's sprite.  Used in Focus Energy, for example.
	ld a, [H_WHOSETURN] ; $fff3
	and a
	jr z, .asm_79435
	ld a, $d8
	ld [wd08a], a
	ld a, $50
	ld [W_SUBANIMTRANSFORM], a ; W_SUBANIMTRANSFORM
	jr .asm_7943c
.asm_79435
	xor a
	ld [wd08a], a
	ld [W_SUBANIMTRANSFORM], a ; W_SUBANIMTRANSFORM
.asm_7943c
	ld d, $7a
	ld c, $3
	xor a
	call Func_797e8
	ld hl, SpiralBallAnimationCoordinates ; $5476
.asm_79447
	push hl
	ld c, $3
	ld de, wOAMBuffer
.asm_7944d
	ld a, [hl]
	cp $ff
	jr z, .asm_7946f
	ld a, [wd08a]
	add [hl]
	ld [de], a
	inc de
	inc hl
	ld a, [W_SUBANIMTRANSFORM] ; W_SUBANIMTRANSFORM
	add [hl]
	ld [de], a
	inc hl
	inc de
	inc de
	inc de
	dec c
	jr nz, .asm_7944d
	ld c, $5
	call DelayFrames
	pop hl
	inc hl
	inc hl
	jr .asm_79447
.asm_7946f
	pop hl
	call AnimationCleanOAM
	jp AnimationFlashScreen

SpiralBallAnimationCoordinates: ; 79476 (1e:5476)
; y, x pairs
; This is the sequence of screen coordinates that the spiraling
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
	db $FF ; list terminator

AnimationSquishMonPic: ; 794a1 (1e:54a1)
; Squishes the mon's sprite horizontally making it
; disappear. Used by Teleport/Sky Attack animations.
	ld c, $4
.asm_794a3
	push bc
	ld a, [H_WHOSETURN] ; $fff3
	and a
	jr z, .asm_794b1
	hlCoord 16, 0
	deCoord 14, 0
	jr .asm_794b7
.asm_794b1
	hlCoord 5, 5
	deCoord 3, 5
.asm_794b7
	push de
	xor a
	ld [wd09f], a
	call Func_794d4
	pop hl
	ld a, $1
	ld [wd09f], a
	call Func_794d4
	pop bc
	dec c
	jr nz, .asm_794a3
	call AnimationHideMonPic
	ld c, $2
	jp DelayFrame

Func_794d4: ; 794d4 (1e:54d4)
	ld c, $7
.asm_794d6
	push bc
	push hl
	ld c, $3
	ld a, [wd09f]
	cp $0
	jr nz, .asm_794e7
	call Func_7985b
	dec hl
	jr .asm_794eb
.asm_794e7
	call Func_79862
	inc hl
.asm_794eb
	ld [hl], $7f
	pop hl
	ld de, $14
	add hl, de
	pop bc
	dec c
	jr nz, .asm_794d6
	jp Delay3

AnimationShootBallsUpward: ; 794f9 (1e:54f9)
; Shoots one pillar of "energy" balls upwards. Used in Teleport/Sky Attack
; animations.
	ld a, [H_WHOSETURN] ; $fff3
	and a
	jr z, .asm_79503
	ld bc, $80
	jr .asm_79506
.asm_79503
	ld bc, $3028
.asm_79506
	ld a, b
	ld [W_BASECOORDY], a ; wd082
	ld a, c
	ld [W_BASECOORDX], a ; wd081
	ld bc, $501
	call Func_79517
	jp AnimationCleanOAM

Func_79517: ; 79517 (1e:5517)
	push bc
	xor a
	ld [wd09f], a
	call LoadAnimationTileset
	pop bc
	ld d, $7a
	ld hl, wOAMBuffer
	push bc
	ld a, [W_BASECOORDY] ; wd082
	ld e, a
.asm_7952a
	call Func_79329
	dec b
	jr nz, .asm_7952a
	call DelayFrame
	pop bc
	ld a, b
	ld [wd08a], a
.asm_79538
	push bc
	ld hl, wOAMBuffer
.asm_7953c
	ld a, [W_BASECOORDY] ; wd082
	add $8
	ld e, a
	ld a, [hl]
	cp e
	jr z, .asm_7954b
	add $fc
	ld [hl], a
	jr .asm_79554
.asm_7954b
	ld [hl], $0
	ld a, [wd08a]
	dec a
	ld [wd08a], a
.asm_79554
	ld de, $4
	add hl, de
	dec b
	jr nz, .asm_7953c
	call DelayFrames
	pop bc
	ld a, [wd08a]
	and a
	jr nz, .asm_79538
	ret

AnimationShootManyBallsUpward: ; 79566 (1e:5566)
; Shoots several pillars of "energy" balls upward.
	ld a, [H_WHOSETURN]
	and a
	ld hl, UpwardBallsAnimXCoordinatesPlayerTurn
	ld a, $50 ; y coordinate for "energy" ball pillar
	jr z, .player
	ld hl, UpwardBallsAnimXCoordinatesEnemyTurn
	ld a, $28 ; y coordinate for "energy" ball pillar
.player
	ld [wTrainerSpriteOffset], a
.loop
	ld a, [wTrainerSpriteOffset]
	ld [W_BASECOORDY], a
	ld a, [hli]
	cp $ff
	jp z, AnimationCleanOAM
	ld [W_BASECOORDX], a
	ld bc, $0401
	push hl
	call Func_79517
	pop hl
	jr .loop

UpwardBallsAnimXCoordinatesPlayerTurn: ; 79591 (1e:5591)
; List of x coordinates for each pillar of "energy" balls in the
; AnimationShootManyBallsUpward animation. It's unused in the game.
	db $10, $40, $28, $18, $38, $30
	db $FF ; list terminator

UpwardBallsAnimXCoordinatesEnemyTurn: ; 79598 (1e:5598)
; List of x coordinates for each pillar of "energy" balls in the
; AnimationShootManyBallsUpward animation. It's unused in the game.
	db $60, $90, $78, $68, $88, $80
	db $FF ; list terminator

AnimationMinimizeMon: ; 7959f (1e:559f)
; Changes the mon's sprite to a mini black sprite. Used by the
; Minimize animation.
	ld hl, wTempPic
	push hl
	xor a
	ld bc, $310
	call FillMemory
	pop hl
	ld de, $194
	add hl, de
	ld de, MinimizedMonSprite ; $55c4
	ld c, $5
.asm_795b4
	ld a, [de]
	ld [hli], a
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_795b4
	call Func_79652
	call Delay3
	jp AnimationShowMonPic

MinimizedMonSprite: ; 795c4 (1e:55c4)
	INCBIN "gfx/minimized_mon_sprite.1bpp"

AnimationSlideMonDownAndHide: ; 795c9 (1e:55c9)
; Slides the mon's sprite down and disappears. Used in Acid Armor.
	ld a, $1
	ld c, $2
.asm_795cd
	push bc
	push af
	call AnimationHideMonPic
	pop af
	push af
	call Func_79842
	call Func_79820
	call Func_79aae
	ld c, $8
	call DelayFrames
	pop af
	inc a
	pop bc
	dec c
	jr nz, .asm_795cd
	call AnimationHideMonPic
	ld hl, wTempPic
	ld bc, $0310
	xor a
	call FillMemory
	jp Func_79652

Func_795f8: ; 795f8 (1e:55f8)
	ld a, [H_WHOSETURN] ; $fff3
	and a
	jr z, .asm_79602
	hlCoord 12, 0
	jr .asm_79605
.asm_79602
	hlCoord 0, 5
.asm_79605
	ld d, $8
.asm_79607
	push hl
	ld b, $7
.asm_7960a
	ld c, $8
.asm_7960c
	ld a, [H_WHOSETURN] ; $fff3
	and a
	jr z, .asm_79616
	call Func_7963c
	jr .asm_79619
.asm_79616
	call Func_79633
.asm_79619
	ld [hli], a
	dec c
	jr nz, .asm_7960c
	push de
	ld de, $c
	add hl, de
	pop de
	dec b
	jr nz, .asm_7960a
	ld a, [W_SUBANIMTRANSFORM] ; W_SUBANIMTRANSFORM
	ld c, a
	call DelayFrames
	pop hl
	dec d
	dec e
	jr nz, .asm_79607
	ret

Func_79633: ; 79633 (1e:5633)
	ld a, [hl]
	add $7
	cp $61
	ret c
	ld a, $7f
	ret

Func_7963c: ; 7963c (1e:563c)
	ld a, [hl]
	sub $7
	cp $30
	ret c
	ld a, $7f
	ret

AnimationSlideMonHalfLeft: ; 79645 (1e:5645)
; Slides the mon's sprite halfway out of the screen. It's used in Softboiled.
	ld e, $4
	ld a, $4
	ld [W_SUBANIMTRANSFORM], a
	call Func_795f8
	jp Delay3

Func_79652: ; 79652 (1e:5652)
	ld a, [H_WHOSETURN] ; $fff3
	and a
	ld hl, vBackPic
	jr z, .asm_7965d
	ld hl, vFrontPic
.asm_7965d
	ld de, wTempPic
	ld bc, 7 * 7
	jp CopyVideoData

AnimationWavyScreen: ; 79666 (1e:5666)
; used in Psywave/Psychic etc.
	ld hl, vBGMap0
	call Func_79e0d
	call Delay3
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	ld a, $90
	ld [hWY], a
	ld d, $80
	ld e, $8f
	ld c, $ff
	ld hl, WavyScreenLineOffsets
.asm_7967f
	push hl
.asm_79680
	call Func_796ae
	ld a, [$ff44]
	cp e
	jr nz, .asm_79680
	pop hl
	inc hl
	ld a, [hl]
	cp d
	jr nz, .asm_79691
	ld hl, WavyScreenLineOffsets
.asm_79691
	dec c
	jr nz, .asm_7967f
	xor a
	ld [hWY], a
	call SaveScreenTilesToBuffer2
	call ClearScreen
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	call Delay3
	call LoadScreenTilesFromBuffer2
	ld hl, vBGMap1
	call Func_79e0d
	ret

Func_796ae: ; 796ae (1e:56ae)
	ld a, [$ff41]
	and $3
	jr nz, Func_796ae
	ld a, [hl]
	ld [$ff43], a
	inc hl
	ld a, [hl]
	cp d
	ret nz
	ld hl, WavyScreenLineOffsets
	ret

WavyScreenLineOffsets: ; 796bf (1e:56bf)
; Sequence of horizontal line pixel offsets for the wavy screen animation.
; This sequence vaguely resembles a sine wave.
	db 0, 0, 0, 0, 0,  1,  1,  1,  2,  2,  2,  2,  2,  1,  1,  1
	db 0, 0, 0, 0, 0, -1, -1, -1, -2, -2, -2, -2, -2, -1, -1, -1
	db $80 ; terminator

AnimationSubstitute: ; 796e0 (1e:56e0)
; Changes the pokemon's sprite to the mini sprite
	ld hl, wTempPic
	xor a
	ld bc, $0310
	call FillMemory
	ld a, [$fff3]
	and a
	jr z, .asm_79715 ; 0x796ed $26
	ld hl, SlowbroSprite ; facing down sprite
	ld de, wTempPic + $120
	call CopySlowbroSpriteData
	ld hl, SlowbroSprite + $10
	ld de, wTempPic + $120 + $70
	call CopySlowbroSpriteData
	ld hl, SlowbroSprite + $20
	ld de, wTempPic + $120 + $10
	call CopySlowbroSpriteData
	ld hl, SlowbroSprite + $30
	ld de, wTempPic + $120 + $10 + $70
	call CopySlowbroSpriteData
	jr .asm_79739
.asm_79715
	ld hl, SlowbroSprite + $40 ; facing up sprite
	ld de, wTempPic + $120 + $70
	call CopySlowbroSpriteData
	ld hl, SlowbroSprite + $50
	ld de, wTempPic + $120 + $e0
	call CopySlowbroSpriteData
	ld hl, SlowbroSprite + $60
	ld de, wTempPic + $120 + $80
	call CopySlowbroSpriteData
	ld hl, SlowbroSprite + $70
	ld de, wTempPic + $120 + $f0
	call CopySlowbroSpriteData
.asm_79739
	call Func_79652
	jp AnimationShowMonPic

CopySlowbroSpriteData: ; 7973f (1e:573f)
	ld bc, $0010
	ld a, BANK(SlowbroSprite)
	jp FarCopyData2

Func_79747: ; 79747 (1e:5747)
	ld a, [H_WHOSETURN] ; $fff3
	and a
	ld hl, wccf7
	ld a, [W_PLAYERBATTSTATUS2] ; W_PLAYERBATTSTATUS2
	jr z, .asm_79758
	ld hl, wccf3
	ld a, [W_ENEMYBATTSTATUS2] ; W_ENEMYBATTSTATUS2
.asm_79758
	push hl
	bit 4, a
	jr nz, .asm_79762
	call AnimationSlideMonDown
	jr .asm_79765
.asm_79762
	call AnimationSlideMonOut
.asm_79765
	pop hl
	ld a, [hl]
	and a
	jp nz, AnimationMinimizeMon
	call AnimationFlashMonPic
	jp AnimationShowMonPic

Func_79771: ; 79771 (1e:5771)
	call AnimationSlideMonOut
	call AnimationSubstitute
	jp AnimationShowMonPic

AnimationBoundUpAndDown: ; 7977a (1e:577a)
; Bounces the mon's sprite up and down several times. It is used
; by Splash's animation.
	ld c, $5
.asm_7977c
	push bc
	call AnimationSlideMonDown
	pop bc
	dec c
	jr nz, .asm_7977c ; 0x79782 $f8
	jp AnimationShowMonPic

AnimationTransformMon: ; 79787 (1e:5787)
; Redraws this mon's sprite as the back/front sprite of the opposing mon.
; Used in Transform.
	ld a, [wEnemyMonSpecies]
	ld [wHPBarMaxHP + 1], a
	ld a, [wBattleMonSpecies]
	ld [wHPBarMaxHP], a

Func_79793: ; 79793 (1e:5793)
	ld a, [H_WHOSETURN] ; $fff3
	and a
	jr z, .asm_797b0
	ld a, [wHPBarMaxHP]
	ld [wcf91], a
	ld [wd0b5], a
	xor a
	ld [W_SPRITEFLIPPED], a
	call GetMonHeader
	hlCoord 12, 0
	call LoadFrontSpriteByMonIndex
	jr .asm_797d3
.asm_797b0
	ld a, [wBattleMonSpecies2]
	push af
	ld a, [wHPBarMaxHP + 1]
	ld [wBattleMonSpecies2], a
	ld [wd0b5], a
	call GetMonHeader
	predef LoadMonBackPic
	xor a
	call Func_79842
	call Func_79820
	call Func_79aae
	pop af
	ld [wBattleMonSpecies2], a
.asm_797d3
	ld b, $1
	jp GoPAL_SET

AnimationHideEnemyMonPic: ; 797d8 (1e:57d8)
; Hides the enemy mon's sprite
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ld hl, AnimationHideMonPic ; $5801
	call CallWithTurnFlipped
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	jp Delay3

Func_797e8: ; 797e8 (1e:57e8)
	push bc
	push de
	ld [wd09f], a
	call LoadAnimationTileset
	pop de
	pop bc
	xor a
	ld e, a
	ld [W_BASECOORDX], a ; wd081
	ld hl, wOAMBuffer
.asm_797fa
	call Func_79329
	dec c
	jr nz, .asm_797fa
	ret

AnimationHideMonPic: ; 79801 (1e:5801)
; Hides the mon's sprite.
	ld a, [H_WHOSETURN] ; $fff3
	and a
	jr z, .asm_7980a
	ld a, $c
	jr Func_7980c
.asm_7980a
	ld a, $65

Func_7980c: ; 7980c (1e:580c)
	push hl
	push de
	push bc
	ld e, a
	ld d, $0
	ld hl, wTileMap
	add hl, de
	ld bc, $707
	call ClearScreenArea
	pop bc
	pop de
	pop hl
	ret

Func_79820: ; 79820 (1e:5820)
	push de
	ld a, [H_WHOSETURN] ; $fff3
	and a
	jr nz, .asm_7982a
	ld a, $65
	jr .asm_7982c
.asm_7982a
	ld a, $c
.asm_7982c
	ld hl, wTileMap
	ld e, a
	ld d, $0
	add hl, de
	ld a, $7
	sub b
	and a
	jr z, .asm_79840
	ld de, $14
.asm_7983c
	add hl, de
	dec a
	jr nz, .asm_7983c
.asm_79840
	pop de
	ret

Func_79842: ; 79842 (1e:5842)
	ld hl, PointerTable_79aea ; $5aea
	ld e, a
	ld d, $0
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

Func_7985b: ; 7985b (1e:585b)
	ld a, [hld]
	ld [hli], a
	inc hl
	dec c
	jr nz, Func_7985b
	ret

Func_79862: ; 79862 (1e:5862)
	ld a, [hli]
	ld [hld], a
	dec hl
	dec c
	jr nz, Func_79862
	ret

Func_79869: ; 79869 (1e:5869)
	ld a, b
	call Func_7986f
	ld b, a
	ret

Func_7986f: ; 7986f (1e:586f)
	ld hl,MoveSoundTable
	ld e,a
	ld d,0
	add hl,de
	add hl,de
	add hl,de
	ld a,[hli]
	ld b,a
	call IsCryMove
	jr nc,.NotCryMove
	ld a,[H_WHOSETURN]
	and a
	jr nz,.next
	ld a,[wBattleMonSpecies] ; get number of current monster
	jr .Continue
.next
	ld a,[wEnemyMonSpecies]
.Continue
	push hl
	call GetCryData
	ld b,a
	pop hl
	ld a,[wc0f1]
	add [hl]
	ld [wc0f1],a
	inc hl
	ld a,[wc0f2]
	add [hl]
	ld [wc0f2],a
	jr .done
.NotCryMove
	ld a,[hli]
	ld [wc0f1],a
	ld a,[hli]
	ld [wc0f2],a
.done
	ld a,b
	ret

IsCryMove: ; 798ad (1e:58ad)
; set carry if the move animation involves playing a monster cry
	ld a,[W_ANIMATIONID]
	cp a,GROWL
	jr z,.CryMove
	cp a,ROAR
	jr z,.CryMove
	and a ; clear carry
	ret
.CryMove
	scf
	ret

MoveSoundTable: ; 798bc (1e:58bc)
	db $a0,$00,$80
	db $a2,$10,$80
	db $b3,$00,$80
	db $a1,$01,$80
	db $a3,$00,$40
	db $e9,$00,$ff
	db $a3,$10,$60
	db $a3,$20,$80
	db $a3,$00,$a0
	db $a6,$00,$80
	db $a5,$20,$40
	db $a5,$00,$80
	db $a4,$00,$a0
	db $a7,$10,$c0
	db $a7,$00,$a0
	db $a8,$00,$c0
	db $a8,$10,$a0
	db $a9,$00,$e0
	db $a7,$20,$c0
	db $aa,$00,$80
	db $b9,$00,$80
	db $ab,$01,$80
	db $b7,$00,$80
	db $ad,$f0,$40
	db $b0,$00,$80
	db $ad,$00,$80
	db $b8,$10,$80
	db $b1,$01,$a0
	db $ae,$00,$80
	db $b4,$00,$60
	db $b4,$01,$40
	db $b6,$00,$a0
	db $b0,$10,$a0
	db $b7,$00,$c0
	db $aa,$10,$60
	db $b0,$00,$a0
	db $b9,$11,$c0
	db $b0,$20,$c0
	db $b8,$00,$80
	db $b1,$00,$80
	db $b1,$20,$c0
	db $af,$00,$80
	db $db,$ff,$40
	db $b4,$00,$80
	db $a1,$00,$c0
	db $a1,$00,$40
	db $e4,$00,$80
	db $bf,$40,$60
	db $bf,$00,$80
	db $bf,$ff,$40
	db $c7,$80,$c0
	db $af,$10,$a0
	db $af,$21,$e0
	db $c5,$00,$80
	db $bb,$20,$60
	db $c7,$00,$80
	db $cc,$00,$80
	db $c2,$40,$80
	db $c5,$f0,$e0
	db $cf,$00,$80
	db $c7,$f0,$60
	db $c2,$00,$80
	db $e6,$00,$80
	db $9d,$01,$a0
	db $a9,$f0,$20
	db $ba,$01,$c0
	db $ba,$00,$80
	db $b0,$00,$e0
	db $be,$01,$60
	db $be,$20,$40
	db $bb,$00,$80
	db $bb,$40,$c0
	db $b1,$03,$60
	db $bd,$11,$e0
	db $a8,$20,$e0
	db $d2,$00,$80
	db $b2,$00,$80
	db $b2,$11,$a0
	db $b2,$01,$c0
	db $a9,$14,$c0
	db $b1,$02,$a0
	db $c5,$f0,$80
	db $c5,$20,$c0
	db $d5,$00,$20
	db $d5,$20,$80
	db $d2,$12,$60
	db $be,$00,$80
	db $aa,$01,$e0
	db $c5,$0f,$e0
	db $c5,$11,$20
	db $a6,$10,$40
	db $a5,$10,$c0
	db $aa,$00,$20
	db $d8,$00,$80
	db $e4,$11,$18
	db $9f,$20,$c0
	db $9e,$20,$c0
	db $bd,$00,$10
	db $be,$f0,$20
	db $df,$f0,$c0
	db $a7,$f0,$e0
	db $9f,$f0,$40
	db $db,$00,$80
	db $df,$80,$40
	db $df,$00,$80
	db $aa,$11,$20
	db $aa,$22,$10
	db $b1,$f1,$ff
	db $a9,$f1,$ff
	db $aa,$33,$30
	db $dd,$40,$c0
	db $a4,$20,$20
	db $a4,$f0,$10
	db $a5,$f8,$10
	db $a7,$f0,$10
	db $bd,$00,$80
	db $ae,$00,$c0
	db $dd,$c0,$ff
	db $9f,$f2,$20
	db $e1,$00,$80
	db $e1,$00,$40
	db $9f,$00,$40
	db $a7,$10,$ff
	db $c7,$20,$20
	db $dd,$00,$80
	db $c5,$1f,$20
	db $bd,$2f,$80
	db $a5,$1f,$ff
	db $ca,$1f,$60
	db $be,$1e,$20
	db $be,$1f,$18
	db $aa,$0f,$80
	db $9f,$f8,$10
	db $9e,$18,$20
	db $dd,$08,$40
	db $ad,$01,$e0
	db $a7,$09,$ff
	db $e4,$42,$01
	db $b2,$00,$ff
	db $dd,$08,$e0
	db $bb,$00,$80
	db $9f,$88,$10
	db $bd,$48,$ff
	db $9e,$ff,$ff
	db $bb,$ff,$10
	db $9e,$ff,$04
	db $b2,$01,$ff
	db $a9,$f8,$ff
	db $a2,$f0,$f0
	db $a5,$08,$10
	db $a3,$f0,$ff
	db $b0,$f0,$ff
	db $e1,$10,$ff
	db $a4,$f0,$20
	db $ca,$f0,$60
	db $b8,$12,$10
	db $e6,$f0,$20
	db $b4,$12,$ff
	db $db,$80,$04
	db $df,$f0,$10
	db $c5,$f8,$ff
	db $be,$f0,$ff
	db $a7,$01,$ff
	db $cc,$d8,$04
	db $a1,$00,$80
	db $a1,$00,$80

Func_79aae: ; 79aae (1e:5aae)
	ld a, [H_WHOSETURN] ; $fff3
	and a
	ld a, $31
	jr z, .asm_79ab6
	xor a
.asm_79ab6
	ld [H_DOWNARROWBLINKCNT1], a ; $ff8b
	jr asm_79acb

Func_79aba: ; 79aba (1e:5aba)
	call GetPredefRegisters
	ld a, [wcd6c]
	and a
	jr nz, .asm_79ac8
	ld de, Unknown_79b02 ; $5b02
	jr asm_79acb
.asm_79ac8
	ld de, Unknown_79b1b ; $5b1b
asm_79acb: ; 79acb (1e:5acb)
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba

Func_79ace: ; 79ace (1e:5ace)
	push hl
.asm_79acf
	push bc
	push hl
	ld a, [H_DOWNARROWBLINKCNT1] ; $ff8b
	ld b, a
.asm_79ad4
	ld a, [de]
	add b
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_79ad4
	pop hl
	ld bc, $14
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_79acf
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	pop hl
	ret

PointerTable_79aea: ; 79aea (1e:5aea)
	dw Unknown_79b24
	db $77
	dw Unknown_79b55
	db $57
	dw Unknown_79b78
	db $37
	dw Unknown_79b8d
	db $77
	dw Unknown_79bbe
	db $77
	dw Unknown_79bef
	db $77
	dw Unknown_79c20
	db $86
	dw Unknown_79c50
	db $3C

Unknown_79b02: ; 79b02 (1e:5b02)
	db $31,$38,$46,$54,$5B,$32,$39,$47,$55,$5C,$34,$3B,$49,$57,$5E,$36,$3D,$4B,$59,$60,$37,$3E,$4C,$5A,$61

Unknown_79b1b: ; 79b1b (1e:5b1b)
	db $31,$46,$5B,$34,$49,$5E,$37,$4C,$61

Unknown_79b24: ; 79b24 (1e:5b24)
	db $00,$07,$0E,$15,$1C,$23,$2A,$01,$08,$0F,$16,$1D,$24,$2B,$02,$09,$10,$17,$1E,$25,$2C,$03,$0A,$11,$18,$1F,$26,$2D,$04,$0B,$12,$19,$20,$27,$2E,$05,$0C,$13,$1A,$21,$28,$2F,$06,$0D,$14,$1B,$22,$29,$30

Unknown_79b55: ; 79b55 (1e:5b55)
	db $00,$07,$0E,$15,$1C,$23,$2A,$01,$08,$0F,$16,$1D,$24,$2B,$03,$0A,$11,$18,$1F,$26,$2D,$04,$0B,$12,$19,$20,$27,$2E,$05,$0C,$13,$1A,$21,$28,$2F

Unknown_79b78: ; 79b78 (1e:5b78)
	db $00,$07,$0E,$15,$1C,$23,$2A,$02,$09,$10,$17,$1E,$25,$2C,$04,$0B,$12,$19,$20,$27,$2E

Unknown_79b8d: ; 79b8d (1e:5b8d)
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$19,$00,$02,$06,$0B,$10,$14,$1A,$00,$00,$07,$0C,$11,$15,$1B,$00,$03,$08,$0D,$12,$16,$1C,$00,$04,$09,$0E,$13,$17,$1D,$1F,$05,$0A,$0F,$01,$18,$1E,$20

Unknown_79bbe: ; 79bbe (1e:5bbe)
	db $00,$00,$00,$30,$00,$37,$00,$00,$00,$2B,$31,$34,$38,$3D,$21,$26,$2C,$01,$35,$39,$3E,$22,$27,$2D,$32,$36,$01,$00,$23,$28,$2E,$33,$01,$3A,$00,$24,$29,$2F,$01,$01,$3B,$00,$25,$2A,$01,$01,$01,$3C,$00

Unknown_79bef: ; 79bef (1e:5bef)
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$47,$4D,$00,$00,$00,$00,$00,$48,$4E,$52,$56,$5B,$3F,$43,$49,$4F,$53,$57,$5C,$40,$44,$4A,$50,$54,$58,$00,$41,$45,$4B,$51,$4C,$59,$5D,$42,$46,$4C,$4C,$55,$5A,$5E

Unknown_79c20: ; 79c20 (1e:5c20)
	db $31,$32,$32,$32,$32,$33,$34,$35,$36,$36,$37,$38,$34,$39,$3A,$3A,$3B,$38,$3C,$3D,$3E,$3E,$3F,$40,$41,$42,$43,$43,$44,$45,$46,$47,$43,$48,$49,$4A,$41,$43,$4B,$4C,$4D,$4E,$4F,$50,$50,$50,$51,$52

Unknown_79c50: ; 79c50 (1e:5c50)
	db $43,$55,$56,$53,$53,$53,$53,$53,$53,$53,$53,$53,$43,$57,$58,$54,$54,$54,$54,$54,$54,$54,$54,$54,$43,$59,$5A,$43,$43,$43,$43,$43,$43,$43,$43,$43

AnimationLeavesFalling: ; 79c74 (1e:5c74)
; Makes leaves float down from the top of the screen. This is used
; in Razor Leaf's animation.
	ld a, [$ff48]
	push af
	ld a, [wcc79]
	ld [$ff48], a
	ld d, $37
	ld a, $3
	ld [W_SUBANIMTRANSFORM], a
	call Func_79c97
	pop af
	ld [$ff48], a
	ret

AnimationPetalsFalling: ; 79c8a (1e:5c8a)
; Makes lots of petals fall down from the top of the screen. It's used in
; the animation for Petal Dance.
	ld d, $71
	ld a, $14
	ld [W_SUBANIMTRANSFORM], a
	call Func_79c97
	jp ClearSprites

Func_79c97: ; 79c97 (1e:5c97)
	ld c, a
	ld a, $1
	call Func_797e8
	call Func_79d2a
	call Func_79d52
	ld hl, wOAMBuffer
	ld [hl], $0
.asm_79ca8
	ld hl, wTrainerSpriteOffset
	ld de, $0000
	ld a, [W_SUBANIMTRANSFORM]
	ld c, a
.asm_79cb2
	push bc
	push hl
	push de
	ld a, [hl]
	ld [wd08a], a
	call Func_79d16
	call Func_79cdb
	pop de
	ld hl, $0004
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [wd08a]
	ld [hli], a
	pop bc
	dec c
	jr nz, .asm_79cb2
	call Delay3
	ld hl, wOAMBuffer
	ld a, [hl]
	cp $68
	jr nz, .asm_79ca8
	ret

Func_79cdb: ; 79cdb (1e:5cdb)
	ld hl, wOAMBuffer
	add hl, de
	ld a, [hl]
	inc a
	inc a
	cp $70
	jr c, .asm_79ce8
	ld a, $a0
.asm_79ce8
	ld [hli], a
	ld a, [wd08a]
	ld b, a
	ld de, Unknown_79d0d
	and $7f
	add e
	jr nc, .asm_79cf6
	inc d
.asm_79cf6
	ld e, a
	ld a, b
	and $80
	jr nz, .asm_79d03
	ld a, [de]
	add [hl]
	ld [hli], a
	inc hl
	xor a
	jr .asm_79d0b
.asm_79d03
	ld a, [de]
	ld b, a
	ld a, [hl]
	sub b
	ld [hli], a
	inc hl
	ld a, $20
.asm_79d0b
	ld [hl], a
	ret

Unknown_79d0d: ; 79d0d (1e:5d0d)
	db $00,$01,$03,$05,$07,$09,$0B,$0D,$0F

Func_79d16: ; 79d16 (1e:5d16)
	ld a, [wd08a]
	inc a
	ld b, a
	and $7f
	cp $9
	ld a, b
	jr nz, .asm_79d26
	and $80
	xor $80
.asm_79d26
	ld [wd08a], a
	ret

Func_79d2a: ; 79d2a (1e:5d2a)
	ld hl, wOAMBuffer + $01
	ld de, Unknown_79d3e
	ld a, [W_SUBANIMTRANSFORM]
	ld c, a
.asm_79d34
	ld a, [de]
	ld [hli], a
	inc hl
	inc hl
	inc hl
	inc de
	dec c
	jr nz, .asm_79d34
	ret

Unknown_79d3e: ; 79d3e (1e:5d3e)
	db $38,$40,$50,$60,$70,$88,$90,$56,$67,$4A,$77,$84,$98,$32,$22,$5C,$6C,$7D,$8E,$99

Func_79d52: ; 79d52 (1e:5d52)
	ld hl, wTrainerSpriteOffset
	ld de, Unknown_79d63
	ld a, [W_SUBANIMTRANSFORM]
	ld c, a
.asm_79d5c
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_79d5c
	ret

Unknown_79d63: ; 79d63 (1e:5d63)
	db $00,$84,$06,$81,$02,$88,$01,$83,$05,$89,$09,$80,$07,$87,$03,$82,$04,$85,$08,$86

AnimationShakeEnemyHUD: ; 79d77 (1e:5d77)
	ld de, vBackPic
	ld hl, vSprites
	ld bc, 7 * 7
	call CopyVideoData
	xor a
	ld [$ffae], a
	ld hl, vBGMap0
	call Func_79e0d
	ld a, $90
	ld [hWY], a
	ld hl, vBGMap0 + $320
	call Func_79e0d
	ld a, $38
	ld [hWY], a
	call Func_792fd
	ld hl, vBGMap0
	call Func_79e0d
	call AnimationHideMonPic
	call Delay3
	ld de, $0208
	call Func_79de9
	call AnimationShowMonPic
	call ClearSprites
	ld a, $90
	ld [hWY], a
	ld hl, vBGMap1
	call Func_79e0d
	xor a
	ld [hWY], a
	call SaveScreenTilesToBuffer1
	ld hl, vBGMap0
	call Func_79e0d
	call ClearScreen
	call Delay3
	call LoadScreenTilesFromBuffer1
	ld hl, vBGMap1
	jp Func_79e0d

Func_79dda: ; 79dda (1e:5dda)
	call GetPredefRegisters
	ld a, c
	ld [H_DOWNARROWBLINKCNT1], a ; $ff8b
	ld a, b
	push hl
	call Func_79842
	pop hl
	jp Func_79ace

Func_79de9: ; 79de9 (1e:5de9)
	ld a, [$ffae]
	ld [wTrainerSpriteOffset], a
.asm_79dee
	ld a, [wTrainerSpriteOffset]
	add d
	ld [$ffae], a
	ld c, $2
	call DelayFrames
	ld a, [wTrainerSpriteOffset]
	sub d
	ld [$ffae], a
	ld c, $2
	call DelayFrames
	dec e
	jr nz, .asm_79dee
	ld a, [wTrainerSpriteOffset]
	ld [$ffae], a
	ret

Func_79e0d: ; 79e0d (1e:5e0d)
	ld a, h
	ld [$ffbd], a
	ld a, l
	ld [H_AUTOBGTRANSFERDEST], a
	jp Delay3

TossBallAnimation: ; 79e16 (1e:5e16)
	ld a,[W_ISINBATTLE]
	cp a,2
	jr z,.BlockBall ; if in trainer battle, play different animation
	ld a,[wd11e]
	ld b,a

	; upper nybble: how many animations (from PokeBallAnimations) to play
	; this will be 4 for successful capture, 6 for breakout
	and a,$F0
	swap a
	ld c,a

	; lower nybble: number of shakes
	; store these for later
	ld a,b
	and a,$F
	ld [wWhichTrade],a

	ld hl,.PokeBallAnimations
	; choose which toss animation to use
	ld a,[wcf91]
	cp a,POKE_BALL
	ld b,TOSS_ANIM
	jr z,.done
	cp a,GREAT_BALL
	ld b,GREATTOSS_ANIM
	jr z,.done
	ld b,ULTRATOSS_ANIM
.done
	ld a,b
.PlayNextAnimation
	ld [W_ANIMATIONID],a
	push bc
	push hl
	call PlayAnimation
	pop hl
	ld a,[hli]
	pop bc
	dec c
	jr nz,.PlayNextAnimation
	ret

.PokeBallAnimations: ; 79e50 (1e:5e50)
; sequence of animations that make up the Poké Ball toss
	db POOF_ANIM,HIDEPIC_ANIM,SHAKE_ANIM,POOF_ANIM,SHOWPIC_ANIM

.BlockBall ; 5E55
	ld a,TOSS_ANIM
	ld [W_ANIMATIONID],a
	call PlayAnimation
	ld a,(SFX_08_43 - SFX_Headers_08) / 3
	call PlaySound ; play sound effect
	ld a,BLOCKBALL_ANIM
	ld [W_ANIMATIONID],a
	jp PlayAnimation

Func_79e6a: ; 79e6a (1e:5e6a)
	call WaitForSoundToFinish
	ld a, [wd05b]
	and $7f
	ret z
	cp $a
	ld a, $20
	ld b, $30
	ld c, (SFX_08_50 - SFX_Headers_08) / 3
	jr z, .asm_79e8b
	ld a, $e0
	ld b, $ff
	ld c, (SFX_08_5a - SFX_Headers_08) / 3
	jr nc, .asm_79e8b
	ld a, $50
	ld b, $1
	ld c, (SFX_08_51 - SFX_Headers_08) / 3
.asm_79e8b
	ld [wc0f1], a
	ld a, b
	ld [wc0f2], a
	ld a, c
	jp PlaySound
