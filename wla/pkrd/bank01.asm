.BANK 1
.ORG $0000

; Pointer Table from 4000 to 4001 (1 entries, indexed by wSpriteDataStart)
SpriteFacingAndAnimationTable:
.dw SpriteFacingAndAnimationTable.StandingDown

; Pointer Table from 4002 to 407F (63 entries, indexed by wSpriteDataStart)
.dw SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.WalkingDown, SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.StandingDown, SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.WalkingDown, SpriteFacingAndAnimationTable.FlippedOAM, SpriteFacingAndAnimationTable.StandingUp
.dw SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.WalkingUp, SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.StandingUp, SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.WalkingUp, SpriteFacingAndAnimationTable.FlippedOAM, SpriteFacingAndAnimationTable.StandingLeft
.dw SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.WalkingLeft, SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.StandingLeft, SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.WalkingLeft, SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.StandingLeft
.dw SpriteFacingAndAnimationTable.FlippedOAM, SpriteFacingAndAnimationTable.WalkingLeft, SpriteFacingAndAnimationTable.FlippedOAM, SpriteFacingAndAnimationTable.StandingLeft, SpriteFacingAndAnimationTable.FlippedOAM, SpriteFacingAndAnimationTable.WalkingLeft, SpriteFacingAndAnimationTable.FlippedOAM, SpriteFacingAndAnimationTable.StandingDown
.dw SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.StandingDown, SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.StandingDown, SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.StandingDown, SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.StandingDown
.dw SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.StandingDown, SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.StandingDown, SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.StandingDown, SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.StandingDown
.dw SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.StandingDown, SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.StandingDown, SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.StandingDown, SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.StandingDown
.dw SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.StandingDown, SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.StandingDown, SpriteFacingAndAnimationTable.NormalOAM, SpriteFacingAndAnimationTable.StandingDown, SpriteFacingAndAnimationTable.NormalOAM

; 1st entry of Pointer Table from 4000 (indexed by wSpriteDataStart)
; Data from 4080 to 4083 (4 bytes)
SpriteFacingAndAnimationTable.StandingDown:
.db $00, $01, $02, $03

; 2nd entry of Pointer Table from 4002 (indexed by wSpriteDataStart)
; Data from 4084 to 4087 (4 bytes)
SpriteFacingAndAnimationTable.WalkingDown:
.db $80, $81, $82, $83

; 8th entry of Pointer Table from 4002 (indexed by wSpriteDataStart)
; Data from 4088 to 408B (4 bytes)
SpriteFacingAndAnimationTable.StandingUp:
.db $04, $05, $06, $07

; 10th entry of Pointer Table from 4002 (indexed by wSpriteDataStart)
; Data from 408C to 408F (4 bytes)
SpriteFacingAndAnimationTable.WalkingUp:
.db $84, $85, $86, $87

; 16th entry of Pointer Table from 4002 (indexed by wSpriteDataStart)
; Data from 4090 to 4093 (4 bytes)
SpriteFacingAndAnimationTable.StandingLeft:
.db $08, $09, $0A, $0B

; 18th entry of Pointer Table from 4002 (indexed by wSpriteDataStart)
; Data from 4094 to 4097 (4 bytes)
SpriteFacingAndAnimationTable.WalkingLeft:
.db $88, $89, $8A, $8B

; 1st entry of Pointer Table from 4002 (indexed by wSpriteDataStart)
; Data from 4098 to 40A3 (12 bytes)
SpriteFacingAndAnimationTable.NormalOAM:
.db $00, $00, $00, $00, $08, $00, $08, $00, $02, $08, $08, $03

; 7th entry of Pointer Table from 4002 (indexed by wSpriteDataStart)
; Data from 40A4 to 417F (220 bytes)
SpriteFacingAndAnimationTable.FlippedOAM:
.db $00, $08, $20, $00, $00, $20, $08, $08, $22, $08, $00, $23, $AF, $EA, $0B, $CF
.db $EA, $00, $D7, $EA, $57, $D0, $EA, $5D, $D3, $EA, $10, $CF, $E0, $B4, $EA, $57
.db $CC, $EA, $60, $CD, $E0, $9F, $E0, $A0, $E0, $A1, $CD, $A6, $35, $38, $2C, $FA
.db $47, $D3, $E0, $9F, $FA, $48, $D3, $E0, $A0, $FA, $49, $D3, $E0, $A1, $AF, $E0
.db $A2, $E0, $A3, $3E, $02, $E0, $A4, $3E, $0D, $CD, $6D, $3E, $F0, $A2, $EA, $47
.db $D3, $F0, $A3, $EA, $48, $D3, $F0, $A4, $EA, $49, $D3, $21, $32, $D7, $CB, $D6
.db $CB, $9E, $CB, $F6, $3E, $FF, $EA, $6B, $CD, $3E, $07, $C3, $6D, $3E, $55, $BE
.db $05, $53, $C3, $7E, $AF, $53, $04, $E6, $50, $7D, $5A, $D2, $63, $35, $48, $55
.db $25, $46, $AD, $81, $18, $D6, $6B, $AA, $F5, $29, $42, $21, $36, $50, $A0, $7F
.db $21, $26, $A9, $26, $38, $D6, $E4, $58, $10, $55, $4E, $1A, $2A, $75, $22, $88
.db $88, $92, $18, $ED, $8B, $81, $39, $15, $48, $41, $8A, $55, $35, $4A, $70, $C1
.db $14, $C7, $AB, $53, $49, $21, $7E, $15, $94, $35, $49, $56, $25, $48, $58, $9A
.db $85, $48, $50, $9F, $FC, $8A, $07, $A8, $85, $AD, $55, $E2, $94, $14, $9A, $21
.db $48, $50, $AA, $82, $82, $32, $B8, $BA, $38, $A9, $4E, $35

; 1st entry of Pointer Table from 17B27 (indexed by wSprite01StateData2ImageBaseOffset)
; Data from 4180 to 425A (219 bytes)
SpriteFacingAndAnimationTable_plus_180:
.db $68, $95, $25, $79, $4E, $58, $6D, $46, $FF, $B7, $8E, $BA, $FF, $FF, $A3, $AA
.db $7C, $0A, $09, $E1, $B0, $D0, $40, $98, $27, $32, $A4, $20, $FA, $93, $19, $A5
.db $22, $91, $D1, $76, $91, $1A, $DA, $D0, $C3, $C5, $24, $31, $29, $9C, $31, $1F
.db $11, $A4, $43, $0D, $68, $46, $89, $3E, $4E, $12, $45, $2A, $9C, $31, $56, $3E
.db $4B, $F9, $16, $9D, $3E, $4F, $E5, $E1, $1C, $6A, $3E, $28, $71, $87, $1A, $D9
.db $3E, $4C, $A1, $E4, $B1, $09, $B5, $13, $E9, $85, $FD, $6B, $DE, $5A, $5A, $A5
.db $34, $45, $7A, $11, $17, $04, $0C, $31, $35, $86, $15, $98, $DC, $63, $02, $52
.db $64, $F1, $C8, $82, $6E, $F4, $71, $D4, $09, $0A, $92, $8B, $47, $57, $7F, $90
.db $86, $77, $C5, $51, $D8, $44, $BE, $2D, $5F, $FF, $D7, $D4, $DD, $EA, $05, $55
.db $AF, $FF, $38, $6E, $A0, $AF, $5A, $F3, $82, $88, $52, $6B, $D4, $D6, $F8, $5E
.db $32, $A3, $D3, $B4, $F0, $28, $F2, $5C, $E6, $BF, $D5, $E3, $B2, $A3, $EA, $27
.db $C5, $A3, $0A, $B8, $2E, $09, $BA, $42, $A4, $B4, $F6, $A7, $07, $12, $8C, $08
.db $53, $9A, $AF, $15, $44, $54, $09, $C1, $10, $9E, $02, $60, $A7, $52, $A1, $47
.db $5D, $18, $E7, $32, $42, $43, $9D, $70, $59, $F8, $40

; Data from 425B to 42A0 (70 bytes)
MewBaseStats:
.db $97, $64, $64, $64, $64, $64, $18, $18, $2D, $40, $55, $12, $41, $05, $42, $01
.db $00, $00, $00, $03, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $21, $E9, $CC, $7E
.db $A7, $28, $06, $35, $21, $A7, $42, $18, $1B, $2B, $7E, $A7, $C8, $35, $21, $AC
.db $42, $20, $11, $E5, $FA, $E5, $CF, $EA, $B5, $D0, $CD, $37, $15, $FA, $C0, $D0
.db $EA, $07, $D0, $E1, $E5, $CD

; 1st entry of Pointer Table from 1AE (indexed by wCurMap)
; Data from 42A1 to 42B0 (16 bytes)
PrintSafariZoneBattleText_tail:
.db $25, $37, $E1, $C3, $49, $3C, $17, $53, $5D, $22, $50, $17, $6A, $5D, $22, $50

CopyDebugName:
	LD BC, $000B
	JP CopyData

PrepareTitleScreen:
	LD HL, DebugNewGamePlayerName
	LD DE, wPlayerName
	CALL CopyDebugName
	LD HL, DebugNewGameRivalName
	LD DE, wRivalName
	CALL CopyDebugName
	XOR A
	LDH (hWY - $FF00), A
	LD (wLetterPrintingDelayFlags), A
	LD HL, wStatusFlags6
	LDI (HL), A
	LDI (HL), A
	LD (HL), A
	LD A, $1F
	LD (wAudioROMBank), A
	LD (wAudioSavedROMBank), A
	CALL GBPalWhiteOut
	LD A, $01
	LDH (hAutoBGTransferEnabled - $FF00), A
	XOR A
	LDH (hTileAnimations - $FF00), A
	LDH (hSCX - $FF00), A
	LD A, $40
	LDH (hSCY - $FF00), A
	LD A, $90
	LDH (hWY - $FF00), A
	CALL ClearScreen
	CALL DisableLCD
	CALL LoadFontTilePatterns
	LD HL, BattleHudTiles3End
	LD DE, $9410
	LD BC, $0050
	LD A, $04
	CALL FarCopyData2
	LD HL, GameFreakLogoGraphics
	LD DE, $9460
	LD BC, $0090
	LD A, $04
	CALL FarCopyData2
	LD HL, PokemonLogoGraphics
	LD DE, $8800
	LD BC, $0600
	LD A, $04
	CALL FarCopyData2
	LD HL, PokemonLogoGraphics + $600
	LD DE, $9310
	LD BC, $0100
	LD A, $04
	CALL FarCopyData2
	LD HL, Version_GFX
	LD DE, $9600
	LD BC, $0050
	LD A, $1A
	CALL FarCopyDataDouble
	CALL ClearBothBGMaps
	LD HL, wTileMap_plus_16
	LD A, $80
	LD DE, $0014
	LD C, $06
DisplayTitleScreen.pokemonLogoTileLoop:
	LD B, $10
	PUSH HL
DisplayTitleScreen.pokemonLogoTileRowLoop:
	LDI (HL), A
	INC A
	DEC B
	JR NZ, DisplayTitleScreen.pokemonLogoTileRowLoop
	POP HL
	ADD HL, DE
	DEC C
	JR NZ, DisplayTitleScreen.pokemonLogoTileLoop
	LD HL, wTileMap_plus_8E
	LD A, $31
	LD B, $10
DisplayTitleScreen.pokemonLogoLastTileRowLoop:
	LDI (HL), A
	INC A
	DEC B
	JR NZ, DisplayTitleScreen.pokemonLogoLastTileRowLoop
	CALL DrawPlayerCharacter
	LD HL, wShadowOAMSprite10
	LD A, $74
	LD (HL), A
	LD HL, wTileMap_plus_156
	LD DE, DisplayTitleScreen.tileScreenCopyrightTiles
	LD B, $10
DisplayTitleScreen.tileScreenCopyrightTilesLoop:
	LD A, (DE)
	LDI (HL), A
	INC DE
	DEC B
	JR NZ, DisplayTitleScreen.tileScreenCopyrightTilesLoop
	JR DisplayTitleScreen.next

; Data from 437F to 438E (16 bytes)
DisplayTitleScreen.tileScreenCopyrightTiles:
.db $41, $42, $43, $42, $44, $42, $45, $46, $47, $48, $49, $4A, $4B, $4C, $4D, $4E

DisplayTitleScreen.next:
	CALL SaveScreenTilesToBuffer2
	CALL LoadScreenTilesFromBuffer2
	CALL EnableLCD
	LD A, $B0
	LD (wBadgeNumberTile), A
	CALL LoadTitleMonSprite
	LD A, $9B
	CALL TitleScreenCopyTileMapToVRAM
	CALL SaveScreenTilesToBuffer1
	LD A, $40
	LDH (hWY - $FF00), A
	CALL LoadScreenTilesFromBuffer2
	LD A, $98
	CALL TitleScreenCopyTileMapToVRAM
	LD B, $06
	CALL RunPaletteCommand
	CALL GBPalNormal
	LD A, $E4
	LDH (rOBP0), A
	LD BC, hSCY
	LD HL, DisplayTitleScreen.TitleScreenPokemonLogoYScrolls
DisplayTitleScreen.bouncePokemonLogoLoop:
	LDI A, (HL)
	AND A
	JR Z, DisplayTitleScreen.finishedBouncingPokemonLogo
	LD D, A
	CP $FD
	JR NZ, DisplayTitleScreen.skipPlayingSound
	LD A, $BC
	CALL PlaySound
DisplayTitleScreen.skipPlayingSound:
	LDI A, (HL)
	LD E, A
	CALL DisplayTitleScreen.ScrollTitleScreenPokemonLogo
	JR DisplayTitleScreen.bouncePokemonLogoLoop

; Data from 43DB to 43DD (3 bytes)
DisplayTitleScreen.TitleScreenPokemonLogoYScrolls:
.db $FC, $10, $03

; Data from 43DE to 43E9 (12 bytes)
DisplayTitleScreen.TitleScreenPokemonLogoYScrolls_after_first_pair:
.db $04, $FD, $04, $02, $02, $FE, $02, $01, $02, $FF, $02, $00

DisplayTitleScreen.ScrollTitleScreenPokemonLogo:
	CALL DelayFrame
	LD A, (BC)
	ADD D
	LD (BC), A
	DEC E
	JR NZ, DisplayTitleScreen.ScrollTitleScreenPokemonLogo
	RET

DisplayTitleScreen.finishedBouncingPokemonLogo:
	CALL LoadScreenTilesFromBuffer1
	LD C, $24
	CALL DelayFrames
	LD A, $BD
	CALL PlaySound
	CALL PrintGameVersionOnTitleScreen
; Data from 4404 to 44DC (217 bytes)
.db $3E, $90, $E0, $B0, $16, $90, $62, $2E, $40, $CD, $CF, $44, $26, $00, $2E, $50
.db $CD, $CF, $44, $7A, $C6, $04, $57, $A7, $20, $EC, $3E, $9C, $CD, $33, $45, $CD
.db $01, $37, $CD, $98, $45, $CD, $D7, $3D, $CD, $48, $37, $3E, $C3, $EA, $EE, $C0
.db $CD, $B1, $23, $AF, $EA, $5B, $CC, $0E, $C8, $CD, $F8, $12, $38, $17, $CD, $C1
.db $44, $0E, $01, $CD, $F8, $12, $38, $0D, $06, $0D, $21, $AC, $72, $CD, $D6, $35
.db $CD, $96, $44, $18, $E2, $FA, $3D, $CD, $CD, $D0, $13, $CD, $48, $37, $CD, $D4
.db $3D, $CD, $82, $00, $AF, $E0, $B0, $3C, $E0, $BA, $CD, $0F, $19, $3E, $98, $CD
.db $33, $45, $3E, $9C, $CD, $33, $45, $CD, $D7, $3D, $CD, $BA, $20, $F0, $B4, $47
.db $E6, $46, $FE, $46, $CA, $8E, $44, $C3, $F2, $5A, $06, $07, $21, $8A, $49, $C3
.db $D6, $35, $3E, $98, $CD, $33, $45, $CD, $5C, $3E, $E6, $0F, $4F, $06, $00, $21
.db $88, $45, $09, $7E, $21, $3D, $CD, $BE, $28, $ED, $77, $CD, $24, $45, $3E, $90
.db $E0, $B0, $16, $01, $06, $0D, $21, $58, $72, $CD, $D6, $35, $C9, $16, $00, $06
.db $0D, $21, $58, $72, $CD, $D6, $35, $AF, $E0, $B0, $C9, $F0, $44, $BD, $20, $FB
.db $7C, $E0, $43, $F0, $44, $BC, $28, $FB, $C9

DrawPlayerCharacter:
	LD HL, PlayerCharacterTitleGraphics
	LD DE, $8000
	LD BC, $0230
	LD A, $04
	CALL FarCopyData2
	CALL ClearSprites
	XOR A
	LD (wBadgeNumberTile), A
	LD HL, wShadowOAM
	LD DE, $605A
	LD B, $07
DrawPlayerCharacter.loop:
	PUSH DE
	LD C, $05
DrawPlayerCharacter.innerLoop:
	LD A, D
	LDI (HL), A
	LD A, E
	LDI (HL), A
	ADD $08
	LD E, A
	LD A, (wBadgeNumberTile)
	LDI (HL), A
	INC A
	LD (wBadgeNumberTile), A
	INC HL
	DEC C
	JR NZ, DrawPlayerCharacter.innerLoop
	POP DE
	LD A, $08
	ADD D
	LD D, A
	DEC B
	JR NZ, DrawPlayerCharacter.loop
	RET

ClearBothBGMaps:
	LD HL, $9800
	LD BC, $0800
	LD A, $7F
	JP FillMemory

LoadTitleMonSprite:
	LD (wCurItem), A
	LD (wCurSpecies), A
	LD HL, $C46D
	CALL GetMonHeader
	JP LoadFrontSpriteByMonIndex

TitleScreenCopyTileMapToVRAM:
	LDH (hAutoBGTransferDest + $1 - $FF00), A
	JP Delay3

; Data from 4538 to 4597 (96 bytes)
.db $AF, $E0, $B0, $CD, $0F, $19, $CD, $A0, $36, $11, $C8, $60, $21, $00, $96, $01
.db $1C, $04, $CD, $48, $18, $21, $2E, $C4, $11, $56, $45, $C3, $55, $19, $60, $61
.db $62, $61, $63, $61, $64, $7F, $65, $66, $67, $68, $69, $6A, $4E, $60, $61, $62
.db $61, $63, $61, $64, $7F, $6B, $6C, $6D, $6E, $6F, $70, $71, $72, $4E, $60, $61
.db $62, $61, $63, $61, $64, $7F, $73, $74, $75, $76, $77, $78, $79, $7A, $7B, $50
.db $B0, $B1, $99, $70, $03, $1A, $54, $04, $01, $94, $19, $4C, $96, $22, $A3, $85

PrintGameVersionOnTitleScreen:
	LD HL, $C447
	LD DE, VersionOnTitleScreenText
	JP PlaceString

; Data from 45A1 to 45A9 (9 bytes)
VersionOnTitleScreenText:
.db $60, $61, $7F, $65, $66, $67, $68, $69, $50

; Data from 45AA to 45B0 (7 bytes)
DebugNewGamePlayerName:
.db $8D, $88, $8D, $93, $84, $8D, $50

