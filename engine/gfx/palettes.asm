_RunPaletteCommand:
	call GetPredefRegisters
	ld a, b
	cp SET_PAL_DEFAULT
	jr nz, .not_default
	ld a, [wDefaultPaletteCommand]
.not_default
	cp SET_PAL_PARTY_MENU_HP_BARS
	jp z, UpdatePartyMenuBlkPacket
	ld l, a
	ld h, 0
	add hl, hl
	ld de, SetPalFunctions
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, SendSGBPackets
	push de
	jp hl

SetPal_BattleBlack:
	ld hl, PalPacket_Black
	ld de, BlkPacket_Battle
	ret

; PureRGBnote: ADDED: updated function to allow alternate palette pokemon based on loaded data.
; uses PalPacket_Empty to build a packet based on mon IDs and health color
SetPal_Battle:
	ld hl, PalPacket_Empty
	ld de, wPalPacket
	ld bc, $10
	call CopyData
	ld a, [wBattleMonFlags]
	and 1 ; only the 1st bit of the flags determines alt palette
	ld [wIsAltPalettePkmn], a
	ld a, [wPlayerBattleStatus3]
	ld hl, wBattleMonSpecies
	call DeterminePaletteID
	ld b, a
	ld a, [wEnemyMonFlags]
	and 1 ; only the 1st bit of the flags determines alt palette
	ld [wIsAltPalettePkmn], a
	ld a, [wEnemyBattleStatus3]
	ld hl, wEnemyMonSpecies2
	call DeterminePaletteID
	ld c, a
	ld hl, wPalPacket + 1
	ld a, [wPlayerHPBarColor]
	add PAL_GREENBAR
	ld [hli], a
	inc hl
	ld a, [wEnemyHPBarColor]
	add PAL_GREENBAR
	ld [hli], a
	inc hl
	ld a, b
	ld [hli], a
	inc hl
	ld a, c
	ld [hl], a
	ld hl, wPalPacket
	ld de, BlkPacket_Battle
	ld a, SET_PAL_BATTLE
	ld [wDefaultPaletteCommand], a
	ret

SetPal_TownMap:
	ld hl, PalPacket_TownMap
	ld de, BlkPacket_WholeScreen
	ret

; PureRGBnote: ADDED: updated function to allow alternate palette pokemon based on loaded data.
; uses PalPacket_Empty to build a packet based the mon ID
SetPal_StatusScreen:
	ld hl, PalPacket_Empty
	ld de, wPalPacket
	ld bc, $10
	call CopyData
	ld a, [wcf91]
	cp NUM_POKEMON_INDEXES + 1
	jr c, .pokemon
	ld a, $1 ; not pokemon
	jr .notPokemon
.pokemon
	push af
	;if it's a pokemon we may have to load the alt color palette based on the pokemon data
	ld a, [wLoadedMonFlags]
	and 1 ; only the 1st bit of the flags determines alt palette, zero the other ones
	ld [wIsAltPalettePkmn], a
	pop af
.notPokemon
	call DeterminePaletteIDOutOfBattle
	push af
	ld hl, wPalPacket + 1
	ld a, [wStatusScreenHPBarColor]
	add PAL_GREENBAR
	ld [hli], a
	inc hl
	pop af
	ld [hl], a
	ld hl, wPalPacket
	ld de, BlkPacket_StatusScreen
	ret

SetPal_PartyMenu:
	ld hl, PalPacket_PartyMenu
	ld de, wPartyMenuBlkPacket
	ret

SetPal_Pokedex:
	ld hl, PalPacket_Pokedex
	ld de, wPalPacket
	ld bc, $10
	call CopyData
	ld a, [wcf91]
	; no alt palette colors when viewing pokedex entries
	call DeterminePaletteIDOutOfBattle
	ld hl, wPalPacket + 3
	ld [hl], a
	ld hl, wPalPacket
	ld de, BlkPacket_Pokedex
	ret

; PureRGBnote: ADDED: function that sets the palette on the pokemon sprite boxes 
;                     that appear in the pewter museum or the route 15 left binoculars
SetPal_MiddleScreenMonBox:
	ld hl, PalPacket_Empty
	ld de, wPalPacket
	ld bc, $10
	call CopyData

	call GetOverworldPalette
	ld hl, wPalPacket + 1
	ld [hl], a
	
	ld a, [wcf91]
	; no alt palette pkmn colors in this case
	call DeterminePaletteIDOutOfBattle
	ld hl, wPalPacket + 3
	ld [hl], a
	ld hl, wPalPacket
	ld de, BlkPacket_PokemonMiddleScreenBox
	ret

