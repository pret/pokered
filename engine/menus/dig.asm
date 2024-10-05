; PureRGBnote: CHANGED: ADDED: using dig in the overworld can also be used
; to dig between towns after a certain point. Digging also has a new overworld animation.

DigFromPartyMenu::
	; check if we are currently surfing
	ld a, [wWalkBikeSurfState]
	cp SURFING
	ld hl, .cannotDigWhileSurfing
	jr z, .printFailed
	CheckEvent EVENT_LEARNED_TO_DIG_BETWEEN_TOWNS
	jr z, .skipForestCheck
	ld a, [wCurMapTileset]
	cp FOREST
	jr z, .noEscapeDungeon ; if we can dig between towns prefer it in the forest tileset
.skipForestCheck
	; check if we're trying to use dig in a dungeon
	callfar IsEscapeRopeUsable
	jr z, .noEscapeDungeon
	call LavaRoomCheck ; can't dig if we're standing on lava in the lava room
	jr z, .doneFailed
	ld a, ESCAPE_ROPE
	ld [wCurItem], a
	ld [wPseudoItemID], a
	call UseItem
	ld a, [wActionResultOrTookBattleTurn]
	and a
	jr z, .doneFailed
	jr .doneSuccess
.noEscapeDungeon
	CheckEvent EVENT_LEARNED_TO_DIG_BETWEEN_TOWNS
	jr z, .itemNotUse
	ld a, [wObtainedBadges]
	bit BIT_THUNDERBADGE, a
	jp z, .newBadgeRequired
	call CheckIfInDigMap
	jr z, .canDig
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	; change text
	ld hl, .cannotDigHereText
.printFailed
	rst _PrintText
	jr .doneFailed
.canDig
	call CheckTileNotDock
	ld hl, .noWhereToDigDown
	jr z, .printFailed
	ld hl, wStatusFlags4
	res BIT_NO_BATTLES, [hl]
	callfar LoadTownMap_Dig
	ld a, [wStatusFlags6]
	bit BIT_FLY_WARP, a ; did the player decide to dig?
	jr nz, .doFly
	call LoadFontTilePatterns
	ld hl, wStatusFlags4
	set BIT_UNKNOWN_4_1, [hl]
	scf
	ret
.itemNotUse
	callfar ItemUseNotTime
	jr .doneFailed
.doneSuccess
	call GBPalWhiteOutWithDelay3
.doFly
	SetFlag FLAG_DIG_OVERWORLD_ANIMATION
	ld a, 1
	and a
	ret
.doneFailed
	call GBPalWhiteOutWithDelay3
	xor a
	ret
.newBadgeRequired
	ld hl, .newBadgeRequiredText
	rst _PrintText
	jr .doneFailed
.newBadgeRequiredText
	text_far _NewBadgeRequiredText
	text_end
.cannotDigHereText
	text_far _CannotDigHereText
	text_end
.cannotDigWhileSurfing
	text_far _CannotDigWhileSurfingText
	text_end
.noWhereToDigDown
	text_far _NoWhereToDigDown
	text_end

StartDigEnterMapAnimation::
	ld c, 10
	rst _DelayFrames
	call PlayDigSound
	call DigAnimationMonsterFrame6
	ld hl, wSpritePlayerStateData1YPixels
	ld a, 60
	ld [hli], a
	ld [hl], 64
	ld de, MonsterDiggingSprite2 tile 12
	ld hl, vNPCSprites
	lb bc, BANK(MonsterDiggingSprite2), 2
	call CopyVideoData
	call DigAnimationMonsterFrame5
	call DigAnimationMonsterFrame4
	call DigAnimationMonsterFrame3
	call DigAnimationMonsterFrame2
	call DigAnimationMonsterFrame1
	ld c, 5
	rst _DelayFrames
	call DigLoadMonsterSprite
	ld c, 20
	rst _DelayFrames
	jp ResetSoundModifiers

DigLoadMonsterSprite::
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	ld de, MonsterSprite
	lb bc, BANK(MonsterSprite), 4
	jr z, .notdiglett
	ld de, PartyMonSprites2 tile 54 ; diglett sprite
	lb bc, BANK(PartyMonSprites2), 2
	ld hl, vNPCSprites tile 2
	call CopyVideoData
	ld de, PartyMonSprites2 tile 50
	lb bc, BANK(PartyMonSprites2), 2
.notdiglett
	ld hl, vNPCSprites
	jp CopyVideoData

DigAnimationMonsterSpriteBlinks::
	ld c, 5
	rst _DelayFrames
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	ld de, DiglettBlinkingSprite
	lb bc, BANK(DiglettBlinkingSprite), 2
	jr nz, .diglett1
	ld de, MonsterBlinkingSprite
	lb bc, BANK(MonsterBlinkingSprite), 2
.diglett1
	ld hl, vNPCSprites
	call CopyVideoData
	ld c, 5
	rst _DelayFrames
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	ld de, PartyMonSprites2 tile 50
	lb bc, BANK(PartyMonSprites2), 2
	jr nz, .diglett2
	ld de, MonsterSprite
	lb bc, BANK(MonsterSprite), 2
.diglett2
	ld hl, vNPCSprites
	jp CopyVideoData

DigAnimationMonsterFrame1:
	ld c, 2
	rst _DelayFrames
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	jr nz, .diglett
	ld de, MonsterSprite tile 12
	lb bc, BANK(MonsterSprite), 2
	call CopyVideoData
	ld de, MonsterDiggingSprite
	ld hl, vNPCSprites tile 2
	lb bc, BANK(MonsterDiggingSprite), 2
	jp CopyVideoData