; Data from 45B1 to 4B0E (1374 bytes)
DebugNewGameRivalName:
.db $92, $8E, $8D, $98, $50, $FA, $5F, $DA, $EA, $91, $CF, $FA, $49, $CC, $FE, $03
.db $28, $0C, $FA, $92, $CF, $5F, $21, $37, $5C, $06, $0E, $CD, $D6, $35, $FA, $91
.db $CF, $EA, $B5, $D0, $CD, $37, $15, $21, $6B, $D1, $01, $2C, $00, $FA, $49, $CC
.db $FE, $01, $38, $14, $21, $A4, $D8, $28, $0F, $FE, $02, $21, $96, $DA, $01, $21
.db $00, $28, $05, $21, $5F, $DA, $18, $06, $FA, $92, $CF, $CD, $87, $3A, $11, $98
.db $CF, $01, $2C, $00, $C3, $B5, $00, $00, $00, $00, $00, $12, $00, $00, $06, $00
.db $00, $02
.dsb 11, $00
.db $10, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $02, $50, $00, $02
.db $50, $00, $02, $00, $00, $02, $00, $00, $30, $00, $00, $25, $00, $00, $15, $00
.db $00, $07, $00, $00, $03
.dsb 26, $00
.db $05, $50, $00, $03, $50, $00, $00, $00, $00, $21, $00, $00, $21, $00, $00, $21
.db $00, $00, $98, $00, $00, $98, $00, $00, $98, $00, $00, $98, $00, $00, $98, $00
.db $00, $48
.dsb 17, $00
.db $09, $50, $00, $21, $00, $00, $00, $00, $01, $00, $00, $00, $98, $00, $00, $10
.db $00, $00, $06, $00, $00, $15, $00, $00, $40, $00, $00, $07, $00, $00, $05, $00
.db $00, $07, $00, $00, $06, $50, $00, $00, $10, $00, $02, $00, $00, $03, $00, $00
.db $03, $50, $00, $00, $00, $00, $00, $00, $00, $05, $00, $00, $05, $50, $00, $03
.db $50, $00, $03, $50
.dsb 87, $00
.db $8C, $80, $92, $93, $84, $91, $7F, $81, $80, $8B, $8B, $50, $94, $8B, $93, $91
.db $80, $7F, $81, $80, $8B, $8B, $50, $86, $91, $84, $80, $93, $7F, $81, $80, $8B
.db $8B, $50, $8F, $8E, $8A, $BA, $7F, $81, $80, $8B, $8B, $50, $93, $8E, $96, $8D
.db $7F, $8C, $80, $8F, $50, $81, $88, $82, $98, $82, $8B, $84, $50, $E6, $E6, $E6
.db $E6, $E6, $50, $92, $80, $85, $80, $91, $88, $7F, $81, $80, $8B, $8B, $50, $8F
.db $8E, $8A, $BA, $83, $84, $97, $50, $8C, $8E, $8E, $8D, $7F, $92, $93, $8E, $8D
.db $84, $50, $80, $8D, $93, $88, $83, $8E, $93, $84, $50, $81, $94, $91, $8D, $7F
.db $87, $84, $80, $8B, $50, $88, $82, $84, $7F, $87, $84, $80, $8B, $50, $80, $96
.db $80, $8A, $84, $8D, $88, $8D, $86, $50, $8F, $80, $91, $8B, $98, $99, $7F, $87
.db $84, $80, $8B, $50, $85, $94, $8B, $8B, $7F, $91, $84, $92, $93, $8E, $91, $84
.db $50, $8C, $80, $97, $7F, $8F, $8E, $93, $88, $8E, $8D, $50, $87, $98, $8F, $84
.db $91, $7F, $8F, $8E, $93, $88, $8E, $8D, $50, $92, $94, $8F, $84, $91, $7F, $8F
.db $8E, $93, $88, $8E, $8D, $50, $8F, $8E, $93, $88, $8E, $8D, $50, $81, $8E, $94
.db $8B, $83, $84, $91, $81, $80, $83, $86, $84, $50, $82, $80, $92, $82, $80, $83
.db $84, $81, $80, $83, $86, $84, $50, $93, $87, $94, $8D, $83, $84, $91, $81, $80
.db $83, $86, $84, $50, $91, $80, $88, $8D, $81, $8E, $96, $81, $80, $83, $86, $84
.db $50, $92, $8E, $94, $8B, $81, $80, $83, $86, $84, $50, $8C, $80, $91, $92, $87
.db $81, $80, $83, $86, $84, $50, $95, $8E, $8B, $82, $80, $8D, $8E, $81, $80, $83
.db $86, $84, $50, $84, $80, $91, $93, $87, $81, $80, $83, $86, $84, $50, $84, $92
.db $82, $80, $8F, $84, $7F, $91, $8E, $8F, $84, $50, $91, $84, $8F, $84, $8B, $50
.db $8E, $8B, $83, $7F, $80, $8C, $81, $84, $91, $50, $85, $88, $91, $84, $7F, $92
.db $93, $8E, $8D, $84, $50, $93, $87, $94, $8D, $83, $84, $91, $92, $93, $8E, $8D
.db $84, $50, $96, $80, $93, $84, $91, $7F, $92, $93, $8E, $8D, $84, $50, $87, $8F
.db $7F, $94, $8F, $50, $8F, $91, $8E, $93, $84, $88, $8D, $50, $88, $91, $8E, $8D
.db $50, $82, $80, $91, $81, $8E, $92, $50, $82, $80, $8B, $82, $88, $94, $8C, $50
.db $91, $80, $91, $84, $7F, $82, $80, $8D, $83, $98, $50, $83, $8E, $8C, $84, $7F
.db $85, $8E, $92, $92, $88, $8B, $50, $87, $84, $8B, $88, $97, $7F, $85, $8E, $92
.db $92, $88, $8B, $50, $92, $84, $82, $91, $84, $93, $7F, $8A, $84, $98, $50, $E6
.db $E6, $E6, $E6, $E6, $50, $81, $88, $8A, $84, $7F, $95, $8E, $94, $82, $87, $84
.db $91, $50, $97, $7F, $80, $82, $82, $94, $91, $80, $82, $98, $50, $8B, $84, $80
.db $85, $7F, $92, $93, $8E, $8D, $84, $50, $82, $80, $91, $83, $7F, $8A, $84, $98
.db $50, $8D, $94, $86, $86, $84, $93, $50, $8F, $8F, $7F, $94, $8F, $50, $8F, $8E
.db $8A, $BA, $7F, $83, $8E, $8B, $8B, $50, $85, $94, $8B, $8B, $7F, $87, $84, $80
.db $8B, $50, $91, $84, $95, $88, $95, $84, $50, $8C, $80, $97, $7F, $91, $84, $95
.db $88, $95, $84, $50, $86, $94, $80, $91, $83, $7F, $92, $8F, $84, $82, $E8, $50
.db $92, $94, $8F, $84, $91, $7F, $91, $84, $8F, $84, $8B, $50, $8C, $80, $97, $7F
.db $91, $84, $8F, $84, $8B, $50, $83, $88, $91, $84, $7F, $87, $88, $93, $50, $82
.db $8E, $88, $8D, $50, $85, $91, $84, $92, $87, $7F, $96, $80, $93, $84, $91, $50
.db $92, $8E, $83, $80, $7F, $8F, $8E, $8F, $50, $8B, $84, $8C, $8E, $8D, $80, $83
.db $84, $50, $92, $E8, $92, $E8, $93, $88, $82, $8A, $84, $93, $50, $86, $8E, $8B
.db $83, $7F, $93, $84, $84, $93, $87, $50, $97, $7F, $80, $93, $93, $80, $82, $8A
.db $50, $97, $7F, $83, $84, $85, $84, $8D, $83, $50, $97, $7F, $92, $8F, $84, $84
.db $83, $50, $97, $7F, $92, $8F, $84, $82, $88, $80, $8B, $50, $82, $8E, $88, $8D
.db $7F, $82, $80, $92, $84, $50, $8E, $80, $8A, $BD, $7F, $8F, $80, $91, $82, $84
.db $8B, $50, $88, $93, $84, $8C, $85, $88, $8D, $83, $84, $91, $50, $92, $88, $8B
.db $8F, $87, $7F, $92, $82, $8E, $8F, $84, $50, $8F, $8E, $8A, $BA, $7F, $85, $8B
.db $94, $93, $84, $50, $8B, $88, $85, $93, $7F, $8A, $84, $98, $50, $84, $97, $8F
.db $E8, $80, $8B, $8B, $50, $8E, $8B, $83, $7F, $91, $8E, $83, $50, $86, $8E, $8E
.db $83, $7F, $91, $8E, $83, $50, $92, $94, $8F, $84, $91, $7F, $91, $8E, $83, $50
.db $8F, $8F, $7F, $94, $8F, $50, $84, $93, $87, $84, $91, $50, $8C, $80, $97, $7F
.db $84, $93, $87, $84, $91, $50, $84, $8B, $88, $97, $84, $91, $50, $8C, $80, $97
.db $7F, $84, $8B, $88, $97, $84, $91, $50, $81, $F8, $85, $50, $81, $F7, $85, $50
.db $F7, $85, $50, $F8, $85, $50, $F9, $85, $50, $FA, $85, $50, $FB, $85, $50, $FC
.db $85, $50, $FD, $85, $50, $FE, $85, $50, $FF, $85, $50, $F7, $F6, $85, $50, $F7
.db $F7, $85, $50, $81, $FA, $85, $50, $B6, $D0, $C5, $D8, $19, $AC, $10, $50, $B6
.db $B2, $26, $D7, $19, $AC, $10, $50, $B5, $2C, $2F, $B3, $19, $AC, $10, $50, $CA
.db $D4, $3C, $BB, $19, $AC, $10, $50, $CB, $DE, $D4, $D8, $19, $AC, $10, $50, $C5
.db $B6, $D6, $BC, $19, $AC, $10, $50, $19, $A5, $19, $AC, $10, $50, $CB, $C9, $C0
.db $CF, $19, $AC, $10, $50, $09, $E3, $A6, $13, $19, $AC, $10, $50, $C0, $CF, $2A
.db $50, $CB, $D6, $BA, $50, $1B, $A8, $AB, $0C, $50, $8B, $A6, $19, $E3, $50, $09
.db $E3, $A6, $13, $50, $42, $90, $86, $AD, $42, $92, $AB, $50, $86, $AD, $42, $92
.db $AB, $50, $42, $90, $9D, $8C, $8F, $E3, $50, $9D, $8C, $8F, $E3, $50, $83, $87
.db $8D, $A7, $AB, $93

PrepareOAMData:
	LD A, (wUpdateSpritesEnabled)
	DEC A
	JR Z, PrepareOAMData.updateEnabled
	CP $FF
	RET NZ
	LD (wUpdateSpritesEnabled), A
	JP HideSprites

PrepareOAMData.updateEnabled:
	XOR A
	LDH (hCollidingSpriteTempYValue - $FF00), A
PrepareOAMData.spriteLoop:
	LDH (hCollidingSpriteOffset - $FF00), A
	LD D, $C1
	LDH A, (hCollidingSpriteOffset - $FF00)
	LD E, A
	LD A, (DE)
	AND A
	JP Z, PrepareOAMData.nextSprite
	INC E
	INC E
	LD A, (DE)
	LD (wSavedSpriteImageIndex), A
	CP $FF
	JR NZ, PrepareOAMData.visible
	CALL GetSpriteScreenXY
	JR PrepareOAMData.nextSprite

PrepareOAMData.visible:
	CP $A0
	JR C, PrepareOAMData.usefacing
	AND $0F
	ADD $10
	JR PrepareOAMData.next

PrepareOAMData.usefacing:
	AND $0F
PrepareOAMData.next:
	LD L, A
	PUSH DE
	INC D
	LD A, E
	ADD $05
	LD E, A
	LD A, (DE)
	AND $80
	LDH (hSpritePriority - $FF00), A
	POP DE
	LD H, $00
	LD BC, SpriteFacingAndAnimationTable
	ADD HL, HL
	ADD HL, HL
	ADD HL, BC
	LDI A, (HL)
	LD C, A
	LDI A, (HL)
	LD B, A
	LDI A, (HL)
	LD H, (HL)
	LD L, A
	CALL GetSpriteScreenXY
	LDH A, (hCollidingSpriteTempYValue - $FF00)
	LD E, A
	LD D, $C3
PrepareOAMData.tileLoop:
	LDH A, (hCollidingSpriteAdjustedDistance - $FF00)
	ADD $10
	ADD (HL)
	LD (DE), A
	INC HL
	LDH A, (hCollidingSpriteTempXValue - $FF00)
	ADD $08
	ADD (HL)
	INC E
	LD (DE), A
	INC E
	LD A, (BC)
	INC BC
	PUSH BC
	LD B, A
	LD A, (wSavedSpriteImageIndex)
	SWAP A
	AND $0F
	CP $0B
	JR NZ, PrepareOAMData.notFourTileSprite
	LD A, $7C
	JR PrepareOAMData.next2

PrepareOAMData.notFourTileSprite:
	SLA A
	SLA A
	LD C, A
	SLA A
	ADD C
PrepareOAMData.next2:
	ADD B
	POP BC
	LD (DE), A
	INC HL
	INC E
	LD A, (HL)
	BIT 1, A
	JR Z, PrepareOAMData.skipPriority
	LDH A, (hSpritePriority - $FF00)
	OR (HL)
PrepareOAMData.skipPriority:
	INC HL
	LD (DE), A
	INC E
	BIT 0, A
	JR Z, PrepareOAMData.tileLoop
	LD A, E
	LDH (hCollidingSpriteTempYValue - $FF00), A
PrepareOAMData.nextSprite:
	LDH A, (hCollidingSpriteOffset - $FF00)
	ADD $10
	CP $00
	JP NZ, PrepareOAMData.spriteLoop
	LDH A, (hCollidingSpriteTempYValue - $FF00)
	LD L, A
	LD H, $C3
	LD DE, $0004
	LD B, $A0
	LD A, (wMovementFlags)
	BIT 6, A
	LD A, $A0
	JR Z, PrepareOAMData.clear
	LD A, $90
PrepareOAMData.clear:
	CP L
	RET Z
	LD (HL), B
	ADD HL, DE
	JR PrepareOAMData.clear

GetSpriteScreenXY:
	INC E
	INC E
	LD A, (DE)
	LDH (hCollidingSpriteAdjustedDistance - $FF00), A
	INC E
	INC E
	LD A, (DE)
	LDH (hCollidingSpriteTempXValue - $FF00), A
	LD A, $04
	ADD E
	LD E, A
	LDH A, (hCollidingSpriteAdjustedDistance - $FF00)
	ADD $04
	AND $F0
	LD (DE), A
	INC E
	LDH A, (hCollidingSpriteTempXValue - $FF00)
	AND $F0
	LD (DE), A
	RET

WriteDMACodeToHRAM:
	LD C, <hDMARoutine
	LD B, $0A
	LD HL, DMARoutine	; Loading Code into RAM
WriteDMACodeToHRAM.copy:
	LDI A, (HL)
	LDH (C), A
	INC C
	DEC B
	JR NZ, WriteDMACodeToHRAM.copy
	RET

; Executed in RAM at ff80
DMARoutine:
	LD A, $C3
	LDH (rDMA), A
	LD A, $28
; Executed in RAM at ff86
DMARoutine.wait:
	DEC A
	JR NZ, DMARoutine.wait
	RET

PrintWaitingText:
	LD HL, wTileMap_plus_CB
	LD B, $01
	LD C, $0B
	LD A, (wIsInBattle)
	AND A
	JR Z, PrintWaitingText.trade
	CALL TextBoxBorder
	JR PrintWaitingText.border_done

PrintWaitingText.trade:
	CALL CableClub_TextBoxBorder
PrintWaitingText.border_done:
	LD HL, $C480
	LD DE, WaitingText
	CALL PlaceString
	LD C, $32
	JP DelayFrames

; Data from 4C28 to 4C33 (12 bytes)
WaitingText:
.db $96, $A0, $A8, $B3, $A8, $AD, $A6, $E8, $E8, $E8, $E7, $50

_UpdateSprites:
	LD H, $C1
	INC H
	LD A, $0E
_UpdateSprites.spriteLoop:
	LD L, A
	SUB $0E
	LD C, A
	LDH (hCurrentSpriteOffset - $FF00), A
	LD A, (HL)
	AND A
	JR Z, _UpdateSprites.skipSprite
	PUSH HL
	PUSH DE
	PUSH BC
	CALL _UpdateSprites.updateCurrentSprite
	POP BC
	POP DE
	POP HL
_UpdateSprites.skipSprite:
	LD A, L
	ADD $10
	CP $0E
	JR NZ, _UpdateSprites.spriteLoop
	RET

_UpdateSprites.updateCurrentSprite:
	CP $01
	JP NZ, UpdateNonPlayerSprite
	JP UpdatePlayerSprite

UpdateNonPlayerSprite:
	DEC A
	SWAP A
	LDH (hTilePlayerStandingOn - $FF00), A
	LD A, (wNPCMovementScriptSpriteOffset)
	LD B, A
	LDH A, (hCurrentSpriteOffset - $FF00)
	CP B
	JR NZ, UpdateNonPlayerSprite.unequal
	JP DoScriptedNPCMovement

UpdateNonPlayerSprite.unequal:
	JP UpdateNPCSprite

DetectCollisionBetweenSprites:
	NOP
	LD H, $C1
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $00
	LD L, A
	LD A, (HL)
	AND A
	RET Z
	LD A, L
	ADD $03
	LD L, A
	LDI A, (HL)
	CALL SetSpriteCollisionValues
	LDI A, (HL)
	ADD $04
	ADD B
	AND $F0
	OR C
	LDH (hCollidingSpriteTempYValue - $FF00), A
	LDI A, (HL)
	CALL SetSpriteCollisionValues
	LD A, (HL)
	ADD B
	AND $F0
	OR C
	LDH (hCollidingSpriteTempXValue - $FF00), A
	LD A, L
	ADD $07
	LD L, A
	XOR A
	LDD (HL), A
	LDD (HL), A
	LDH A, (hCollidingSpriteTempXValue - $FF00)
	LDD (HL), A
	LDH A, (hCollidingSpriteTempYValue - $FF00)
	LD (HL), A
	XOR A
DetectCollisionBetweenSprites.loop:
	LDH (hCollidingSpriteOffset - $FF00), A
	SWAP A
	LD E, A
	LDH A, (hCurrentSpriteOffset - $FF00)
	CP E
	JP Z, DetectCollisionBetweenSprites.next
	LD D, H
	LD A, (DE)
	AND A
	JP Z, DetectCollisionBetweenSprites.next
	INC E
	INC E
	LD A, (DE)
	INC A
	JP Z, DetectCollisionBetweenSprites.next
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $0A
	LD L, A
	INC E
	LD A, (DE)
	CALL SetSpriteCollisionValues
	INC E
	LD A, (DE)
	ADD $04
	ADD B
	AND $F0
	OR C
	SUB (HL)
	JR NC, DetectCollisionBetweenSprites.noCarry1
	CPL
	INC A
DetectCollisionBetweenSprites.noCarry1:
	LDH (hCollidingSpriteTempYValue - $FF00), A
	PUSH AF
	RL C
	POP AF
	CCF
	RL C
	LD B, $07
	LD A, (HL)
	AND $0F
	JR Z, DetectCollisionBetweenSprites.next1
	LD B, $09
DetectCollisionBetweenSprites.next1:
	LDH A, (hCollidingSpriteTempYValue - $FF00)
	SUB B
	LDH (hCollidingSpriteAdjustedDistance - $FF00), A
	LD A, B
	LDH (hCollidingSpriteTempYValue - $FF00), A
	JR C, DetectCollisionBetweenSprites.checkXDistance
	LD B, $07
	DEC E
	LD A, (DE)
	INC E
	AND A
	JR Z, DetectCollisionBetweenSprites.next2
	LD B, $09
DetectCollisionBetweenSprites.next2:
	LDH A, (hCollidingSpriteAdjustedDistance - $FF00)
	SUB B
	JR Z, DetectCollisionBetweenSprites.checkXDistance
	JR NC, DetectCollisionBetweenSprites.next
DetectCollisionBetweenSprites.checkXDistance:
	INC E
	INC L
	LD A, (DE)
	PUSH BC
	CALL SetSpriteCollisionValues
	INC E
	LD A, (DE)
	ADD B
	AND $F0
	OR C
	POP BC
	SUB (HL)
	JR NC, DetectCollisionBetweenSprites.noCarry2
	CPL
	INC A
DetectCollisionBetweenSprites.noCarry2:
	LDH (hCollidingSpriteTempXValue - $FF00), A
	PUSH AF
	RL C
	POP AF
	CCF
	RL C
	LD B, $07
	LD A, (HL)
	AND $0F
	JR Z, DetectCollisionBetweenSprites.next3
	LD B, $09
DetectCollisionBetweenSprites.next3:
	LDH A, (hCollidingSpriteTempXValue - $FF00)
	SUB B
	LDH (hCollidingSpriteAdjustedDistance - $FF00), A
	LD A, B
	LDH (hCollidingSpriteTempXValue - $FF00), A
	JR C, DetectCollisionBetweenSprites.collision
	LD B, $07
	DEC E
	LD A, (DE)
	INC E
	AND A
	JR Z, DetectCollisionBetweenSprites.next4
	LD B, $09
DetectCollisionBetweenSprites.next4:
	LDH A, (hCollidingSpriteAdjustedDistance - $FF00)
	SUB B
	JR Z, DetectCollisionBetweenSprites.collision
	JR NC, DetectCollisionBetweenSprites.next
DetectCollisionBetweenSprites.collision:
	LDH A, (hCollidingSpriteTempXValue - $FF00)
	LD B, A
	LDH A, (hCollidingSpriteTempYValue - $FF00)
	INC L
	CP B
	JR C, DetectCollisionBetweenSprites.next5
	LD B, $0C
	JR DetectCollisionBetweenSprites.next6

DetectCollisionBetweenSprites.next5:
	LD B, $03
DetectCollisionBetweenSprites.next6:
	LD A, C
	AND B
	OR (HL)
	LD (HL), A
	LD A, C
	INC L
	INC L
	LDH A, (hCollidingSpriteOffset - $FF00)
	LD DE, SpriteCollisionBitTable
	ADD A
	ADD E
	LD E, A
	JR NC, DetectCollisionBetweenSprites.noCarry3
	INC D
DetectCollisionBetweenSprites.noCarry3:
	LD A, (DE)
	OR (HL)
	LDI (HL), A
	INC DE
	LD A, (DE)
	OR (HL)
	LD (HL), A
DetectCollisionBetweenSprites.next:
	LDH A, (hCollidingSpriteOffset - $FF00)
	INC A
	CP $10
	JP NZ, DetectCollisionBetweenSprites.loop
	RET

SetSpriteCollisionValues:
	AND A
	LD B, $00
	LD C, $00
	JR Z, SetSpriteCollisionValues.done
	LD C, $09
	CP $FF
	JR Z, SetSpriteCollisionValues.ok
	LD C, $07
	LD A, $00
SetSpriteCollisionValues.ok:
	LD B, A
SetSpriteCollisionValues.done:
	RET

; Data from 4D85 to 4E30 (172 bytes)
SpriteCollisionBitTable:
.db $00, $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80
.db $01, $00, $02, $00, $04, $00, $08, $00, $10, $00, $20, $00, $40, $00, $80, $00
.db $C9, $CD, $DC, $3D, $3E, $80, $EA, $56, $D3, $21, $33, $D7, $CB, $C6, $21, $63
.db $D1, $AF, $22, $3D, $77, $3E, $01, $EA, $91, $CF, $3E, $14, $EA, $27, $D1, $AF
.db $EA, $49, $CC, $EA, $5E, $D3, $CD, $27, $39, $3E, $01, $EA, $59, $D0, $3E, $2C
.db $CD, $6D, $3E, $3E, $01, $EA, $CB, $CF, $E0, $BA, $18, $C5, $CD, $3C, $3C, $F0
.db $8C, $47, $21, $CE, $D5, $2A, $FE, $FF, $C8, $B8, $28, $03, $23, $18, $F6, $7E
.db $E0, $DB, $21, $04, $D5, $F0, $8C, $3D, $87, $16, $00, $5F, $19, $7E, $47, $0E
.db $01, $CD, $2E, $3E, $30, $14, $F0, $DB, $EA, $4D, $CC, $3E, $11, $CD, $6D, $3E
.db $3E, $01, $EA, $3C, $CC, $21, $26, $4E, $18, $03, $21, $2C, $4E, $CD, $49, $3C
.db $C9, $17, $19, $41, $20, $0B, $50, $17, $2A, $41, $20, $50