; PureRGBnote: ADDED: function that sets the palette on the color changer NPC's "before and after" screen
SetPal_ColorBeforeAfter:
	ld hl, PalPacket_Empty
	ld de, wPalPacket
	ld bc, $10
	call CopyData
	; before picture
	ld a, [wLoadedMonFlags]
	and 1 ; only the 1st bit of the flags determines alt palette, zero the other ones
	ld c, a
	ld [wIsAltPalettePkmn], a
	ld a, [wcf91]
	call DeterminePaletteIDOutOfBattle
	ld b, a
	; after picture
	ld a, c
	xor 1 ; second palette should always be alternate one
	ld [wIsAltPalettePkmn], a
	ld a, [wcf91]
	call DeterminePaletteIDOutOfBattle
	ld c, a
	ld hl, wPalPacket + 1
	ld [hl], a
	ld hl, wPalPacket + 3
	ld a, b
	ld [hl], a
	ld hl, wPalPacket
	ld de, BlkPacket_Pokedex
	ret

SetPal_Slots:
	ld hl, PalPacket_Slots
	ld de, BlkPacket_Slots
	ret

SetPal_TitleScreen:
	ld hl, PalPacket_Titlescreen
	ld de, BlkPacket_Titlescreen
	ret

; used mostly for menus and the Oak intro
SetPal_Generic:
	ld hl, PalPacket_Generic
	ld de, BlkPacket_WholeScreen
	ret

SetPal_NidorinoIntro:
	ld hl, PalPacket_NidorinoIntro
	ld de, BlkPacket_NidorinoIntro
	ret

SetPal_GameFreakIntro:
	ld hl, PalPacket_GameFreakIntro
	ld de, BlkPacket_GameFreakIntro
	ld a, SET_PAL_GENERIC
	ld [wDefaultPaletteCommand], a
	ret

; PureRGBnote: CHANGED: abstracted code to a function called GetOverworldPalette for reusability.
; uses PalPacket_Empty to build a packet based on the current map
SetPal_Overworld:
	ld hl, PalPacket_Empty
	ld de, wPalPacket
	ld bc, $10
	call CopyData
	call GetOverworldPalette
	ld hl, wPalPacket + 1
	ld [hld], a
	ld de, BlkPacket_WholeScreen
	ld a, SET_PAL_OVERWORLD
	ld [wDefaultPaletteCommand], a
	ret

; PureRGBnote: CHANGED: abstracted into its own function, removed some redundant code
; stores the palette used  for the current map in a
GetOverworldPalette:
	ld a, [wCurMapTileset]
	cp CEMETERY
	jr z, .PokemonTowerOrAgatha
	cp CAVERN
	jr z, .caveOrBruno
	ld a, [wCurMap]
	cp FIRST_INDOOR_MAP
	jr c, .townOrRoute
	cp CERULEAN_ROCKET_HOUSE_B1F ; PureRGBnote: ADDED: this new map uses the red pokemon palette
	jr z, .rocketHouseBasement
	cp CERULEAN_CAVE_2F
	jr c, .normalDungeonOrBuilding
	cp LORELEIS_ROOM
	jr z, .Lorelei
	cp BRUNOS_ROOM
	jr z, .caveOrBruno
.normalDungeonOrBuilding
	ld a, [wLastMap] ; town or route that current dungeon or building is located
.townOrRoute
	cp NUM_CITY_MAPS
	jr c, .town
	ld a, PAL_ROUTE - 1
.town
	inc a ; a town's palette ID is its map ID + 1
	ret
.rocketHouseBasement
	ld a, PAL_REDMON - 1
	jr .town
.PokemonTowerOrAgatha
	ld a, PAL_GREYMON - 1
	jr .town
.caveOrBruno ; PureRGBnote: CHANGED: seafoam islands use a bluish purple color palette instead of brown.
	ld a, [wCurMap]
	cp SEAFOAM_ISLANDS_1F
	jr z, .seafoam
	cp SEAFOAM_ISLANDS_B1F
	jr c, .caveDefault
	cp SEAFOAM_ISLANDS_B4F + 1
	jr c, .seafoam
.caveDefault
	ld a, PAL_CAVE - 1
	jr .town
.Lorelei
	call GetPalettes
	jr c, .gbcLorelei
	jr .seafoam ; PureRGBnote: CHANGED: lorelei's room uses a bluish purple palette instead of light green on SGB colors.
.gbcLorelei 
	xor a
	jr .town