.diglett
	ld de, PartyMonSprites2 tile 48
	lb bc, BANK(PartyMonSprites2), 2
	ld hl, vNPCSprites
	call CopyVideoData
	ld de, PartyMonSprites2 tile 52
	lb bc, BANK(PartyMonSprites2), 2
	ld hl, vNPCSprites tile 2
	jp CopyVideoData

DigAnimationMonsterFrame2:
	ld c, 2
	rst _DelayFrames
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	ld de, DiglettDiggingSprite 
	lb bc, BANK(DiglettDiggingSprite), 4
	jr nz, .diglett
	ld de, MonsterDiggingSprite2
	lb bc, BANK(MonsterDiggingSprite2), 4
.diglett
	ld hl, vNPCSprites
	jp CopyVideoData

DigAnimationMonsterFrame3:
	ld c, 2
	rst _DelayFrames
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	ld de, DiglettDiggingSprite tile 4
	lb bc, BANK(DiglettDiggingSprite), 4
	jr nz, .diglett
	ld de, MonsterDiggingSprite2 tile 4
	lb bc, BANK(MonsterDiggingSprite2), 4
.diglett
	ld hl, vNPCSprites
	jp CopyVideoData

DigAnimationMonsterFrame4:
	ld c, 2
	rst _DelayFrames
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	ld de, DiglettDiggingSprite tile 8
	lb bc, BANK(DiglettDiggingSprite), 4
	jr nz, .diglett
	ld de, MonsterDiggingSprite2 tile 8
	lb bc, BANK(MonsterDiggingSprite2), 4
.diglett
	ld hl, vNPCSprites
	jp CopyVideoData

DigAnimationMonsterFrame5:
	ld c, 2
	rst _DelayFrames
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	ld de, MonsterDiggingSprite2 tile 12
	lb bc, BANK(MonsterDiggingSprite2), 4
	jr z, .notdiglett
	ld de, DiglettDiggingSprite tile 12
	lb bc, BANK(DiglettDiggingSprite), 2
	ld hl, vNPCSprites tile 2
	call CopyVideoData
	ld de, MonsterDiggingSprite2 tile 12
	lb bc, BANK(MonsterDiggingSprite2), 2
.notdiglett
	ld hl, vNPCSprites
	jp CopyVideoData

DigAnimationMonsterFrame6:
	ld c, 2
	rst _DelayFrames
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	ld de, MonsterDiggingSprite2 tile 16
	lb bc, BANK(MonsterDiggingSprite2), 2
	jr z, .notdiglett
	ld de, DiglettDiggingSprite tile 14
	lb bc, BANK(DiglettDiggingSprite), 2
.notdiglett
	ld hl, vNPCSprites tile 2
	jp CopyVideoData

PlayDigSound:
	ld a, BANK(Music_GymLeaderBattle) ; switch to audio bank 2 to get battle sfx to work
	ld [wAudioROMBank], a
	ld [wAudioSavedROMBank], a
	ld a, $10
	ld [wFrequencyModifier], a
	ld a, $40
	ld [wTempoModifier], a
	ld a, SFX_DAMAGE
	rst _PlaySound
	ret

ResetSoundModifiers:
	xor a
	ld [wFrequencyModifier], a
	ld [wTempoModifier], a
	ret

StartDigLeaveMapAnimation::
	call DigLoadMonsterSprite
	ld a, SPRITE_FACING_DOWN
	ld [wSpritePlayerStateData1ImageIndex], a
	ld c, 10
	rst _DelayFrames
	call DigAnimationMonsterSpriteBlinks
	call DigAnimationMonsterSpriteBlinks
	call DigAnimationMonsterSpriteBlinks
	ld c, 24
	rst _DelayFrames ; wait a bit after showing the sprite
	; show it digging away
	call PlayDigSound
	call DigAnimationMonsterFrame1
	call DigAnimationMonsterFrame2
	call DigAnimationMonsterFrame3
	call DigAnimationMonsterFrame4
	call DigAnimationMonsterFrame5
	call DigAnimationMonsterFrame6
	call ResetSoundModifiers
	ld c, 36
	rst _DelayFrames
	ret

CheckTileNotDock:
	ld a, [wCurMapTileset]
	cp OVERWORLD
	jr nz, .noMatch
	ld a, [wCurMapWidth]
	lb de, 2, 2 ; block coord player is standing on
	call GetBlockAtCoord
	cp $54 ; dock block in overworld
	ret
.noMatch
	ld a, 1
	and a
	ret

; go to block on screen block coordinate d = x, e = y
GetBlockAtCoord::
	ld hl, wCurrentTileBlockMapViewPointer
	call GetAddressFromPointer
	ld b, 0
	ld a, e
	and a
	jr z, .skip
	ld a, [wCurMapWidth]
	add 6 ; extra 3 blocks on both side of map view
	ld c, a
.loop
	add hl, bc
	dec e
	jr nz, .loop
.skip
	ld c, d
	add hl, bc
	ld a, [hl]
	ld d, a
	ret

; in the flooding lava room of the volcano we need to block dig/teleporting out when you're standing on lava
; it's possible to pause while standing on lava for 1 frame and dig/teleporting at that point glitches the game out
LavaRoomCheck:
	ld a, [wCurMap]
	cp CINNABAR_VOLCANO
	ret nz
	CheckEvent EVENT_LAVA_FLOOD_ACTIVE
	jr z, .noLava
	ld a, [wTilePlayerStandingOn]
	cp $2A ; flood lava tile
	ret
.noLava
	ld a, 1
	and a
	ret