UpdatePlayerSprite:
	LD A, (wSprite15StateData1End)
	AND A
	JR Z, UpdatePlayerSprite.checkIfTextBoxInFrontOfSprite
	CP $FF
	JR Z, UpdatePlayerSprite.disableSprite
	DEC A
	LD (wSprite15StateData1End), A
	JR UpdatePlayerSprite.disableSprite

UpdatePlayerSprite.checkIfTextBoxInFrontOfSprite:
	LD A, (wTileMap_plus_BC)
	LDH (hTilePlayerStandingOn - $FF00), A
	CP $60
	JR C, UpdatePlayerSprite.lowerLeftTileIsMapTile
UpdatePlayerSprite.disableSprite:
	LD A, $FF
	LD (wSpritePlayerStateData1ImageIndex), A
	RET

UpdatePlayerSprite.lowerLeftTileIsMapTile:
	CALL DetectCollisionBetweenSprites
	LD H, $C1
	LD A, (wWalkCounter)
	AND A
	JR NZ, UpdatePlayerSprite.moving
	LD A, (wPlayerMovingDirection)
	BIT 2, A
	JR Z, UpdatePlayerSprite.checkIfUp
	XOR A
	JR UpdatePlayerSprite.next

UpdatePlayerSprite.checkIfUp:
	BIT 3, A
	JR Z, UpdatePlayerSprite.checkIfLeft
	LD A, $04
	JR UpdatePlayerSprite.next

UpdatePlayerSprite.checkIfLeft:
	BIT 1, A
	JR Z, UpdatePlayerSprite.checkIfRight
	LD A, $08
	JR UpdatePlayerSprite.next

UpdatePlayerSprite.checkIfRight:
	BIT 0, A
	JR Z, UpdatePlayerSprite.notMoving
	LD A, $0C
	JR UpdatePlayerSprite.next

UpdatePlayerSprite.notMoving:
	XOR A
	LD (wSpritePlayerStateData1IntraAnimFrameCounter), A
	LD (wSpritePlayerStateData1AnimFrameCounter), A
	JR UpdatePlayerSprite.calcImageIndex

UpdatePlayerSprite.next:
	LD (wSpritePlayerStateData1FacingDirection), A
	LD A, (wFontLoaded)
	BIT 0, A
	JR NZ, UpdatePlayerSprite.notMoving
UpdatePlayerSprite.moving:
	LD A, (wMovementFlags)
	BIT 7, A
	JR NZ, UpdatePlayerSprite.skipSpriteAnim
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $07
	LD L, A
	LD A, (HL)
	INC A
	LD (HL), A
	CP $04
	JR NZ, UpdatePlayerSprite.calcImageIndex
	XOR A
	LD (HL), A
	INC HL
	LD A, (HL)
	INC A
	AND $03
	LD (HL), A
UpdatePlayerSprite.calcImageIndex:
	LD A, (wSpritePlayerStateData1AnimFrameCounter)
	LD B, A
	LD A, (wSpritePlayerStateData1FacingDirection)
	ADD B
	LD (wSpritePlayerStateData1ImageIndex), A
UpdatePlayerSprite.skipSpriteAnim:
	LDH A, (hTilePlayerStandingOn - $FF00)
	LD C, A
	LD A, (wGrassTile)
	CP C
	LD A, $00
	JR NZ, UpdatePlayerSprite.next2
	LD A, $80
UpdatePlayerSprite.next2:
	LD (wSpritePlayerStateData2GrassPriority), A
	RET

; Data from 4EC7 to 4ED0 (10 bytes)
.db $C5, $F5, $F0, $DA, $4F, $F1, $81, $6F, $C1, $C9

UpdateNPCSprite:
	LDH A, (hCurrentSpriteOffset - $FF00)
	SWAP A
	DEC A
	ADD A
	LD HL, wMapSpriteData
	ADD L
	LD L, A
	LD A, (HL)
	LD (wCurSpriteMovement2), A
	LD H, $C1
	LDH A, (hCurrentSpriteOffset - $FF00)
	LD L, A
	INC L
	LD A, (HL)
	AND A
	JP Z, InitializeSpriteStatus
	CALL CheckSpriteAvailability
	RET C
	LD H, $C1
	LDH A, (hCurrentSpriteOffset - $FF00)
	LD L, A
	INC L
	LD A, (HL)
	BIT 7, A
	JP NZ, MakeNPCFacePlayer
	LD B, A
	LD A, (wFontLoaded)
	BIT 0, A
	JP NZ, NotYetMoving
	LD A, B
	CP $02
	JP Z, UpdateSpriteMovementDelay
	CP $03
	JP Z, UpdateSpriteInWalkingAnimation
	LD A, (wWalkCounter)
	AND A
	RET NZ
	CALL InitializeSpriteScreenPosition
	LD H, $C2
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $06
	LD L, A
	LD A, (HL)
	INC A
	JR Z, UpdateNPCSprite.randomMovement
	INC A
	JR Z, UpdateNPCSprite.randomMovement
	DEC A
	LD (HL), A
	DEC A
	PUSH HL
	LD HL, wNPCNumScriptedSteps
	DEC (HL)
	POP HL
	LD DE, wAnimationType
	CALL LoadDEPlusA
	CP $E0
	JP Z, ChangeFacingDirection
	CP $FF
	JR NZ, UpdateNPCSprite.next
	LD (HL), A
	LD HL, wStatusFlags5
	RES 0, (HL)
	XOR A
	LD (wSimulatedJoypadStatesIndex), A
	LD (wUnusedOverrideSimulatedJoypadStatesIndex), A
	RET

UpdateNPCSprite.next:
	CP $FE
	JR NZ, UpdateNPCSprite.determineDirection
	LD (HL), $01
	LD DE, wAnimationType
	CALL LoadDEPlusA
	JR UpdateNPCSprite.determineDirection

UpdateNPCSprite.randomMovement:
	CALL GetTileSpriteStandsOn
	CALL Random
UpdateNPCSprite.determineDirection:
	LD B, A
	LD A, (wCurSpriteMovement2)
	CP $D0
	JR Z, UpdateNPCSprite.moveDown
	CP $D1
	JR Z, UpdateNPCSprite.moveUp
	CP $D2
	JR Z, UpdateNPCSprite.moveLeft
	CP $D3
	JR Z, UpdateNPCSprite.moveRight
	LD A, B
	CP $40
	JR NC, UpdateNPCSprite.notDown
	LD A, (wCurSpriteMovement2)
	CP $02
	JR Z, UpdateNPCSprite.moveLeft
UpdateNPCSprite.moveDown:
	LD DE, $0028
	ADD HL, DE
	LD DE, $0100
	LD BC, $0400
	JR TryWalking

UpdateNPCSprite.notDown:
	CP $80
	JR NC, UpdateNPCSprite.notUp
	LD A, (wCurSpriteMovement2)
	CP $02
	JR Z, UpdateNPCSprite.moveRight
UpdateNPCSprite.moveUp:
	LD DE, hMovingBGTilesCounter1
	ADD HL, DE
	LD DE, $FF00
	LD BC, $0804
	JR TryWalking

UpdateNPCSprite.notUp:
	CP $C0
	JR NC, UpdateNPCSprite.notLeft
	LD A, (wCurSpriteMovement2)
	CP $01
	JR Z, UpdateNPCSprite.moveUp
UpdateNPCSprite.moveLeft:
	DEC HL
	DEC HL
	LD DE, $00FF
	LD BC, $0208
	JR TryWalking

UpdateNPCSprite.notLeft:
	LD A, (wCurSpriteMovement2)
	CP $01
	JR Z, UpdateNPCSprite.moveDown
UpdateNPCSprite.moveRight:
	INC HL
	INC HL
	LD DE, $0001
	LD BC, $010C
	JR TryWalking

ChangeFacingDirection:
	LD DE, $0000
TryWalking:
	PUSH HL
	LD H, $C1
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $09
	LD L, A
	LD (HL), C
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $03
	LD L, A
	LD (HL), D
	INC L
	INC L
	LD (HL), E
	POP HL
	PUSH DE
	LD C, (HL)
	CALL CanWalkOntoTile
	POP DE
	RET C
	LD H, $C2
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $04
	LD L, A
	LD A, (HL)
	ADD D
	LDI (HL), A
	LD A, (HL)
	ADD E
	LD (HL), A
	LDH A, (hCurrentSpriteOffset - $FF00)
	LD L, A
	LD (HL), $10
	DEC H
	INC L
	LD (HL), $03
	JP UpdateSpriteImage

UpdateSpriteInWalkingAnimation:
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $07
	LD L, A
	LD A, (HL)
	INC A
	LD (HL), A
	CP $04
	JR NZ, UpdateSpriteInWalkingAnimation.noNextAnimationFrame
	XOR A
	LD (HL), A
	INC L
	LD A, (HL)
	INC A
	AND $03
	LD (HL), A
UpdateSpriteInWalkingAnimation.noNextAnimationFrame:
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $03
	LD L, A
	LDI A, (HL)
	LD B, A
	LD A, (HL)
	ADD B
	LDI (HL), A
	LDI A, (HL)
	LD B, A
	LD A, (HL)
	ADD B
	LD (HL), A
	LDH A, (hCurrentSpriteOffset - $FF00)
	LD L, A
	INC H
	LD A, (HL)
	DEC A
	LD (HL), A
	RET NZ
	LD A, $06
	ADD L
	LD L, A
	LD A, (HL)
	CP $FE
	JR NC, UpdateSpriteInWalkingAnimation.initNextMovementCounter
	LDH A, (hCurrentSpriteOffset - $FF00)
	INC A
	LD L, A
	DEC H
	LD (HL), $01
	RET

UpdateSpriteInWalkingAnimation.initNextMovementCounter:
	CALL Random
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $08
	LD L, A
	LDH A, (hRandomAdd - $FF00)
	AND $7F
	LD (HL), A
	DEC H
	LDH A, (hCurrentSpriteOffset - $FF00)
	INC A
	LD L, A
	LD (HL), $02
	INC L
	INC L
	XOR A
	LD B, (HL)
	LDI (HL), A
	INC L
	LD C, (HL)
	LD (HL), A
	RET

UpdateSpriteMovementDelay:
	LD H, $C2
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $06
	LD L, A
	LD A, (HL)
	INC L
	INC L
	CP $FE
	JR NC, UpdateSpriteMovementDelay.tickMoveCounter
	LD (HL), $00
	JR UpdateSpriteMovementDelay.moving

UpdateSpriteMovementDelay.tickMoveCounter:
	DEC (HL)
	JR NZ, NotYetMoving
UpdateSpriteMovementDelay.moving:
	DEC H
	LDH A, (hCurrentSpriteOffset - $FF00)
	INC A
	LD L, A
	LD (HL), $01
NotYetMoving:
	LD H, $C1
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $08
	LD L, A
	LD (HL), $00
	JP UpdateSpriteImage

MakeNPCFacePlayer:
	LD A, (wCableClubDestinationMap)
	BIT 5, A
	JR NZ, NotYetMoving
	RES 7, (HL)
	LD A, (wPlayerDirection)
	BIT 3, A
	JR Z, MakeNPCFacePlayer.notFacingDown
	LD C, $00
	JR MakeNPCFacePlayer.facingDirectionDetermined

MakeNPCFacePlayer.notFacingDown:
	BIT 2, A
	JR Z, MakeNPCFacePlayer.notFacingUp
	LD C, $04
	JR MakeNPCFacePlayer.facingDirectionDetermined

MakeNPCFacePlayer.notFacingUp:
	BIT 1, A
	JR Z, MakeNPCFacePlayer.notFacingRight
	LD C, $0C
	JR MakeNPCFacePlayer.facingDirectionDetermined

MakeNPCFacePlayer.notFacingRight:
	LD C, $08
MakeNPCFacePlayer.facingDirectionDetermined:
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $09
	LD L, A
	LD (HL), C
	JR NotYetMoving

InitializeSpriteStatus:
	LD (HL), $01
	INC L
	LD (HL), $FF
	INC H
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $02
	LD L, A
	LD A, $08
	LDI (HL), A
	LD (HL), A
	RET

InitializeSpriteScreenPosition:
	LD H, $C2
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $04
	LD L, A
	LD A, (wYCoord)
	LD B, A
	LD A, (HL)
	SUB B
	SWAP A
	SUB $04
	DEC H
	LDI (HL), A
	INC H
	LD A, (wXCoord)
	LD B, A
	LDI A, (HL)
	SUB B
	SWAP A
	DEC H
	LD (HL), A
	RET

CheckSpriteAvailability:
	LD A, $12
	CALL Predef
	LDH A, (hDividend2 - $FF00)
	AND A
	JP NZ, CheckSpriteAvailability.spriteInvisible
	LD H, $C2
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $06
	LD L, A
	LD A, (HL)
	CP $FE
	JR C, CheckSpriteAvailability.skipXVisibilityTest
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $04
	LD L, A
	LD B, (HL)
	LD A, (wYCoord)
	CP B
	JR Z, CheckSpriteAvailability.skipYVisibilityTest
	JR NC, CheckSpriteAvailability.spriteInvisible
	ADD $08
	CP B
	JR C, CheckSpriteAvailability.spriteInvisible
CheckSpriteAvailability.skipYVisibilityTest:
	INC L
	LD B, (HL)
	LD A, (wXCoord)
	CP B
	JR Z, CheckSpriteAvailability.skipXVisibilityTest
	JR NC, CheckSpriteAvailability.spriteInvisible
	ADD $09
	CP B
	JR C, CheckSpriteAvailability.spriteInvisible
CheckSpriteAvailability.skipXVisibilityTest:
	CALL GetTileSpriteStandsOn
	LD D, $60
	LDI A, (HL)
	CP D
	JR NC, CheckSpriteAvailability.spriteInvisible
	LDD A, (HL)
	CP D
	JR NC, CheckSpriteAvailability.spriteInvisible
	LD BC, $FFEC
	ADD HL, BC
	LDI A, (HL)
	CP D
	JR NC, CheckSpriteAvailability.spriteInvisible
	LD A, (HL)
	CP D
	JR C, CheckSpriteAvailability.spriteVisible
CheckSpriteAvailability.spriteInvisible:
	LD H, $C1
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $02
	LD L, A
	LD (HL), $FF
	SCF
	JR CheckSpriteAvailability.done

CheckSpriteAvailability.spriteVisible:
	LD C, A
	LD A, (wWalkCounter)
	AND A
	JR NZ, CheckSpriteAvailability.done
	CALL UpdateSpriteImage
	INC H
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $07
	LD L, A
	LD A, (wGrassTile)
	CP C
	LD A, $00
	JR NZ, CheckSpriteAvailability.notInGrass
	LD A, $80
CheckSpriteAvailability.notInGrass:
	LD (HL), A
	AND A
CheckSpriteAvailability.done:
	RET

UpdateSpriteImage:
	LD H, $C1
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $08
	LD L, A
	LDI A, (HL)
	LD B, A
	LD A, (HL)
	ADD B
	LD B, A
	LDH A, (hTilePlayerStandingOn - $FF00)
	ADD B
	LD B, A
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $02
	LD L, A
	LD (HL), B
	RET

CanWalkOntoTile:
	LD H, $C2
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $06
	LD L, A
	LD A, (HL)
	CP $FE
	JR NC, CanWalkOntoTile.notScripted
	AND A
	RET

CanWalkOntoTile.notScripted:
	LD A, (wTilesetCollisionPtr)
	LD L, A
	LD A, (wTilesetCollisionPtr + $1)
	LD H, A
CanWalkOntoTile.tilePassableLoop:
	LDI A, (HL)
	CP $FF
	JR Z, CanWalkOntoTile.impassable
	CP C
	JR NZ, CanWalkOntoTile.tilePassableLoop
	LD H, $C2
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $06
	LD L, A
	LD A, (HL)
	INC A
	JR Z, CanWalkOntoTile.impassable
	LD H, $C1
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $04
	LD L, A
	LDI A, (HL)
	ADD $04
	ADD D
	CP $80
	JR NC, CanWalkOntoTile.impassable
	INC L
	LD A, (HL)
	ADD E
	CP $90
	JR NC, CanWalkOntoTile.impassable
	PUSH DE
	PUSH BC
	CALL DetectCollisionBetweenSprites
	POP BC
	POP DE
	LD H, $C1
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $0C
	LD L, A
	LD A, (HL)
	AND B
	JR NZ, CanWalkOntoTile.impassable
	LD H, $C2
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $02
	LD L, A
	LDI A, (HL)
	BIT 7, D
	JR NZ, CanWalkOntoTile.upwards
	ADD D
	CP $05
	JR C, CanWalkOntoTile.impassable
	JR CanWalkOntoTile.checkHorizontal

CanWalkOntoTile.upwards:
	SUB $01
	JR C, CanWalkOntoTile.impassable
CanWalkOntoTile.checkHorizontal:
	LD D, A
	LD A, (HL)
	BIT 7, E
	JR NZ, CanWalkOntoTile.left
	ADD E
	CP $05
	JR CanWalkOntoTile.passable

CanWalkOntoTile.left:
	SUB $01
	JR C, CanWalkOntoTile.impassable
CanWalkOntoTile.passable:
	LDD (HL), A
	LD (HL), D
	AND A
	RET

CanWalkOntoTile.impassable:
	LD H, $C1
	LDH A, (hCurrentSpriteOffset - $FF00)
	INC A
	LD L, A
	LD (HL), $02
	INC L
	INC L
	XOR A
	LDI (HL), A
	INC L
	LD (HL), A
	INC H
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $08
	LD L, A
	CALL Random
	LDH A, (hRandomAdd - $FF00)
	AND $7F
	LD (HL), A
	SCF
	RET

GetTileSpriteStandsOn:
	LD H, $C1
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $04
	LD L, A
	LDI A, (HL)
	ADD $04
	AND $F0
	SRL A
	LD C, A
	LD B, $00
	INC L
	LD A, (HL)
	SRL A
	SRL A
	SRL A
	ADD $14
	LD D, $00
	LD E, A
	LD HL, wShadowOAMEnd
	ADD HL, BC
	ADD HL, BC
	ADD HL, BC
	ADD HL, BC
	ADD HL, BC
	ADD HL, DE
	RET

LoadDEPlusA:
	ADD E
	LD E, A
	JR NC, LoadDEPlusA.noCarry
	INC D
LoadDEPlusA.noCarry:
	LD A, (DE)
	RET

DoScriptedNPCMovement:
	LD A, (wStatusFlags5)
	BIT 7, A
	RET Z
	LD HL, wStatusFlags4
	BIT 7, (HL)
	SET 7, (HL)
	JP Z, InitScriptedNPCMovement
	LD HL, wNPCMovementDirections2
	LD A, (wFilteredBagItemsCount)
	ADD L
	LD L, A
	JR NC, DoScriptedNPCMovement.noCarry
	INC H
DoScriptedNPCMovement.noCarry:
	LD A, (HL)
	CP $40
	JR NZ, DoScriptedNPCMovement.checkIfMovingDown
	CALL GetSpriteScreenYPointer
	LD C, $04
	LD A, $FE
	JR DoScriptedNPCMovement.move

DoScriptedNPCMovement.checkIfMovingDown:
	CP $00
	JR NZ, DoScriptedNPCMovement.checkIfMovingLeft
	CALL GetSpriteScreenYPointer
	LD C, $00
	LD A, $02
	JR DoScriptedNPCMovement.move

DoScriptedNPCMovement.checkIfMovingLeft:
	CP $80
	JR NZ, DoScriptedNPCMovement.checkIfMovingRight
	CALL GetSpriteScreenXPointer
	LD C, $08
	LD A, $FE
	JR DoScriptedNPCMovement.move

DoScriptedNPCMovement.checkIfMovingRight:
	CP $C0
	JR NZ, DoScriptedNPCMovement.noMatch
	CALL GetSpriteScreenXPointer
	LD C, $0C
	LD A, $02
	JR DoScriptedNPCMovement.move

DoScriptedNPCMovement.noMatch:
	CP $FF
	RET

DoScriptedNPCMovement.move:
	LD B, A
	LD A, (HL)
	ADD B
	LD (HL), A
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $09
	LD L, A
	LD A, C
	LD (HL), A
	CALL AnimScriptedNPCMovement
	LD HL, wScriptedNPCWalkCounter
	DEC (HL)
	RET NZ
	LD A, $08
	LD (wScriptedNPCWalkCounter), A
	LD HL, wFilteredBagItemsCount
	INC (HL)
	RET

InitScriptedNPCMovement:
	XOR A
	LD (wFilteredBagItemsCount), A
	LD A, $08
	LD (wScriptedNPCWalkCounter), A
	JP AnimScriptedNPCMovement

GetSpriteScreenYPointer:
	LD A, $04
	LD B, A
	JR GetSpriteScreenXYPointerCommon

GetSpriteScreenXPointer:
	LD A, $06
	LD B, A
GetSpriteScreenXYPointerCommon:
	LD HL, $C100
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD L
	ADD B
	LD L, A
	RET