.seafoam
	ld a, PAL_0F - 1
	jr .town

; PureRGBnote: ADDED: updated function to allow alternate palette pokemon based on loaded data.
; used when a Pokemon is the only thing on the screen
; such as evolution, trading and the Hall of Fame
SetPal_PokemonWholeScreen:
	ld a, [wLoadedMonFlags]
	and 1 ; only the 1st bit of the flags determines alt palette, zero the other ones
	ld [wIsAltPalettePkmn], a
SetPal_PokemonWholeScreenTrade:
	push bc
	ld hl, PalPacket_Empty
	ld de, wPalPacket
	ld bc, $10
	call CopyData
	pop bc
	ld a, c
	and a
	ld a, PAL_BLACK
	jr nz, .next
	ld a, [wWholeScreenPaletteMonSpecies]
	call DeterminePaletteIDOutOfBattle
.next
	ld [wPalPacket + 1], a
	ld hl, wPalPacket
	ld de, BlkPacket_WholeScreen
	ret

SetPal_TrainerCard:
	ld hl, BlkPacket_TrainerCard
	ld de, wTrainerCardBlkPacket
	ld bc, $40
	call CopyData
	ld de, BadgeBlkDataLengths
	ld hl, wTrainerCardBlkPacket + 2
	ld a, [wObtainedBadges]
	ld c, NUM_BADGES
.badgeLoop
	srl a
	push af
	jr c, .haveBadge
; The player doens't have the badge, so zero the badge's blk data.
	push bc
	ld a, [de]
	ld c, a
	xor a
.zeroBadgeDataLoop
	ld [hli], a
	dec c
	jr nz, .zeroBadgeDataLoop
	pop bc
	jr .nextBadge
.haveBadge
; The player does have the badge, so skip past the badge's blk data.
	ld a, [de]
.skipBadgeDataLoop
	inc hl
	dec a
	jr nz, .skipBadgeDataLoop
.nextBadge
	pop af
	inc de
	dec c
	jr nz, .badgeLoop
	ld hl, PalPacket_TrainerCard
	ld de, wTrainerCardBlkPacket
	ret

SetPalFunctions:
; entries correspond to SET_PAL_* constants
	dw SetPal_BattleBlack
	dw SetPal_Battle
	dw SetPal_TownMap
	dw SetPal_StatusScreen
	dw SetPal_Pokedex
	dw SetPal_Slots
	dw SetPal_TitleScreen
	dw SetPal_NidorinoIntro
	dw SetPal_Generic
	dw SetPal_Overworld
	dw SetPal_PartyMenu
	dw SetPal_PokemonWholeScreen
	dw SetPal_PokemonWholeScreenTrade
	dw SetPal_GameFreakIntro
	dw SetPal_TrainerCard
	dw SetPal_ColorBeforeAfter
	dw SetPal_MiddleScreenMonBox

; The length of the blk data of each badge on the Trainer Card.
; The Rainbow Badge has 3 entries because of its many colors.
BadgeBlkDataLengths:
	db 6     ; Boulder Badge
	db 6     ; Cascade Badge
	db 6     ; Thunder Badge
	db 6 * 3 ; Rainbow Badge
	db 6     ; Soul Badge
	db 6     ; Marsh Badge
	db 6     ; Volcano Badge
	db 6     ; Earth Badge

DeterminePaletteID:
	bit TRANSFORMED, a ; a is battle status 3
	ld a, DEX_DITTO	;ld a, PAL_GREYMON  ; shinpokerednote: FIXED: if the mon has used Transform, use Ditto's palette
	jr nz, DeterminePaletteIDOutOfBattle.skipDexNumConversion ;ret nz
	ld a, [hl]
DeterminePaletteIDOutOfBattle:
	ld [wd11e], a
	and a ; is the mon index 0?
	jr z, .skipDexNumConversion
	push bc
	predef IndexToPokedex
	pop bc
	ld a, [wd11e]
	; 0 = missingno is a valid value here
.skipDexNumConversion
	ld e, a
	ld d, 0
;;;;;;;;;; PureRGBnote: ADDED: show an alternate palette pokemon if the flag is set. Then immediately clear the flag.
	ld a, [wIsAltPalettePkmn]
	and a
	jr z, .defaultPalette
	ld a, [wOptions2]
	bit BIT_ALT_PKMN_PALETTES, a ; do we have alt palettes enabled
	jr z, .defaultPalette ; if not show default palettes always
	ld hl, AltMonsterPalettes ; not just for Pokemon, Trainers use it too
	jr .usePalette
.defaultPalette
	ld hl, MonsterPalettes ; not just for Pokemon, Trainers use it too
.usePalette
	add hl, de
	xor a
	ld [wIsAltPalettePkmn], a ; always reset this value after displaying a pokemon sprite
;;;;;;;;;;
	ld a, [hl]
	ret

InitPartyMenuBlkPacket:
	ld hl, BlkPacket_PartyMenu
	ld de, wPartyMenuBlkPacket
	ld bc, $30
	jp CopyData

UpdatePartyMenuBlkPacket:
; Update the blk packet with the palette of the HP bar that is
; specified in [wWhichPartyMenuHPBar].
	ld hl, wPartyMenuHPBarColors
	ld a, [wWhichPartyMenuHPBar]
	ld e, a
	ld d, 0
	add hl, de
	ld e, l
	ld d, h
	ld a, [de]
	and a
	ld e, (1 << 2) | 1 ; green
	jr z, .next
	dec a
	ld e, (2 << 2) | 2 ; yellow
	jr z, .next
	ld e, (3 << 2) | 3 ; red
.next
	push de
	ld hl, wPartyMenuBlkPacket + 8 + 1
	ld bc, 6
	ld a, [wWhichPartyMenuHPBar]
	call AddNTimes
	pop de
	ld [hl], e
	ret

SendSGBPacket: ; shinpokerednote: gbcnote - shifted joypad polling around
; disable ReadJoypad to prevent it from interfering with sending the packet
	ld a, 1
	ldh [hDisableJoypadPolling], a ; don't poll joypad while sending packet
	call _SendSGBPacket
;re-enable joypad polling
	xor a
	ldh [hDisableJoypadPolling], a
	ret

_SendSGBPacket:
;check number of packets
	ld a, [hl]
	and $07
	ret z
; store number of packets in B
	ld b, a
.loop2
; save B for later use
	push bc
; send RESET signal (P14=LOW, P15=LOW)
	xor a
	ldh [rJOYP], a
; set P14=HIGH, P15=HIGH
	ld a, $30
	ldh [rJOYP], a
;load length of packets (16 bytes)
	ld b, $10
.nextByte
;set bit counter (8 bits per byte)
	ld e, $08
; get next byte in the packet
	ld a, [hli]
	ld d, a
.nextBit0
	bit 0, d
; if 0th bit is not zero set P14=HIGH, P15=LOW (send bit 1)
	ld a, $10
	jr nz, .next0
; else (if 0th bit is zero) set P14=LOW, P15=HIGH (send bit 0)
	ld a, $20
.next0
	ldh [rJOYP], a
; must set P14=HIGH,P15=HIGH between each "pulse"
	ld a, $30
	ldh [rJOYP], a
; rotation will put next bit in 0th position (so  we can always use command
; "bit 0, d" to fetch the bit that has to be sent)
	rr d
; decrease bit counter so we know when we have sent all 8 bits of current byte
	dec e
	jr nz, .nextBit0
	dec b
	jr nz, .nextByte
; send bit 1 as a "stop bit" (end of parameter data)
	ld a, $20
	ldh [rJOYP], a
; set P14=HIGH,P15=HIGH
	ld a, $30
	ldh [rJOYP], a
; wait for about 70000 cycles
	call Wait7000
; restore (previously pushed) number of packets
	pop bc
	dec b
; return if there are no more packets
	ret z
; else send 16 more bytes
	jr .loop2

; shinpokerednote: gbcnote: run GBC color code if on GBC when running this function now
LoadSGB:
	xor a
	ld [wOnSGB], a
	call CheckSGB
	jr c, .onSGB
	ldh a, [hGBC]
	and a
	jr z, .onDMG
	;if on gbc, set SGB flag but skip all the SGB vram stuff
	ld a, $1
	ld [wOnSGB], a
.onDMG
	ret	
.onSGB
	ld a, $1
	ld [wOnSGB], a
	di
	call PrepareSuperNintendoVRAMTransfer
	ei
	ld a, 1
	ld [wCopyingSGBTileData], a
	ld de, ChrTrnPacket
	ld hl, SGBBorderGraphics
	call CopyGfxToSuperNintendoVRAM
	xor a
	ld [wCopyingSGBTileData], a
	ld de, PctTrnPacket
	ld hl, BorderPalettes
	call CopyGfxToSuperNintendoVRAM
	xor a
	ld [wCopyingSGBTileData], a
	ld de, PalTrnPacket