AnimScriptedNPCMovement:
	LD HL, $C200
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $0E
	LD L, A
	LD A, (HL)
	DEC A
	SWAP A
	LD B, A
	LD HL, $C100
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $09
	LD L, A
	LD A, (HL)
	CP $00
	JR Z, AnimScriptedNPCMovement.anim
	CP $04
	JR Z, AnimScriptedNPCMovement.anim
	CP $08
	JR Z, AnimScriptedNPCMovement.anim
	CP $0C
	JR Z, AnimScriptedNPCMovement.anim
	RET

AnimScriptedNPCMovement.anim:
	ADD B
	LD B, A
	LDH (hSpriteVRAMSlotAndFacing - $FF00), A
	CALL AdvanceScriptedNPCAnimFrameCounter
	LD HL, $C100
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $02
	LD L, A
	LDH A, (hSpriteVRAMSlotAndFacing - $FF00)
	LD B, A
	LDH A, (hCoordsInFrontOfPlayerMatch - $FF00)
	ADD B
	LD (HL), A
	RET

AdvanceScriptedNPCAnimFrameCounter:
	LDH A, (hCurrentSpriteOffset - $FF00)
	ADD $07
	LD L, A
	LD A, (HL)
	INC A
	LD (HL), A
	CP $04
	RET NZ
	XOR A
	LD (HL), A
	INC L
	LD A, (HL)
	INC A
	AND $03
	LD (HL), A
	LDH (hCoordsInFrontOfPlayerMatch - $FF00), A
	RET

; Data from 5317 to 5573 (605 bytes)
.db $0E, $50, $CD, $39, $37, $CD, $0F, $19, $CD, $29, $24, $CD, $80, $36, $CD, $C0
.db $36, $CD, $E6, $5A, $21, $43, $C4, $06, $02, $0E, $0C, $CD, $B3, $5A, $21, $6C
.db $C4, $11, $0F, $55, $CD, $55, $19, $21, $74, $D0, $AF, $22, $36, $50, $21, $52
.db $D1, $3E, $FD, $06, $06, $22, $05, $20, $FC, $21, $41, $D1, $3E, $FD, $06, $07
.db $22, $05, $20, $FC, $06, $0A, $CD, $5C, $3E, $FE, $FD, $30, $F9, $22, $05, $20
.db $F5, $21, $08, $C5, $3E, $FD, $22, $22, $22, $06, $C8, $AF, $22, $05, $20, $FC
.db $21, $87, $D8, $01, $A9, $01, $AF, $22, $0B, $78, $B1, $20, $F9, $21, $6A, $D1
.db $11, $12, $C5, $01, $00, $00, $0C, $79, $FE, $FD, $28, $16, $78, $3D, $20, $05
.db $79, $FE, $0D, $28, $16, $23, $7E, $FE, $FE, $20, $EB, $79, $12, $13, $36, $FF
.db $18, $E4, $3E, $FF, $12, $13, $01, $00, $01, $18, $DB, $3E, $FF, $12, $CD, $7F
.db $22, $F0, $AA, $FE, $02, $20, $14, $CD, $D7, $3D, $AF, $E0, $AC, $3E, $81, $E0
.db $02, $CD, $AF, $20, $AF, $E0, $AC, $3E, $81, $E0, $02, $CD, $D7, $3D, $3E, $08
.db $E0, $FF, $21, $41, $D1, $11, $81, $CD, $01, $11, $00, $CD, $6F, $21, $3E, $FE
.db $12, $21, $52, $D1, $11, $93, $D8, $01, $A8, $01, $CD, $6F, $21, $3E, $FE, $12
.db $21, $08, $C5, $11, $D0, $C5, $01, $C8, $00, $CD, $6F, $21, $3E, $0D, $E0, $FF
.db $3E, $FF, $CD, $B1, $23, $F0, $AA, $FE, $02, $28, $1F, $21, $81, $CD, $2A, $A7
.db $28, $FC, $FE, $FD, $28, $F8, $FE, $FE, $28, $F4, $2B, $11, $48, $D1, $0E, $0A
.db $2A, $FE, $FE, $28, $FB, $12, $13, $0D, $20, $F6, $21, $96, $D8, $2A, $A7, $28
.db $FC, $FE, $FD, $28, $F8, $FE, $FE, $28, $F4, $2B, $11, $87, $D8, $0E, $0B, $2A
.db $FE, $FE, $28, $FB, $12, $13, $0D, $20, $F6, $11, $9C, $D8, $01, $94, $01, $2A
.db $FE, $FE, $28, $FB, $12, $13, $0B, $78, $B1, $20, $F4, $11, $08, $C5, $21, $6B
.db $D1, $0E, $02, $1A, $13, $A7, $28, $FB, $FE, $FD, $28, $F7, $FE, $FE, $28, $F3
.db $FE, $FF, $28, $0E, $E5, $C5, $06, $00, $3D, $4F, $09, $3E, $FE, $77, $C1, $E1
.db $18, $E1, $21, $67, $D2, $0D, $20, $DB, $11, $D0, $C5, $21, $A4, $D8, $0E, $02
.db $1A, $13, $A7, $28, $FB, $FE, $FD, $28, $F7, $FE, $FE, $28, $F3, $FE, $FF, $28
.db $0E, $E5, $C5, $06, $00, $3D, $4F, $09, $3E, $FE, $77, $C1, $E1, $18, $E1, $21
.db $A0, $D9, $0D, $20, $DB, $3E, $AC, $EA, $8D, $CF, $3E, $D9, $EA, $8E, $CF, $AF
.db $EA, $38, $CC, $3E, $FF, $CD, $B1, $23, $F0, $AA, $FE, $02, $0E, $42, $CC, $39
.db $37, $FA, $2B, $D1, $FE, $03, $3E, $32, $EA, $2B, $D1, $20, $22, $3E, $04, $EA
.db $2B, $D1, $3E, $E1, $EA, $59, $D0, $CD, $0F, $19, $CD, $D7, $3D, $21, $55, $D3
.db $CB, $BE, $3E, $2C, $CD, $6D, $3E, $3E, $07, $CD, $6D, $3E, $C3, $7D, $57, $0E
.db $1F, $3E, $D9, $CD, $A1, $23, $18, $0D, $8F, $8B, $84, $80, $92, $84, $7F, $96
.db $80, $88, $93, $E7, $50, $21, $5B, $5A, $06, $00, $FA, $38, $CC, $FE, $FF, $CA
.db $DD, $42, $87, $4F, $09, $2A, $66, $6F, $E9, $CD, $0F, $19, $CD, $E6, $5A, $CD
.db $F2, $57, $CD, $A2, $57, $AF, $21, $3D, $CC, $22, $22, $22, $77, $EA, $37, $CC
.db $EA, $26, $CC, $EA, $2A, $CC, $EA, $34, $CC, $3C, $EA, $42, $CC, $C3, $DC, $55
.db $AF, $EA, $37, $CC, $3C, $EA, $49, $CC, $3E, $A1, $EA, $29, $CC, $FA, $9C, $D8
.db $EA, $28, $CC, $3E, $09, $EA, $24, $CC, $3E, $01, $EA, $25, $CC

TradeCenter_SelectMon.enemyMonMenu_HandleInput:
	LD HL, hUILayoutFlags
	SET 1, (HL)
	CALL HandleMenuInput
	LD HL, hUILayoutFlags
	RES 1, (HL)
	AND A
	JP Z, TradeCenter_SelectMon.getNewInput
	BIT 0, A
	JR Z, TradeCenter_SelectMon.enemyMonMenu_ANotPressed
	LD A, (wMaxMenuItem)
	LD C, A
	LD A, (wCurrentMenuItem)
	CP C
	JR C, TradeCenter_SelectMon.displayEnemyMonStats
	LD A, (wMaxMenuItem)
	DEC A
	LD (wCurrentMenuItem), A
TradeCenter_SelectMon.displayEnemyMonStats:
	LD A, $01
	LD (wInitListType), A
	LD HL, $5BD5
	LD B, $0E
	CALL Bankswitch
	LD HL, $D8A4
	CALL TradeCenter_DisplayStats
	JP TradeCenter_SelectMon.getNewInput

TradeCenter_SelectMon.enemyMonMenu_ANotPressed:
	BIT 5, A
	JR Z, TradeCenter_SelectMon.enemyMonMenu_LeftNotPressed
; Data from 55B4 to 55D3 (32 bytes)
.db $AF, $EA, $49, $CC, $FA, $30, $CC, $6F, $FA, $31, $CC, $67, $FA, $27, $CC, $77
.db $FA, $26, $CC, $47, $FA, $63, $D1, $3D, $B8, $30, $0D, $EA, $26, $CC, $18, $08

TradeCenter_SelectMon.enemyMonMenu_LeftNotPressed:
	BIT 7, A
	JP Z, TradeCenter_SelectMon.getNewInput
	JP TradeCenter_SelectMon.selectedCancelMenuItem

TradeCenter_SelectMon.playerMonMenu:
	XOR A
	LD (wMonDataLocation), A
	LD (wMenuWatchMovingOutOfBounds), A
	LD A, $91
	LD (wMenuWatchedKeys), A
	LD A, (wPartyCount)
	LD (wMaxMenuItem), A
	LD A, $01
	LD (wTopMenuItemY), A
	LD A, $01
	LD (wTopMenuItemX), A
	LD HL, wTileMap_plus_15
	LD BC, $0601
	CALL ClearScreenArea
TradeCenter_SelectMon.playerMonMenu_HandleInput:
	LD HL, hUILayoutFlags
	SET 1, (HL)
	CALL HandleMenuInput
	LD HL, hUILayoutFlags
	RES 1, (HL)
	AND A
	JR NZ, TradeCenter_SelectMon.playerMonMenu_SomethingPressed
	JP TradeCenter_SelectMon.getNewInput

TradeCenter_SelectMon.playerMonMenu_SomethingPressed:
	BIT 0, A
	JR Z, TradeCenter_SelectMon.playerMonMenu_ANotPressed
; Data from 5618 to 562D (22 bytes)
.db $C3, $65, $56, $3E, $04, $EA, $1B, $D1, $21, $D5, $5B, $06, $0E, $CD, $D6, $35
.db $CD, $D6, $57, $C3, $5B, $56

TradeCenter_SelectMon.playerMonMenu_ANotPressed:
	BIT 4, A
	JR Z, TradeCenter_SelectMon.playerMonMenu_RightNotPressed
; Data from 5632 to 5653 (34 bytes)
.db $3E, $01, $EA, $49, $CC, $FA, $30, $CC, $6F, $FA, $31, $CC, $67, $FA, $27, $CC
.db $77, $FA, $26, $CC, $47, $FA, $9C, $D8, $3D, $B8, $30, $03, $EA, $26, $CC, $C3
.db $57, $55

TradeCenter_SelectMon.playerMonMenu_RightNotPressed:
	BIT 7, A
	JR Z, TradeCenter_SelectMon.getNewInput
; Data from 5658 to 565A (3 bytes)
.db $C3, $2F, $57

TradeCenter_SelectMon.getNewInput:
	LD A, (wMonDataLocation)
	AND A
	JP Z, TradeCenter_SelectMon.playerMonMenu_HandleInput
	JP TradeCenter_SelectMon.enemyMonMenu_HandleInput

; Data from 5665 to 569E (58 bytes)
.db $CD, $19, $37, $CD, $EC, $3B, $FA, $28, $CC, $4F, $FA, $26, $CC, $B9, $38, $04
.db $FA, $28, $CC, $3D, $F5, $21, $B8, $C4, $06, $02, $0E, $12, $CD, $B3, $5A, $21
.db $E2, $C4, $11, $1F, $57, $CD, $55, $19, $AF, $EA, $26, $CC, $EA, $2A, $CC, $EA
.db $34, $CC, $EA, $28, $CC, $3E, $10, $EA, $24, $CC

TradeCenter_SelectMon.selectStatsMenuItem:
	LD A, $7F
	LD (wTileMap_plus_14B), A
	LD A, $13
	LD (wMenuWatchedKeys), A
	LD A, $01
	LD (wTopMenuItemX), A
	CALL HandleMenuInput
	BIT 4, A
	JR NZ, TradeCenter_SelectMon.selectTradeMenuItem
; Data from 56B5 to 56B8 (4 bytes)
.db $CB, $4F, $28, $26

TradeCenter_SelectMon.cancelPlayerMonChoice:
	POP AF
	LD (wCurrentMenuItem), A
	CALL LoadScreenTilesFromBuffer1
	JP TradeCenter_SelectMon.playerMonMenu

TradeCenter_SelectMon.selectTradeMenuItem:
	LD A, $7F
	LD (wTileMap_plus_141), A
	LD A, $23
	LD (wMenuWatchedKeys), A
	LD A, $0B
	LD (wTopMenuItemX), A
	CALL HandleMenuInput
	BIT 5, A
	JR NZ, TradeCenter_SelectMon.selectStatsMenuItem
	BIT 1, A
	JR NZ, TradeCenter_SelectMon.cancelPlayerMonChoice
; Data from 56DD to 572E (82 bytes)
.db $18, $1A, $F1, $EA, $26, $CC, $3E, $04, $EA, $1B, $D1, $21, $D5, $5B, $06, $0E
.db $CD, $D6, $35, $CD, $D6, $57, $CD, $25, $37, $C3, $DC, $55, $CD, $EC, $3B, $F1
.db $EA, $26, $CC, $EA, $3D, $CD, $EA, $42, $CC, $CD, $6E, $22, $FA, $3D, $CC, $FE
.db $0F, $CA, $1C, $55, $EA, $3E, $CD, $CD, $C7, $57, $3E, $01, $EA, $38, $CC, $C3
.db $1C, $55, $92, $93, $80, $93, $92, $7F, $7F, $7F, $7F, $7F, $93, $91, $80, $83
.db $84, $50

TradeCenter_SelectMon.selectedCancelMenuItem:
	LD A, (wCurrentMenuItem)
	LD B, A
	LD A, (wMaxMenuItem)
	CP B
	JP NZ, TradeCenter_SelectMon.getNewInput
	LD A, (wMenuCursorLocation)
	LD L, A
	LD A, (wMenuCursorLocation + $1)
	LD H, A
	LD A, $7F
	LD (HL), A
TradeCenter_SelectMon.cancelMenuItem_Loop:
	LD A, $ED
	LD (wTileMap_plus_141), A
TradeCenter_SelectMon.cancelMenuItem_JoypadLoop:
	CALL JoypadLowSensitivity
	LDH A, (hJoy5 - $FF00)
	AND A
	JR Z, TradeCenter_SelectMon.cancelMenuItem_JoypadLoop
	BIT 0, A
	JR NZ, TradeCenter_SelectMon.cancelMenuItem_APressed
	BIT 6, A
	JR Z, TradeCenter_SelectMon.cancelMenuItem_JoypadLoop
	LD A, $7F
	LD (wTileMap_plus_141), A
	LD A, (wPartyCount)
	DEC A
	LD (wCurrentMenuItem), A
	JP TradeCenter_SelectMon.playerMonMenu

TradeCenter_SelectMon.cancelMenuItem_APressed:
	LD A, $EC
	LD (wTileMap_plus_141), A
	LD A, $0F
	LD (wLinkMenuSelectionSendBuffer), A
	CALL Serial_PrintWaitingTextAndSyncAndExchangeNybble
	LD A, (wLinkMenuSelectionReceiveBuffer)
	CP $0F
	JR NZ, TradeCenter_SelectMon.cancelMenuItem_Loop
	CALL GBPalWhiteOutWithDelay3
	LD HL, wFontLoaded
	LD A, (HL)
	PUSH AF
	PUSH HL
	RES 0, (HL)
	XOR A
	LD (wCableClubDestinationMap), A
	DEC A
	LD (wDestinationWarpID), A
	CALL LoadMapData
; Data from 5793 to 57A1 (15 bytes)
.db $06, $03, $21, $35, $43, $CD, $D6, $35, $E1, $F1, $77, $CD, $F6, $20, $C9

TradeCenter_DrawCancelBox:
	LD HL, wTileMap_plus_137
	LD A, $7E
	LD BC, $0031
	CALL FillMemory
	LD HL, wTileMap_plus_12C
	LD B, $01
	LD C, $09
	CALL CableClub_TextBoxBorder
	LD HL, $C4E2
	LD DE, CancelTextString
	JP PlaceString

; Data from 57C0 to 57D5 (22 bytes)
CancelTextString:
.db $82, $80, $8D, $82, $84, $8B, $50, $FA, $3D, $CC, $21, $55, $C4, $01, $14, $00
.db $CD, $87, $3A, $36, $EC, $C9

TradeCenter_DisplayStats:
	LD A, (wCurrentMenuItem)
	LD (wWhichPokemon), A
	LD A, $36
	CALL Predef
	LD A, $37
	CALL Predef
	CALL GBPalNormal
	CALL LoadTrainerInfoTextBoxTiles
	CALL TradeCenter_DrawPartyLists
	JP TradeCenter_DrawCancelBox

TradeCenter_DrawPartyLists:
	LD HL, wShadowOAMEnd
	LD B, $06
	LD C, $12
	CALL CableClub_TextBoxBorder
	LD HL, wTileMap_plus_A0
	LD B, $06
	LD C, $12
	CALL CableClub_TextBoxBorder
	LD HL, $C3A5
	LD DE, wPlayerName
	CALL PlaceString
	LD HL, $C445
	LD DE, wGrassRate
	CALL PlaceString
	LD HL, $C3B6
	LD DE, wPartySpecies
	CALL TradeCenter_PrintPartyListNames
	LD HL, $C456
	LD DE, wEnemyPartySpecies
TradeCenter_PrintPartyListNames:
	LD C, $00
TradeCenter_PrintPartyListNames.loop:
	LD A, (DE)
	CP $FF
	RET Z
	LD (wCalculateWhoseStats), A
	PUSH BC
	PUSH HL
	PUSH DE
	PUSH HL
	LD A, C
	LDH (hDividend - $FF00), A
	CALL GetMonName
	POP HL
	CALL PlaceString
	POP DE
	INC DE
	POP HL
	LD BC, $0014
	ADD HL, BC
	POP BC
	INC C
	JR TradeCenter_PrintPartyListNames.loop

; Data from 5849 to 5875 (45 bytes)
.db $0E, $64, $CD, $39, $37, $AF, $EA, $43, $CC, $EA, $3E, $CC, $EA, $37, $CC, $EA
.db $34, $CC, $21, $90, $C4, $06, $04, $0E, $12, $CD, $B3, $5A, $FA, $3D, $CD, $21
.db $64, $D1, $4F, $06, $00, $09, $7E, $EA, $1E, $D1, $CD, $9E, $2F

TradeCenter_Trade.loadEnemyMonTradePrompt:
	LD HL, wBattleMenuCurrentPP
	LD DE, wBadgeOrFaceTiles
	LD BC, $000B
	CALL CopyData
	LD A, (wBadgeNameTile)
	LD HL, wEnemyPartySpecies
	LD C, A
	LD B, $00
	ADD HL, BC
	LD A, (HL)
	LD (wCalculateWhoseStats), A
	CALL GetMonName
	LD HL, WillBeTradedText
	LD BC, $C4B9
	CALL TextCommandProcessor
	CALL SaveScreenTilesToBuffer1
	LD HL, wTileMap_plus_96
	LD BC, $080B
	LD A, $05
	LD (wTwoOptionMenuID), A
	LD A, $14
	LD (wTextBoxID), A
	CALL DisplayTextBoxID
; Data from 58B2 to 5A23 (370 bytes)
.db $CD, $25, $37, $FA, $26, $CC, $A7, $28, $1E, $3E, $01, $EA, $42, $CC, $21, $90
.db $C4, $06, $04, $0E, $12, $CD, $B3, $5A, $21, $B9, $C4, $11, $3A, $5A, $CD, $55
.db $19, $CD, $6E, $22, $C3, $18, $5A, $3E, $02, $EA, $42, $CC, $CD, $6E, $22, $FA
.db $3D, $CC, $3D, $20, $16, $21, $90, $C4, $06, $04, $0E, $12, $CD, $B3, $5A, $21
.db $B9, $C4, $11, $3A, $5A, $CD, $55, $19, $C3, $18, $5A, $FA, $3D, $CD, $21, $73
.db $D2, $CD, $7D, $3A, $11, $41, $CD, $01, $0B, $00, $CD, $B5, $00, $21, $6B, $D1
.db $FA, $3D, $CD, $01, $2C, $00, $CD, $87, $3A, $01, $0C, $00, $09, $2A, $EA, $4C
.db $CD, $7E, $EA, $4D, $CD, $FA, $3E, $CD, $21, $AC, $D9, $CD, $7D, $3A, $11, $4E
.db $CD, $01, $0B, $00, $CD, $B5, $00, $21, $A4, $D8, $FA, $3E, $CD, $01, $2C, $00
.db $CD, $87, $3A, $01, $0C, $00, $09, $2A, $EA, $59, $CD, $7E, $EA, $5A, $CD, $FA
.db $3D, $CD, $EA, $92, $CF, $21, $64, $D1, $06, $00, $4F, $09, $7E, $EA, $3D, $CD
.db $AF, $EA, $95, $CF, $CD, $1F, $39, $FA, $3E, $CD, $4F, $EA, $92, $CF, $21, $9D
.db $D8, $16, $00, $5F, $19, $7E, $EA, $91, $CF, $21, $A4, $D8, $79, $01, $2C, $00
.db $CD, $87, $3A, $11, $98, $CF, $01, $2C, $00, $CD, $B5, $00, $CD, $53, $3A, $FA
.db $63, $D1, $3D, $EA, $92, $CF, $3E, $01, $EA, $D4, $CC, $FA, $3E, $CD, $21, $9D
.db $D8, $06, $00, $4F, $09, $7E, $EA, $3E, $CD, $3E, $0A, $EA, $C7, $CF, $3E, $02
.db $EA, $F0, $C0, $3E, $E5, $EA, $EE, $C0, $CD, $B1, $23, $0E, $64, $CD, $39, $37
.db $CD, $0F, $19, $CD, $C0, $36, $AF, $EA, $5B, $CC, $F0, $AA, $FE, $01, $28, $07
.db $3E, $38, $CD, $6D, $3E, $18, $05, $3E, $2F, $CD, $6D, $3E, $21, $0E, $6D, $06
.db $0E, $CD, $D6, $35, $CD, $0F, $19, $CD, $E6, $5A, $CD, $6E, $22, $0E, $28, $CD
.db $39, $37, $21, $90, $C4, $06, $04, $0E, $12, $CD, $B3, $5A, $21, $B9, $C4, $11
.db $29, $5A, $CD, $55, $19, $3E, $50, $CD, $6D, $3E, $0E, $32, $CD, $39, $37, $AF
.db $EA, $38, $CC, $C3, $45, $53, $0E, $64, $CD, $39, $37, $AF, $EA, $38, $CC, $C3
.db $1C, $55