;;;;;;;;;; PureRGBnote: ADDED: optional toggle between original SGB palettes and GBC palettes when playing on SGB
	call GetPalettes
	jr c, .gbcPalettes
	ld hl, SuperPalettes
	jr .gotPalettes
.gbcPalettes
	ld hl, GBCBasePalettes
.gotPalettes
;;;;;;;;;;
	call CopyGfxToSuperNintendoVRAM
	call ClearVram
	ld hl, MaskEnCancelPacket
	jp SendSGBPacket

PrepareSuperNintendoVRAMTransfer:
	ld hl, .packetPointers
	ld c, 9
.loop
	push bc
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
	call SendSGBPacket
	pop hl
	inc hl
	pop bc
	dec c
	jr nz, .loop
	ret

.packetPointers
; Only the first packet is needed.
	dw MaskEnFreezePacket
	dw DataSndPacket1
	dw DataSndPacket2
	dw DataSndPacket3
	dw DataSndPacket4
	dw DataSndPacket5
	dw DataSndPacket6
	dw DataSndPacket7
	dw DataSndPacket8

CheckSGB:
; Returns whether the game is running on an SGB in carry.
	ld hl, MltReq2Packet
	di
	call SendSGBPacket
	ld a, 1
	ldh [hDisableJoypadPolling], a
	ei
	call Wait7000
	ldh a, [rJOYP]
	and $3
	cp $3
	jr nz, .isSGB
	ld a, $20
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	call Wait7000
	call Wait7000
	ld a, $30
	ldh [rJOYP], a
	call Wait7000
	call Wait7000
	ld a, $10
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	call Wait7000
	vc_hook Unknown_network_reset
	call Wait7000
	ld a, $30
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	call Wait7000
	call Wait7000
	ldh a, [rJOYP]
	and $3
	cp $3
	jr nz, .isSGB
	call SendMltReq1Packet
	and a
	ret
.isSGB
	call SendMltReq1Packet
	scf
	ret

SendMltReq1Packet:
	ld hl, MltReq1Packet
	call SendSGBPacket
	jp Wait7000

CopyGfxToSuperNintendoVRAM:
	di
	push de
	call DisableLCD
	ld a, $e4
	ldh [rBGP], a
	call UpdateGBCPal_BGP ; shinpokerednote: gbcnote: color code from pokemon yellow
	ld de, vChars1
	ld a, [wCopyingSGBTileData]
	and a
	jr z, .notCopyingTileData
	call CopySGBBorderTiles
	jr .next
.notCopyingTileData
	ld bc, $1000
	call CopyData
.next
	ld hl, vBGMap0
	ld de, $c
	ld a, $80
	ld c, $d
.loop
	ld b, $14
.innerLoop
	ld [hli], a
	inc a
	dec b
	jr nz, .innerLoop
	add hl, de
	dec c
	jr nz, .loop
	ld a, $e3
	ldh [rLCDC], a
	pop hl
	call SendSGBPacket
	xor a
	ldh [rBGP], a
	call UpdateGBCPal_BGP ; shinpokerednote: gbcnote: color code from pokemon yellow
	ei
	ret

Wait7000:
; Each loop takes 9 cycles so this routine actually waits 63000 cycles.
	ld de, 7000
.loop
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .loop
	ret

SendSGBPackets:
	ldh a, [hGBC]
	and a
	jr z, .notGBC
	push de
	call InitGBCPalettesNew
	pop hl
	;call EmptyFunc3
	;shinpokerednote: gbcnote: initialize the second pal packet in de (now in hl) then enable the lcd
	call InitGBCPalettesNew
	ldh a, [rLCDC]
	and rLCDC_ENABLE_MASK
	ret z
	call Delay3
	ret
.notGBC
	push de
	call SendSGBPacket
	pop hl
	jp SendSGBPacket


; PureRGBnote: ADDED: figure out if we have SGB or GBC palettes selected in the options.
GetPalettes:
	ld a, [wOptions2]
	and %11
	cp 3
	jr z, .gbcPalettes
	and a
	jr .done
.gbcPalettes
	scf
.done
	ret


InitGBCPalettesNew:	;shinpokerednote: gbcnote: updating this to work with the Yellow code
	ld a, [hl]
	and $f8
	cp $20	;check to see if hl points to a blk pal packet
	jp z, TranslatePalPacketToBGMapAttributes	;jump if so
	;otherwise hl points to a different pal packet or wPalPacket
	inc hl
index = 0
	REPT NUM_ACTIVE_PALS
		IF index > 0
			pop hl
		ENDC

		ld a, [hli]	;get palette ID into 'A'
		inc hl

		IF index < (NUM_ACTIVE_PALS + -1)
			push hl
		ENDC

		call GetGBCBasePalAddress	;get palette address into de
		ld a, e
		ld [wGBCBasePalPointers + index * 2], a
		ld a, d
		ld [wGBCBasePalPointers + index * 2 + 1], a

		ld a, CONVERT_BGP
		call DMGPalToGBCPal
		ld a, index
		call TransferCurBGPData

		ld a, CONVERT_OBP0
		call DMGPalToGBCPal
		ld a, index
		call TransferCurOBPData

		ld a, CONVERT_OBP1
		call DMGPalToGBCPal
		ld a, index + 4
		call TransferCurOBPData
index = index + 1
	ENDR
	ret

GetGBCBasePalAddress:: ;shinpokerednote: gbcnote: new function
; Input: a = palette ID
; Output: de = palette address
	push hl
	ld l, a
	xor a
	ld h, a
	add hl, hl
	add hl, hl
	add hl, hl
;;;;;;;;;; PureRGBnote: ADDED: optional toggle between original SGB palettes and GBC palettes when playing on SGB
	call GetPalettes
	jr c, .gbcPalettes
	ld de, SuperPalettes
	jr .gotPalettes
.gbcPalettes
	ld de, GBCBasePalettes
.gotPalettes
;;;;;;;;;;
	add hl, de
	ld a, l
	ld e, a
	ld a, h
	ld d, a
	pop hl
	ret
	
DMGPalToGBCPal::	;shinpokerednote: gbcnote: new function
; Populate wGBCPal with colors from a base palette, selected using one of the
; DMG palette registers.
; Input:
; a = which DMG palette register
; de = address of GBC base palette
	and a
	jr nz, .notBGP
;;;;;;;;;; PureRGBnote: ADDED: on GBC we will use the original duochromatic colors if the option is selected.
	ld a, [wOptions2]
	and %11 
	jr nz, .notOG1 ; if this value is non-zero we're not using OG palettes on GBC
	ld de, GBC_OGPalettes_BGOBJ1
.notOG1
;;;;;;;;;; 
	ldh a, [rBGP]
	ld [wLastBGP], a
	jr .convert
.notBGP
	dec a
	jr nz, .notOBP0
;;;;;;;;;; PureRGBnote: ADDED: on GBC we will use the original duochromatic colors if the option is selected.
	ld a, [wOptions2]
	and %11 
	jr nz, .notOG2 ; if this value is non-zero we're not using OG palettes on GBC
	ld de, GBC_OGPalettes_OBJ0
.notOG2
;;;;;;;;;;
	ldh a, [rOBP0]
	ld [wLastOBP0], a
	jr .convert
.notOBP0
;;;;;;;;;; PureRGBnote: ADDED: on GBC we will use the original duochromatic colors if the option is selected.
	ld a, [wOptions2]
	and %11 
	jr nz, .notOG3 ; if this value is non-zero we're not using OG palettes on GBC
	ld de, GBC_OGPalettes_BGOBJ1
.notOG3
;;;;;;;;;;
	ldh a, [rOBP1]
	ld [wLastOBP1], a
.convert
;"A" now holds the palette data
color_index = 0
	REPT NUM_COLORS
		ld b, a	;"B" now holds the palette data
		and %11	;"A" now has just the value for the shade of palette color 0
		call .GetColorAddress
		push de
		;get the palett color value in de
		ld a, [hli]
		ld e, a
		ld a, [hl]
		ld d, a
		;now load the value that HL points to into wGBCPal offset by the loop
		ld a, e
		ld [wGBCPal + color_index * 2], a
		ld a, d
		ld [wGBCPal + color_index * 2 + 1], a
		pop de

		IF color_index < (NUM_COLORS + -1)
			ld a, b	;restore the palette data back into "A"
			;rotate the palette data bits twice to the right so the next color in line becomes color 0
			rrca
			rrca
		ENDC
color_index = color_index + 1
	ENDR
	ret
.GetColorAddress:
	add a	;double the value of the shade in "A"
	ld l, a	;load 2x shade value into "L"
	xor a	;zero "A"
	ld h, a	;and load it to "H", so HL is now [00|2x shade]
	add hl, de	;HL now holds the base palette address offset by 2x shade in bytes (base, base+2, base+4, or base+6)
	ret