; Data from 5A24 to 5AB2 (143 bytes)
WillBeTradedText:
.db $17, $77, $66, $22, $50, $93, $B1, $A0, $A3, $A4, $7F, $A2, $AE, $AC, $AF, $AB
.db $A4, $B3, $A4, $A3, $E7, $50, $93, $AE, $AE, $7F, $A1, $A0, $A3, $E7, $7F, $93
.db $A7, $A4, $7F, $B3, $B1, $A0, $A3, $A4, $4E, $B6, $A0, $B2, $7F, $A2, $A0, $AD
.db $A2, $A4, $AB, $A4, $A3, $E7, $50, $30, $55, $49, $58, $FA, $2B, $D1, $FE, $02
.db $28, $0F, $FE, $03, $28, $0B, $FE, $05, $C0, $3E, $4D, $CD, $6D, $3E, $C3, $54
.db $1F, $CD, $17, $53, $21, $70, $76, $7C, $EA, $2F, $D5, $7D, $EA, $2E, $D5, $3E
.db $1B, $EA, $2B, $D5, $21, $D1, $17, $7C, $EA, $31, $D5, $7D, $EA, $30, $D5, $AF
.db $EA, $87, $D8, $3C, $EA, $2B, $D1, $E0, $B5, $3E, $0A, $EA, $C7, $CF, $3E, $02
.db $EA, $F0, $C0, $3E, $CA, $EA, $EE, $C0, $C3, $B1, $23, $C9, $CD, $94, $3E

CableClub_TextBoxBorder:
	PUSH HL
	LD A, $78
	LDI (HL), A
	INC A
	CALL CableClub_DrawHorizontalLine
	INC A
	LD (HL), A
	POP HL
	LD DE, $0014
	ADD HL, DE
CableClub_TextBoxBorder.loop:
	PUSH HL
	LD A, $7B
	LDI (HL), A
	LD A, $7F
	CALL CableClub_DrawHorizontalLine
	LD (HL), $77
	POP HL
	LD DE, $0014
	ADD HL, DE
	DEC B
	JR NZ, CableClub_TextBoxBorder.loop
	LD A, $7C
	LDI (HL), A
	LD A, $76
	CALL CableClub_DrawHorizontalLine
	LD (HL), $7D
	RET

CableClub_DrawHorizontalLine:
	LD D, C
CableClub_DrawHorizontalLine.loop:
	LDI (HL), A
	DEC D
	JR NZ, CableClub_DrawHorizontalLine.loop
	RET

LoadTrainerInfoTextBoxTiles:
	LD DE, $7B98
	LD HL, $9760
	LD BC, $0B09
	JP CopyVideoData

; Data from 5AF2 to 6441 (2384 bytes)
.db $CD, $FF, $5B, $AF, $EA, $8A, $D0, $3C, $EA, $88, $D0, $CD, $9E, $60, $30, $05
.db $3E, $52, $CD, $6D, $3E, $0E, $14, $CD, $39, $37, $AF, $EA, $2B, $D1, $21, $2B
.db $CC, $22, $22, $22, $77, $EA, $7C, $D0, $21, $2E, $D7, $CB, $B6, $CD, $0F, $19
.db $CD, $ED, $3D, $CD, $A0, $36, $CD, $80, $36, $21, $30, $D7, $CB, $F6, $FA, $88
.db $D0, $FE, $01, $28, $15, $21, $A0, $C3, $06, $06, $0E, $0D, $CD, $22, $19, $21
.db $CA, $C3, $11, $7E, $5D, $CD, $55, $19, $18, $13, $21, $A0, $C3, $06, $04, $0E
.db $0D, $CD, $22, $19, $21, $CA, $C3, $11, $87, $5D, $CD, $55, $19, $21, $30, $D7
.db $CB, $B6, $CD, $29, $24, $AF, $EA, $26, $CC, $EA, $2A, $CC, $EA, $34, $CC, $3C
.db $EA, $25, $CC, $3C, $EA, $24, $CC, $3E, $0B, $EA, $29, $CC, $FA, $88, $D0, $EA
.db $28, $CC, $CD, $BE, $3A, $CB, $4F, $C2, $DD, $42, $0E, $14, $CD, $39, $37, $FA
.db $26, $CC, $47, $FA, $88, $D0, $FE, $02, $CA, $9E, $5B, $04, $78, $A7, $28, $10
.db $FE, $01, $CA, $52, $5D, $CD, $8A, $5E, $3E, $01, $EA, $8A, $D0, $C3, $07, $5B
.db $CD, $B5, $5D, $21, $26, $D1, $CB, $EE, $AF, $E0, $B3, $E0, $B2, $E0, $B4, $CD
.db $9A, $01, $F0, $B4, $CB, $47, $20, $07, $CB, $4F, $C2, $07, $5B, $18, $E9, $CD
.db $D4, $3D, $CD, $0F, $19, $3E, $04, $EA, $2A, $D5, $0E, $0A, $CD, $39, $37, $FA
.db $A2, $D5, $A7, $CA, $5F, $5D, $FA, $5E, $D3, $FE, $76, $C2, $5F, $5D, $AF, $EA
.db $1A, $D7, $21, $32, $D7, $CB, $D6, $CD, $CE, $62, $C3, $5F, $5D, $3E, $01, $EA
.db $58, $D3, $3E, $03, $EA, $55, $D3, $C9, $AF, $EA, $58, $D3, $21, $2E, $D7, $CB
.db $F6, $21, $20, $6B, $CD, $49, $3C, $CD, $19, $37, $21, $43, $5D, $CD, $49, $3C
.db $21, $09, $C4, $06, $06, $0E, $0D, $CD, $22, $19, $CD, $29, $24, $21, $33, $C4
.db $11, $97, $5D, $CD, $55, $19, $AF, $EA, $37, $CD, $EA, $2D, $D7, $21, $24, $CC
.db $3E, $07, $22, $3E, $06, $22, $AF, $22, $23, $3E, $02, $22, $3C, $22, $AF, $77
.db $CD, $BE, $3A, $E6, $03, $87, $87, $47, $FA, $26, $CC, $80, $C6, $D0, $EA, $42
.db $CC, $EA, $43, $CC, $CD, $47, $22, $FA, $3D, $CC, $47, $E6, $F0, $FE, $D0, $28
.db $0A, $FA, $3E, $CC, $47, $E6, $F0, $FE, $D0, $20, $E9, $78, $E6, $0C, $20, $09
.db $FA, $42, $CC, $E6, $0C, $28, $C9, $18, $16, $FA, $42, $CC, $E6, $0C, $28, $06
.db $F0, $AA, $FE, $02, $28, $09, $78, $EA, $42, $CC, $E6, $03, $EA, $26, $CC, $F0
.db $AA, $FE, $02, $20, $0A, $CD, $AF, $20, $CD, $AF, $20, $3E, $81, $E0, $02, $06
.db $7F, $0E, $7F, $16, $EC, $FA, $42, $CC, $E6, $08, $20, $0E, $FA, $26, $CC, $FE
.db $02, $28, $07, $4A, $50, $3D, $28, $02, $41, $4A, $78, $EA, $32, $C4, $79, $EA
.db $5A, $C4, $7A, $EA, $82, $C4, $0E, $28, $CD, $39, $37, $CD, $25, $37, $FA, $42
.db $CC, $E6, $08, $20, $46, $FA, $26, $CC, $FE, $02, $28, $3F, $AF, $EA, $00, $D7
.db $FA, $26, $CC, $A7, $3E, $F0, $20, $02, $3E, $EF, $EA, $2D, $D7, $21, $48, $5D
.db $CD, $49, $3C, $0E, $32, $CD, $39, $37, $21, $32, $D7, $CB, $8E, $FA, $7C, $D0
.db $EA, $1A, $D7, $CD, $CE, $62, $0E, $14, $CD, $39, $37, $AF, $EA, $34, $CC, $EA
.db $42, $CC, $3C, $EA, $2B, $D1, $EA, $47, $CC, $18, $32, $AF, $EA, $34, $CC, $CD
.db $D7, $3D, $CD, $D7, $72, $21, $4D, $5D, $CD, $49, $3C, $21, $2E, $D7, $CB, $B6
.db $C9, $17, $D0, $63, $22, $50, $17, $ED, $63, $22, $50, $17, $0D, $64, $22, $50
.db $21, $32, $D7, $CB, $8E, $CD, $15, $61, $0E, $14, $CD, $39, $37, $AF, $E0, $B3
.db $E0, $B4, $E0, $B5, $EA, $2D, $D7, $21, $32, $D7, $CB, $C6, $CD, $A6, $28, $0E
.db $14, $CD, $39, $37, $FA, $47, $CC, $A7, $C0, $C3, $A6, $03, $82, $8E, $8D, $93
.db $88, $8D, $94, $84, $4E, $8D, $84, $96, $7F, $86, $80, $8C, $84, $4E, $8E, $8F
.db $93, $88, $8E, $8D, $50, $93, $91, $80, $83, $84, $7F, $82, $84, $8D, $93, $84
.db $91, $4E, $82, $8E, $8B, $8E, $92, $92, $84, $94, $8C, $4E, $82, $80, $8D, $82
.db $84, $8B, $50, $AF, $E0, $BA, $21, $30, $C4, $06, $08, $0E, $0E, $CD, $22, $19
.db $21, $59, $C4, $11, $6A, $5E, $CD, $55, $19, $21, $60, $C4, $11, $58, $D1, $CD
.db $55, $19, $21, $8D, $C4, $CD, $2F, $5E, $21, $B4, $C4, $CD, $42, $5E, $21, $D9
.db $C4, $CD, $55, $5E, $3E, $01, $E0, $BA, $0E, $1E, $C3, $39, $37, $AF, $E0, $BA
.db $21, $A4, $C3, $06, $08, $0E, $0E, $CD, $22, $19, $CD, $A0, $36, $CD, $29, $24
.db $21, $CD, $C3, $11, $6A, $5E, $CD, $55, $19, $21, $D4, $C3, $11, $58, $D1, $CD
.db $55, $19, $21, $01, $C4, $CD, $2F, $5E, $21, $28, $C4, $CD, $42, $5E, $21, $4D
.db $C4, $CD, $55, $5E, $3E, $01, $E0, $BA, $0E, $1E, $C3, $39, $37, $E5, $21, $56
.db $D3, $06, $01, $CD, $7F, $2B, $E1, $11, $1E, $D1, $01, $02, $01, $C3, $5F, $3C
.db $E5, $21, $F7, $D2, $06, $13, $CD, $7F, $2B, $E1, $11, $1E, $D1, $01, $03, $01
.db $C3, $5F, $3C, $11, $41, $DA, $01, $03, $01, $CD, $5F, $3C, $36, $6D, $23, $11
.db $43, $DA, $01, $02, $81, $C3, $5F, $3C, $8F, $8B, $80, $98, $84, $91, $4E, $81
.db $80, $83, $86, $84, $92, $7F, $7F, $7F, $7F, $4E, $54, $83, $84, $97, $7F, $7F
.db $7F, $7F, $4E, $93, $88, $8C, $84, $50, $21, $A0, $C3, $06, $03, $0E, $12, $CD
.db $22, $19, $21, $04, $C4, $06, $03, $0E, $12, $CD, $22, $19, $21, $68, $C4, $06
.db $03, $0E, $12, $CD, $22, $19, $21, $B5, $C3, $11, $C0, $5F, $CD, $55, $19, $21
.db $19, $C4, $11, $DE, $5F, $CD, $55, $19, $21, $7D, $C4, $11, $FD, $5F, $CD, $55
.db $19, $21, $E2, $C4, $11, $18, $60, $CD, $55, $19, $AF, $EA, $26, $CC, $EA, $2A
.db $CC, $3C, $EA, $58, $D3, $EA, $40, $CD, $3E, $03, $EA, $24, $CC, $CD, $4C, $60
.db $FA, $3D, $CD, $EA, $25, $CC, $3E, $01, $E0, $BA, $CD, $D7, $3D, $CD, $7C, $3B
.db $CD, $1F, $60, $CD, $31, $38, $F0, $B5, $47, $E6, $FB, $28, $F6, $CB, $48, $20
.db $0F, $CB, $58, $20, $0B, $CB, $40, $28, $16, $FA, $24, $CC, $FE, $10, $20, $DD
.db $3E, $90, $CD, $B1, $23, $C9, $EA, $25, $CC, $CD, $F9, $3B, $C3, $EF, $5E, $FA
.db $24, $CC, $CB, $78, $20, $18, $CB, $70, $20, $2E, $FE, $08, $28, $50, $FE, $0D
.db $28, $57, $FE, $10, $28, $B7, $CB, $68, $C2, $96, $5F, $C3, $A9, $5F, $FE, $10
.db $06, $F3, $21, $3D, $CD, $28, $29, $06, $05, $FE, $03, $23, $28, $22, $FE, $08
.db $23, $28, $1D, $06, $03, $23, $18, $18, $FE, $08, $06, $FB, $21, $3D, $CD, $28
.db $0F, $FE, $0D, $23, $28, $0A, $FE, $10, $06, $FD, $23, $28, $03, $06, $0D, $23
.db $80, $EA, $24, $CC, $7E, $EA, $25, $CC, $CD, $EC, $3B, $C3, $EF, $5E, $FA, $3E
.db $CD, $EE, $0B, $EA, $3E, $CD, $C3, $18, $5F, $FA, $3F, $CD, $EE, $0B, $EA, $3F
.db $CD, $C3, $18, $5F, $FA, $3D, $CD, $FE, $01, $28, $1D, $FE, $07, $20, $04, $D6
.db $06, $18, $15, $D6, $07, $18, $11, $FA, $3D, $CD, $FE, $0E, $28, $0A, $FE, $07
.db $20, $04, $C6, $07, $18, $02, $C6, $06, $EA, $3D, $CD, $C3, $18, $5F, $93, $84
.db $97, $93, $7F, $92, $8F, $84, $84, $83, $4E, $7F, $85, $80, $92, $93, $7F, $7F
.db $8C, $84, $83, $88, $94, $8C, $7F, $92, $8B, $8E, $96, $50, $81, $80, $93, $93
.db $8B, $84, $7F, $80, $8D, $88, $8C, $80, $93, $88, $8E, $8D, $4E, $7F, $8E, $8D
.db $7F, $7F, $7F, $7F, $7F, $7F, $7F, $8E, $85, $85, $50, $81, $80, $93, $93, $8B
.db $84, $7F, $92, $93, $98, $8B, $84, $4E, $7F, $92, $87, $88, $85, $93, $7F, $7F
.db $7F, $7F, $92, $84, $93, $50, $82, $80, $8D, $82, $84, $8B, $50, $21, $96, $60
.db $FA, $3D, $CD, $4F, $2A, $B9, $28, $03, $23, $18, $F9, $7E, $57, $FA, $3E, $CD
.db $3D, $28, $04, $CB, $FA, $18, $02, $CB, $BA, $FA, $3F, $CD, $3D, $28, $04, $CB
.db $F2, $18, $02, $CB, $B2, $7A, $EA, $55, $D3, $C9, $21, $97, $60, $FA, $55, $D3
.db $4F, $E6, $3F, $C5, $11, $02, $00, $CD, $AB, $3D, $C1, $2B, $7E, $EA, $3D, $CD
.db $21, $DC, $C3, $CD, $8F, $60, $CB, $21, $3E, $01, $30, $02, $3E, $0A, $EA, $3E
.db $CD, $21, $40, $C4, $CD, $8F, $60, $CB, $21, $3E, $01, $30, $02, $3E, $0A, $EA
.db $3F, $CD, $21, $A4, $C4, $CD, $8F, $60, $21, $E0, $C4, $3E, $01, $5F, $16, $00
.db $19, $36, $EC, $C9, $0E, $05, $07, $03, $01, $01, $07, $FF, $3E, $0A, $EA, $00
.db $00, $3E, $01, $EA, $00, $60, $EA, $00, $40, $06, $0B, $21, $98, $A5, $2A, $FE
.db $50, $28, $0C, $05, $20, $F8, $AF, $EA, $00, $00, $EA, $00, $60, $A7, $C9, $AF
.db $EA, $00, $00, $EA, $00, $60, $37, $C9, $FA, $58, $D3, $F5, $FA, $55, $D3, $F5
.db $FA, $32, $D7, $F5, $21, $58, $D1, $01, $8A, $0D, $AF, $CD, $E0, $36, $21, $00
.db $C1, $01, $00, $02, $AF, $CD, $E0, $36, $F1, $EA, $32, $D7, $F1, $EA, $55, $D3
.db $F1, $EA, $58, $D3, $FA, $8A, $D0, $A7, $CC, $FF, $5B, $21, $AA, $45, $11, $58
.db $D1, $01, $0B, $00, $CD, $B5, $00, $21, $B1, $45, $11, $4A, $D3, $01, $0B, $00
.db $C3, $B5, $00, $3E, $FF, $CD, $B1, $23, $3E, $02, $4F, $3E, $EF, $CD, $A1, $23
.db $CD, $0F, $19, $CD, $A0, $36, $CD, $CA, $60, $3E, $18, $CD, $6D, $3E, $21, $3A
.db $D5, $3E, $14, $EA, $91, $CF, $3E, $01, $EA, $96, $CF, $CD, $CF, $2B, $FA, $7C
.db $D0, $EA, $1A, $D7, $CD, $CE, $62, $AF, $E0, $D7, $FA, $32, $D7, $CB, $4F, $C2
.db $BC, $61, $11, $5F, $61, $01, $00, $13, $CD, $A4, $62, $CD, $71, $62, $21, $53
.db $62, $CD, $49, $3C, $CD, $D8, $20, $CD, $0F, $19, $3E, $A7, $EA, $B5, $D0, $EA
.db $91, $CF, $CD, $37, $15, $21, $F6, $C3, $CD, $84, $13, $CD, $88, $62, $21, $58
.db $62, $CD, $49, $3C, $CD, $D8, $20, $CD, $0F, $19, $11, $DE, $6E, $01, $00, $04
.db $CD, $A4, $62, $CD, $88, $62, $21, $62, $62, $CD, $49, $3C, $CD, $5D, $69, $CD
.db $D8, $20, $CD, $0F, $19, $11, $49, $60, $01, $00, $13, $CD, $A4, $62, $CD, $71
.db $62, $21, $67, $62, $CD, $49, $3C, $CD, $A4, $69, $CD, $D8, $20, $CD, $0F, $19
.db $11, $DE, $6E, $01, $00, $04, $CD, $A4, $62, $CD, $F6, $20, $FA, $2D, $D7, $A7
.db $20, $06, $21, $6C, $62, $CD, $49, $3C, $F0, $B8, $F5, $3E, $9C, $CD, $B1, $23
.db $F1, $E0, $B8, $EA, $00, $20, $0E, $04, $CD, $39, $37, $11, $80, $41, $21, $00
.db $80, $01, $0C, $05, $CD, $48, $18, $11, $E8, $6F, $01, $00, $04, $CD, $A4, $62
.db $0E, $04, $CD, $39, $37, $11, $42, $70, $01, $00, $04, $CD, $A4, $62, $CD, $A6
.db $28, $F0, $B8, $F5, $3E, $02, $EA, $EF, $C0, $EA, $F0, $C0, $3E, $0A, $EA, $C7
.db $CF, $3E, $FF, $EA, $EE, $C0, $CD, $B1, $23, $F1, $E0, $B8, $EA, $00, $20, $0E
.db $14, $CD, $39, $37, $21, $0A, $C4, $06, $07, $0E, $07, $CD, $C4, $18, $CD, $A0
.db $36, $3E, $01, $EA, $CB, $CF, $0E, $32, $CD, $39, $37, $CD, $D8, $20, $C3, $0F
.db $19, $17, $25, $64, $22, $50, $17, $7F, $64, $22, $14, $17, $B3, $64, $22, $50
.db $17, $19, $65, $22, $50, $17, $34, $65, $22, $50, $17, $97, $65, $22, $50, $21
.db $82, $62, $06, $06, $2A, $E0, $47, $0E, $0A, $CD, $39, $37, $05, $20, $F5, $C9
.db $54, $A8, $FC, $F8, $F4, $E4, $3E, $77, $E0, $4B, $CD, $AF, $20, $3E, $E4, $E0
.db $47, $CD, $AF, $20, $F0, $4B, $D6, $08, $FE, $FF, $C8, $E0, $4B, $18, $F2, $CD
.db $94, $3E, $C5, $78, $CD, $EB, $36, $21, $88, $A1, $11, $00, $A0, $01, $10, $03
.db $CD, $B5, $00, $11, $00, $90, $CD, $EA, $16, $C1, $79, $A7, $21, $C3, $C3, $20
.db $03, $21, $F6, $C3, $AF, $E0, $E1, $3E, $01, $C3, $6D, $3E, $CD, $FF, $62, $3E
.db $19, $CD, $6D, $3E, $21, $32, $D7, $CB, $56, $CB, $96, $28, $05, $FA, $1A, $D7
.db $18, $09, $CB, $4E, $28, $03, $CD, $EA, $64, $3E, $00, $47, $FA, $2D, $D7, $A7
.db $20, $01, $78, $21, $32, $D7, $CB, $66, $C0, $EA, $65, $D3, $C9, $FA, $2D, $D7
.db $FE, $EF, $20, $0E, $21, $28, $64, $F0, $AA, $FE, $02, $28, $25, $21, $30, $64
.db $18, $20, $FE, $F0, $20, $0E, $21, $38, $64, $F0, $AA, $FE, $02, $28, $13, $21
.db $40, $64, $18, $0E, $FA, $32, $D7, $CB, $4F, $20, $19, $CB, $57, $20, $15, $21
.db $20, $64, $11, $5E, $D3, $0E, $07, $2A, $12, $13, $0D, $20, $FA, $2A, $EA, $67
.db $D3, $AF, $18, $6D, $FA, $65, $D3, $21, $32, $D7, $CB, $66, $20, $0B, $CB, $76
.db $CB, $B6, $28, $38, $FA, $19, $D7, $18, $36, $21, $2D, $D7, $CB, $A6, $FA, $1D
.db $D7, $47, $EA, $5E, $D3, $FA, $1E, $D7, $4F, $21, $BF, $63, $11, $00, $00, $3E
.db $06, $EA, $2F, $D1, $2A, $B8, $28, $03, $23, $18, $04, $2A, $B9, $28, $07, $FA
.db $2F, $D1, $83, $5F, $18, $EE, $21, $D8, $63, $19, $18, $16, $FA, $1A, $D7, $47
.db $EA, $5E, $D3, $21, $48, $64, $2A, $23, $B8, $28, $04, $23, $23, $18, $F7, $2A
.db $66, $6F, $11, $5F, $D3, $0E, $06, $2A, $12, $13, $0D, $20, $FA, $AF, $EA, $67
.db $D3, $EA, $E2, $D4, $EA, $E3, $D4, $3E, $FF, $EA, $2F, $D4, $C9, $9F, $01, $9F
.db $02, $A0, $01, $A0, $02, $A1, $01, $A1, $02, $A2, $01, $A2, $02, $C2, $02, $A5
.db $01, $A5, $02, $D6, $03, $FF, $46, $C7, $07, $12, $01, $00, $48, $C7, $07, $17
.db $01, $01, $46, $C7, $07, $13, $01, $01, $48, $C7, $07, $16, $01, $00, $46, $C7
.db $07, $12, $01, $00, $46, $C7, $07, $13, $01, $01, $93, $C7, $0E, $04, $00, $00
.db $93, $C7, $0E, $05, $00, $01, $B1, $C7, $10, $16, $00, $00, $99, $C7, $0E, $10
.db $00, $00, $99, $C7, $0E, $10, $00, $00, $9A, $C7, $0E, $12, $00, $00, $26, $12
.db $C7, $06, $03, $00, $01, $04, $EF, $0B, $C7, $04, $03, $00, $01, $15, $EF, $0D
.db $C7, $04, $06, $00, $00, $15, $F0, $0B, $C7, $04, $03, $00, $01, $15, $F0, $0D

; 1st entry of Pointer Table from 3140 (indexed by wNPCMovementScriptPointerTableNum)
; Data from 6442 to 650F (206 bytes)
PalletMovementScriptPointerTable:
.db $C7, $04, $06, $00, $00, $15, $00, $00, $7C, $64, $01, $00, $82, $64, $02, $00
.db $88, $64, $03, $00, $8E, $64, $04, $00, $94, $64, $05, $00, $9A, $64, $06, $00
.db $A0, $64, $07, $00, $A6, $64, $08, $00, $AC, $64, $09, $00, $B2, $64, $0A, $00
.db $B8, $64, $0F, $00, $BE, $64, $15, $00, $C4, $64, $2B, $C7, $06, $05, $00, $01
.db $60, $C8, $1A, $17, $00, $01, $5B, $C8, $1A, $0D, $00, $01, $F6, $C7, $12, $13
.db $00, $01, $2A, $C7, $06, $03, $00, $01, $3C, $C7, $04, $0B, $00, $01, $B7, $C7
.db $0A, $29, $00, $01, $78, $C8, $1C, $13, $00, $01, $5E, $C7, $0C, $0B, $00, $01
.db $2D, $C7, $06, $09, $00, $01, $8D, $C8, $1E, $09, $00, $01, $BA, $C7, $06, $0B
.db $00, $01, $9E, $C7, $14, $0B, $00, $01, $11, $DF, $64, $1A, $FE, $FF, $C8, $EA
.db $91, $CF, $13, $1A, $EA, $27, $D1, $13, $CD, $27, $39, $18, $EE, $0A, $5A, $15
.db $14, $68, $38, $76, $38, $4A, $39, $FF, $C9, $CD, $19, $37, $CD, $94, $3E, $E5
.db $FA, $57, $D0, $3D, $21, $A0, $C3, $06, $04, $0E, $0B, $CC, $C4, $18, $FA, $91
.db $CF, $EA, $1E, $D1, $CD, $9E, $2F, $21, $57, $65, $CD, $49, $3C, $21

; 2nd entry of Pointer Table from 3140 (indexed by wNPCMovementScriptPointerTableNum)
; Data from 6510 to 657C (109 bytes)
PewterMuseumGuyMovementScriptPointerTable:
.db $3A, $C4, $01, $0F, $08, $3E, $14, $EA, $25, $D1, $CD, $E8, $30, $E1, $FA, $26
.db $CC, $A7, $20, $28, $FA, $CB, $CF, $F5, $AF, $EA, $CB, $CF, $E5, $3E, $02, $EA
.db $7D, $D0, $CD, $96, $65, $FA, $57, $D0, $A7, $20, $03, $CD, $08, $3E, $CD, $25
.db $37, $E1, $F1, $EA, $CB, $CF, $FA, $4B, $CF, $FE, $50, $C0, $54, $5D, $21, $6D
.db $CD, $01, $0B, $00, $C3, $B5, $00, $17, $05, $66, $22, $50, $21, $E9, $CE, $AF
.db $EA, $CB, $CF, $3E, $02, $EA, $7D, $D0, $CD, $96, $65, $CD, $D4, $3D, $CD, $BE
.db $3D, $CD, $BA, $20, $FA, $4B, $CF, $FE, $50, $28, $19, $21, $B5

; 3rd entry of Pointer Table from 3140 (indexed by wNPCMovementScriptPointerTableNum)
; Data from 657D to 7094 (2840 bytes)
PewterGymGuyMovementScriptPointerTable:
.db $D2, $01, $0B, $00, $FA, $92, $CF, $CD, $87, $3A, $5D, $54, $21, $E9, $CE, $01
.db $0B, $00, $CD, $B5, $00, $A7, $C9, $37, $C9, $E5, $21, $30, $D7, $CB, $F6, $CD
.db $D4, $3D, $CD, $0F, $19, $CD, $29, $24, $06, $08, $CD, $EF, $3D, $CD, $C0, $36
.db $CD, $5B, $67, $06, $1C, $21, $6C, $57, $CD, $D6, $35, $21, $F0, $C3, $06, $09
.db $0E, $12, $CD, $22, $19, $CD, $F8, $68, $3E, $03, $EA, $24, $CC, $3E, $01, $EA
.db $25, $CC, $EA, $2A, $CC, $EA, $26, $CC, $3E, $FF, $EA, $29, $CC, $3E, $07, $EA
.db $28, $CC, $3E, $50, $EA, $4B, $CF, $AF, $21, $EA, $CE, $22, $22, $EA, $8B, $D0
.db $CD, $6F, $67, $CD, $DC, $3D, $FA, $EA, $CE, $A7, $20, $34, $CD, $0E, $68, $CD
.db $7C, $3B, $FA, $26, $CC, $F5, $06, $1C, $21, $F7, $56, $CD, $D6, $35, $F1, $EA
.db $26, $CC, $CD, $31, $38, $F0, $B3, $A7, $28, $E8, $21, $5E, $66, $CB, $27, $38
.db $06, $23, $23, $23, $23, $18, $F6, $2A, $5F, $2A, $57, $2A, $66, $6F, $D5, $E9
.db $D1, $21, $4B, $CF, $01, $0B, $00, $CD, $B5, $00, $CD, $D4, $3D, $CD, $0F, $19
.db $CD, $82, $00, $CD, $ED, $3D, $CD, $DC, $3D, $AF, $EA, $8B, $D0, $21, $30, $D7
.db $CB, $B6, $FA, $57, $D0, $A7, $CA, $A0, $36, $21, $5B, $6E, $06, $0F, $C3, $D6
.db $35, $FC, $65, $3E, $67, $FC, $65, $2C, $67, $FC, $65, $18, $67, $FC, $65, $02
.db $67, $F3, $65, $8C, $66, $ED, $65, $83, $66, $F3, $65, $F6, $66, $F3, $65, $92
.db $66, $D1, $11, $ED, $65, $D5, $FA, $EB, $CE, $EE, $01, $EA, $EB, $CE, $C9, $3E
.db $01, $EA, $EA, $CE, $C9, $FA, $26, $CC, $FE, $05, $20, $07, $FA, $25, $CC, $FE
.db $11, $28, $EC, $FA, $26, $CC, $FE, $06, $20, $07, $FA, $25, $CC, $FE, $01, $28
.db $D0, $21, $30, $CC, $2A, $66, $6F, $23, $7E, $EA, $ED, $CE, $CD, $EB, $68, $FA
.db $ED, $CE, $FE, $E5, $11, $85, $68, $28, $1D, $FE, $E4, $11, $D6, $68, $28, $16
.db $FA, $7D, $D0, $FE, $02, $30, $07, $FA, $E9, $CE, $FE, $07, $18, $05, $FA, $E9
.db $CE, $FE, $0A, $38, $08, $C9, $E5, $CD, $71, $68, $E1, $D0, $2B, $FA, $ED, $CE
.db $22, $36, $50, $3E, $90, $CD, $B1, $23, $C9, $FA, $E9, $CE, $A7, $C8, $CD, $EB
.db $68, $2B, $36, $50, $C9, $FA, $26, $CC, $FE, $06, $C8, $FA, $25, $CC, $FE, $11
.db $CA, $14, $67, $3C, $3C, $18, $41, $3E, $01, $18, $3D, $FA, $26, $CC, $FE, $06
.db $C8, $FA, $25, $CC, $3D, $CA, $28, $67, $3D, $18, $2D, $3E, $11, $18, $29, $FA
.db $26, $CC, $3D, $EA, $26, $CC, $A7, $C0, $3E, $06, $EA, $26, $CC, $3E, $01, $18
.db $17, $FA, $26, $CC, $3C, $EA, $26, $CC, $FE, $07, $20, $07, $3E, $01, $EA, $26
.db $CC, $18, $05, $FE, $06, $C0, $3E, $01, $EA, $25, $CC, $C3, $F9, $3B, $11, $67
.db $67, $21, $00, $8F, $01, $01, $00, $C3, $86, $18, $F0, $C0, $F0, $CE, $FD, $0D
.db $0D, $0E, $AF, $E0, $BA, $FA, $EB, $CE, $A7, $11, $9E, $67, $20, $03, $11, $D6
.db $67, $21, $06, $C4, $01, $09, $05, $C5, $1A, $22, $23, $13, $0D, $20, $F9, $01
.db $16, $00, $09, $C1, $05, $20, $F0, $CD, $55, $19, $3E, $01, $E0, $BA, $C3, $D7
.db $3D, $A0, $A1, $A2, $A3, $A4, $A5, $A6, $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE
.db $AF, $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $7F, $F1, $9A, $9B, $9C
.db $9D, $9E, $9F, $E1, $E2, $E3, $E6, $E7, $EF, $F5, $F3, $F2, $F4, $F0, $94, $8F
.db $8F, $84, $91, $7F, $82, $80, $92, $84, $50, $80, $81, $82, $83, $84, $85, $86
.db $87, $88, $89, $8A, $8B, $8C, $8D, $8E, $8F, $90, $91, $92, $93, $94, $95, $96
.db $97, $98, $99, $7F, $F1, $9A, $9B, $9C, $9D, $9E, $9F, $E1, $E2, $E3, $E6, $E7
.db $EF, $F5, $F3, $F2, $F4, $F0, $AB, $AE, $B6, $A4, $B1, $7F, $A2, $A0, $B2, $A4
.db $50, $CD, $EB, $68, $79, $EA, $E9, $CE, $21, $D2, $C3, $01, $0A, $01, $CD, $C4
.db $18, $21, $D2, $C3, $11, $4B, $CF, $CD, $55, $19, $21, $E6, $C3, $FA, $7D, $D0
.db $FE, $02, $30, $04, $06, $07, $18, $02, $06, $0A, $3E, $76, $22, $05, $20, $FC
.db $FA, $7D, $D0, $FE, $02, $FA, $E9, $CE, $30, $04, $FE, $07, $18, $02, $FE, $0A
.db $20, $18, $CD, $F9, $3B, $3E, $11, $EA, $25, $CC, $3E, $05, $EA, $26, $CC, $FA
.db $7D, $D0, $FE, $02, $3E, $09, $30, $02, $3E, $06, $4F, $06, $00, $21, $E6, $C3
.db $09, $36, $77, $C9, $D5, $CD, $EB, $68, $2B, $7E, $E1, $11, $02, $00, $CD, $AB
.db $3D, $D0, $23, $7E, $EA, $ED, $CE, $C9, $B6, $26, $B7, $27, $B8, $28, $B9, $29
.db $BA, $2A, $BB, $2B, $BC, $2C, $BD, $2D, $BE, $2E, $BF, $2F, $C0, $30, $C1, $31
.db $C2, $32, $C3, $33, $C4, $34, $CA, $3A, $CB, $3B, $CC, $3C, $CD, $3D, $CE, $3E
.db $85, $05, $86, $06, $87, $07, $88, $08, $89, $09, $8A, $0A, $8B, $0B, $8C, $0C
.db $8D, $0D, $8E, $0E, $8F, $0F, $90, $10, $91, $11, $92, $12, $93, $13, $99, $19
.db $9A, $1A, $9B, $1B, $CD, $3D, $9C, $1C, $FF, $CA, $44, $CB, $45, $CC, $46, $CD
.db $47, $CE, $48, $99, $40, $9A, $41, $9B, $42, $CD, $47, $9C, $43, $FF, $21, $4B
.db $CF, $0E, $00, $7E, $FE, $50, $C8, $23, $0C, $18, $F8, $21, $B4, $C3, $FA, $7D
.db $D0, $11, $3F, $69, $A7, $28, $30, $11, $45, $69, $3D, $28, $2A, $FA, $91, $CF
.db $EA, $5D, $CD, $F5, $06, $1C, $21, $82, $58, $CD, $D6, $35, $F1, $EA, $1E, $D1
.db $CD, $9E, $2F, $21, $B8, $C3, $CD, $55, $19, $21, $01, $00, $09, $36, $C9, $21
.db $DD, $C3, $11, $53, $69, $18, $08, $CD, $55, $19, $69, $60, $11, $4D, $69, $C3
.db $55, $19, $98, $8E, $94, $91, $7F, $50, $91, $88, $95, $80, $8B, $BD, $7F, $50
.db $8D, $80, $8C, $84, $E6, $50, $8D, $88, $82, $8A, $8D, $80, $8C, $84, $E6, $50
.db $CD, $12, $6A, $11, $A8, $6A, $CD, $6C, $6A, $FA, $26, $CC, $A7, $28, $0E, $21
.db $F2, $6A, $CD, $D6, $6A, $11, $58, $D1, $CD, $EC, $69, $18, $1F, $21, $58, $D1
.db $AF, $EA, $7D, $D0, $CD, $96, $65, $FA, $4B, $CF, $FE, $50, $28, $EF, $CD, $0F
.db $19, $CD, $D7, $3D, $11, $DE, $6E, $06, $04, $CD, $A4, $62, $21, $9F, $69, $C3
.db $49, $3C, $17, $2F, $66, $22, $50, $CD, $12, $6A, $11, $BE, $6A, $CD, $6C, $6A
.db $FA, $26, $CC, $A7, $28, $0E, $21, $08, $6B, $CD, $D6, $6A, $11, $4A, $D3, $CD
.db $EC, $69, $18, $20, $21, $4A, $D3, $3E, $01, $EA, $7D, $D0, $CD, $96, $65, $FA
.db $4B, $CF, $FE, $50, $28, $EE, $CD, $0F, $19, $CD, $D7, $3D, $11, $49, $60, $06
.db $13, $CD, $A4, $62, $21, $E7, $69, $C3, $49, $3C, $17, $4A, $66, $22, $50, $D5
.db $21, $A0, $C3, $01, $0B, $0C, $CD, $C4, $18, $0E, $0A, $CD, $39, $37, $D1, $21
.db $6D, $CD, $01, $0B, $00, $CD, $B5, $00, $CD, $D7, $3D, $21, $FC, $C3, $11, $7D
.db $06, $3E, $FF, $18, $07, $21, $F5, $C3, $11, $7D, $06, $AF, $E5, $D5, $C5, $E0
.db $8D, $7A, $E0, $8B, $7B, $E0, $8C, $4F, $F0, $8D, $A7, $20, $03, $16, $00, $19
.db $54, $5D, $AF, $E0, $BA, $F0, $8D, $A7, $20, $05, $2A, $32, $2B, $18, $03, $3A
.db $22, $23, $0D, $20, $ED, $F0, $8D, $A7, $28, $03, $AF, $2B, $77, $3E, $01, $E0
.db $BA, $CD, $D7, $3D, $F0, $8C, $4F, $62, $6B, $F0, $8D, $A7, $20, $03, $23, $18
.db $01, $2B, $54, $5D, $F0, $8B, $3D, $E0, $8B, $20, $C7, $C1, $D1, $E1, $C9, $D5
.db $21, $A0, $C3, $06, $0A, $0E, $09, $CD, $22, $19, $21, $A3, $C3, $11, $A3, $6A
.db $CD, $55, $19, $D1, $21, $CA, $C3, $CD, $55, $19, $CD, $29, $24, $AF, $EA, $26
.db $CC, $EA, $2A, $CC, $3C, $EA, $25, $CC, $EA, $29, $CC, $3C, $EA, $24, $CC, $3C
.db $EA, $28, $CC, $C3, $BE, $3A, $8D, $80, $8C, $84, $50, $8D, $84, $96, $7F, $8D
.db $80, $8C, $84, $4E, $91, $84, $83, $4E, $80, $92, $87, $4E, $89, $80, $82, $8A
.db $50, $8D, $84, $96, $7F, $8D, $80, $8C, $84, $4E, $81, $8B, $94, $84, $4E, $86
.db $80, $91, $98, $4E, $89, $8E, $87, $8D, $50, $47, $0E, $00, $54, $5D, $2A, $FE
.db $50, $20, $FB, $78, $B9, $28, $03, $0C, $18, $F2, $62, $6B, $11, $6D, $CD, $01
.db $14, $00, $C3, $B5, $00, $8D, $84, $96, $7F, $8D, $80, $8C, $84, $50, $91, $84
.db $83, $50, $80, $92, $87, $50, $89, $80, $82, $8A, $50, $8D, $84, $96, $7F, $8D
.db $80, $8C, $84, $50, $81, $8B, $94, $84, $50, $86, $80, $91, $98, $50, $89, $8E
.db $87, $8D, $50, $50, $11, $47, $D3, $21, $9F, $FF, $0E, $03, $CD, $8E, $3A, $D8
.db $11, $49, $D3, $21, $A1, $FF, $0E, $03, $3E, $0C, $CD, $6D, $3E, $3E, $13, $EA
.db $25, $D1, $CD, $E8, $30, $A7, $C9, $FA, $94, $CF, $FE, $03, $C2, $53, $2C, $E5
.db $21, $8B, $CF, $2A, $66, $6F, $23, $FA, $26, $CC, $47, $FA, $36, $CC, $80, $87
.db $4F, $06, $00, $09, $7E, $E1, $3C, $CA, $53, $2C, $FA, $35, $CC, $A7, $20, $14
.db $FA, $26, $CC, $3C, $47, $FA, $36, $CC, $80, $EA, $35, $CC, $0E, $14, $CD, $39
.db $37, $C3, $53, $2C, $FA, $26, $CC, $3C, $47, $FA, $36, $CC, $80, $47, $FA, $35
.db $CC, $B8, $CA, $53, $2C, $3D, $EA, $35, $CC, $0E, $14, $CD, $39, $37, $E5, $D5
.db $21, $8B, $CF, $2A, $66, $6F, $23, $54, $5D, $FA, $26, $CC, $47, $FA, $36, $CC
.db $80, $87, $4F, $06, $00, $09, $FA, $35, $CC, $87, $83, $5F, $30, $01, $14, $1A
.db $47, $2A, $B8, $28, $1A, $E0, $95, $3A, $E0, $96, $1A, $22, $13, $1A, $77, $F0
.db $96, $12, $1B, $F0, $95, $12, $AF, $EA, $35, $CC, $D1, $E1, $C3, $53, $2C, $13
.db $7E, $47, $1A, $80, $FE, $64, $38, $08, $D6, $63, $12, $3E, $63, $77, $18, $2A
.db $77, $21, $8B, $CF, $2A, $66, $6F, $35, $7E, $EA, $2A, $D1, $FE, $01, $20, $03
.db $EA, $28, $CC, $1B, $62, $6B, $23, $23, $2A, $12, $13, $3C, $28, $05, $2A, $12
.db $13, $18, $F5, $AF, $EA, $36, $CC, $EA, $26, $CC, $AF, $EA, $35, $CC, $D1, $E1
.db $C3, $53, $2C, $FA, $36, $CC, $EA, $7E, $D0, $CD, $29, $24, $AF, $EA, $0A, $CF
.db $AF, $EA, $36, $CC, $EA, $26, $CC, $EA, $2F, $CC, $3C, $EA, $93, $CF, $3E, $13
.db $EA, $25, $D1, $CD, $E8, $30, $3E, $15, $EA, $25, $D1, $CD, $E8, $30, $21, $28
.db $D1, $2A, $6E, $67, $FA, $2E, $D1, $FE, $02, $CA, $F7, $6D, $FA, $2D, $D1, $A7
.db $CA, $1E, $6D, $3D, $CA, $68, $6C, $3D, $CA, $F7, $6D, $AF, $EA, $93, $CF, $3E
.db $02, $EA, $1B, $D1, $21, $D5, $5B, $06, $0E, $CD, $D6, $35, $FA, $1D, $D3, $A7
.db $CA, $12, $6D, $21, $25, $6E, $CD, $49, $3C, $CD, $19, $37, $CD, $25, $37, $3E
.db $13, $EA, $25, $D1, $CD, $E8, $30, $21, $1D, $D3, $7D, $EA, $8B, $CF, $7C, $EA
.db $8C, $CF, $AF, $EA, $93, $CF, $EA, $26, $CC, $3E, $03, $EA, $94, $CF, $CD, $E6
.db $2B, $DA, $C8, $6D, $CD, $D9, $30, $FA, $24, $D1, $A7, $20, $4F, $FA, $91, $CF
.db $CD, $40, $30, $38, $47, $3E, $02, $EA, $94, $CF, $E0, $8E, $CD, $57, $2D, $3C
.db $28, $BA, $21, $2A, $6E, $01, $01, $0E, $CD, $49, $3C, $21, $3A, $C4, $01, $0F
.db $08, $3E, $14, $EA, $25, $D1, $CD, $E8, $30, $FA, $2E, $D1, $FE, $02, $28, $9C
.db $FA, $2D, $D1, $3D, $28, $96, $FA, $0A, $CF, $A7, $20, $04, $3C, $EA, $0A, $CF
.db $CD, $9E, $2B, $21, $1D, $D3, $CD, $BB, $2B, $C3, $89, $6C, $21, $34, $6E, $CD
.db $49, $3C, $C3, $C8, $6D, $21, $2F, $6E, $CD, $49, $3C, $CD, $19, $37, $C3, $C8
.db $6D, $3E, $01, $EA, $93, $CF, $3E, $03, $EA, $1B, $D1, $21, $D5, $5B, $06, $0E
.db $CD, $D6, $35, $21, $0C, $6E, $CD, $49, $3C, $CD, $19, $37, $CD, $25, $37, $3E
.db $13, $EA, $25, $D1, $CD, $E8, $30, $21, $7B, $CF, $7D, $EA, $8B, $CF, $7C, $EA
.db $8C, $CF, $AF, $EA, $26, $CC, $3C, $EA, $93, $CF, $3C, $EA, $94, $CF, $CD, $E6
.db $2B, $38, $68, $3E, $63, $EA, $97, $CF, $AF, $E0, $8E, $CD, $57, $2D, $3C, $28
.db $CB, $FA, $91, $CF, $EA, $1E, $D1, $CD, $CF, $2F, $CD, $26, $38, $21, $11, $6E
.db $CD, $49, $3C, $21, $3A, $C4, $01, $0F, $08, $3E, $14, $EA, $25, $D1, $CD, $E8
.db $30, $FA, $2E, $D1, $FE, $02, $CA, $39, $6D, $FA, $2D, $D1, $3D, $28, $9D, $CD
.db $DC, $6D, $38, $46, $21, $1D, $D3, $CD, $CF, $2B, $30, $46, $CD, $96, $2B, $FA
.db $0A, $CF, $A7, $20, $05, $3E, $01, $EA, $0A, $CF, $3E, $B2, $CD, $40, $37, $CD
.db $48, $37, $21, $16, $6E, $CD, $49, $3C, $C3, $39, $6D, $CD, $25, $37, $3E, $13
.db $EA, $25, $D1, $CD, $E8, $30, $21, $3E, $6E, $CD, $49, $3C, $C3, $2D, $6C, $11
.db $47, $D3, $21, $9F, $FF, $0E, $03, $C3, $8E, $3A, $21, $1B, $6E, $CD, $49, $3C
.db $18, $D9, $21, $20, $6E, $CD, $49, $3C, $18, $D1, $21, $39, $6E, $CD, $49, $3C
.db $3E, $01, $EA, $CB, $CF, $CD, $29, $24, $FA, $7E, $D0, $EA, $36, $CC, $C9, $17
.db $08, $66, $28, $50, $17, $19, $66, $28, $50, $17, $39, $66, $28, $50, $17, $53
.db $66, $28, $50, $17, $70, $66, $28, $50, $17, $90, $66, $28, $50, $17, $AE, $66
.db $28, $50, $17, $CF, $66, $28, $50, $17, $F0, $66, $28, $50, $17, $0D, $67, $28
.db $50, $17, $19, $67, $28, $50, $CD, $19, $37, $FA, $92, $CF, $21, $B5, $D2, $CD
.db $BA, $15, $21, $6D, $CD, $11, $36, $D0, $01, $0B, $00, $CD, $B5, $00, $21, $73
.db $D1, $01, $2C, $00, $FA, $92, $CF, $CD, $87, $3A, $54, $5D, $06, $04, $7E, $A7
.db $28, $1C, $23, $05, $20, $F8, $D5, $CD, $07, $6F, $D1, $DA, $DA, $6E, $E5, $D5
.db $EA, $1E, $D1, $CD, $58, $30, $21, $C8, $6F, $CD, $49, $3C, $D1, $E1, $FA, $E0
.db $D0, $77, $01, $15, $00, $09, $E5, $D5, $3D, $21, $00, $40, $01, $06, $00, $CD
.db $87, $3A, $11, $E9, $CE, $3E, $0E, $CD, $9D, $00, $FA, $EE, $CE, $D1, $E1, $77
.db $FA, $57, $D0, $A7, $CA, $FE, $6E, $FA, $92, $CF, $47, $FA, $2F, $CC, $B8, $C2
.db $FE, $6E, $62, $6B, $11, $1C, $D0, $01, $04, $00, $CD, $B5, $00, $01, $11, $00
.db $09, $11, $2D, $D0, $01, $04, $00, $CD, $B5, $00, $C3, $FE, $6E, $21, $B9, $6F
.db $CD, $49, $3C, $21, $3A, $C4, $01, $0F, $08, $3E, $14, $EA, $25, $D1, $CD, $E8
.db $30, $FA, $26, $CC, $A7, $C2, $5B, $6E, $21, $BE, $6F, $CD, $49, $3C, $06, $00
.db $C9, $21, $AD, $6F, $CD, $49, $3C, $06, $01, $C9, $E5, $21, $C3, $6F, $CD, $49
.db $3C, $21, $3A, $C4, $01, $0F, $08, $3E, $14, $EA, $25, $D1, $CD, $E8, $30, $E1
.db $FA, $26, $CC, $1F, $D8, $01, $FC, $FF, $09, $E5, $11, $DC, $D0, $01, $04, $00
.db $CD, $B5, $00, $21, $87, $5B, $06, $0E, $CD, $D6, $35, $E1, $E5, $21, $B4, $6F
.db $CD, $49, $3C, $21, $30, $C4, $06, $04, $0E, $0E, $CD, $22, $19, $21, $46, $C4
.db $11, $E1, $D0, $F0, $F6, $CB, $D7, $E0, $F6, $CD, $55, $19, $F0, $F6, $CB, $97
.db $E0, $F6, $21, $24, $CC, $3E, $08, $22, $3E, $05, $22, $AF, $22, $23, $FA, $6C
.db $CD, $22, $3E, $03, $22, $36, $00, $21, $F6, $FF, $CB, $CE, $CD, $BE, $3A, $21
.db $F6, $FF, $CB, $8E, $F5, $CD, $25, $37, $F1, $E1, $CB, $4F, $20, $20, $E5, $FA
.db $26, $CC, $4F, $06, $00, $09, $7E, $F5, $C5, $CD, $49, $30, $C1, $D1, $7A, $38
.db $04, $E1, $09, $A7, $C9, $21, $E1, $6F, $CD, $49, $3C, $E1, $18, $8E, $37, $C9
.db $17, $3B, $67, $28, $0B, $06, $50, $17, $50, $67, $28, $50, $17, $71, $67, $28
.db $50, $17, $8A, $67, $28, $50, $17, $A4, $67, $28, $50, $17, $19, $68, $28, $0A
.db $08, $3E, $AE, $CD, $40, $37, $21, $D7, $6F, $C9, $17, $27, $68, $28, $0A, $17
.db $30, $68, $28, $50, $17, $4D, $68, $28, $50, $CD, $19, $37, $21, $5D, $70, $CD
.db $49, $3C, $21, $2E, $D7, $CB, $56, $CB, $CE, $CB, $D6, $20, $06, $21, $62, $70
.db $CD, $49, $3C, $CD, $0A, $36, $FA, $26, $CC, $A7, $20, $48, $CD, $78, $70, $CD
.db $25, $37, $21, $68, $70, $CD, $49, $3C, $3E, $18, $EA, $12, $C1, $CD, $D7, $3D
.db $3E, $07, $CD, $6D, $3E, $06, $1C, $21, $33, $44, $CD, $D6, $35, $AF, $EA, $C7
.db $CF, $FA, $F0, $C0, $EA, $EF, $C0, $FA, $5B, $D3, $EA, $CA, $CF, $EA, $EE, $C0
.db $CD, $B1, $23, $21, $6D, $70, $CD, $49, $3C, $3E, $14, $EA, $12, $C1, $4F, $CD
.db $39, $37, $18, $03, $CD, $25, $37, $21, $72, $70, $CD, $49, $3C, $C3, $29, $24
.db $17, $6D, $68, $28, $50, $0A, $17, $B4, $68, $28, $50, $17, $CE, $68, $28, $50
.db $17, $E8, $68, $28, $50, $0A, $17, $10, $69, $28, $50, $E5, $21, $92, $70, $FA
.db $5E, $D3, $47, $2A, $FE, $FF, $28, $05, $B8, $20, $F8, $18, $06, $FA, $65, $D3
.db $EA, $19, $D7, $E1, $C9, $DF, $E0, $E1