TransferCurBGPData:: ;shinpokerednote: gbcnote: code from pokemon yellow
; a = indexed offset of wGBCBasePalPointers
	push de
	;multiply index by 8 since each index represents 8 bytes worth of data
	add a
	add a
	add a
	or $80 ; set auto-increment bit of rBGPI
	ldh [rBGPI], a
	ld de, rBGPD
	ld hl, wGBCPal
	ldh a, [rLCDC]
	and rLCDC_ENABLE_MASK
	jr nz, .lcdEnabled
	rept NUM_COLORS
	call TransferPalColorLCDDisabled
	endr
	jr .done
.lcdEnabled
	rept NUM_COLORS
	call TransferPalColorLCDEnabled
	endr
.done
	pop de
	ret	

BufferBGPPal:: ;shinpokerednote: gbcnote: code from pokemon yellow
; Copy wGBCPal to palette a in wBGPPalsBuffer.
; a = indexed offset of wGBCBasePalPointers
	push de
	;multiply index by 8 since each index represents 8 bytes worth of data
	add a
	add a
	add a
	ld l, a
	xor a
	ld h, a
	ld de, wBGPPalsBuffer
	add hl, de	;hl now points to wBGPPalsBuffer + 8*index
	ld de, wGBCPal
	ld c, PAL_SIZE
.loop	;copy the 8 bytes of wGBCPal to its indexed spot in wBGPPalsBuffer
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop
	pop de
	ret
	
TransferBGPPals:: ;shinpokerednote: gbcnote: code from pokemon yellow
; Transfer the buffered BG palettes.
	ldh a, [rLCDC]
	and rLCDC_ENABLE_MASK
	jr z, .lcdDisabled
	; have to wait until LCDC is disabled
	; LCD should only ever be disabled during the V-blank period to prevent hardware damage
	di	;disable interrupts
.waitLoop
	ldh a, [rLY]
	cp 144	;V-blank can be confirmed when the value of LY is greater than or equal to 144
	jr c, .waitLoop
.lcdDisabled
	call .DoTransfer
	ei	;enable interrupts
	ret
.DoTransfer:
	xor a
	or $80 ; set the auto-increment bit of rBPGI
	ldh [rBGPI], a
	ld de, rBGPD
	ld hl, wBGPPalsBuffer
	ld c, 4 * PAL_SIZE
.loop
	ld a, [hli]
	ld [de], a
	dec c
	jr nz, .loop
	ret

TransferCurOBPData: ;shinpokerednote: gbcnote: code from pokemon yellow
; a = indexed offset of wGBCBasePalPointers
	push de
	;multiply index by 8 since each index represents 8 bytes worth of data
	add a
	add a
	add a
	or $80 ; set auto-increment bit of OBPI
	ldh [rOBPI], a
	ld de, rOBPD
	ld hl, wGBCPal
	ldh a, [rLCDC]
	and rLCDC_ENABLE_MASK
	jr nz, .lcdEnabled
	rept NUM_COLORS
	call TransferPalColorLCDDisabled
	endr
	jr .done
.lcdEnabled
	rept NUM_COLORS
	call TransferPalColorLCDEnabled
	endr
.done
	pop de
	ret	

TransferPalColorLCDEnabled: ;shinpokerednote: gbcnote: code from pokemon yellow
; Transfer a palette color while the LCD is enabled.
; In case we're already in H-blank or V-blank, wait for it to end. This is a
; precaution so that the transfer doesn't extend past the blanking period.
	ldh a, [rSTAT]
	and %10 ; mask for non-V-blank/non-H-blank STAT mode
	jr z, TransferPalColorLCDEnabled	;repeat if still in h-blank or v-blank
; Wait for H-blank or V-blank to begin.
.notInBlankingPeriod
	ldh a, [rSTAT]
	and %10 ; mask for non-V-blank/non-H-blank STAT mode
	jr nz, .notInBlankingPeriod
; fall through
TransferPalColorLCDDisabled:
; Transfer a palette color while the LCD is disabled.
	ld a, [hli]
	ld [de], a
	ld a, [hli]
	ld [de], a
	ret
	
_UpdateGBCPal_BGP:: ;shinpokerednote: gbcnote: code from pokemon yellow
index = 0
	REPT NUM_ACTIVE_PALS
		ld a, [wGBCBasePalPointers + index * 2]
		ld e, a
		ld a, [wGBCBasePalPointers + index * 2 + 1]
		ld d, a
		xor a ; CONVERT_BGP
		call DMGPalToGBCPal
		ld a, index
		call BufferBGPPal	; Copy wGBCPal to palette indexed in wBGPPalsBuffer.
index = index + 1
	ENDR
	call TransferBGPPals	;Transfer wBGPPalsBuffer contents to rBGPD
	ret