SafariZoneRestHouses.end:
.db $FF
DisplayTextIDInit:
	XOR A
	LD (wHPBarType), A
	LD A, (wAutoTextBoxDrawingControl)
	BIT 0, A
	JR NZ, DisplayTextIDInit.skipDrawingTextBoxBorder
	LDH A, (hDownArrowBlinkCount2 - $FF00)
	AND A
	JR NZ, DisplayTextIDInit.notStartMenu
	LD A, (wEventFlags_plus_4)
	BIT 5, A
	LD HL, wTileMap_plus_A
	LD B, $0E
	LD C, $08
	JR NZ, DisplayTextIDInit.drawTextBoxBorder
	LD HL, wTileMap_plus_A
	LD B, $0C
	LD C, $08
	JR DisplayTextIDInit.drawTextBoxBorder

DisplayTextIDInit.notStartMenu:
	LD HL, wTileMap_plus_F0
	LD B, $04
	LD C, $12
DisplayTextIDInit.drawTextBoxBorder:
	CALL TextBoxBorder
DisplayTextIDInit.skipDrawingTextBoxBorder:
	LD HL, wFontLoaded
	SET 0, (HL)
	LD HL, wMiscFlags
	BIT 4, (HL)
	RES 4, (HL)
	JR NZ, DisplayTextIDInit.skipMovingSprites
	CALL UpdateSprites
DisplayTextIDInit.skipMovingSprites:
	LD HL, wSprite01StateData1FacingDirection
	LD C, $0F
	LD DE, $0010
DisplayTextIDInit.spriteFacingDirectionCopyLoop:
	LD A, (HL)
	INC H
	LD (HL), A
	DEC H
	ADD HL, DE
	DEC C
	JR NZ, DisplayTextIDInit.spriteFacingDirectionCopyLoop
	LD HL, wSpritePlayerStateData1ImageIndex
	LD DE, $0010
	LD C, E
DisplayTextIDInit.spriteStandStillLoop:
	LD A, (HL)
	CP $FF
	JR Z, DisplayTextIDInit.nextSprite
	AND $FC
	LD (HL), A
DisplayTextIDInit.nextSprite:
	ADD HL, DE
	DEC C
	JR NZ, DisplayTextIDInit.spriteStandStillLoop
	LD B, $9C
	CALL CopyScreenTileBufferToVRAM
	XOR A
	LDH (hWY - $FF00), A
	CALL LoadFontTilePatterns
	LD A, $01
	LDH (hAutoBGTransferEnabled - $FF00), A
	RET

DrawStartMenu:
	LD A, (wEventFlags_plus_4)
	BIT 5, A
	LD HL, wTileMap_plus_A
	LD B, $0E
	LD C, $08
	JR NZ, DrawStartMenu.drawTextBoxBorder
	LD HL, wTileMap_plus_A
	LD B, $0C
	LD C, $08
DrawStartMenu.drawTextBoxBorder:
	CALL TextBoxBorder
	LD A, $CB
	LD (wMenuWatchedKeys), A
	LD A, $02
	LD (wTopMenuItemY), A
	LD A, $0B
	LD (wTopMenuItemX), A
	LD A, (wBattleAndStartSavedMenuItem)
	LD (wCurrentMenuItem), A
	LD (wLastMenuItem), A
	XOR A
	LD (wMenuWatchMovingOutOfBounds), A
	LD HL, wStatusFlags5
	SET 6, (HL)
	LD HL, $C3D4
	LD A, (wEventFlags_plus_4)
	BIT 5, A
	LD A, $06
	JR Z, DrawStartMenu.storeMenuItemCount
	LD DE, StartMenuPokedexText
	CALL PrintStartMenuItem
	LD A, $07
DrawStartMenu.storeMenuItemCount:
	LD (wMaxMenuItem), A
	LD DE, StartMenuPokemonText
	CALL PrintStartMenuItem
	LD DE, StartMenuItemText
	CALL PrintStartMenuItem
	LD DE, wPlayerName
	CALL PrintStartMenuItem
	LD A, (wStatusFlags4)
	BIT 6, A
	LD DE, StartMenuSaveText
	JR Z, DrawStartMenu.printSaveOrResetText
	LD DE, StartMenuResetText
DrawStartMenu.printSaveOrResetText:
	CALL PrintStartMenuItem
	LD DE, StartMenuOptionText
	CALL PrintStartMenuItem
	LD DE, StartMenuExitText
	CALL PlaceString
	LD HL, wStatusFlags5
	RES 6, (HL)
	RET

; Data from 718F to 7196 (8 bytes)
StartMenuPokedexText:
.db $8F, $8E, $8A, $BA, $83, $84, $97, $50

; Data from 7197 to 719E (8 bytes)
StartMenuPokemonText:
.db $8F, $8E, $8A, $BA, $8C, $8E, $8D, $50

; Data from 719F to 71A3 (5 bytes)
StartMenuItemText:
.db $88, $93, $84, $8C, $50

; Data from 71A4 to 71A8 (5 bytes)
StartMenuSaveText:
.db $92, $80, $95, $84, $50

; Data from 71A9 to 71AE (6 bytes)
StartMenuResetText:
.db $91, $84, $92, $84, $93, $50

; Data from 71AF to 71B3 (5 bytes)
StartMenuExitText:
.db $84, $97, $88, $93, $50

; Data from 71B4 to 71BA (7 bytes)
StartMenuOptionText:
.db $8E, $8F, $93, $88, $8E, $8D, $50

PrintStartMenuItem:
	PUSH HL
	CALL PlaceString
	POP HL
	LD DE, $0028
	ADD HL, DE
	RET

; Data from 71C5 to 72E9 (293 bytes)
.db $21, $B8, $72, $CD, $49, $3C, $FA, $4B, $D7, $CB, $6F, $C2, $E1, $71, $0E, $3C
.db $CD, $39, $37, $21, $D2, $72, $CD, $49, $3C, $C3, $98, $72, $3E, $01, $EA, $34
.db $CC, $3E, $5A, $EA, $47, $CC, $F0, $AA, $FE, $02, $28, $29, $FE, $01, $28, $25
.db $3E, $FF, $E0, $AA, $3E, $02, $E0, $01, $AF, $E0, $AD, $3E, $80, $E0, $02, $FA
.db $47, $CC, $3D, $EA, $47, $CC, $28, $7A, $3E, $01, $E0, $01, $3E, $81, $E0, $02
.db $CD, $AF, $20, $18, $D1, $CD, $ED, $22, $CD, $AF, $20, $CD, $ED, $22, $0E, $32
.db $CD, $39, $37, $21, $BD, $72, $CD, $49, $3C, $AF, $EA, $34, $CC, $CD, $EC, $35
.db $3E, $01, $EA, $34, $CC, $FA, $26, $CC, $A7, $20, $4F, $21, $48, $78, $06, $1C
.db $CD, $D6, $35, $CD, $48, $37, $3E, $B6, $CD, $40, $37, $21, $C2, $72, $CD, $49
.db $3C, $21, $47, $CC, $3E, $03, $22, $AF, $77, $E0, $A9, $EA, $42, $CC, $CD, $7F
.db $22, $21, $47, $CC, $2A, $3C, $20, $3B, $7E, $3C, $20, $37, $06, $0A, $CD, $AF
.db $20, $CD, $ED, $22, $05, $20, $F7, $CD, $D7, $72, $21, $C8, $72, $CD, $49, $3C
.db $18, $11, $21, $B3, $72, $CD, $49, $3C, $18, $09, $CD, $D7, $72, $21, $CD, $72
.db $CD, $49, $3C, $AF, $21, $47, $CC, $22, $77, $21, $2E, $D7, $CB, $B6, $AF, $EA
.db $34, $CC, $C9, $AF, $32, $77, $21, $0A, $5C, $06, $01, $C3, $D6, $35, $17, $2B
.db $69, $28, $50, $17, $69, $69, $28, $50, $17, $85, $69, $28, $50, $17, $CC, $69
.db $28, $0A, $50, $17, $DB, $69, $28, $50, $17, $00, $40, $29, $50, $17, $14, $40
.db $29, $50, $CD, $D7, $3D, $3E, $FF, $E0, $AA, $3E, $02, $E0, $01, $AF, $E0, $AD
.db $3E, $80, $E0, $02, $C9

DisplayTextBoxID_:
	LD A, (wTextBoxID)
	CP $14
	JP Z, DisplayTwoOptionMenu
	LD C, A
	LD HL, TextBoxFunctionTable
	LD DE, $0003
	CALL SearchTextBoxTable
	JR C, DisplayTextBoxID_.functionTableMatch
; Data from 72FE to 7313 (22 bytes)
.db $21, $91, $73, $11, $05, $00, $CD, $4C, $73, $38, $14, $21, $B0, $73, $11, $09
.db $00, $CD, $4C, $73, $38, $13

; Data from 7314 to 7314 (1 bytes)
DisplayTextBoxID_.done:
.db $C9

DisplayTextBoxID_.functionTableMatch:
	LDI A, (HL)
	LD H, (HL)
	LD L, A
	LD DE, DisplayTextBoxID_.done
	PUSH DE
	JP HL

; Data from 731D to 734B (47 bytes)
.db $CD, $5A, $73, $CD, $75, $73, $CD, $22, $19, $C9, $CD, $5A, $73, $E5, $CD, $75
.db $73, $CD, $22, $19, $E1, $CD, $67, $73, $FA, $30, $D7, $F5, $FA, $30, $D7, $CB
.db $F7, $EA, $30, $D7, $CD, $55, $19, $F1, $EA, $30, $D7, $CD, $29, $24, $C9

SearchTextBoxTable:
	DEC DE
SearchTextBoxTable.loop:
	LDI A, (HL)
	CP $FF
	JR Z, SearchTextBoxTable.notFound
	CP C
	JR Z, SearchTextBoxTable.found
	ADD HL, DE
	JR SearchTextBoxTable.loop

SearchTextBoxTable.found:
	SCF
SearchTextBoxTable.notFound:
	RET

; Data from 735A to 7386 (45 bytes)
.db $2A, $5F, $2A, $57, $2A, $93, $3D, $4F, $2A, $92, $3D, $47, $C9, $2A, $5F, $2A
.db $57, $D5, $2A, $5F, $7E, $57, $CD, $75, $73, $D1, $C9, $C5, $21, $A0, $C3, $01
.db $14, $00, $7A, $A7, $28, $04, $09, $15, $18, $F8, $C1, $19, $C9

; Data from 7387 to 7558 (466 bytes)
TextBoxFunctionTable:
.db $13, $BA, $74, $15, $EA, $74, $04, $E1, $76, $FF, $01, $00, $0C, $13, $11, $03
.db $00, $00, $13, $0E, $07, $00, $00, $0B, $06, $0D, $04, $02, $13, $0C, $10, $07
.db $00, $13, $11, $11, $06, $04, $0E, $0D, $FF, $05, $00, $00, $0E, $11, $43, $74
.db $03, $00, $06, $0D, $0A, $13, $0E, $22, $74, $0F, $0B, $08, $00, $00, $07, $05
.db $2B, $74, $02, $02, $09, $00, $06, $05, $0A, $35, $74, $02, $07, $0B, $08, $0C
.db $13, $11, $55, $74, $0A, $0E, $1B, $00, $0C, $13, $11, $68, $74, $02, $0E, $0C
.db $0B, $0B, $13, $11, $89, $74, $0D, $0C, $0E, $00, $00, $0A, $06, $13, $74, $02
.db $01, $0F, $0B, $00, $13, $02, $3D, $74, $0D, $00, $12, $07, $06, $0B, $0A, $9D
.db $74, $08, $08, $1A, $0B, $08, $13, $11, $A1, $74, $0C, $0A, $81, $94, $98, $4E
.db $92, $84, $8B, $8B, $4E, $90, $94, $88, $93, $50, $50, $94, $92, $84, $4E, $93
.db $8E, $92, $92, $50, $B7, $DB, $B8, $4E, $A0, $AC, $8D, $E3, $0B, $50, $CA, $D4
.db $B2, $4E, $B5, $BF, $B2, $50, $8C, $8E, $8D, $84, $98, $50, $D3, $C1, $D3, $C9
.db $50, $C2, $32, $B7, $B6, $D7, $4E, $BB, $B2, $BC, $E2, $B6, $D7, $50, $85, $88
.db $86, $87, $93, $7F, $E1, $E2, $4E, $88, $93, $84, $8C, $7F, $7F, $91, $94, $8D
.db $50, $81, $80, $8B, $8B, $F1, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $81, $80, $88
.db $93, $4E, $93, $87, $91, $8E, $96, $7F, $91, $8E, $82, $8A, $7F, $7F, $91, $94
.db $8D, $50, $92, $96, $88, $93, $82, $87, $4E, $92, $93, $80, $93, $92, $4E, $82
.db $80, $8D, $82, $84, $8B, $50, $80, $AC, $E7, $50, $12, $E3, $8F, $DD, $D0, $D9
.db $4E, $C5, $B7, $2A, $B4, $4E, $3C, $DE, $46, $DD, $D0, $D9, $4E, $86, $AD, $AB
.db $8D, $A6, $50, $21, $30, $D7, $CB, $F6, $3E, $0F, $EA, $25, $D1, $CD, $E8, $30
.db $21, $C1, $C3, $06, $01, $0E, $06, $CD, $C4, $18, $21, $C0, $C3, $11, $47, $D3
.db $0E, $A3, $CD, $CD, $15, $21, $30, $D7, $CB, $B6, $C9, $7F, $7F, $7F, $7F, $7F
.db $7F, $F0, $50, $FA, $30, $D7, $CB, $F7, $EA, $30, $D7, $AF, $EA, $2D, $D1, $3E
.db $0E, $EA, $25, $D1, $CD, $E8, $30, $3E, $03, $EA, $29, $CC, $3E, $02, $EA, $28
.db $CC, $3E, $01, $EA, $24, $CC, $3E, $01, $EA, $25, $CC, $AF, $EA, $26, $CC, $EA
.db $2A, $CC, $EA, $37, $CC, $FA, $30, $D7, $CB, $B7, $EA, $30, $D7, $CD, $BE, $3A
.db $CD, $EC, $3B, $CB, $47, $20, $0B, $CB, $4F, $28, $07, $3E, $02, $EA, $2E, $D1
.db $18, $13, $3E, $01, $EA, $2E, $D1, $FA, $26, $CC, $EA, $2D, $D1, $47, $FA, $28
.db $CC, $B8, $28, $01, $C9, $3E, $02, $EA, $2E, $D1, $FA, $26, $CC, $EA, $2D, $D1
.db $37, $C9

DisplayTwoOptionMenu:
	PUSH HL
	LD A, (wStatusFlags5)
	SET 6, A
	LD (wStatusFlags5), A
	XOR A
	LD (wChosenMenuItem), A
	LD (wMenuExitMethod), A
	LD A, $03
	LD (wMenuWatchedKeys), A
	LD A, $01
	LD (wMaxMenuItem), A
	LD A, B
	LD (wTopMenuItemY), A
	LD A, C
	LD (wTopMenuItemX), A
	XOR A
	LD (wLastMenuItem), A
	LD (wMenuWatchMovingOutOfBounds), A
	PUSH HL
	LD HL, wTwoOptionMenuID
	BIT 7, (HL)
	RES 7, (HL)
	JR Z, DisplayTwoOptionMenu.storeCurrentMenuItem
	INC A
DisplayTwoOptionMenu.storeCurrentMenuItem:
	LD (wCurrentMenuItem), A
	POP HL
	PUSH HL
	PUSH HL
	CALL TwoOptionMenu_SaveScreenTiles
	LD A, (wTwoOptionMenuID)
	LD HL, TwoOptionMenuStrings
	LD E, A
	LD D, $00
	LD A, $05
DisplayTwoOptionMenu.menuStringLoop:
	ADD HL, DE
	DEC A
	JR NZ, DisplayTwoOptionMenu.menuStringLoop
	LDI A, (HL)
	LD C, A
	LDI A, (HL)
	LD B, A
	LD E, L
	LD D, H
	POP HL
	PUSH DE
	LD A, (wTwoOptionMenuID)
	CP $05
	JR NZ, DisplayTwoOptionMenu.notTradeCancelMenu
; Data from 75B4 to 75B8 (5 bytes)
.db $CD, $B3, $5A, $18, $03

DisplayTwoOptionMenu.notTradeCancelMenu:
	CALL TextBoxBorder
	CALL UpdateSprites
	POP HL
	LDI A, (HL)
	AND A
	LD BC, $0016
	JR Z, DisplayTwoOptionMenu.noBlankLine
; Data from 75C7 to 75C9 (3 bytes)
.db $01, $2A, $00

DisplayTwoOptionMenu.noBlankLine:
	LDI A, (HL)
	LD E, A
	LDI A, (HL)
	LD D, A
	POP HL
	ADD HL, BC
	CALL PlaceString
	LD HL, wStatusFlags5
	RES 6, (HL)
	LD A, (wTwoOptionMenuID)
	CP $07
	JR NZ, DisplayTwoOptionMenu.notNoYesMenu
	XOR A
	LD (wTwoOptionMenuID), A
	LD A, (wMiscFlags)
	PUSH AF
	PUSH HL
	LD HL, wMiscFlags
	BIT 5, (HL)
	SET 5, (HL)
	POP HL
DisplayTwoOptionMenu.noYesMenuInputLoop:
	CALL HandleMenuInput
	BIT 1, A
	JR NZ, DisplayTwoOptionMenu.noYesMenuInputLoop
	POP AF
	POP HL
	LD (wMiscFlags), A
	LD A, $90
	CALL PlaySound
; Data from 7601 to 7602 (2 bytes)
.db $18, $0C

DisplayTwoOptionMenu.notNoYesMenu:
	XOR A
	LD (wTwoOptionMenuID), A
	CALL HandleMenuInput
	POP HL
	BIT 1, A
	JR NZ, DisplayTwoOptionMenu.choseSecondMenuItem
	LD A, (wCurrentMenuItem)
	LD (wChosenMenuItem), A
	AND A
	JR NZ, DisplayTwoOptionMenu.choseSecondMenuItem
	LD A, $01
	LD (wMenuExitMethod), A
	LD C, $0F
	CALL DelayFrames
	CALL TwoOptionMenu_RestoreScreenTiles
	AND A
	RET

DisplayTwoOptionMenu.choseSecondMenuItem:
	LD A, $01
	LD (wCurrentMenuItem), A
	LD (wChosenMenuItem), A
	LD A, $02
	LD (wMenuExitMethod), A
	LD C, $0F
	CALL DelayFrames
	CALL TwoOptionMenu_RestoreScreenTiles
	SCF
	RET

TwoOptionMenu_SaveScreenTiles:
	LD DE, wBuffer
	LD BC, $0506
TwoOptionMenu_SaveScreenTiles.loop:
	LDI A, (HL)
	LD (DE), A
	INC DE
	DEC C
	JR NZ, TwoOptionMenu_SaveScreenTiles.loop
	PUSH BC
	LD BC, $000E
	ADD HL, BC
	POP BC
	LD C, $06
	DEC B
	JR NZ, TwoOptionMenu_SaveScreenTiles.loop
	RET

TwoOptionMenu_RestoreScreenTiles:
	LD DE, wBuffer
	LD BC, $0506
TwoOptionMenu_RestoreScreenTiles.loop:
	LD A, (DE)
	INC DE
	LDI (HL), A
	DEC C
	JR NZ, TwoOptionMenu_RestoreScreenTiles.loop
	PUSH BC
	LD BC, $000E
	ADD HL, BC
	POP BC
	LD C, $06
	DEC B
	JR NZ, TwoOptionMenu_RestoreScreenTiles.loop
	CALL UpdateSprites
	RET

; Data from 7671 to 7FFF (2447 bytes)
TwoOptionMenuStrings:
.db $04, $03, $00, $A0, $76, $06, $03, $00, $A7, $76, $06, $03, $00, $B2, $76, $06
.db $03, $00, $A0, $76, $06, $03, $00, $BD, $76, $07, $03, $00, $C8, $76, $07, $04
.db $01, $D5, $76, $04, $03, $00, $99, $76, $8D, $8E, $4E, $98, $84, $92, $50, $98
.db $84, $92, $4E, $8D, $8E, $50, $8D, $8E, $91, $93, $87, $4E, $96, $84, $92, $93
.db $50, $92, $8E, $94, $93, $87, $4E, $84, $80, $92, $93, $50, $8D, $8E, $91, $93
.db $87, $4E, $84, $80, $92, $93, $50, $93, $91, $80, $83, $84, $4E, $82, $80, $8D
.db $82, $84, $8B, $50, $87, $84, $80, $8B, $4E, $82, $80, $8D, $82, $84, $8B, $50
.db $AF, $21, $3D, $CD, $22, $22, $22, $22, $22, $36, $0C, $CD, $D6, $77, $FA, $41
.db $CD, $A7, $20, $1A, $21, $87, $C4, $06, $05, $0E, $07, $CD, $22, $19, $CD, $29
.db $24, $3E, $0C, $E0, $F7, $21, $9D, $C4, $11, $C2, $77, $C3, $55, $19, $F5, $21
.db $7C, $C4, $FA, $42, $CD, $3D, $5F, $16, $00, $19, $06, $05, $3E, $12, $93, $4F
.db $F1, $11, $D8, $FF, $19, $04, $04, $3D, $20, $FA, $11, $EC, $FF, $19, $04, $CD
.db $22, $19, $CD, $29, $24, $21, $90, $C4, $FA, $42, $CD, $3C, $5F, $16, $00, $19
.db $11, $D8, $FF, $FA, $41, $CD, $19, $3D, $20, $FC, $AF, $EA, $41, $CD, $11, $3D
.db $CD, $E5, $21, $8D, $77, $1A, $A7, $28, $1C, $13, $47, $05, $28, $07, $2A, $FE
.db $50, $20, $FB, $18, $F6, $44, $4D, $E1, $D5, $50, $59, $CD, $55, $19, $01, $28
.db $00, $09, $D1, $18, $DC, $E1, $FA, $42, $CD, $E0, $F7, $21, $90, $C4, $FA, $42
.db $CD, $3C, $5F, $16, $00, $19, $11, $C2, $77, $C3, $55, $19, $82, $94, $93, $50
.db $85, $8B, $98, $50, $50, $92, $94, $91, $85, $50, $92, $93, $91, $84, $8D, $86
.db $93, $87, $50, $85, $8B, $80, $92, $87, $50, $83, $88, $86, $50, $93, $84, $8B
.db $84, $8F, $8E, $91, $93, $50, $92, $8E, $85, $93, $81, $8E, $88, $8B, $84, $83
.db $50, $92, $93, $80, $93, $92, $4E, $92, $96, $88, $93, $82, $87, $4E, $82, $80
.db $8D, $82, $84, $8B, $50, $FA, $92, $CF, $21, $73, $D1, $01, $2C, $00, $CD, $87
.db $3A, $54, $5D, $0E, $05, $21, $3D, $CD, $E5, $0D, $28, $34, $1A, $A7, $28, $30
.db $47, $13, $21, $23, $78, $2A, $FE, $FF, $28, $EF, $B8, $28, $04, $23, $23, $18
.db $F4, $78, $EA, $43, $CD, $2A, $46, $E1, $22, $FA, $41, $CD, $3C, $EA, $41, $CD
.db $FA, $42, $CD, $B8, $38, $04, $78, $EA, $42, $CD, $FA, $43, $CD, $47, $18, $C8
.db $E1, $C9, $0F, $01, $0C, $13, $02, $0C, $B4, $03, $0C, $39, $04, $0C, $46, $05
.db $0A, $94, $06, $0C, $5B, $07, $0C, $64, $08, $0A, $87, $09, $08, $FF, $21, $D7
.db $D0, $7E, $CB, $3F, $22, $7E, $CB, $1F, $32, $B6, $20, $02, $23, $34, $21, $15
.db $D0, $11, $23, $D0, $F0, $F3, $A7, $CA, $61, $78, $21, $E6, $CF, $11, $F4, $CF
.db $01, $EC, $CE, $2A, $02, $7E, $0B, $02, $1A, $0B, $02, $13, $1A, $0B, $02, $FA
.db $D8, $D0, $46, $80, $32, $EA, $ED, $CE, $FA, $D7, $D0, $46, $88, $22, $EA, $EE
.db $CE, $38, $0C, $3A, $47, $1A, $1B, $90, $2A, $47, $1A, $13, $98, $30, $0C, $1A
.db $32, $EA, $ED, $CE, $1B, $1A, $22, $EA, $EE, $CE, $13, $F0, $F3, $A7, $21, $5E
.db $C4, $3E, $01, $28, $04, $21, $CA, $C3, $AF, $EA, $94, $CF, $3E, $48, $CD, $6D
.db $3E, $3E, $00, $CD, $6D, $3E, $3E, $49, $CD, $6D, $3E, $21, $43, $4D, $06, $0F
.db $CD, $D6, $35, $21, $DC, $78, $F0, $F3, $A7, $FA, $D3, $CF, $28, $03, $FA, $CD
.db $CF, $FE, $08, $20, $03, $21, $E1, $78, $C3, $49, $3C, $17, $D5, $4A, $25, $50
.db $17, $EC, $4A, $25, $50, $21, $30, $D7, $CB, $F6, $3E, $04, $EA, $B6, $D0, $CD
.db $19, $37, $AF, $EA, $2C, $CC, $EA, $D3, $CC, $FA, $60, $CD, $CB, $5F, $20, $0B
.db $3E, $99, $CD, $B1, $23, $21, $22, $7B, $CD, $49, $3C, $FA, $D3, $CC, $EA, $26
.db $CC, $21, $60, $CD, $CB, $EE, $CD, $01, $37, $21, $A0, $C3, $06, $08, $0E, $0E
.db $CD, $22, $19, $CD, $29, $24, $21, $CA, $C3, $11, $F5, $7A, $CD, $55, $19, $21
.db $24, $CC, $3E, $02, $22, $3D, $22, $23, $23, $3E, $03, $22, $3E, $03, $22, $AF
.db $77, $21, $36, $CC, $22, $77, $EA, $2F, $CC, $21, $27, $7B, $CD, $49, $3C, $CD
.db $BE, $3A, $CB, $4F, $C2, $6D, $79, $CD, $EC, $3B, $FA, $26, $CC, $EA, $D3, $CC
.db $A7, $CA, $12, $7A, $3D, $CA, $95, $79, $3D, $CA, $8F, $7A, $FA, $60, $CD, $CB
.db $5F, $20, $08, $3E, $9A, $CD, $B1, $23, $CD, $48, $37, $21, $60, $CD, $CB, $AE
.db $CD, $01, $37, $AF, $EA, $36, $CC, $EA, $2C, $CC, $21, $30, $D7, $CB, $B6, $AF
.db $EA, $3C, $CC, $C9, $AF, $EA, $26, $CC, $EA, $36, $CC, $FA, $1D, $D3, $A7, $20
.db $09, $21, $3B, $7B, $CD, $49, $3C, $C3, $0C, $79, $21, $2C, $7B, $CD, $49, $3C
.db $21, $1D, $D3, $7D, $EA, $8B, $CF, $7C, $EA, $8C, $CF, $AF, $EA, $93, $CF, $3E
.db $03, $EA, $94, $CF, $CD, $E6, $2B, $DA, $0C, $79, $CD, $D9, $30, $3E, $01, $EA
.db $96, $CF, $FA, $24, $D1, $A7, $20, $0E, $21, $31, $7B, $CD, $49, $3C, $CD, $57
.db $2D, $FE, $FF, $CA, $AB, $79, $21, $3A, $D5, $CD, $CF, $2B, $38, $09, $21, $40
.db $7B, $CD, $49, $3C, $C3, $AB, $79, $21, $1D, $D3, $CD, $BB, $2B, $CD, $48, $37
.db $3E, $AB, $CD, $B1, $23, $CD, $48, $37, $21, $36, $7B, $CD, $49, $3C, $C3, $AB
.db $79, $AF, $EA, $26, $CC, $EA, $36, $CC, $FA, $3A, $D5, $A7, $20, $09, $21, $54
.db $7B, $CD, $49, $3C, $C3, $0C, $79, $21, $45, $7B, $CD, $49, $3C, $21, $3A, $D5
.db $7D, $EA, $8B, $CF, $7C, $EA, $8C, $CF, $AF, $EA, $93, $CF, $3E, $03, $EA, $94
.db $CF, $CD, $E6, $2B, $DA, $0C, $79, $CD, $D9, $30, $3E, $01, $EA, $96, $CF, $FA
.db $24, $D1, $A7, $20, $0E, $21, $4A, $7B, $CD, $49, $3C, $CD, $57, $2D, $FE, $FF
.db $CA, $28, $7A, $21, $1D, $D3, $CD, $CF, $2B, $38, $09, $21, $59, $7B, $CD, $49
.db $3C, $C3, $28, $7A, $21, $3A, $D5, $CD, $BB, $2B, $CD, $48, $37, $3E, $AB, $CD
.db $B1, $23, $CD, $48, $37, $21, $4F, $7B, $CD, $49, $3C, $C3, $28, $7A, $AF, $EA
.db $26, $CC, $EA, $36, $CC, $FA, $3A, $D5, $A7, $20, $09, $21, $54, $7B, $CD, $49
.db $3C, $C3, $0C, $79, $21, $5E, $7B, $CD, $49, $3C, $21, $3A, $D5, $7D, $EA, $8B
.db $CF, $7C, $EA, $8C, $CF, $AF, $EA, $93, $CF, $3E, $03, $EA, $94, $CF, $E5, $CD
.db $E6, $2B, $E1, $DA, $0C, $79, $E5, $CD, $D9, $30, $E1, $3E, $01, $EA, $96, $CF
.db $FA, $24, $D1, $A7, $20, $18, $FA, $91, $CF, $CD, $40, $30, $38, $10, $E5, $21
.db $63, $7B, $CD, $49, $3C, $CD, $57, $2D, $E1, $FE, $FF, $CA, $A5, $7A, $CD, $C4
.db $30, $C3, $A5, $7A, $96, $88, $93, $87, $83, $91, $80, $96, $7F, $88, $93, $84
.db $8C, $4E, $83, $84, $8F, $8E, $92, $88, $93, $7F, $88, $93, $84, $8C, $4E, $93
.db $8E, $92, $92, $7F, $88, $93, $84, $8C, $4E, $8B, $8E, $86, $7F, $8E, $85, $85
.db $50, $17, $A9, $5F, $22, $50, $17, $BE, $5F, $22, $50, $17, $D7, $5F, $22, $50
.db $17, $F5, $5F, $22, $50, $17, $00, $60, $22, $50, $17, $18, $60, $22, $50, $17
.db $36, $60, $22, $50, $17, $54, $60, $22, $50, $17, $73, $60, $22, $50, $17, $7E
.db $60, $22, $50, $17, $8F, $60, $22, $50, $17, $A9, $60, $22, $50, $17, $C9, $60
.db $22, $50, $17, $E9, $60, $22, $50, $21, $63, $D1, $FA, $95, $CF, $A7, $28, $03
.db $21, $80, $DA, $7E, $3D, $22, $FA, $92, $CF, $4F, $06, $00, $09, $5D, $54, $13
.db $1A, $13, $22, $3C, $20, $FA, $21, $73, $D2, $16, $05, $FA, $95, $CF, $A7, $28
.db $05, $21, $2A, $DD, $16, $13, $FA, $92, $CF, $CD, $7D, $3A, $FA, $92, $CF, $BA
.db $20, $03, $36, $FF, $C9, $54, $5D, $01, $0B, $00, $09, $01, $B5, $D2, $FA, $95
.db $CF, $A7, $28, $03, $01, $06, $DE, $CD, $13, $39, $21, $6B, $D1, $01, $2C, $00
.db $FA, $95, $CF, $A7, $28, $06, $21, $96, $DA, $01, $21, $00, $FA, $92, $CF, $CD
.db $87, $3A, $54, $5D, $FA, $95, $CF, $A7, $28, $09, $01, $21, $00, $09, $01, $2A
.db $DD, $18, $07, $01, $2C, $00, $09, $01, $73, $D2, $CD, $13, $39, $21, $B5, $D2
.db $FA, $95, $CF, $A7, $28, $03, $21, $06, $DE, $01, $0B, $00, $FA, $92, $CF, $CD
.db $87, $3A, $54, $5D, $01, $0B, $00, $09, $01, $F7, $D2, $FA, $95, $CF, $A7, $28
.db $03, $01, $E2, $DE, $C3, $13, $39, $21, $30, $D7, $CB, $F6, $3E, $3D, $CD, $6D
.db $3E, $21, $30, $D7, $CB, $B6, $CD, $71, $30, $0E, $0A, $CD, $39, $37, $3E, $3A
.db $CD, $6D, $3E, $FA, $1E, $D1, $3D, $4F, $06, $01, $21, $0A, $D3, $3E, $10, $CD
.db $6D, $3E, $3E, $01, $EA, $3C, $CC, $C9
.dsb 951, $00