_UpdateGBCPal_OBP:: ;shinpokerednote: gbcnote: code from pokemon yellow
; d then c = CONVERT_OBP0 or CONVERT_OBP1
	ld a, d
	ld c, a
index = 0
	REPT NUM_ACTIVE_PALS
		ld a, [wGBCBasePalPointers + index * 2]
		ld e, a
		ld a, [wGBCBasePalPointers + index * 2 + 1]
		ld d, a
		ld a, c
		call DMGPalToGBCPal
		ld a, c
		dec a
		rlca
		rlca

		IF index > 0
			IF index == 1
				inc a
			ELSE
				add index
			ENDC
		ENDC
		;OBP0: a = 0, 1, 2, or 3
		;OBP1: a = 4, 5, 6, or 7
		call TransferCurOBPData
index = index + 1
	ENDR
	ret
	
;shinpokerednote: gbcnote: new function
TranslatePalPacketToBGMapAttributes::
; translate the SGB pals for blk packets into something usable for the GBC
	push hl
	pop de
	ld hl, PalPacketPointers
	ld a, [hli]
	ld c, a
.loop
	ld a, e
.innerLoop
	cp [hl]
	jr z, .checkHighByte
	inc hl
	inc hl
	dec c
	jr nz, .innerLoop
	ret
.checkHighByte
; the low byte of pointer matched, so check the high byte
	inc hl
	ld a, d
	cp [hl]
	jr z, .foundMatchingPointer
	inc hl
	dec c
	jr nz, .loop
	ret
.foundMatchingPointer
	push de
	ld d, c
	callfar LoadBGMapAttributes
	pop de
	ret

;shinpokerednote: gbcnote: pointers from pokemon yellow
PalPacketPointers::
	db (palPacketPointersEnd - palPacketPointers) / 2
palPacketPointers:
	dw BlkPacket_WholeScreen
	dw BlkPacket_Battle
	dw BlkPacket_StatusScreen
	dw BlkPacket_Pokedex
	dw BlkPacket_Slots
	dw BlkPacket_Titlescreen
	dw BlkPacket_NidorinoIntro
	dw wPartyMenuBlkPacket
	dw wTrainerCardBlkPacket
	dw BlkPacket_GameFreakIntro
	dw wPalPacket
	dw BlkPacket_PokemonMiddleScreenBox
palPacketPointersEnd:
	


EmptyFunc3:
	ret

CopySGBBorderTiles:
; SGB tile data is stored in a 4BPP planar format.
; Each tile is 32 bytes. The first 16 bytes contain bit planes 1 and 2, while
; the second 16 bytes contain bit planes 3 and 4.
; This function converts 2BPP planar data into this format by mapping
; 2BPP colors 0-3 to 4BPP colors 0-3. 4BPP colors 4-15 are not used.
	ld b, 128
.tileLoop
; Copy bit planes 1 and 2 of the tile data.
	ld c, 16
.copyLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copyLoop

; Zero bit planes 3 and 4.
	ld c, 16
	xor a
.zeroLoop
	ld [de], a
	inc de
	dec c
	jr nz, .zeroLoop

	dec b
	jr nz, .tileLoop
	ret

;shinpokerednote: gbcnote: This function loads the palette for a given pokemon index in wcf91 into a specified palette register on the GBC
;d = CONVERT_OBP0, CONVERT_OBP1, or CONVERT_BGP
;e = palette register # (0 to 7)
;if wcf91 has bit 7 set, then it the address holds a specific palette instead of a 'mon
TransferMonPal:
	ldh a, [hGBC]
	and a
	ret z 
	ld a, e
	push af
	ld a, d
	push af
	ld a, [wcf91]
	cp NUM_POKEMON_INDEXES+2
	jr c, .isMon
	sub NUM_POKEMON_INDEXES+2
.back	
	call GetGBCBasePalAddress
	pop af
	cp CONVERT_BGP
	push af
	call DMGPalToGBCPal
	pop af
	jr z, .do_bgp
	pop af
	call TransferCurOBPData
	ret
.do_bgp
	pop af
	call TransferCurBGPData
	ret
.isMon	
	call DeterminePaletteIDOutOfBattle
	jr .back



INCLUDE "data/sgb/sgb_packets.asm"

INCLUDE "data/pokemon/palettes.asm"
INCLUDE "data/pokemon/alt_palettes.asm"

INCLUDE "data/sgb/sgb_palettes.asm"
INCLUDE "data/gbc/gbc_palettes.asm"

INCLUDE "data/sgb/sgb_border.asm"
