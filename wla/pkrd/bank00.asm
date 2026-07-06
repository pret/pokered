.BANK 0 SLOT 0
.ORG $0000

; Data from 0 to 13 (20 bytes)
.db $FF, $00, $00, $00, $00, $00, $00, $00, $FF, $00, $00, $00, $00, $00, $00, $00
.db $FF, $00, $00, $00

; Data from 14 to 1F (12 bytes)
RST10ToRST20Padding:
.db $00, $00, $00, $00, $FF, $00, $00, $00, $00, $00, $00, $00

RST20Vector:
	RST $38
; Data from 21 to 3F (31 bytes)
.db $00, $00, $00, $00, $00, $00, $00, $FF, $00, $00, $00, $00, $00, $00, $00, $FF
.db $00, $00, $00, $00, $00, $00, $00, $FF, $00, $00, $00, $00, $00, $00, $00

VBlankVector:
	JP VBlank

; Data from 43 to 4F (13 bytes)
.db $00, $00, $00, $00, $00, $FF, $00, $00, $00, $00, $00, $00, $00

TimerVector:
	JP Timer

; Data from 53 to 57 (5 bytes)
.db $00, $00, $00, $00, $00

SerialVector:
	JP Serial

; Data from 5B to 5F (5 bytes)
.db $00, $00, $00, $00, $00

JoypadVector:
	RETI

DisableLCD:
	XOR A
	LDH (rIF), A
	LDH A, (rIE)
	LD B, A
	RES 0, A
	LDH (rIE), A
DisableLCD.wait:
	LDH A, (rLY)
	CP $91
	JR NZ, DisableLCD.wait
	LDH A, (rLCDC)
	AND $7F
	LDH (rLCDC), A
	LD A, B
	LDH (rIE), A
	RET

EnableLCD:
	LDH A, (rLCDC)
	SET 7, A
	LDH (rLCDC), A
	RET

ClearSprites:
	XOR A
	LD HL, wShadowOAM
	LD B, $A0
ClearSprites.loop:
	LDI (HL), A
	DEC B
	JR NZ, ClearSprites.loop
	RET

HideSprites:
	LD A, $A0
	LD HL, wShadowOAM
	LD DE, $0004
	LD B, $28
HideSprites.loop:
	LD (HL), A
	ADD HL, DE
	DEC B
	JR NZ, HideSprites.loop
	RET

FarCopyData:
	LD (wBuffer), A
	LDH A, (hLoadedROMBank - $FF00)
	PUSH AF
	LD A, (wBuffer)
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	CALL CopyData
	POP AF
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	RET

CopyData:
	LDI A, (HL)
	LD (DE), A
	INC DE
	DEC BC
	LD A, C
	OR B
	JR NZ, CopyData
	RET

; Data from BE to BF (2 bytes)
.db $00, $00

; Data from C0 to FF (64 bytes)
PreStartPadding:
.dsb 64, $00

Start:
	NOP
; Entry jump to main startup routine
StartEntryJump:
	JP _Start

GBcartridgeHeader:
; Nintendo Logo: OK
.db $CE, $ED, $66, $66, $CC, $0D, $00, $0B, $03, $73, $00, $83, $00, $0C, $00, $0D
.db $00, $08, $11, $1F, $88, $89, $00, $0E, $DC, $CC, $6E, $E6, $DD, $DD, $D9, $99
.db $BB, $BB, $67, $63, $6E, $0E, $EC, $CC, $DD, $DC, $99, $9F, $BB, $B9, $33, $3E

.db "POKEMON RED" ; Title
.db $00, $00, $00, $00 ; Manufacturer Code / End of Title
.db $00      ; CGB Flag: Game does not support CGB functions.
.db "01"     ; New Licensee Code
.db $03      ; SGB Flag: Game supports SGB functions
.db $13      ; Cartridge Type: MBC3+RAM+BATTERY
.db $05      ; ROM Size: 1 MByte 	64 banks (only 63 banks used by MBC1)
.db $03      ; RAM Size: 32 KBytes (4 banks of 8KBytes each)
.db $01      ; Destination Code: Non-Japanese
.db $33      ; Old Licensee Code (Overriden by New Licensee Code)
.db $00      ; Mask ROM Version number
.db $20      ; Header Checksum: OK
.dw $E691    ; Global Checksum: OK

_Start:
	CP $11
	JR Z, _Start.cgb
	XOR A
	JR _Start.ok

_Start.cgb:
	LD A, $00
_Start.ok:
	LD (wOnCGB), A
	JP Init

; Data from 15F to 199 (59 bytes)
.db $3E, $20, $0E, $00, $E0, $00, $F0, $00, $F0, $00, $F0, $00, $F0, $00, $F0, $00
.db $F0, $00, $2F, $E6, $0F, $CB, $37, $47, $3E, $10, $E0, $00, $F0, $00, $F0, $00
.db $F0, $00, $F0, $00, $F0, $00, $F0, $00, $F0, $00, $F0, $00, $F0, $00, $F0, $00
.db $2F, $E6, $0F, $B0, $E0, $F8, $3E, $30, $E0, $00, $C9

Joypad:
	LDH A, (hLoadedROMBank - $FF00)
	PUSH AF
	LD A, $03
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	CALL _Joypad
	POP AF
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	RET

; Pointer Table from 1AE to 1AF (1 entries, indexed by wCurMap)
MapHeaderPointers:
.dw PalletTown_h

; Data from 1B0 to 1FE (79 bytes)
.db $57, $43, $54, $45, $4E, $47, $00, $40, $98, $49, $00, $40, $A7, $4B, $00, $40
.db $1E, $49, $A4, $49, $A4, $49, $C3, $40, $00, $40, $E6, $41, $90, $43, $81, $45
.db $00, $40, $00, $40, $2D, $41, $86, $46, $D4, $42, $BE, $44, $6D, $46, $0C, $48
.db $99, $49, $2C, $49, $DA, $4A, $20, $4B, $38, $4C, $78, $4E, $F1, $40, $FF, $4F
.db $00, $40, $3F, $43, $82, $46, $9B, $47, $5C, $41, $A4, $40, $2F, $5B, $02

	LD C, E
	LD D, C
	LD B, D
	LD H, D
	LD D, H
	LD B, B
	LD D, L
	LD A, L
	LD D, L
	SUB A
	LD C, B
	AND H
	LD E, (HL)
	LD A, E
	LD D, L
	POP HL
	LD E, (HL)
	RET Z
	LD D, L
	LD D, B
	LD D, (HL)
	LD BC, $EB51
	LD B, B
	DEC BC
	LD B, E
	LD A, E
	LD B, E
	RST $20	; RST20Vector
; Data from 21D to 39D (385 bytes)
.db $55, $A1, $4C, $3C, $56, $7B, $45, $BC, $59, $36, $5A, $FF, $5C, $79, $56, $EA
.db $56, $39, $46, $A7, $46, $30, $57, $89, $48, $C3, $52, $79, $56, $27, $5F, $9D
.db $56, $43, $62, $31, $60, $E3, $56, $E3, $56, $F4, $60, $20, $57, $5D, $57, $BB
.db $61, $7D, $62, $AE, $53, $D0, $44, $BA, $62, $00, $54, $AE, $65, $48, $54, $F8
.db $54, $5E, $67, $83, $49, $64, $5B, $D5, $49, $1A, $4A, $F0, $5A, $46, $5B, $59
.db $52, $93, $53, $26, $49, $22, $56, $A2, $56, $A7, $57, $89, $58, $6A, $59, $3F
.db $5B, $49, $5D, $A2, $62, $A2, $62, $A2, $62, $FE, $59, $A2, $62, $A2, $62, $A2
.db $62, $A2, $62, $A2, $62, $A2, $62, $A2, $62, $A2, $62, $A2, $62, $92, $64, $1A
.db $5F, $11, $5F, $3E, $5F, $7A, $4F, $E9, $60, $19, $42, $4A, $43, $C9, $43, $F4
.db $45, $88, $46, $2E, $47, $84, $47, $5F, $48, $2E, $5D, $AC, $48, $FE, $48, $B1
.db $4B, $5D, $50, $E4, $50, $45, $51, $02, $52, $5D, $52, $CE, $48, $20, $44, $E6
.db $44, $C0, $46, $EA, $47, $26, $49, $E3, $4A, $F9, $4C, $9C, $58, $20, $49, $A2
.db $59, $7C, $5D, $0C, $50, $57, $50, $A9, $50, $C1, $51, $31, $54, $D7, $56, $09
.db $63, $45, $64, $81, $65, $8D, $67, $64, $60, $70, $61, $A3, $42, $3E, $57, $80
.db $5B, $15, $5C, $7B, $5C, $25, $5D, $20, $5E, $72, $5E, $72, $5E, $4F, $5C, $B7
.db $5E, $65, $4C, $51, $4D, $01, $50, $D1, $5D, $FD, $53, $42, $54, $29, $55, $30
.db $5E, $F6, $55, $3E, $56, $B2, $56, $FF, $57, $EC, $65, $73, $64, $6A, $58, $69
.db $59, $DD, $47, $77, $66, $91, $57, $54, $55, $06, $5C, $62, $5F, $74, $49, $BE
.db $4B, $1B, $4E, $19, $52, $51, $54, $04, $57, $04, $57, $04, $57, $04, $57, $E5
.db $5C, $4F, $5F, $FF, $5C, $2B, $5F, $9D, $61, $55, $5B, $F8, $64, $CC, $5F, $E2
.db $61, $AD, $63, $5F, $58, $9F, $59, $A9, $61, $A6, $5B, $E1, $5C, $0B, $63, $1E
.db $5D, $69, $5D, $B4, $5D, $FF, $5D, $E4, $5E, $00, $4D, $06, $5A, $FD, $4D, $B2
.db $56, $DF, $5F, $AF, $57, $2D, $61, $EE, $60, $B4, $57, $E5, $5C, $E5, $5C, $04
.db $7D, $71, $7D, $E5, $5C, $E5, $5C, $E5, $5C, $E5, $5C, $6F, $61, $CA, $62, $21
.db $64

HandleMidJump:
	LD B, $1C
	LD HL, $487E
	JP Bankswitch

; Data from 3A6 to 3FE (89 bytes)
.db $3E, $FF, $EA, $6B, $CD, $CD, $41, $12, $06, $03, $21, $35, $43, $CD, $D6, $35
.db $21, $2C, $D7, $CB, $46, $28, $05, $3E, $03, $EA, $3C, $D1, $21, $2E, $D7, $CB
.db $6E, $CB, $AE, $CC, $E7, $12, $C4, $1F, $09, $21, $32, $D7, $7E, $E6, $18, $28
.db $0D, $CB, $9E, $06, $1C, $21, $10, $45, $CD, $D6, $35, $CD, $29, $24, $06, $03
.db $21, $8B, $43, $CD, $D6, $35, $21, $2D, $D7, $CB, $AE, $CD, $29, $24, $21, $26
.db $D1, $CB, $EE, $CB, $F6, $AF, $EA, $6B, $CD

OverworldLoop:
	CALL DelayFrame
OverworldLoopLessDelay:
	CALL DelayFrame
	CALL LoadGBPal
	LD A, (wMovementFlags)
	BIT 6, A
	CALL NZ, HandleMidJump
	LD A, (wWalkCounter)
	AND A
	JP NZ, OverworldLoopLessDelay.moveAhead
	CALL JoypadOverworld
	LD B, $07
	LD HL, $6988
	CALL Bankswitch
; Data from 422 to 5B4 (403 bytes)
.db $FA, $46, $DA, $A7, $C2, $3C, $07, $21, $2D, $D7, $CB, $5E, $CB, $9E, $C2, $3C
.db $07, $FA, $32, $D7, $E6, $18, $C2, $65, $09, $FA, $59, $D0, $A7, $C2, $2C, $06
.db $FA, $30, $D7, $CB, $7F, $28, $04, $F0, $B4, $18, $02, $F0, $B3, $CB, $5F, $28
.db $06, $AF, $E0, $8C, $C3, $7D, $04, $CB, $47, $CA, $EB, $04, $FA, $30, $D7, $CB
.db $57, $C2, $CD, $04, $CD, $FD, $30, $20, $58, $CD, $B5, $3E, $F0, $EB, $A7, $CA
.db $FF, $03, $CD, $23, $0B, $F0, $8C, $A7, $CA, $FF, $03, $3E, $35, $CD, $6D, $3E
.db $CD, $29, $24, $FA, $60, $CD, $CB, $57, $20, $37, $CB, $47, $20, $33, $FA, $5C
.db $C4, $EA, $0E, $CF, $CD, $20, $29, $FA, $47, $CC, $A7, $28, $24, $3D, $3E, $00
.db $EA, $47, $CC, $28, $19, $3E, $52, $CD, $6D, $3E, $FA, $5E, $D3, $EA, $1A, $D7
.db $CD, $CE, $62, $FA, $5E, $D3, $CD, $BC, $12, $21, $67, $D3, $CB, $FE, $C3, $A6
.db $03, $FA, $59, $D0, $A7, $C2, $2C, $06, $C3, $FF, $03, $21, $60, $CD, $CB, $96
.db $CD, $29, $24, $3E, $01, $EA, $4B, $CC, $FA, $28, $D5, $A7, $CA, $FF, $03, $EA
.db $29, $D5, $AF, $EA, $28, $D5, $C3, $FF, $03, $F0, $B4, $CB, $7F, $28, $09, $3E
.db $01, $EA, $03, $C1, $3E, $04, $18, $23, $CB, $77, $28, $09, $3E, $FF, $EA, $03
.db $C1, $3E, $08, $18, $16, $CB, $6F, $28, $09, $3E, $FF, $EA, $05, $C1, $3E, $02
.db $18, $09, $CB, $67, $28, $B5, $3E, $01, $EA, $05, $C1, $EA, $2A, $D5, $FA, $30
.db $D7, $CB, $7F, $20, $57, $FA, $4B, $CC, $A7, $28, $51, $FA, $2A, $D5, $47, $FA
.db $29, $D5, $B8, $28, $47, $CB, $37, $B0, $FE, $48, $20, $07, $3E, $02, $EA, $28
.db $D5, $18, $1F, $FE, $84, $20, $07, $3E, $01, $EA, $28, $D5, $18, $14, $FE, $12
.db $20, $07, $3E, $04, $EA, $28, $D5, $18, $09, $FE, $21, $20, $05, $3E, $08, $EA
.db $28, $D5, $21, $60, $CD, $CB, $D6, $21, $4B, $CC, $35, $20, $F5, $FA, $2A, $D5
.db $EA, $28, $D5, $CD, $83, $06, $DA, $37, $06, $C3, $FF, $03, $FA, $2A, $D5, $EA
.db $28, $D5, $CD, $29, $24, $FA, $00, $D7, $FE, $02, $28, $1A, $CD, $D1, $0B, $30
.db $1B, $E5, $21, $36, $D7, $CB, $56, $E1, $CA, $FF, $03, $E5, $CD, $E9, $08, $E1
.db $DA, $06, $07, $C3, $FF, $03, $CD, $B7, $0F, $DA, $FF, $03, $3E, $08, $EA, $C5
.db $CF, $18, $12

OverworldLoopLessDelay.moveAhead:
	LD A, (wMovementFlags)
	BIT 7, A
	JR Z, OverworldLoopLessDelay.noSpinning
; Data from 5BC to 5BF (4 bytes)
.db $06, $11, $21, $D7

; 2nd entry of Pointer Table from 17B27 (indexed by wSprite01StateData2ImageBaseOffset)
; Data from 5C0 to 5C3 (4 bytes)
OverworldLoopLessDelay_moveAhead_inline_5C0:
.db $4F, $CD, $D6, $35

OverworldLoopLessDelay.noSpinning:
	CALL UpdateSprites
	LD HL, wMiscFlags
	RES 2, (HL)
	LD A, (wWalkBikeSurfState)
	DEC A
	JR NZ, OverworldLoopLessDelay.normalPlayerSpriteAdvancement
; Data from 5D2 to 5DB (10 bytes)
.db $FA, $36, $D7, $CB, $77, $20, $03, $CD, $A0, $06

OverworldLoopLessDelay.normalPlayerSpriteAdvancement:
	CALL AdvancePlayerSprite
	LD A, (wWalkCounter)
	AND A
	JP NZ, CheckMapConnections
; Data from 5E6 to 6BF (218 bytes)
.db $FA, $30, $D7, $CB, $7F, $20, $16, $21, $3B, $D1, $35, $FA, $2C, $D7, $CB, $47
.db $28, $0B, $21, $3C, $D1, $35, $20, $05, $21, $2C, $D7, $CB, $86, $FA, $90, $D7
.db $CB, $7F, $28, $0F, $06, $07, $21, $97, $69, $CD, $D6, $35, $FA, $46, $DA, $A7
.db $C2, $3C, $07, $FA, $57, $D0, $A7, $C2, $B4, $06, $3E, $13, $CD, $6D, $3E, $FA
.db $2D, $D1, $A7, $C2, $31, $09, $CD, $83, $06, $21, $36, $D7, $CB, $96, $D2, $B4
.db $06, $21, $2D, $D7, $CB, $B6, $21, $33, $D7, $CB, $9E, $21, $26, $D1, $CB, $EE
.db $CB, $F6, $AF, $E0, $B4, $FA, $5E, $D3, $FE, $A6, $20, $05, $21, $9B, $D7, $CB
.db $FE, $21, $2E, $D7, $CB, $EE, $FA, $5E, $D3, $FE, $28, $CA, $70, $06, $21, $83
.db $4A, $06, $0F, $CD, $D6, $35, $7A, $A7, $28, $08, $0E, $0A, $CD, $39, $37, $C3
.db $A6, $03, $3E, $FF, $EA, $57, $D0, $CD, $1B, $10, $C3, $31, $09, $FA, $2D, $D7
.db $CB, $67, $20, $14, $CD, $FD, $30, $20, $0F, $FA, $2E, $D7, $CB, $67, $20, $08
.db $06, $0F, $21, $12, $6F, $C3, $D6, $35, $A7, $C9, $FA, $57, $CC, $A7, $C0, $FA
.db $5E, $D3, $FE, $1C, $20, $05, $F0, $B4, $E6, $70, $C0, $C3, $27, $0D, $FA, $AE
.db $D3, $A7, $CA, $BA, $07, $FA, $AE, $D3, $06, $00

CheckWarpsNoCollision_WarpCountLoaded:
	LD C, A
	LD A, (wYCoord)
	LD D, A
	LD A, (wXCoord)
	LD E, A
	LD HL, wWarpEntries
CheckWarpsNoCollisionLoop:
	LDI A, (HL)
	CP D
	JR NZ, CheckWarpsNoCollisionRetry1
	LDI A, (HL)
	CP E
	JR NZ, CheckWarpsNoCollisionRetry2
; Data from 6D4 to 72E (91 bytes)
.db $E5, $C5, $21, $36, $D7, $CB, $D6, $06, $03, $21, $9D, $44, $CD, $D6, $35, $C1
.db $E1, $38, $4E, $E5, $C5, $CD, $E9, $08, $C1, $E1, $30, $40, $FA, $33, $D7, $CB
.db $57, $20, $3E, $D5, $C5, $CD, $9A, $01, $C1, $D1, $F0, $B4, $E6, $F0, $28, $2C
.db $18, $2F, $FA, $AE, $D3, $4F, $21, $AF, $D3, $2A, $47, $FA, $61, $D3, $B8, $20
.db $11, $2A, $47, $FA, $62, $D3, $B8, $20, $0A, $2A, $EA, $2F, $D4, $7E, $E0, $8B
.db $18, $16, $23, $23, $23, $0D, $20, $E1, $C3, $FF, $03

CheckWarpsNoCollisionRetry1:
	INC HL
CheckWarpsNoCollisionRetry2:
	INC HL
	INC HL
	JP ContinueCheckWarpsNoCollisionLoop

; Data from 735 to 7B4 (128 bytes)
.db $2A, $EA, $2F, $D4, $2A, $E0, $8B, $FA, $AE, $D3, $91, $EA, $3B, $D7, $FA, $5E
.db $D3, $EA, $3C, $D7, $CD, $E1, $08, $20, $22, $FA, $5E, $D3, $EA, $65, $D3, $FA
.db $69, $D3, $EA, $66, $D3, $F0, $8B, $EA, $5E, $D3, $FE, $52, $20, $08, $3E, $06
.db $EA, $5D, $D3, $CD, $EF, $20, $CD, $C9, $08, $18, $3A, $F0, $8B, $FE, $FF, $28
.db $27, $EA, $5E, $D3, $06, $1C, $21, $87, $47, $CD, $D6, $35, $FA, $5B, $CD, $3D
.db $20, $0A, $21, $32, $D7, $CB, $DE, $CD, $8F, $09, $18, $03, $CD, $C9, $08, $21
.db $36, $D7, $CB, $86, $CB, $8E, $18, $0D, $FA, $65, $D3, $EA, $5E, $D3, $CD, $C9
.db $08, $AF, $EA, $5D, $D3, $21, $36, $D7, $CB, $C6, $CD, $DA, $12, $C3, $A6, $03

ContinueCheckWarpsNoCollisionLoop:
	INC B
	DEC C
	JP NZ, CheckWarpsNoCollisionLoop
CheckMapConnections:
	LD A, (wXCoord)
	CP $FF
	JR NZ, CheckMapConnections.checkEastMap
	LD A, (wWestConnectedMap)
	LD (wCurMap), A
	LD A, (wWestConnectedMapXAlignment)
	LD (wXCoord), A
	LD A, (wYCoord)
	LD C, A
	LD A, (wWestConnectedMapYAlignment)
	ADD C
	LD C, A
	LD (wYCoord), A
	LD A, (wWestConnectedMapViewPointer)
	LD L, A
	LD A, (wWestConnectedMapViewPointer + $1)
	LD H, A
	SRL C
	JR Z, CheckMapConnections.savePointer1
; Data from 7E5 to 7F2 (14 bytes)
.db $FA, $8D, $D3, $C6, $06, $5F, $16, $00, $06, $00, $19, $0D, $20, $F2

CheckMapConnections.savePointer1:
	LD A, L
	LD (wCurrentTileBlockMapViewPointer), A
	LD A, H
	LD (wCurrentTileBlockMapViewPointer + $1), A
	JP CheckMapConnections.loadNewMap

CheckMapConnections.checkEastMap:
	LD B, A
	LD A, (wCurrentMapWidth2)
	CP B
	JR NZ, CheckMapConnections.checkNorthMap
; Data from 805 to 841 (61 bytes)
.db $FA, $92, $D3, $EA, $5E, $D3, $FA, $9A, $D3, $EA, $62, $D3, $FA, $61, $D3, $4F
.db $FA, $99, $D3, $81, $4F, $EA, $61, $D3, $FA, $9B, $D3, $6F, $FA, $9C, $D3, $67
.db $CB, $39, $28, $0E, $FA, $98, $D3, $C6, $06, $5F, $16, $00, $06, $00, $19, $0D
.db $20, $F2, $7D, $EA, $5F, $D3, $7C, $EA, $60, $D3, $C3, $AD, $08

CheckMapConnections.checkNorthMap:
	LD A, (wYCoord)
	CP $FF
	JR NZ, CheckMapConnections.checkSouthMap
; Data from 849 to 878 (48 bytes)
.db $FA, $71, $D3, $EA, $5E, $D3, $FA, $78, $D3, $EA, $61, $D3, $FA, $62, $D3, $4F
.db $FA, $79, $D3, $81, $4F, $EA, $62, $D3, $FA, $7A, $D3, $6F, $FA, $7B, $D3, $67
.db $06, $00, $CB, $39, $09, $7D, $EA, $5F, $D3, $7C, $EA, $60, $D3, $C3, $AD, $08

CheckMapConnections.checkSouthMap:
	LD B, A
	LD A, (wCurrentMapHeight2)
	CP B
	JR NZ, CheckMapConnections.didNotEnterConnectedMap
; Data from 880 to 8AC (45 bytes)
.db $FA, $7C, $D3, $EA, $5E, $D3, $FA, $83, $D3, $EA, $61, $D3, $FA, $62, $D3, $4F
.db $FA, $84, $D3, $81, $4F, $EA, $62, $D3, $FA, $85, $D3, $6F, $FA, $86, $D3, $67
.db $06, $00, $CB, $39, $09, $7D, $EA, $5F, $D3, $7C, $EA, $60, $D3

CheckMapConnections.loadNewMap:
	CALL LoadMapHeader
	CALL PlayDefaultMusicFadeOutCurrent
	LD B, $09
	CALL RunPaletteCommand
	LD B, $05
	LD HL, $785B
	CALL Bankswitch
	CALL LoadTileBlockMap
	JP OverworldLoopLessDelay

CheckMapConnections.didNotEnterConnectedMap:
	JP OverworldLoop

; Data from 8C9 to 996 (206 bytes)
.db $FA, $48, $C4, $FE, $0B, $20, $04, $3E, $AD, $18, $02, $3E, $B5, $CD, $B1, $23
.db $FA, $5D, $D3, $A7, $C0, $C3, $EF, $20, $FA, $67, $D3, $A7, $C8, $FE, $17, $C9
.db $FA, $5E, $D3, $FE, $61, $28, $22, $FE, $C7, $28, $23, $FE, $C8, $28, $1F, $FE
.db $CA, $28, $1B, $FE, $52, $28, $17, $FA, $67, $D3, $A7, $28, $11, $FE, $0D, $28
.db $0D, $FE, $0E, $28, $09, $FE, $17, $28, $05, $21, $FF, $43, $18, $03, $21, $4E
.db $44, $06, $03, $C3, $D6, $35, $06, $03, $21, $5F, $43, $CD, $D6, $35, $FA, $5D
.db $D3, $A7, $CA, $F6, $20, $C3, $BA, $20, $CD, $EF, $20, $3E, $08, $CD, $51, $09
.db $21, $2E, $D7, $CB, $AE, $3E, $01, $E0, $B8, $EA, $00, $20, $CD, $B0, $40, $CD
.db $CE, $62, $CD, $12, $23, $C3, $5F, $5D, $EA, $C7, $CF, $3E, $FF, $EA, $EE, $C0
.db $CD, $B1, $23, $FA, $C7, $CF, $A7, $20, $FA, $C3, $0E, $20, $CD, $29, $24, $CD
.db $D7, $3D, $AF, $EA, $0B, $CF, $EA, $00, $D7, $EA, $57, $D0, $EA, $5D, $D3, $21
.db $32, $D7, $CB, $D6, $CB, $AE, $CD, $8F, $09, $3E, $01, $E0, $B8, $EA, $00, $20
.db $CD, $CE, $62, $C3, $5F, $5D, $06, $1C, $21, $BA, $45, $C3, $D6, $35

LoadPlayerSpriteGraphics:
	LD A, (wWalkBikeSurfState)
	DEC A
	JR Z, LoadPlayerSpriteGraphics.ridingBike
	LDH A, (hTileAnimations - $FF00)
	AND A
	JR NZ, LoadPlayerSpriteGraphics.determineGraphics
	JR LoadPlayerSpriteGraphics.startWalking

LoadPlayerSpriteGraphics.ridingBike:
	CALL IsBikeRidingAllowed
	JR C, LoadPlayerSpriteGraphics.determineGraphics
LoadPlayerSpriteGraphics.startWalking:
	XOR A
	LD (wWalkBikeSurfState), A
	LD (wWalkBikeSurfStateCopy), A
	JP LoadWalkingPlayerSpriteGraphics

LoadPlayerSpriteGraphics.determineGraphics:
	LD A, (wWalkBikeSurfState)
	AND A
	JP Z, LoadWalkingPlayerSpriteGraphics
	DEC A
	JP Z, LoadBikePlayerSpriteGraphics
	DEC A
	JP Z, LoadSurfingPlayerSpriteGraphics
	JP LoadWalkingPlayerSpriteGraphics

IsBikeRidingAllowed:
	LD A, (wCurMap)
	CP $22
	JR Z, IsBikeRidingAllowed.allowed
	CP $09
	JR Z, IsBikeRidingAllowed.allowed
	LD A, (wCurMapHeader)
	LD B, A
	LD HL, BikeRidingTilesets
IsBikeRidingAllowed.loop:
	LDI A, (HL)
	CP B
	JR Z, IsBikeRidingAllowed.allowed
	INC A
	JR NZ, IsBikeRidingAllowed.loop
	AND A
	RET

IsBikeRidingAllowed.allowed:
	SCF
	RET

; Data from 9E2 to 9E7 (6 bytes)
BikeRidingTilesets:
.db $00, $03, $0B, $0E, $11, $FF

LoadTilesetTilePatternData:
	LD A, (wTilesetGfxPtr)
	LD L, A
	LD A, (wTilesetGfxPtr + $1)
	LD H, A
	LD DE, $9000
	LD BC, $0600
	LD A, (wTilesetBank)
	JP FarCopyData2

LoadTileBlockMap:
	LD HL, wOverworldMap
	LD A, (wMapBackgroundTile)
	LD D, A
	LD BC, $0514
LoadTileBlockMap.backgroundTileLoop:
	LD A, D
	LDI (HL), A
	DEC BC
	LD A, C
	OR B
	JR NZ, LoadTileBlockMap.backgroundTileLoop
	LD HL, $C6E8
	LD A, (wCurMapWidth)
	LDH (hDownArrowBlinkCount2 - $FF00), A
	ADD $06
	LDH (hBaseTileID - $FF00), A
	LD B, $00
	LD C, A
	ADD HL, BC
	ADD HL, BC
	ADD HL, BC
	LD C, $03
	ADD HL, BC
	LD A, (wCurMapDataPtr)
	LD E, A
	LD A, (wCurMapDataPtr + $1)
	LD D, A
	LD A, (wCurMapHeight)
	LD B, A
LoadTileBlockMap.rowLoop:
	PUSH HL
	LDH A, (hDownArrowBlinkCount2 - $FF00)
	LD C, A
LoadTileBlockMap.rowInnerLoop:
	LD A, (DE)
	INC DE
	LDI (HL), A
	DEC C
	JR NZ, LoadTileBlockMap.rowInnerLoop
	POP HL
	LDH A, (hBaseTileID - $FF00)
	ADD L
	LD L, A
	JR NC, LoadTileBlockMap.noCarry
	INC H
LoadTileBlockMap.noCarry:
	DEC B
	JR NZ, LoadTileBlockMap.rowLoop
	LD A, (wCurMapHeaderEnd)
	CP $FF
	JR Z, LoadTileBlockMap.southConnection
	CALL SwitchToMapRomBank
	LD A, (wNorthConnectionStripSrc)
	LD L, A
	LD A, (wNorthConnectionStripSrc + $1)
	LD H, A
	LD A, (wNorthConnectionStripDest)
	LD E, A
	LD A, (wNorthConnectionStripDest + $1)
	LD D, A
	LD A, (wNorthConnectionStripLength)
	LDH (hBaseTileID - $FF00), A
	LD A, (wNorthConnectedMapWidth)
	LDH (hDownArrowBlinkCount2 - $FF00), A
	CALL LoadNorthSouthConnectionsTileMap
LoadTileBlockMap.southConnection:
	LD A, (wSouthConnectedMap)
	CP $FF
	JR Z, LoadTileBlockMap.westConnection
	CALL SwitchToMapRomBank
	LD A, (wSouthConnectionStripSrc)
	LD L, A
	LD A, (wSouthConnectionStripSrc + $1)
	LD H, A
	LD A, (wSouthConnectionStripDest)
	LD E, A
	LD A, (wSouthConnectionStripDest + $1)
	LD D, A
	LD A, (wSouthConnectionStripLength)
	LDH (hBaseTileID - $FF00), A
	LD A, (wSouthConnectedMapWidth)
	LDH (hDownArrowBlinkCount2 - $FF00), A
	CALL LoadNorthSouthConnectionsTileMap
LoadTileBlockMap.westConnection:
	LD A, (wWestConnectedMap)
	CP $FF
	JR Z, LoadTileBlockMap.eastConnection
	CALL SwitchToMapRomBank
	LD A, (wWestConnectionStripSrc)
	LD L, A
	LD A, (wWestConnectionStripSrc + $1)
	LD H, A
	LD A, (wWestConnectionStripDest)
	LD E, A
	LD A, (wWestConnectionStripDest + $1)
	LD D, A
	LD A, (wWestConnectionStripLength)
	LD B, A
	LD A, (wWestConnectedMapWidth)
	LDH (hBaseTileID - $FF00), A
	CALL LoadEastWestConnectionsTileMap
LoadTileBlockMap.eastConnection:
	LD A, (wEastConnectedMap)
	CP $FF
	JR Z, LoadTileBlockMap.done
	CALL SwitchToMapRomBank
	LD A, (wEastConnectionStripSrc)
	LD L, A
	LD A, (wEastConnectionStripSrc + $1)
	LD H, A
	LD A, (wEastConnectionStripDest)
	LD E, A
	LD A, (wEastConnectionStripDest + $1)
	LD D, A
	LD A, (wEastConnectionStripLength)
	LD B, A
	LD A, (wEastConnectedMapWidth)
	LDH (hBaseTileID - $FF00), A
	CALL LoadEastWestConnectionsTileMap
LoadTileBlockMap.done:
	RET

LoadNorthSouthConnectionsTileMap:
	LD C, $03
LoadNorthSouthConnectionsTileMap.loop:
	PUSH DE
	PUSH HL
	LDH A, (hBaseTileID - $FF00)
	LD B, A
LoadNorthSouthConnectionsTileMap.innerLoop:
	LDI A, (HL)
	LD (DE), A
	INC DE
	DEC B
	JR NZ, LoadNorthSouthConnectionsTileMap.innerLoop
	POP HL
	POP DE
	LDH A, (hDownArrowBlinkCount2 - $FF00)
	ADD L
	LD L, A
	JR NC, LoadNorthSouthConnectionsTileMap.noCarry1
	INC H
LoadNorthSouthConnectionsTileMap.noCarry1:
	LD A, (wCurMapWidth)
	ADD $06
	ADD E
	LD E, A
	JR NC, LoadNorthSouthConnectionsTileMap.noCarry2
	INC D
LoadNorthSouthConnectionsTileMap.noCarry2:
	DEC C
	JR NZ, LoadNorthSouthConnectionsTileMap.loop
	RET

LoadEastWestConnectionsTileMap:
	PUSH HL
	PUSH DE
	LD C, $03
LoadEastWestConnectionsTileMap.innerLoop:
	LDI A, (HL)
	LD (DE), A
	INC DE
	DEC C
	JR NZ, LoadEastWestConnectionsTileMap.innerLoop
	POP DE
	POP HL
	LDH A, (hBaseTileID - $FF00)
	ADD L
	LD L, A
	JR NC, LoadEastWestConnectionsTileMap.noCarry1
	INC H
LoadEastWestConnectionsTileMap.noCarry1:
	LD A, (wCurMapWidth)
	ADD $06
	ADD E
	LD E, A
	JR NC, LoadEastWestConnectionsTileMap.noCarry2
	INC D
LoadEastWestConnectionsTileMap.noCarry2:
	DEC B
	JR NZ, LoadEastWestConnectionsTileMap
	RET

; Data from B23 to B6A (72 bytes)
.db $AF, $E0, $8C, $FA, $B0, $D4, $A7, $28, $2C, $3E, $35, $CD, $6D, $3E, $21, $B1
.db $D4, $FA, $B0, $D4, $47, $0E, $00, $0C, $2A, $BA, $28, $03, $23, $18, $13, $2A
.db $BB, $20, $0F, $E5, $C5, $21, $D1, $D4, $06, $00, $0D, $09, $7E, $E0, $8C, $C1
.db $E1, $C9, $05, $20, $E2, $3E, $35, $CD, $6D, $3E, $21, $32, $D5, $06, $03, $16
.db $20, $2A, $B9, $28, $05, $05, $20, $F9

IsSpriteInFrontOfPlayer:
	LD D, $10
	LD BC, $3C40
	LD A, (wSpritePlayerStateData1FacingDirection)
	CP $04
	JR NZ, IsSpriteInFrontOfPlayer2.checkIfPlayerFacingDown
	LD A, B
	SUB D
	LD B, A
	LD A, $08
	JR IsSpriteInFrontOfPlayer2.doneCheckingDirection

IsSpriteInFrontOfPlayer2.checkIfPlayerFacingDown:
	CP $00
	JR NZ, IsSpriteInFrontOfPlayer2.checkIfPlayerFacingRight
	LD A, B
	ADD D
	LD B, A
	LD A, $04
	JR IsSpriteInFrontOfPlayer2.doneCheckingDirection

IsSpriteInFrontOfPlayer2.checkIfPlayerFacingRight:
	CP $0C
	JR NZ, IsSpriteInFrontOfPlayer2.playerFacingLeft
	LD A, C
	ADD D
	LD C, A
	LD A, $01
	JR IsSpriteInFrontOfPlayer2.doneCheckingDirection

IsSpriteInFrontOfPlayer2.playerFacingLeft:
	LD A, C
	SUB D
	LD C, A
	LD A, $02
IsSpriteInFrontOfPlayer2.doneCheckingDirection:
	LD (wPlayerDirection), A
	LD A, (wNumSprites)
	AND A
	RET Z
	LD HL, wSprite01StateData1
	LD D, A
	LD E, $01
IsSpriteInFrontOfPlayer2.spriteLoop:
	PUSH HL
	LDI A, (HL)
	AND A
	JR Z, IsSpriteInFrontOfPlayer2.nextSprite
	INC L
	LDI A, (HL)
	INC A
	JR Z, IsSpriteInFrontOfPlayer2.nextSprite
	INC L
	LDI A, (HL)
	CP B
	JR NZ, IsSpriteInFrontOfPlayer2.nextSprite
	INC L
	LD A, (HL)
	CP C
	JR Z, IsSpriteInFrontOfPlayer2.foundSpriteInFrontOfPlayer
IsSpriteInFrontOfPlayer2.nextSprite:
	POP HL
	LD A, L
	ADD $10
	LD L, A
	INC E
	DEC D
	JR NZ, IsSpriteInFrontOfPlayer2.spriteLoop
	RET

IsSpriteInFrontOfPlayer2.foundSpriteInFrontOfPlayer:
	POP HL
	LD A, L
	AND $F0
	INC A
	LD L, A
	SET 7, (HL)
	LD A, E
	LDH (hDownArrowBlinkCount2 - $FF00), A
	RET

; Data from BD1 to CA9 (217 bytes)
.db $FA, $36, $D7, $CB, $77, $20, $36, $FA, $38, $CD, $A7, $20, $30, $FA, $2A, $D5
.db $57, $FA, $0C, $C1, $A2, $20, $18, $AF, $E0, $8C, $CD, $6B, $0B, $F0, $8C, $A7
.db $20, $0D, $21, $7E, $0C, $CD, $2A, $0C, $38, $05, $CD, $10, $0C, $30, $0E, $FA
.db $2A, $C0, $FE, $B4, $28, $05, $3E, $B4, $CD, $B1, $23, $37, $C9, $A7, $C9, $3E
.db $35, $CD, $6D, $3E, $FA, $C6, $CF, $4F, $21, $30, $D5, $2A, $66, $6F, $2A, $FE
.db $FF, $28, $04, $B9, $C8, $18, $F7, $37, $C9, $E5, $3E, $35, $CD, $6D, $3E, $D5
.db $C5, $06, $06, $21, $72, $66, $CD, $D6, $35, $C1, $D1, $E1, $A7, $FA, $36, $D7
.db $CB, $77, $C0, $FA, $5C, $C4, $EA, $0E, $CF, $FA, $C6, $CF, $4F, $FA, $67, $D3
.db $47, $2A, $FE, $FF, $28, $25, $B8, $28, $04, $23, $23, $18, $F0, $FA, $0E, $CF
.db $47, $7E, $B8, $28, $07, $23, $7E, $B8, $28, $09, $18, $EE, $23, $7E, $B9, $28
.db $08, $18, $DA, $2B, $2A, $B9, $23, $20, $D4, $37, $C9, $A7, $C9, $11, $20, $05
.db $11, $41, $05, $03, $30, $2E, $11, $2A, $05, $11, $05, $21, $03, $52, $2E, $03
.db $55, $2E, $03, $56, $2E, $03, $20, $2E, $03, $5E, $2E, $03, $5F, $2E, $FF, $03
.db $14, $2E, $03, $48, $2E, $11, $14, $05, $FF

LoadCurrentMapView:
	LDH A, (hLoadedROMBank - $FF00)
	PUSH AF
	LD A, (wTilesetBank)
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	LD A, (wCurrentTileBlockMapViewPointer)
	LD E, A
	LD A, (wCurrentTileBlockMapViewPointer + $1)
	LD D, A
	LD HL, wSerialPartyMonsPatchList
	LD B, $05
LoadCurrentMapView.rowLoop:
	PUSH HL
	PUSH DE
	LD C, $06
LoadCurrentMapView.rowInnerLoop:
	PUSH BC
	PUSH DE
	PUSH HL
	LD A, (DE)
	LD C, A
	CALL DrawTileBlock
	POP HL
	POP DE
	POP BC
	INC HL
	INC HL
	INC HL
	INC HL
	INC DE
	DEC C
	JR NZ, LoadCurrentMapView.rowInnerLoop
	POP DE
	LD A, (wCurMapWidth)
	ADD $06
	ADD E
	LD E, A
	JR NC, LoadCurrentMapView.noCarry
	INC D
LoadCurrentMapView.noCarry:
	POP HL
	LD A, $60
	ADD L
	LD L, A
	JR NC, LoadCurrentMapView.noCarry2
	INC H
LoadCurrentMapView.noCarry2:
	DEC B
	JR NZ, LoadCurrentMapView.rowLoop
	LD HL, wSerialPartyMonsPatchList
	LD BC, $0000
	LD A, (wYBlockCoord)
	AND A
	JR Z, LoadCurrentMapView.adjustForXCoordWithinTileBlock
	LD BC, $0030
	ADD HL, BC
LoadCurrentMapView.adjustForXCoordWithinTileBlock:
	LD A, (wXBlockCoord)
	AND A
	JR Z, LoadCurrentMapView.copyToVisibleAreaBuffer
	LD BC, $0002
	ADD HL, BC
LoadCurrentMapView.copyToVisibleAreaBuffer:
	LD DE, wShadowOAMEnd
	LD B, $12
LoadCurrentMapView.rowLoop2:
	LD C, $14
LoadCurrentMapView.rowInnerLoop2:
	LDI A, (HL)
	LD (DE), A
	INC DE
	DEC C
	JR NZ, LoadCurrentMapView.rowInnerLoop2
	LD A, $04
	ADD L
	LD L, A
	JR NC, LoadCurrentMapView.noCarry3
	INC H
LoadCurrentMapView.noCarry3:
	DEC B
	JR NZ, LoadCurrentMapView.rowLoop2
	POP AF
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	RET

AdvancePlayerSprite:
	LD A, (wSpritePlayerStateData1YStepVector)
	LD B, A
	LD A, (wSpritePlayerStateData1XStepVector)
	LD C, A
	LD HL, wWalkCounter
	DEC (HL)
	JR NZ, AdvancePlayerSprite.afterUpdateMapCoords
	LD A, (wYCoord)
	ADD B
	LD (wYCoord), A
	LD A, (wXCoord)
	ADD C
	LD (wXCoord), A
AdvancePlayerSprite.afterUpdateMapCoords:
	LD A, (wWalkCounter)
	CP $07
	JP NZ, AdvancePlayerSprite.scrollBackgroundAndSprites
	LD A, C
	CP $01
	JR NZ, AdvancePlayerSprite.checkIfMovingWest
	LD A, (wMapViewVRAMPointer)
	LD E, A
	AND $E0
	LD D, A
	LD A, E
	ADD $02
	AND $1F
	OR D
	LD (wMapViewVRAMPointer), A
	JR AdvancePlayerSprite.adjustXCoordWithinBlock

AdvancePlayerSprite.checkIfMovingWest:
	CP $FF
	JR NZ, AdvancePlayerSprite.checkIfMovingSouth
	LD A, (wMapViewVRAMPointer)
	LD E, A
	AND $E0
	LD D, A
	LD A, E
	SUB $02
	AND $1F
	OR D
	LD (wMapViewVRAMPointer), A
	JR AdvancePlayerSprite.adjustXCoordWithinBlock

AdvancePlayerSprite.checkIfMovingSouth:
	LD A, B
	CP $01
	JR NZ, AdvancePlayerSprite.checkIfMovingNorth
	LD A, (wMapViewVRAMPointer)
	ADD $40
	LD (wMapViewVRAMPointer), A
	JR NC, AdvancePlayerSprite.adjustXCoordWithinBlock
	LD A, (wMapViewVRAMPointer + $1)
	INC A
	AND $03
	OR $98
	LD (wMapViewVRAMPointer + $1), A
	JR AdvancePlayerSprite.adjustXCoordWithinBlock

AdvancePlayerSprite.checkIfMovingNorth:
	CP $FF
	JR NZ, AdvancePlayerSprite.adjustXCoordWithinBlock
	LD A, (wMapViewVRAMPointer)
	SUB $40
	LD (wMapViewVRAMPointer), A
	JR NC, AdvancePlayerSprite.adjustXCoordWithinBlock
	LD A, (wMapViewVRAMPointer + $1)
	DEC A
	AND $03
	OR $98
	LD (wMapViewVRAMPointer + $1), A
AdvancePlayerSprite.adjustXCoordWithinBlock:
	LD A, C
	AND A
	JR Z, AdvancePlayerSprite.pointlessJump
AdvancePlayerSprite.pointlessJump:
	LD HL, wXBlockCoord
	LD A, (HL)
	ADD C
	LD (HL), A
	CP $02
	JR NZ, AdvancePlayerSprite.checkForMoveToWestBlock
	XOR A
	LD (HL), A
	LD HL, wXOffsetSinceLastSpecialWarp
	INC (HL)
	LD DE, wCurrentTileBlockMapViewPointer
	CALL MoveTileBlockMapPointerEast
	JR AdvancePlayerSprite.updateMapView

AdvancePlayerSprite.checkForMoveToWestBlock:
	CP $FF
	JR NZ, AdvancePlayerSprite.adjustYCoordWithinBlock
	LD A, $01
	LD (HL), A
	LD HL, wXOffsetSinceLastSpecialWarp
	DEC (HL)
	LD DE, wCurrentTileBlockMapViewPointer
	CALL MoveTileBlockMapPointerWest
	JR AdvancePlayerSprite.updateMapView

AdvancePlayerSprite.adjustYCoordWithinBlock:
	LD HL, wYBlockCoord
	LD A, (HL)
	ADD B
	LD (HL), A
	CP $02
	JR NZ, AdvancePlayerSprite.checkForMoveToNorthBlock
	XOR A
	LD (HL), A
	LD HL, wYOffsetSinceLastSpecialWarp
	INC (HL)
	LD DE, wCurrentTileBlockMapViewPointer
	LD A, (wCurMapWidth)
	CALL MoveTileBlockMapPointerSouth
	JR AdvancePlayerSprite.updateMapView

AdvancePlayerSprite.checkForMoveToNorthBlock:
	CP $FF
	JR NZ, AdvancePlayerSprite.updateMapView
	LD A, $01
	LD (HL), A
	LD HL, wYOffsetSinceLastSpecialWarp
	DEC (HL)
	LD DE, wCurrentTileBlockMapViewPointer
	LD A, (wCurMapWidth)
	CALL MoveTileBlockMapPointerNorth
AdvancePlayerSprite.updateMapView:
	CALL LoadCurrentMapView
	LD A, (wSpritePlayerStateData1YStepVector)
	CP $01
	JR NZ, AdvancePlayerSprite.checkIfMovingNorth2
	CALL ScheduleSouthRowRedraw
	JR AdvancePlayerSprite.scrollBackgroundAndSprites

AdvancePlayerSprite.checkIfMovingNorth2:
	CP $FF
	JR NZ, AdvancePlayerSprite.checkIfMovingEast2
	CALL ScheduleNorthRowRedraw
	JR AdvancePlayerSprite.scrollBackgroundAndSprites

AdvancePlayerSprite.checkIfMovingEast2:
	LD A, (wSpritePlayerStateData1XStepVector)
	CP $01
	JR NZ, AdvancePlayerSprite.checkIfMovingWest2
	CALL ScheduleEastColumnRedraw
	JR AdvancePlayerSprite.scrollBackgroundAndSprites

AdvancePlayerSprite.checkIfMovingWest2:
	CP $FF
	JR NZ, AdvancePlayerSprite.scrollBackgroundAndSprites
	CALL ScheduleWestColumnRedraw
AdvancePlayerSprite.scrollBackgroundAndSprites:
	LD A, (wSpritePlayerStateData1YStepVector)
	LD B, A
	LD A, (wSpritePlayerStateData1XStepVector)
	LD C, A
	SLA B
	SLA C
	LDH A, (hSCY - $FF00)
	ADD B
	LDH (hSCY - $FF00), A
	LDH A, (hSCX - $FF00)
	ADD C
	LDH (hSCX - $FF00), A
	LD HL, wSprite01StateData1YPixels
	LD A, (wNumSprites)
	AND A
	JR Z, AdvancePlayerSprite.done
	LD E, A
AdvancePlayerSprite.spriteShiftLoop:
	LD A, (HL)
	SUB B
	LDI (HL), A
	INC L
	LD A, (HL)
	SUB C
	LD (HL), A
	LD A, $0E
	ADD L
	LD L, A
	DEC E
	JR NZ, AdvancePlayerSprite.spriteShiftLoop
AdvancePlayerSprite.done:
	RET

MoveTileBlockMapPointerEast:
	LD A, (DE)
	ADD $01
	LD (DE), A
	RET NC
	INC DE
	LD A, (DE)
	INC A
	LD (DE), A
	RET

MoveTileBlockMapPointerWest:
	LD A, (DE)
	SUB $01
	LD (DE), A
	RET NC
	INC DE
	LD A, (DE)
	DEC A
	LD (DE), A
	RET

MoveTileBlockMapPointerSouth:
	ADD $06
	LD B, A
	LD A, (DE)
	ADD B
	LD (DE), A
	RET NC
	INC DE
	LD A, (DE)
	INC A
	LD (DE), A
	RET

MoveTileBlockMapPointerNorth:
	ADD $06
	LD B, A
	LD A, (DE)
	SUB B
	LD (DE), A
	RET NC
	INC DE
	LD A, (DE)
	DEC A
	LD (DE), A
	RET

ScheduleNorthRowRedraw:
	LD HL, wShadowOAMEnd
	CALL CopyToRedrawRowOrColumnSrcTiles
	LD A, (wMapViewVRAMPointer)
	LDH (hRedrawRowOrColumnDest - $FF00), A
	LD A, (wMapViewVRAMPointer + $1)
	LDH (hRedrawRowOrColumnDest + $1 - $FF00), A
	LD A, $02
	LDH (hRedrawRowOrColumnMode - $FF00), A
	RET

CopyToRedrawRowOrColumnSrcTiles:
	LD DE, wOverworldMapEnd
	LD C, $28
CopyToRedrawRowOrColumnSrcTiles.loop:
	LDI A, (HL)
	LD (DE), A
	INC DE
	DEC C
	JR NZ, CopyToRedrawRowOrColumnSrcTiles.loop
	RET

ScheduleSouthRowRedraw:
	LD HL, wTileMap_plus_140
	CALL CopyToRedrawRowOrColumnSrcTiles
	LD A, (wMapViewVRAMPointer)
	LD L, A
	LD A, (wMapViewVRAMPointer + $1)
	LD H, A
	LD BC, $0200
	ADD HL, BC
	LD A, H
	AND $03
	OR $98
	LDH (hRedrawRowOrColumnDest + $1 - $FF00), A
	LD A, L
	LDH (hRedrawRowOrColumnDest - $FF00), A
	LD A, $02
	LDH (hRedrawRowOrColumnMode - $FF00), A
	RET

ScheduleEastColumnRedraw:
	LD HL, wTileMap_plus_12
	CALL ScheduleColumnRedrawHelper
	LD A, (wMapViewVRAMPointer)
	LD C, A
	AND $E0
	LD B, A
	LD A, C
	ADD $12
	AND $1F
	OR B
	LDH (hRedrawRowOrColumnDest - $FF00), A
	LD A, (wMapViewVRAMPointer + $1)
	LDH (hRedrawRowOrColumnDest + $1 - $FF00), A
	LD A, $01
	LDH (hRedrawRowOrColumnMode - $FF00), A
	RET

ScheduleColumnRedrawHelper:
	LD DE, wOverworldMapEnd
	LD C, $12
ScheduleColumnRedrawHelper.loop:
	LDI A, (HL)
	LD (DE), A
	INC DE
	LD A, (HL)
	LD (DE), A
	INC DE
	LD A, $13
	ADD L
	LD L, A
	JR NC, ScheduleColumnRedrawHelper.noCarry
	INC H
ScheduleColumnRedrawHelper.noCarry:
	DEC C
	JR NZ, ScheduleColumnRedrawHelper.loop
	RET

ScheduleWestColumnRedraw:
	LD HL, wShadowOAMEnd
	CALL ScheduleColumnRedrawHelper
	LD A, (wMapViewVRAMPointer)
	LDH (hRedrawRowOrColumnDest - $FF00), A
	LD A, (wMapViewVRAMPointer + $1)
	LDH (hRedrawRowOrColumnDest + $1 - $FF00), A
	LD A, $01
	LDH (hRedrawRowOrColumnMode - $FF00), A
	RET

DrawTileBlock:
	PUSH HL
	LD A, (wTilesetBlocksPtr)
	LD L, A
	LD A, (wTilesetBlocksPtr + $1)
	LD H, A
	LD A, C
	SWAP A
	LD B, A
	AND $F0
	LD C, A
	LD A, B
	AND $0F
	LD B, A
	ADD HL, BC
	LD D, H
	LD E, L
	POP HL
	LD C, $04
DrawTileBlock.loop:
	PUSH BC
	LD A, (DE)
	LDI (HL), A
	INC DE
	LD A, (DE)
	LDI (HL), A
	INC DE
	LD A, (DE)
	LDI (HL), A
	INC DE
	LD A, (DE)
	LD (HL), A
	INC DE
	LD BC, $0015
	ADD HL, BC
	POP BC
	DEC C
	JR NZ, DrawTileBlock.loop
	RET

JoypadOverworld:
	XOR A
	LD (wSpritePlayerStateData1YStepVector), A
	LD (wSpritePlayerStateData1XStepVector), A
	CALL RunMapScript
	CALL Joypad
	LD A, (wStatusFlags7)
	BIT 3, A
	JR NZ, JoypadOverworld.notForcedDownwards
	LD A, (wCurMap)
	CP $1C
	JR NZ, JoypadOverworld.notForcedDownwards
	LDH A, (hJoyHeld - $FF00)
	AND $F3
	JR NZ, JoypadOverworld.notForcedDownwards
	LD A, $80
	LDH (hJoyHeld - $FF00), A
JoypadOverworld.notForcedDownwards:
	LD A, (wStatusFlags5)
	BIT 7, A
	RET Z
	LDH A, (hJoyHeld - $FF00)
	LD B, A
	LD A, (wOverrideSimulatedJoypadStatesMask)
	AND B
	RET NZ
	LD HL, wSimulatedJoypadStatesIndex
	DEC (HL)
	LD A, (HL)
	CP $FF
	JR Z, JoypadOverworld.doneSimulating
	LD HL, wAddedToParty
	ADD L
	LD L, A
	JR NC, JoypadOverworld.noCarry
	INC H
JoypadOverworld.noCarry:
	LD A, (HL)
	LDH (hJoyHeld - $FF00), A
	AND A
	RET NZ
	LDH (hJoyPressed - $FF00), A
	LDH (hJoyReleased - $FF00), A
	RET

JoypadOverworld.doneSimulating:
	XOR A
	LD (wUnusedOverrideSimulatedJoypadStatesIndex), A
	LD (wSimulatedJoypadStatesIndex), A
	LD (wAddedToParty), A
	LD (wJoyIgnore), A
	LDH (hJoyHeld - $FF00), A
	LD HL, wMovementFlags
	LD A, (HL)
	AND $F8
	LD (HL), A
	LD HL, wStatusFlags5
	RES 7, (HL)
	RET

; Data from FB7 to 101A (100 bytes)
.db $FA, $30, $D7, $CB, $7F, $C2, $04, $10, $FA, $2A, $D5, $57, $FA, $0C, $C1, $A2
.db $20, $1C, $21, $A0, $0C, $CD, $2A, $0C, $38, $24, $3E, $35, $CD, $6D, $3E, $FA
.db $C6, $CF, $FE, $14, $28, $27, $FE, $32, $28, $31, $FE, $48, $28, $1F, $21, $30
.db $D5, $2A, $66, $6F, $2A, $FE, $FF, $28, $05, $B9, $28, $13, $18, $F6, $FA, $2A
.db $C0, $FE, $B4, $28, $05, $3E, $B4, $CD, $B1, $23, $37, $18, $01, $A7, $C9, $AF
.db $EA, $00, $D7, $CD, $97, $09, $CD, $07, $23, $18, $F2, $FA, $67, $D3, $FE, $0E
.db $20, $EB, $18, $EB

RunMapScript:
	PUSH HL
	PUSH DE
	PUSH BC
	LD B, $03
	LD HL, $7225
	CALL Bankswitch
	LD A, (wMiscFlags)
	BIT 1, A
	JR Z, RunMapScript.afterBoulderEffect
	LD B, $03
	LD HL, DoBoulderDustAnimation
	CALL Bankswitch
RunMapScript.afterBoulderEffect:
	POP BC
	POP DE
	POP HL
	CALL RunNPCMovementScript
	LD A, (wCurMap)
	CALL SwitchToMapRomBank
	LD HL, wCurMapScriptPtr
	LDI A, (HL)
	LD H, (HL)
	LD L, A
	LD DE, RunMapScript.return	; Overriding return address
	PUSH DE
	JP HL

RunMapScript.return:
	RET

LoadWalkingPlayerSpriteGraphics:
	LD DE, $4180
	LD HL, $8000
	JR LoadPlayerSpriteGraphicsCommon

LoadSurfingPlayerSpriteGraphics:
	LD DE, $76C0
	LD HL, $8000
	JR LoadPlayerSpriteGraphicsCommon

LoadBikePlayerSpriteGraphics:
	LD DE, $4000
	LD HL, $8000
LoadPlayerSpriteGraphicsCommon:
	PUSH DE
	PUSH HL
	LD BC, $050C
	CALL CopyVideoData
	POP HL
	POP DE
	LD A, $C0
	ADD E
	LD E, A
	JR NC, LoadPlayerSpriteGraphicsCommon.noCarry
	INC D
LoadPlayerSpriteGraphicsCommon.noCarry:
	SET 3, H
	LD BC, $050C
	JP CopyVideoData

LoadMapHeader:
	LD B, $03
	LD HL, $7113
	CALL Bankswitch
	LD A, (wCurMapHeader)
	LD (wUnusedCurMapTilesetCopy), A
	LD A, (wCurMap)
	CALL SwitchToMapRomBank
	LD A, (wCurMapHeader)
	LD B, A
	RES 7, A
	LD (wCurMapHeader), A
	LDH (hBaseTileID - $FF00), A
	BIT 7, B
	RET NZ
	LD HL, MapHeaderPointers
	LD A, (wCurMap)
	SLA A
	JR NC, LoadMapHeader.noCarry1
	INC H
LoadMapHeader.noCarry1:
	ADD L
	LD L, A
	JR NC, LoadMapHeader.noCarry2
	INC H
LoadMapHeader.noCarry2:
	LDI A, (HL)
	LD H, (HL)
	LD L, A
	LD DE, wCurMapHeader
	LD C, $0A
LoadMapHeader.copyFixedHeaderLoop:
	LDI A, (HL)
	LD (DE), A
	INC DE
	DEC C
	JR NZ, LoadMapHeader.copyFixedHeaderLoop
	LD A, $FF
	LD (wCurMapHeaderEnd), A
	LD (wSouthConnectedMap), A
	LD (wWestConnectedMap), A
	LD (wEastConnectedMap), A
	LD A, (wCurMapConnections)
	LD B, A
	BIT 3, B
	JR Z, LoadMapHeader.checkSouth
	LD DE, wCurMapHeaderEnd
	CALL CopyMapConnectionHeader
LoadMapHeader.checkSouth:
	BIT 2, B
	JR Z, LoadMapHeader.checkWest
	LD DE, wSouthConnectedMap
	CALL CopyMapConnectionHeader
LoadMapHeader.checkWest:
	BIT 1, B
	JR Z, LoadMapHeader.checkEast
	LD DE, wWestConnectedMap
	CALL CopyMapConnectionHeader
LoadMapHeader.checkEast:
	BIT 0, B
	JR Z, LoadMapHeader.getObjectDataPointer
	LD DE, wEastConnectedMap
	CALL CopyMapConnectionHeader
LoadMapHeader.getObjectDataPointer:
	LDI A, (HL)
	LD (wObjectDataPointerTemp), A
	LDI A, (HL)
	LD (wObjectDataPointerTemp + $1), A
	PUSH HL
	LD A, (wObjectDataPointerTemp)
	LD L, A
	LD A, (wObjectDataPointerTemp + $1)
	LD H, A
	LD DE, wMapBackgroundTile
	LDI A, (HL)
	LD (DE), A
	LDI A, (HL)
	LD (wNumberOfWarps), A
	AND A
	JR Z, LoadMapHeader.loadSignData
	LD C, A
	LD DE, wWarpEntries
LoadMapHeader.warpLoop:
	LD B, $04
LoadMapHeader.warpInnerLoop:
	LDI A, (HL)
	LD (DE), A
	INC DE
	DEC B
	JR NZ, LoadMapHeader.warpInnerLoop
	DEC C
	JR NZ, LoadMapHeader.warpLoop
LoadMapHeader.loadSignData:
	LDI A, (HL)
	LD (wNumSigns), A
	AND A
	JR Z, LoadMapHeader.loadSpriteData
	LD C, A
	LD DE, $D4D1
	LD A, D
	LDH (hDividend - $FF00), A
	LD A, E
	LDH (hExperience - $FF00), A
	LD DE, wSignCoords
LoadMapHeader.signLoop:
	LDI A, (HL)
	LD (DE), A
	INC DE
	LDI A, (HL)
	LD (DE), A
	INC DE
	PUSH DE
	LDH A, (hDividend - $FF00)
	LD D, A
	LDH A, (hExperience - $FF00)
	LD E, A
	LDI A, (HL)
	LD (DE), A
	INC DE
	LD A, D
	LDH (hDividend - $FF00), A
	LD A, E
	LDH (hExperience - $FF00), A
	POP DE
	DEC C
	JR NZ, LoadMapHeader.signLoop
LoadMapHeader.loadSpriteData:
	LD A, (wStatusFlags4)
	BIT 5, A
	JP NZ, LoadMapHeader.finishUp
	LDI A, (HL)
	LD (wNumSprites), A
	PUSH HL
	LD HL, wSprite01StateData1
	LD DE, wSprite01StateData2
	XOR A
	LD B, $F0
LoadMapHeader.zeroSpriteDataLoop:
	LDI (HL), A
	LD (DE), A
	INC E
	DEC B
	JR NZ, LoadMapHeader.zeroSpriteDataLoop
	LD HL, wSprite01StateData1ImageIndex
	LD DE, $0010
	LD C, $0F
LoadMapHeader.disableSpriteEntriesLoop:
	LD (HL), $FF
	ADD HL, DE
	DEC C
	JR NZ, LoadMapHeader.disableSpriteEntriesLoop
	POP HL
	LD DE, wSprite01StateData1
	LD A, (wNumSprites)
	AND A
	JP Z, LoadMapHeader.finishUp
	LD B, A
	LD C, $00
LoadMapHeader.loadSpriteLoop:
	LDI A, (HL)
	LD (DE), A
	INC D
	LD A, $04
	ADD E
	LD E, A
	LDI A, (HL)
	LD (DE), A
	INC E
	LDI A, (HL)
	LD (DE), A
	INC E
	LDI A, (HL)
	LD (DE), A
	LDI A, (HL)
	LDH (hEnemySpeed - $FF00), A
	LDI A, (HL)
	LDH (hFourTileSpriteCount - $FF00), A
	PUSH BC
	PUSH HL
	LD B, $00
	LD HL, wMapSpriteData
	ADD HL, BC
	LDH A, (hEnemySpeed - $FF00)
	LDI (HL), A
	LDH A, (hFourTileSpriteCount - $FF00)
	LD (HL), A
	LDH A, (hFourTileSpriteCount - $FF00)
	LDH (hEnemySpeed - $FF00), A
	AND $3F
	LD (HL), A
	POP HL
	LDH A, (hEnemySpeed - $FF00)
	BIT 6, A
	JR NZ, LoadMapHeader.trainerSprite
	BIT 7, A
	JR NZ, LoadMapHeader.itemBallSprite
	JR LoadMapHeader.regularSprite

LoadMapHeader.trainerSprite:
	LDI A, (HL)
	LDH (hEnemySpeed - $FF00), A
	LDI A, (HL)
	LDH (hFourTileSpriteCount - $FF00), A
	PUSH HL
	LD HL, wMapSpriteExtraData
	ADD HL, BC
	LDH A, (hEnemySpeed - $FF00)
	LDI (HL), A
	LDH A, (hFourTileSpriteCount - $FF00)
	LD (HL), A
	POP HL
	JR LoadMapHeader.nextSprite

LoadMapHeader.itemBallSprite:
	LDI A, (HL)
	LDH (hEnemySpeed - $FF00), A
	PUSH HL
	LD HL, $D504
	ADD HL, BC
	LDH A, (hEnemySpeed - $FF00)
	LDI (HL), A
	XOR A
	LD (HL), A
	POP HL
	JR LoadMapHeader.nextSprite

LoadMapHeader.regularSprite:
	PUSH HL
	LD HL, wMapSpriteExtraData
	ADD HL, BC
	XOR A
	LDI (HL), A
	LD (HL), A
	POP HL
LoadMapHeader.nextSprite:
	POP BC
	DEC D
	LD A, $0A
	ADD E
	LD E, A
	INC C
	INC C
	DEC B
	JP NZ, LoadMapHeader.loadSpriteLoop
LoadMapHeader.finishUp:
	LD A, $19
	CALL Predef
	LD HL, $4EB8
	LD B, $03
	CALL Bankswitch
	POP HL
	LD A, (wCurMapHeight)
	ADD A
	LD (wCurrentMapHeight2), A
	LD A, (wCurMapWidth)
	ADD A
	LD (wCurrentMapWidth2), A
	LD A, (wCurMap)
	LD C, A
	LD B, $00
	LDH A, (hLoadedROMBank - $FF00)
	PUSH AF
	LD A, $03
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	LD HL, MapSongBanks
	ADD HL, BC
	ADD HL, BC
	LDI A, (HL)
	LD (wMapMusicSoundID), A
	LD A, (HL)
	LD (wMapMusicROMBank), A
	POP AF
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	RET

CopyMapConnectionHeader:
	LD C, $0B
CopyMapConnectionHeader.loop:
	LDI A, (HL)
	LD (DE), A
	INC DE
	DEC C
	JR NZ, CopyMapConnectionHeader.loop
	RET

LoadMapData:
	LDH A, (hLoadedROMBank - $FF00)
	PUSH AF
	CALL DisableLCD
	LD A, $98
	LD (wMapViewVRAMPointer + $1), A
	XOR A
	LD (wMapViewVRAMPointer), A
	LDH (hSCY - $FF00), A
	LDH (hSCX - $FF00), A
	LD (wWalkCounter), A
	LD (wUnusedCurMapTilesetCopy), A
	LD (wWalkBikeSurfStateCopy), A
	LD (wSpriteSetID), A
	CALL LoadTextBoxTilePatterns
	CALL LoadMapHeader
	LD B, $05
	LD HL, $785B
	CALL Bankswitch
	CALL LoadTileBlockMap
	CALL LoadTilesetTilePatternData
	CALL LoadCurrentMapView
	LD HL, wShadowOAMEnd
	LD DE, $9800
	LD B, $12
LoadMapData.vramCopyLoop:
	LD C, $14
LoadMapData.vramCopyInnerLoop:
	LDI A, (HL)
	LD (DE), A
	INC E
	DEC C
	JR NZ, LoadMapData.vramCopyInnerLoop
	LD A, $0C
	ADD E
	LD E, A
	JR NC, LoadMapData.noCarry
	INC D
LoadMapData.noCarry:
	DEC B
	JR NZ, LoadMapData.vramCopyLoop
	LD A, $01
	LD (wUpdateSpritesEnabled), A
	CALL EnableLCD
	LD B, $09
	CALL RunPaletteCommand
	CALL LoadPlayerSpriteGraphics
	LD A, (wStatusFlags6)
	AND $18
	JR NZ, LoadMapData.restoreRomBank
	LD A, (wStatusFlags7)
	BIT 1, A
	JR NZ, LoadMapData.restoreRomBank
	CALL UpdateMusic6Times
; Data from 12B2 to 12B4 (3 bytes)
.db $CD, $12, $23

LoadMapData.restoreRomBank:
	POP AF
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	RET

SwitchToMapRomBank:
	PUSH HL
	PUSH BC
	LD C, A
	LD B, $00
	LD A, $03
	CALL BankswitchHome
	LD HL, MapHeaderBanks
	ADD HL, BC
	LD A, (HL)
	LDH (hMapROMBank - $FF00), A
	CALL BankswitchBack
	LDH A, (hMapROMBank - $FF00)
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	POP BC
	POP HL
	RET

; Data from 12DA to 1388 (175 bytes)
.db $3E, $1E, $EA, $3A, $D1, $21, $30, $D7, $7E, $F6, $26, $77, $C9, $21, $28, $D7
.db $CB, $86, $C9, $06, $05, $21, $97, $09, $CD, $D6, $35, $C3, $07, $23, $CD, $AF
.db $20, $C5, $CD, $31, $38, $C1, $F0, $B4, $FE, $46, $28, $0B, $F0, $B5, $E6, $09
.db $20, $05, $0D, $20, $E9, $A7, $C9, $37, $C9, $47, $F0, $B8, $F5, $FA, $12, $CF
.db $E0, $B8, $EA, $00, $20, $78, $87, $87, $4F, $06, $00, $09, $01, $04, $00, $11
.db $5F, $D3, $CD, $B5, $00, $F1, $E0, $B8, $EA, $00, $20, $C9, $E5, $D5, $C5, $3E
.db $71, $22, $3E, $62, $22, $E5, $3E, $63, $22, $15, $20, $FC, $FA, $94, $CF, $3D
.db $3E, $6D, $28, $01, $3D, $77, $E1, $7B, $A7, $20, $06, $79, $A7, $28, $15, $1E
.db $01, $7B, $D6, $08, $38, $0A, $5F, $3E, $6B, $22, $7B, $A7, $28, $06, $18, $F1
.db $3E, $63, $83, $77, $C1, $D1, $E1, $C9, $21, $B6, $45, $06, $01, $C3, $D6, $35
.db $21, $DC, $D0, $58, $16, $00, $19, $79, $77, $C9, $3E, $01, $EA, $AA, $D0

LoadFrontSpriteByMonIndex:
	PUSH HL
	LD A, (wCalculateWhoseStats)
	PUSH AF
	LD A, (wCurItem)
	LD (wCalculateWhoseStats), A
	LD A, $3A
	CALL Predef
	LD HL, wCalculateWhoseStats
	LD A, (HL)
	POP BC
	LD (HL), B
	AND A
	POP HL
	JR Z, LoadFrontSpriteByMonIndex.invalidDexNumber
	CP $98
	JR C, LoadFrontSpriteByMonIndex.validDexNumber
LoadFrontSpriteByMonIndex.invalidDexNumber:
	LD A, $01
	LD (wCurItem), A
	RET

LoadFrontSpriteByMonIndex.validDexNumber:
	PUSH HL
	LD DE, $9000
	CALL LoadMonFrontSprite
	POP HL
	LDH A, (hLoadedROMBank - $FF00)
	PUSH AF
	LD A, $0F
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	XOR A
	LDH (hStartTileID - $FF00), A
	CALL CopyUncompressedPicToHL
	XOR A
	LD (wSpriteFlipped), A
	POP AF
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	RET

PlayCry:
	CALL GetCryData
	CALL PlaySound
; Data from 13D6 to 13D8 (3 bytes)
.db $C3, $48, $37

GetCryData:
	DEC A
	LD C, A
	LD B, $00
	LD HL, $5446
	ADD HL, BC
	ADD HL, BC
	ADD HL, BC
	LD A, $0E
	CALL BankswitchHome
	LDI A, (HL)
	LD B, A
	LDI A, (HL)
	LD (wFrequencyModifier), A
	LD A, (HL)
	LD (wTempoModifier), A
	CALL BankswitchBack
	LD A, B
	LD C, $14
	RLCA
	ADD B
	ADD C
	RET

; Data from 13FC to 1536 (315 bytes)
.db $F0, $D7, $F5, $AF, $E0, $D7, $CD, $D4, $3D, $CD, $82, $00, $CD, $20, $14, $CD
.db $D4, $14, $C3, $5A, $14, $F0, $D7, $F5, $AF, $E0, $D7, $CD, $20, $14, $CD, $D9
.db $14, $C3, $5A, $14, $3E, $01, $CD, $BC, $35, $CD, $C0, $36, $21, $30, $D7, $CB
.db $F6, $AF, $EA, $49, $CC, $EA, $37, $CC, $21, $24, $CC, $3C, $22, $AF, $22, $FA
.db $2B, $CC, $F5, $22, $23, $FA, $63, $D1, $A7, $28, $01, $3D, $22, $FA, $1F, $D1
.db $A7, $3E, $03, $28, $05, $AF, $EA, $1F, $D1, $3C, $22, $F1, $77, $C9, $3E, $01
.db $EA, $4A, $CC, $3E, $40, $EA, $9B, $D0, $CD, $C2, $3A, $CD, $EC, $3B, $47, $AF
.db $EA, $9B, $D0, $FA, $26, $CC, $EA, $2B, $CC, $21, $30, $D7, $CB, $B6, $FA, $35
.db $CC, $A7, $C2, $AC, $14, $F1, $E0, $D7, $CB, $48, $20, $1F, $FA, $63, $D1, $A7
.db $28, $19, $FA, $26, $CC, $EA, $92, $CF, $21, $64, $D1, $06, $00, $4F, $09, $7E
.db $EA, $91, $CF, $EA, $D9, $CF, $CD, $CD, $35, $A7, $C9, $CD, $CD, $35, $37, $C9
.db $CB, $48, $28, $14, $06, $04, $21, $ED, $72, $CD, $D6, $35, $AF, $EA, $35, $CC
.db $EA, $7D, $D0, $CD, $D9, $14, $18, $96, $FA, $26, $CC, $EA, $92, $CF, $06, $04
.db $21, $13, $76, $CD, $D6, $35, $18, $86, $21, $D2, $6C, $18, $03, $21, $E3, $6C
.db $06, $04, $C3, $D6, $35, $D5, $1B, $1B, $1A, $47, $1B, $1A, $B0, $D1, $20, $0A
.db $3E, $85, $22, $3E, $8D, $22, $36, $93, $A7, $C9, $F0, $B8, $F5, $3E, $1D, $E0
.db $B8, $EA, $00, $20, $CD, $DE, $47, $C1, $78, $E0, $B8, $EA, $00, $20, $C9, $3E
.db $6E, $22, $0E, $02, $FA, $B9, $CF, $FE, $64, $38, $0C, $2B, $0C, $18, $08, $3E
.db $6E, $22, $0E, $03, $FA, $B9, $CF, $EA, $1E, $D1, $11, $1E, $D1, $06, $41, $C3
.db $5F, $3C, $21, $DC, $D0, $4F, $06, $00, $09, $7E, $C9

GetMonHeader:
	LDH A, (hLoadedROMBank - $FF00)
	PUSH AF
	LD A, $0E
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	PUSH BC
	PUSH DE
	PUSH HL
	LD A, (wCalculateWhoseStats)
	PUSH AF
	LD A, (wCurSpecies)
	LD (wCalculateWhoseStats), A
	LD DE, $79E8
	LD B, $66
	CP $B6
	JR Z, GetMonHeader.specialID
	LD DE, $66B5
	CP $B8
	JR Z, GetMonHeader.specialID
	LD DE, $6536
	LD B, $77
	CP $B7
	JR Z, GetMonHeader.specialID
	CP $15
	JR Z, GetMonHeader.mew
	LD A, $3A
	CALL Predef
	LD A, (wCalculateWhoseStats)
	DEC A
	LD BC, $001C
	LD HL, BaseStats
	CALL AddNTimes
	LD DE, wMonHIndex
	LD BC, $001C
	CALL CopyData
	JR GetMonHeader.done

GetMonHeader.specialID:
	LD HL, wMonHSpriteDim
	LD (HL), B
	INC HL
	LD (HL), E
	INC HL
	LD (HL), D
	JR GetMonHeader.done

GetMonHeader.mew:
	LD HL, MewBaseStats
	LD DE, wMonHIndex
	LD BC, $001C
	LD A, $01
	CALL FarCopyData
GetMonHeader.done:
	LD A, (wCurSpecies)
	LD (wMonHIndex), A
	POP AF
	LD (wCalculateWhoseStats), A
	POP HL
	POP DE
	POP BC
	POP AF
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	RET

; Data from 15B4 to 1626 (115 bytes)
.db $FA, $92, $CF, $21, $B5, $D2, $E5, $C5, $CD, $7D, $3A, $11, $6D, $CD, $D5, $01
.db $0B, $00, $CD, $B5, $00, $D1, $C1, $E1, $C9, $41, $CB, $B9, $CB, $B1, $CB, $A9
.db $CB, $68, $28, $07, $CB, $78, $20, $03, $36, $F0, $23, $1A, $CB, $37, $CD, $04
.db $16, $1A, $CD, $04, $16, $13, $0D, $20, $F2, $CB, $78, $28, $12, $CB, $70, $20
.db $01, $2B, $CB, $68, $28, $03, $36, $F0, $23, $36, $F6, $CD, $D3, $38, $23, $C9
.db $E6, $0F, $A7, $28, $15, $CB, $78, $28, $0B, $CB, $68, $28, $05, $36, $F0, $23
.db $CB, $A8, $CB, $B8, $C6, $F6, $22, $C3, $D3, $38, $CB, $78, $28, $F6, $CB, $70
.db $C0, $23, $C9

UncompressMonSprite:
	LD BC, $D0B8
	ADD HL, BC
	LDI A, (HL)
	LD (wSpriteInputPtr), A
	LD A, (HL)
	LD (wSpriteInputPtr + $1), A
	LD A, (wCurItem)
	LD B, A
	CP $15
	LD A, $01
	JR Z, UncompressMonSprite.GotBank
	LD A, B
	CP $B6
	LD A, $0B
	JR Z, UncompressMonSprite.GotBank
	LD A, B
	CP $1F
	LD A, $09
	JR C, UncompressMonSprite.GotBank
	LD A, B
	CP $4A
	LD A, $0A
	JR C, UncompressMonSprite.GotBank
	LD A, B
	CP $74
	LD A, $0B
	JR C, UncompressMonSprite.GotBank
	LD A, B
	CP $99
	LD A, $0C
	JR C, UncompressMonSprite.GotBank
	LD A, $0D
UncompressMonSprite.GotBank:
	JP UncompressSpriteData

LoadMonFrontSprite:
	PUSH DE
	LD HL, $000B
	CALL UncompressMonSprite
	LD HL, wMonHSpriteDim
	LDI A, (HL)
	LD C, A
	POP DE
	PUSH DE
	AND $0F
	LDH (hBaseTileID - $FF00), A
	LD B, A
	LD A, $07
	SUB B
	INC A
	SRL A
	LD B, A
	ADD A
	ADD A
	ADD A
	SUB B
	LDH (hEnemySpeed - $FF00), A
	LD A, C
	SWAP A
	AND $0F
	LD B, A
	ADD A
	ADD A
	ADD A
	LDH (hDownArrowBlinkCount2 - $FF00), A
	LD A, $07
	SUB B
	LD B, A
	LDH A, (hEnemySpeed - $FF00)
	ADD B
	ADD A
	ADD A
	ADD A
	LDH (hEnemySpeed - $FF00), A
	XOR A
	LD ($4000), A
	LD HL, sSpriteBuffer0
	CALL ZeroSpriteBuffer
	LD DE, sSpriteBuffer1
	LD HL, $A000
	CALL AlignSpriteDataCentered
	LD HL, sSpriteBuffer1
	CALL ZeroSpriteBuffer
	LD DE, sSpriteBuffer2
	LD HL, $A188
	CALL AlignSpriteDataCentered
	POP DE
	JP InterlaceMergeSpriteBuffers

AlignSpriteDataCentered:
	LDH A, (hEnemySpeed - $FF00)
	LD B, $00
	LD C, A
	ADD HL, BC
	LDH A, (hBaseTileID - $FF00)
AlignSpriteDataCentered.columnLoop:
	PUSH AF
	PUSH HL
	LDH A, (hDownArrowBlinkCount2 - $FF00)
	LD C, A
AlignSpriteDataCentered.columnInnerLoop:
	LD A, (DE)
	INC DE
	LDI (HL), A
	DEC C
	JR NZ, AlignSpriteDataCentered.columnInnerLoop
	POP HL
	LD BC, $0038
	ADD HL, BC
	POP AF
	DEC A
	JR NZ, AlignSpriteDataCentered.columnLoop
	RET

ZeroSpriteBuffer:
	LD BC, $0188
ZeroSpriteBuffer.nextByteLoop:
	XOR A
	LDI (HL), A
	DEC BC
	LD A, B
	OR C
	JR NZ, ZeroSpriteBuffer.nextByteLoop
	RET

InterlaceMergeSpriteBuffers:
	XOR A
	LD ($4000), A
	PUSH DE
	LD HL, sSpriteBuffer2 + $187
	LD DE, sSpriteBuffer1 + $187
	LD BC, sSpriteBuffer0 + $187
	LD A, $C4
	LDH (hBaseTileID - $FF00), A
InterlaceMergeSpriteBuffers.interlaceLoop:
	LD A, (DE)
	DEC DE
	LDD (HL), A
	LD A, (BC)
	DEC BC
	LDD (HL), A
	LD A, (DE)
	DEC DE
	LDD (HL), A
	LD A, (BC)
	DEC BC
	LDD (HL), A
	LDH A, (hBaseTileID - $FF00)
	DEC A
	LDH (hBaseTileID - $FF00), A
	JR NZ, InterlaceMergeSpriteBuffers.interlaceLoop
	LD A, (wSpriteFlipped)
	AND A
	JR Z, InterlaceMergeSpriteBuffers.notFlipped
	LD BC, $0310
	LD HL, sSpriteBuffer1
InterlaceMergeSpriteBuffers.swapLoop:
	SWAP (HL)
	INC HL
	DEC BC
	LD A, B
	OR C
	JR NZ, InterlaceMergeSpriteBuffers.swapLoop
InterlaceMergeSpriteBuffers.notFlipped:
	POP HL
	LD DE, $A188
	LD C, $31
	LDH A, (hLoadedROMBank - $FF00)
	LD B, A
	JP CopyVideoData

; Data from 172F to 17F6 (200 bytes)
.db $0B, $0C, $13, $15, $18, $FF, $00, $10, $1B, $20, $21, $23, $2C, $2D, $2E, $30
.db $31, $33, $39, $3C, $3E, $52, $54, $58, $5B, $FF, $01, $02, $03, $11, $12, $13
.db $14, $1C, $1A, $FF, $11, $1A, $1C, $3C, $5E, $FF, $11, $16, $19, $2B, $3C, $3D
.db $3F, $4A, $4C, $4D, $03, $FF, $1E, $20, $2E, $30, $34, $37, $39, $3A, $40, $51
.db $52, $5A, $5C, $5E, $5F, $FF, $01, $12, $14, $28, $32, $37, $44, $54, $5C, $FF
.db $01, $12, $14, $1A, $1C, $37, $38, $3B, $3C, $5E, $FF, $04, $0D, $17, $1D, $1E
.db $23, $34, $37, $39, $4A, $FF, $0A, $1A, $32, $3B, $FF, $01, $10, $13, $1B, $22
.db $42, $52, $FF, $04, $0F, $15, $1F, $3B, $45, $47, $55, $56, $FF, $05, $15, $18
.db $1A, $20, $21, $22, $2A, $2D, $30, $FF, $FF, $14, $17, $1A, $1C, $20, $38, $45
.db $FF, $01, $05, $11, $12, $14, $1A, $1C, $2C, $53, $FF, $0C, $26, $16, $1E, $34
.db $37, $FF, $0F, $1A, $1F, $26, $28, $29, $2C, $2D, $2E, $2F, $41, $FF, $01, $10
.db $11, $13, $1B, $20, $21, $22, $30, $31, $32, $42, $43, $48, $52, $55, $58, $5E
.db $FF, $1B, $23, $2C, $2D, $3B, $45, $FF

FarCopyData2:
	LDH (hBaseTileID - $FF00), A
	LDH A, (hLoadedROMBank - $FF00)
	PUSH AF
	LDH A, (hBaseTileID - $FF00)
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	CALL CopyData
	POP AF
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	RET

; Data from 180D to 182A (30 bytes)
.db $E0, $8B, $F0, $B8, $F5, $F0, $8B, $E0, $B8, $EA, $00, $20, $E5, $D5, $D5, $54
.db $5D, $E1, $CD, $B5, $00, $D1, $E1, $F1, $E0, $B8, $EA, $00, $20, $C9

FarCopyDataDouble:
	LDH (hBaseTileID - $FF00), A
	LDH A, (hLoadedROMBank - $FF00)
	PUSH AF
	LDH A, (hBaseTileID - $FF00)
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
FarCopyDataDouble.loop:
	LDI A, (HL)
	LD (DE), A
	INC DE
	LD (DE), A
	INC DE
	DEC BC
	LD A, C
	OR B
	JR NZ, FarCopyDataDouble.loop
	POP AF
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	RET

CopyVideoData:
	LDH A, (hAutoBGTransferEnabled - $FF00)
	PUSH AF
	XOR A
	LDH (hAutoBGTransferEnabled - $FF00), A
	LDH A, (hLoadedROMBank - $FF00)
	LDH (hBaseTileID - $FF00), A
	LD A, B
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	LD A, E
	LDH (hVBlankCopySource - $FF00), A
	LD A, D
	LDH (hVBlankCopySource + $1 - $FF00), A
	LD A, L
	LDH (hVBlankCopyDest - $FF00), A
	LD A, H
	LDH (hVBlankCopyDest + $1 - $FF00), A
CopyVideoData.loop:
	LD A, C
	CP $08
	JR NC, CopyVideoData.keepgoing
	LDH (hVBlankCopySize - $FF00), A
	CALL DelayFrame
	LDH A, (hBaseTileID - $FF00)
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	POP AF
	LDH (hAutoBGTransferEnabled - $FF00), A
	RET

CopyVideoData.keepgoing:
	LD A, $08
	LDH (hVBlankCopySize - $FF00), A
	CALL DelayFrame
	LD A, C
	SUB $08
	LD C, A
	JR CopyVideoData.loop

CopyVideoDataDouble:
	LDH A, (hAutoBGTransferEnabled - $FF00)
	PUSH AF
	XOR A
	LDH (hAutoBGTransferEnabled - $FF00), A
	LDH A, (hLoadedROMBank - $FF00)
	LDH (hBaseTileID - $FF00), A
	LD A, B
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	LD A, E
	LDH (hVBlankCopyDoubleSource - $FF00), A
	LD A, D
	LDH (hVBlankCopyDoubleSource + $1 - $FF00), A
	LD A, L
	LDH (hVBlankCopyDoubleDest - $FF00), A
	LD A, H
	LDH (hVBlankCopyDoubleDest + $1 - $FF00), A
CopyVideoDataDouble.loop:
	LD A, C
	CP $08
	JR NC, CopyVideoDataDouble.keepgoing
	LDH (hVBlankCopyDoubleSize - $FF00), A
	CALL DelayFrame
	LDH A, (hBaseTileID - $FF00)
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	POP AF
	LDH (hAutoBGTransferEnabled - $FF00), A
	RET

CopyVideoDataDouble.keepgoing:
	LD A, $08
	LDH (hVBlankCopyDoubleSize - $FF00), A
	CALL DelayFrame
	LD A, C
	SUB $08
	LD C, A
	JR CopyVideoDataDouble.loop

ClearScreenArea:
	LD A, $7F
	LD DE, $0014
ClearScreenArea.loopRows:
	PUSH HL
	PUSH BC
ClearScreenArea.loopTiles:
	LDI (HL), A
	DEC C
	JR NZ, ClearScreenArea.loopTiles
	POP BC
	POP HL
	ADD HL, DE
	DEC B
	JR NZ, ClearScreenArea.loopRows
	RET

CopyScreenTileBufferToVRAM:
	LD C, $06
	LD HL, $0000
	LD DE, $C3A0
	CALL CopyScreenTileBufferToVRAM.setup
	CALL DelayFrame
	LD HL, $0600
	LD DE, $C418
	CALL CopyScreenTileBufferToVRAM.setup
	CALL DelayFrame
	LD HL, $0C00
	LD DE, $C490
	CALL CopyScreenTileBufferToVRAM.setup
	JP DelayFrame

CopyScreenTileBufferToVRAM.setup:
	LD A, D
	LDH (hVBlankCopyBGSource + $1 - $FF00), A
	CALL GetRowColAddressBgMap
	LD A, L
	LDH (hVBlankCopyBGDest - $FF00), A
	LD A, H
	LDH (hVBlankCopyBGDest + $1 - $FF00), A
	LD A, C
	LDH (hVBlankCopyBGNumRows - $FF00), A
	LD A, E
	LDH (hVBlankCopyBGSource - $FF00), A
	RET

ClearScreen:
	LD BC, $0168
	INC B
	LD HL, wShadowOAMEnd
	LD A, $7F
ClearScreen.loop:
	LDI (HL), A
	DEC C
	JR NZ, ClearScreen.loop
	DEC B
	JR NZ, ClearScreen.loop
	JP Delay3

TextBoxBorder:
	PUSH HL
	LD A, $79
	LDI (HL), A
	INC A
	CALL TextBoxBorder.PlaceChars
	INC A
	LD (HL), A
	POP HL
	LD DE, $0014
	ADD HL, DE
TextBoxBorder.next:
	PUSH HL
	LD A, $7C
	LDI (HL), A
	LD A, $7F
	CALL TextBoxBorder.PlaceChars
	LD (HL), $7C
	POP HL
	LD DE, $0014
	ADD HL, DE
	DEC B
	JR NZ, TextBoxBorder.next
	LD A, $7D
	LDI (HL), A
	LD A, $7A
	CALL TextBoxBorder.PlaceChars
	LD (HL), $7E
	RET

TextBoxBorder.PlaceChars:
	LD D, C
TextBoxBorder.loop:
	LDI (HL), A
	DEC D
	JR NZ, TextBoxBorder.loop
	RET

PlaceString:
	PUSH HL
PlaceNextChar:
	LD A, (DE)
	CP $50
	JR NZ, PlaceNextChar.NotTerminator
	LD B, H
	LD C, L
	POP HL
	RET

PlaceNextChar.NotTerminator:
	CP $4E
	JR NZ, PlaceNextChar.NotNext
; Data from 1963 to 1974 (18 bytes)
.db $01, $28, $00, $F0, $F6, $CB, $57, $28, $03, $01, $14, $00, $E1, $09, $E5, $C3
.db $E8, $19

PlaceNextChar.NotNext:
	CP $4F
	JR NZ, PlaceNextChar.NotLine
; Data from 1979 to 1980 (8 bytes)
.db $E1, $21, $E1, $C4, $E5, $C3, $E8, $19

PlaceNextChar.NotLine:
	AND A
	JP Z, NullChar
	CP $4C
	JP Z, _ContTextNoPause
	CP $4B
	JP Z, _ContText
; Data from 198F to 19E7 (89 bytes)
.db $FE, $51, $CA, $B4, $1A, $FE, $49, $CA, $D5, $1A, $FE, $52, $CA, $F9, $19, $FE
.db $53, $CA, $FF, $19, $FE, $54, $CA, $1D, $1A, $FE, $5B, $CA, $11, $1A, $FE, $5E
.db $CA, $17, $1A, $FE, $5C, $CA, $0B, $1A, $FE, $5D, $CA, $05, $1A, $FE, $55, $CA
.db $7C, $1A, $FE, $56, $CA, $23, $1A, $FE, $57, $CA, $AD, $1A, $FE, $58, $CA, $95
.db $1A, $FE, $4A, $CA, $29, $1A, $FE, $5F, $CA, $91, $1A, $FE, $59, $CA, $2F, $1A
.db $FE, $5A, $CA, $35, $1A, $22, $CD, $D3, $38

NextChar:
	INC DE
	JP PlaceNextChar

NullChar:
	LD B, H
	LD C, L
	POP HL
	LD DE, $19F4
	DEC DE
	RET

; Data from 19F4 to 1AF7 (260 bytes)
.db $17, $96, $66, $22, $50, $D5, $11, $58, $D1, $18, $4C, $D5, $11, $4A, $D3, $18
.db $46, $D5, $11, $58, $1A, $18, $40, $D5, $11, $55, $1A, $18, $3A, $D5, $11, $60
.db $1A, $18, $34, $D5, $11, $63, $1A, $18, $2E, $D5, $11, $6A, $1A, $18, $28, $D5
.db $11, $6F, $1A, $18, $22, $D5, $11, $79, $1A, $18, $1C, $F0, $F3, $EE, $01, $18
.db $02, $F0, $F3, $D5, $A7, $20, $05, $11, $09, $D0, $18, $0B, $11, $72, $1A, $CD
.db $55, $19, $60, $69, $11, $DA, $CF, $CD, $55, $19, $60, $69, $D1, $13, $C3, $56
.db $19, $93, $8C, $50, $93, $91, $80, $88, $8D, $84, $91, $50, $8F, $82, $50, $91
.db $8E, $82, $8A, $84, $93, $50, $8F, $8E, $8A, $BA, $50, $75, $75, $50, $84, $AD
.db $A4, $AC, $B8, $7F, $50, $E1, $E2, $50, $D5, $44, $4D, $21, $8C, $1A, $CD, $40
.db $1B, $60, $69, $D1, $13, $C3, $56, $19, $17, $A3, $66, $22, $50, $36, $E8, $E1
.db $C9, $FA, $2B, $D1, $FE, $04, $CA, $A2, $1A, $3E, $EE, $EA, $F2, $C4, $CD, $3A
.db $1B, $CD, $98, $38, $3E, $7F, $EA, $F2, $C4, $E1, $11, $B3, $1A, $1B, $C9, $50
.db $D5, $3E, $EE, $EA, $F2, $C4, $CD, $3A, $1B, $CD, $98, $38, $21, $A5, $C4, $01
.db $12, $04, $CD, $C4, $18, $0E, $14, $CD, $39, $37, $D1, $21, $B9, $C4, $C3, $E8
.db $19, $D5, $3E, $EE, $EA, $F2, $C4, $CD, $3A, $1B, $CD, $98, $38, $21, $69, $C4
.db $01, $12, $07, $CD, $C4, $18, $0E, $14, $CD, $39, $37, $D1, $E1, $21, $7D, $C4
.db $E5, $C3, $E8, $19

_ContText:
	LD A, $EE
	LD (wTileMap_plus_152), A
	CALL ProtectedDelay3
	PUSH DE
	CALL ManualTextScroll
; Data from 1B04 to 1B09 (6 bytes)
.db $D1, $3E, $7F, $EA, $F2, $C4

_ContTextNoPause:
	PUSH DE
	CALL ScrollTextUpOneLine
	CALL ScrollTextUpOneLine
	LD HL, $C4E1
	POP DE
	JP NextChar

ScrollTextUpOneLine:
	LD HL, wTileMap_plus_118
	LD DE, wTileMap_plus_104
	LD B, $3C
ScrollTextUpOneLine.copyText:
	LDI A, (HL)
	LD (DE), A
	INC DE
	DEC B
	JR NZ, ScrollTextUpOneLine.copyText
	LD HL, wTileMap_plus_141
	LD A, $7F
	LD B, $12
ScrollTextUpOneLine.clearText:
	LDI (HL), A
	DEC B
	JR NZ, ScrollTextUpOneLine.clearText
	LD B, $05
ScrollTextUpOneLine.WaitFrame:
	CALL DelayFrame
	DEC B
	JR NZ, ScrollTextUpOneLine.WaitFrame
	RET

ProtectedDelay3:
	PUSH BC
	CALL Delay3
	POP BC
	RET

TextCommandProcessor:
	LD A, (wLetterPrintingDelayFlags)
	PUSH AF
	SET 1, A
	LD E, A
	LDH A, (hClearLetterPrintingDelayFlags - $FF00)
	XOR E
	LD (wLetterPrintingDelayFlags), A
	LD A, C
	LD (wTextDest), A
	LD A, B
	LD (wTextDest + $1), A
NextTextCommand:
	LDI A, (HL)
	CP $50
	JR NZ, NextTextCommand.TextCommand
	POP AF
	LD (wLetterPrintingDelayFlags), A
	RET

NextTextCommand.TextCommand:
	PUSH HL
	CP $17
	JP Z, TextCommand_FAR
	CP $0E
	JP NC, TextCommand_SOUND
; Data from 1B6A to 1C30 (199 bytes)
.db $21, $C1, $1C, $C5, $87, $06, $00, $4F, $09, $C1, $2A, $66, $6F, $E9, $E1, $2A
.db $5F, $2A, $57, $2A, $47, $2A, $4F, $E5, $62, $6B, $CD, $22, $19, $E1, $18, $CB
.db $E1, $54, $5D, $60, $69, $CD, $55, $19, $62, $6B, $23, $18, $BE, $E1, $2A, $5F
.db $2A, $57, $E5, $60, $69, $CD, $55, $19, $E1, $18, $B0, $E1, $2A, $5F, $2A, $57
.db $2A, $E5, $60, $69, $4F, $CD, $CD, $15, $44, $4D, $E1, $18, $9E, $E1, $2A, $EA
.db $3A, $CC, $4F, $2A, $EA, $3B, $CC, $47, $C3, $55, $1B, $E1, $01, $E1, $C4, $C3
.db $55, $1B, $FA, $2B, $D1, $FE, $04, $CA, $9A, $1C, $3E, $EE, $EA, $F2, $C4, $C5
.db $CD, $98, $38, $C1, $3E, $7F, $EA, $F2, $C4, $E1, $C3, $55, $1B, $3E, $7F, $EA
.db $F2, $C4, $CD, $18, $1B, $CD, $18, $1B, $E1, $01, $E1, $C4, $C3, $55, $1B, $E1
.db $11, $55, $1B, $D5, $E9, $E1, $2A, $5F, $2A, $57, $2A, $E5, $60, $69, $47, $E6
.db $0F, $4F, $78, $E6, $F0, $CB, $37, $CB, $F7, $47, $CD, $5F, $3C, $44, $4D, $E1
.db $C3, $55, $1B, $C5, $CD, $9A, $01, $F0, $B4, $E6, $03, $20, $05, $0E, $1E, $CD
.db $39, $37, $C1, $E1, $C3, $55, $1B

TextCommand_SOUND:
	POP HL
	PUSH BC
	DEC HL
	LDI A, (HL)
	LD B, A
	PUSH HL
	LD HL, TextCommandSounds
	LDI A, (HL)
	CP B
	JR Z, TextCommand_SOUND.play
; Data from 1C3E to 1C40 (3 bytes)
.db $23, $18, $F9

TextCommand_SOUND.play:
	CP $14
	JR Z, TextCommand_SOUND.pokemonCry
; Data from 1C45 to 1C58 (20 bytes)
.db $FE, $15, $28, $10, $FE, $16, $28, $0C, $7E, $CD, $B1, $23, $CD, $48, $37, $E1
.db $C1, $C3, $55, $1B

TextCommand_SOUND.pokemonCry:
	PUSH DE
	LD A, (HL)
	CALL PlayCry
; Data from 1C5E to 1C63 (6 bytes)
.db $D1, $E1, $C1, $C3, $55, $1B

; Data from 1C64 to 1CA2 (63 bytes)
TextCommandSounds:
.db $0B, $86, $12, $9A, $0E, $91, $0F, $86, $10, $89, $11, $94, $13, $98, $14, $A8
.db $15, $97, $16, $78, $E1, $2A, $57, $E5, $60, $69, $3E, $75, $22, $D5, $CD, $9A
.db $01, $D1, $F0, $B4, $E6, $03, $20, $05, $0E, $0A, $CD, $39, $37, $15, $20, $EA
.db $44, $4D, $E1, $C3, $55, $1B, $C5, $CD, $98, $38, $C1, $E1, $C3, $55, $1B

TextCommand_FAR:
	POP HL
	LDH A, (hLoadedROMBank - $FF00)
	PUSH AF
	LDI A, (HL)
	LD E, A
	LDI A, (HL)
	LD D, A
	LDI A, (HL)
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	PUSH HL
	LD L, E
	LD H, D
	CALL TextCommandProcessor
	POP HL
	POP AF
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	JP NextTextCommand

; Data from 1CC1 to 1CDC (28 bytes)
.db $8A, $1B, $97, $1B, $A5, $1B, $B7, $1B, $78, $1B, $C5, $1B, $CC, $1B, $E7, $1B
.db $F9, $1B, $FF, $1B, $1D, $1C, $31, $1C, $78, $1C, $9A, $1C

GetRowColAddressBgMap:
	XOR A
	SRL H
	RR A
	SRL H
	RR A
	SRL H
	RR A
	OR L
	LD L, A
	LD A, B
	OR H
	LD H, A
	RET

ClearBgMap:
	LD A, $7F
	JR FillBgMapCommon

; Data from 1CF4 to 1CF4 (1 bytes)
.db $7D

FillBgMapCommon:
	LD DE, $0400
	LD L, E
FillBgMapCommon.loop:
	LDI (HL), A
	DEC E
	JR NZ, FillBgMapCommon.loop
	DEC D
	JR NZ, FillBgMapCommon.loop
	RET

RedrawRowOrColumn:
	LDH A, (hRedrawRowOrColumnMode - $FF00)
	AND A
	RET Z
	LD B, A
	XOR A
	LDH (hRedrawRowOrColumnMode - $FF00), A
	DEC B
	JR NZ, RedrawRowOrColumn.redrawRow
	LD HL, wOverworldMapEnd
	LDH A, (hRedrawRowOrColumnDest - $FF00)
	LD E, A
	LDH A, (hRedrawRowOrColumnDest + $1 - $FF00)
	LD D, A
	LD C, $12
RedrawRowOrColumn.loop1:
	LDI A, (HL)
	LD (DE), A
	INC DE
	LDI A, (HL)
	LD (DE), A
	LD A, $1F
	ADD E
	LD E, A
	JR NC, RedrawRowOrColumn.noCarry
	INC D
RedrawRowOrColumn.noCarry:
	LD A, D
	AND $03
	OR $98
	LD D, A
	DEC C
	JR NZ, RedrawRowOrColumn.loop1
	XOR A
	LDH (hRedrawRowOrColumnMode - $FF00), A
	RET

RedrawRowOrColumn.redrawRow:
	LD HL, wOverworldMapEnd
	LDH A, (hRedrawRowOrColumnDest - $FF00)
	LD E, A
	LDH A, (hRedrawRowOrColumnDest + $1 - $FF00)
	LD D, A
	PUSH DE
	CALL RedrawRowOrColumn.DrawHalf
	POP DE
	LD A, $20
	ADD E
	LD E, A
RedrawRowOrColumn.DrawHalf:
	LD C, $0A
RedrawRowOrColumn.loop2:
	LDI A, (HL)
	LD (DE), A
	INC DE
	LDI A, (HL)
	LD (DE), A
	LD A, E
	INC A
	AND $1F
	LD B, A
	LD A, E
	AND $E0
	OR B
	LD E, A
	DEC C
	JR NZ, RedrawRowOrColumn.loop2
	RET

AutoBgMapTransfer:
	LDH A, (hAutoBGTransferEnabled - $FF00)
	AND A
	RET Z
	LD HL, SP+0
	LD A, H
	LDH (hSPTemp - $FF00), A
	LD A, L
	LDH (hSPTemp + $1 - $FF00), A
	LDH A, (hAutoBGTransferPortion - $FF00)
	AND A
	JR Z, AutoBgMapTransfer.transferTopThird
	DEC A
	JR Z, AutoBgMapTransfer.transferMiddleThird
	LD HL, $C490
	LD SP, HL
	LDH A, (hAutoBGTransferDest + $1 - $FF00)
	LD H, A
	LDH A, (hAutoBGTransferDest - $FF00)
	LD L, A
	LD DE, $0180
	ADD HL, DE
	XOR A
	JR AutoBgMapTransfer.doTransfer

AutoBgMapTransfer.transferTopThird:
	LD HL, $C3A0
	LD SP, HL
	LDH A, (hAutoBGTransferDest + $1 - $FF00)
	LD H, A
	LDH A, (hAutoBGTransferDest - $FF00)
	LD L, A
	LD A, $01
	JR AutoBgMapTransfer.doTransfer

AutoBgMapTransfer.transferMiddleThird:
	LD HL, $C418
	LD SP, HL
	LDH A, (hAutoBGTransferDest + $1 - $FF00)
	LD H, A
	LDH A, (hAutoBGTransferDest - $FF00)
	LD L, A
	LD DE, $00C0
	ADD HL, DE
	LD A, $02
AutoBgMapTransfer.doTransfer:
	LDH (hAutoBGTransferPortion - $FF00), A
	LD B, $06
TransferBgRows:
	POP DE
	LD (HL), E
	INC L
	LD (HL), D
	INC L
	POP DE
	LD (HL), E
	INC L
	LD (HL), D
	INC L
	POP DE
	LD (HL), E
	INC L
	LD (HL), D
	INC L
	POP DE
	LD (HL), E
	INC L
	LD (HL), D
	INC L
	POP DE
	LD (HL), E
	INC L
	LD (HL), D
	INC L
	POP DE
	LD (HL), E
	INC L
	LD (HL), D
	INC L
	POP DE
	LD (HL), E
	INC L
	LD (HL), D
	INC L
	POP DE
	LD (HL), E
	INC L
	LD (HL), D
	INC L
	POP DE
	LD (HL), E
	INC L
	LD (HL), D
	INC L
	POP DE
	LD (HL), E
	INC L
	LD (HL), D
	LD A, $0D
	ADD L
	LD L, A
	JR NC, TransferBgRows.ok
	INC H
TransferBgRows.ok:
	DEC B
	JR NZ, TransferBgRows
	LDH A, (hSPTemp - $FF00)
	LD H, A
	LDH A, (hSPTemp + $1 - $FF00)
	LD L, A
	LD SP, HL
	RET

VBlankCopyBgMap:
	LDH A, (hVBlankCopyBGSource - $FF00)
	AND A
	RET Z
	LD HL, SP+0
	LD A, H
	LDH (hSPTemp - $FF00), A
	LD A, L
	LDH (hSPTemp + $1 - $FF00), A
	LDH A, (hVBlankCopyBGSource - $FF00)
	LD L, A
	LDH A, (hVBlankCopyBGSource + $1 - $FF00)
	LD H, A
	LD SP, HL
	LDH A, (hVBlankCopyBGDest - $FF00)
	LD L, A
	LDH A, (hVBlankCopyBGDest + $1 - $FF00)
	LD H, A
	LDH A, (hVBlankCopyBGNumRows - $FF00)
	LD B, A
	XOR A
	LDH (hVBlankCopyBGSource - $FF00), A
	JR TransferBgRows

VBlankCopyDouble:
	LDH A, (hVBlankCopyDoubleSize - $FF00)
	AND A
	RET Z
	LD HL, SP+0
	LD A, H
	LDH (hSPTemp - $FF00), A
	LD A, L
	LDH (hSPTemp + $1 - $FF00), A
	LDH A, (hVBlankCopyDoubleSource - $FF00)
	LD L, A
	LDH A, (hVBlankCopyDoubleSource + $1 - $FF00)
	LD H, A
	LD SP, HL
	LDH A, (hVBlankCopyDoubleDest - $FF00)
	LD L, A
	LDH A, (hVBlankCopyDoubleDest + $1 - $FF00)
	LD H, A
	LDH A, (hVBlankCopyDoubleSize - $FF00)
	LD B, A
	XOR A
	LDH (hVBlankCopyDoubleSize - $FF00), A
VBlankCopyDouble.loop:
	POP DE
	LD (HL), E
	INC L
	LD (HL), E
	INC L
	LD (HL), D
	INC L
	LD (HL), D
	INC L
	POP DE
	LD (HL), E
	INC L
	LD (HL), E
	INC L
	LD (HL), D
	INC L
	LD (HL), D
	INC L
	POP DE
	LD (HL), E
	INC L
	LD (HL), E
	INC L
	LD (HL), D
	INC L
	LD (HL), D
	INC L
	POP DE
	LD (HL), E
	INC L
	LD (HL), E
	INC L
	LD (HL), D
	INC L
	LD (HL), D
	INC HL
	DEC B
	JR NZ, VBlankCopyDouble.loop
	LD A, L
	LDH (hVBlankCopyDoubleDest - $FF00), A
	LD A, H
	LDH (hVBlankCopyDoubleDest + $1 - $FF00), A
	LD HL, SP+0
	LD A, L
	LDH (hVBlankCopyDoubleSource - $FF00), A
	LD A, H
	LDH (hVBlankCopyDoubleSource + $1 - $FF00), A
	LDH A, (hSPTemp - $FF00)
	LD H, A
	LDH A, (hSPTemp + $1 - $FF00)
	LD L, A
	LD SP, HL
	RET

VBlankCopy:
	LDH A, (hVBlankCopySize - $FF00)
	AND A
	RET Z
	LD HL, SP+0
	LD A, H
	LDH (hSPTemp - $FF00), A
	LD A, L
	LDH (hSPTemp + $1 - $FF00), A
	LDH A, (hVBlankCopySource - $FF00)
	LD L, A
	LDH A, (hVBlankCopySource + $1 - $FF00)
	LD H, A
	LD SP, HL
	LDH A, (hVBlankCopyDest - $FF00)
	LD L, A
	LDH A, (hVBlankCopyDest + $1 - $FF00)
	LD H, A
	LDH A, (hVBlankCopySize - $FF00)
	LD B, A
	XOR A
	LDH (hVBlankCopySize - $FF00), A
VBlankCopy.loop:
	POP DE
	LD (HL), E
	INC L
	LD (HL), D
	INC L
	POP DE
	LD (HL), E
	INC L
	LD (HL), D
	INC L
	POP DE
	LD (HL), E
	INC L
	LD (HL), D
	INC L
	POP DE
	LD (HL), E
	INC L
	LD (HL), D
	INC L
	POP DE
	LD (HL), E
	INC L
	LD (HL), D
	INC L
	POP DE
	LD (HL), E
	INC L
	LD (HL), D
	INC L
	POP DE
	LD (HL), E
	INC L
	LD (HL), D
	INC L
	POP DE
	LD (HL), E
	INC L
	LD (HL), D
	INC HL
	DEC B
	JR NZ, VBlankCopy.loop
	LD A, L
	LDH (hVBlankCopyDest - $FF00), A
	LD A, H
	LDH (hVBlankCopyDest + $1 - $FF00), A
	LD HL, SP+0
	LD A, L
	LDH (hVBlankCopySource - $FF00), A
	LD A, H
	LDH (hVBlankCopySource + $1 - $FF00), A
	LDH A, (hSPTemp - $FF00)
	LD H, A
	LDH A, (hSPTemp + $1 - $FF00)
	LD L, A
	LD SP, HL
	RET

UpdateMovingBgTiles:
	LDH A, (hTileAnimations - $FF00)
	AND A
	RET Z
	LDH A, (hMovingBGTilesCounter1 - $FF00)
	INC A
	LDH (hMovingBGTilesCounter1 - $FF00), A
	CP $14
	RET C
	CP $15
	JR Z, UpdateMovingBgTiles.flower
	LD HL, $9140
	LD C, $10
	LD A, (wMovingBGTilesCounter2)
	INC A
	AND $07
	LD (wMovingBGTilesCounter2), A
	AND $04
	JR NZ, UpdateMovingBgTiles.left
UpdateMovingBgTiles.right:
	LD A, (HL)
	RRCA
	LDI (HL), A
	DEC C
	JR NZ, UpdateMovingBgTiles.right
	JR UpdateMovingBgTiles.done

UpdateMovingBgTiles.left:
	LD A, (HL)
	RLCA
	LDI (HL), A
	DEC C
	JR NZ, UpdateMovingBgTiles.left
UpdateMovingBgTiles.done:
	LDH A, (hTileAnimations - $FF00)
	RRCA
	RET NC
	XOR A
	LDH (hMovingBGTilesCounter1 - $FF00), A
	RET

UpdateMovingBgTiles.flower:
	XOR A
	LDH (hMovingBGTilesCounter1 - $FF00), A
	LD A, (wMovingBGTilesCounter2)
	AND $03
	CP $02
	LD HL, FlowerTile1
	JR C, UpdateMovingBgTiles.copy
	LD HL, FlowerTile2
	JR Z, UpdateMovingBgTiles.copy
	LD HL, FlowerTile3
UpdateMovingBgTiles.copy:
	LD DE, $9030
	LD C, $10
UpdateMovingBgTiles.loop:
	LDI A, (HL)
	LD (DE), A
	INC DE
	DEC C
	JR NZ, UpdateMovingBgTiles.loop
	RET

; Data from 1F19 to 1F28 (16 bytes)
FlowerTile1:
.db $81, $00, $00, $18, $00, $24, $85, $5A, $1C, $42, $18, $A5, $00, $7E, $81, $18

; Data from 1F29 to 1F38 (16 bytes)
FlowerTile2:
.db $81, $00, $00, $0C, $00, $12, $82, $2D, $0E, $E1, $0C, $73, $00, $3E, $81, $18

; Data from 1F39 to 1F48 (16 bytes)
FlowerTile3:
.db $81, $18, $00, $24, $04, $5A, $9D, $42, $18, $24, $00, $DB, $00, $7E, $81, $18

SoftReset:
	CALL StopAllSounds
	CALL GBPalWhiteOut
	LD C, $20
	CALL DelayFrames
Init:
	DI
	XOR A
	LDH (rIF), A
	LDH (rIE), A
	LDH (rSCX), A
	LDH (rSCY), A
	LDH (rSB), A
	LDH (rSC), A
	LDH (rWX), A
	LDH (rWY), A
	LDH (rTMA), A
	LDH (rTAC), A
	LDH (rBGP), A
	LDH (rOBP0), A
	LDH (rOBP1), A
	LD A, $80
	LDH (rLCDC), A
	CALL DisableLCD
	LD SP, $DFFF
	LD HL, wUnusedMusicByte
	LD BC, $2000
Init.loop:
	LD (HL), $00
	INC HL
	DEC BC
	LD A, B
	OR C
	JR NZ, Init.loop
	CALL ClearVram
	LD HL, hDMARoutine
	LD BC, $007F
	CALL FillMemory
	CALL ClearSprites
	LD A, $01
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	CALL WriteDMACodeToHRAM
	XOR A
	LDH (hTileAnimations - $FF00), A
	LDH (rSTAT), A
	LDH (hSCX - $FF00), A
	LDH (hSCY - $FF00), A
	LDH (rIF), A
	LD A, $0D
	LDH (rIE), A
	LD A, $90
	LDH (hWY - $FF00), A
	LDH (rWY), A
	LD A, $07
	LDH (rWX), A
	LD A, $FF
	LDH (hSerialConnectionStatus - $FF00), A
	LD H, $98
	CALL ClearBgMap
	LD H, $9C
	CALL ClearBgMap
	LD A, $E3
	LDH (rLCDC), A
	LD A, $10
	LDH (hSoftReset - $FF00), A
	CALL StopAllSounds
	EI
	LD A, $40
	CALL Predef
	LD A, $1F
	LD (wAudioROMBank), A
	LD (wAudioSavedROMBank), A
	LD A, $9C
	LDH (hAutoBGTransferDest + $1 - $FF00), A
	XOR A
	LDH (hAutoBGTransferDest - $FF00), A
	DEC A
	LD (wUpdateSpritesEnabled), A
	LD A, $32
	CALL Predef
	CALL DisableLCD
	CALL ClearVram
	CALL GBPalNormal
	CALL ClearSprites
	LD A, $E3
	LDH (rLCDC), A
	JP PrepareTitleScreen

ClearVram:
	LD HL, $8000
	LD BC, $2000
	XOR A
	JP FillMemory

StopAllSounds:
	LD A, $02
	LD (wAudioROMBank), A
	LD (wAudioSavedROMBank), A
	XOR A
	LD (wAudioFadeOutControl), A
	LD (wNewSoundID), A
	LD (wLastMusicSoundID), A
	DEC A
	JP PlaySound

VBlank:
	PUSH AF
	PUSH BC
	PUSH DE
	PUSH HL
	LDH A, (hLoadedROMBank - $FF00)
	LD (wVBlankSavedROMBank), A
	LDH A, (hSCX - $FF00)
	LDH (rSCX), A
	LDH A, (hSCY - $FF00)
	LDH (rSCY), A
	LD A, (wDisableVBlankWYUpdate)
	AND A
	JR NZ, VBlank.ok
; Data from 203B to 203E (4 bytes)
.db $F0, $B0, $E0, $4A

VBlank.ok:
	CALL AutoBgMapTransfer
	CALL VBlankCopyBgMap
	CALL RedrawRowOrColumn
	CALL VBlankCopy
	CALL VBlankCopyDouble
	CALL UpdateMovingBgTiles
	CALL hDMARoutine	; Code is loaded from DMARoutine
	LD A, $01
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	CALL PrepareOAMData
	CALL Random
	LDH A, (hVBlankOccurred - $FF00)
	AND A
	JR Z, VBlank.skipZeroing
; Data from 2066 to 2068 (3 bytes)
.db $AF, $E0, $D6

VBlank.skipZeroing:
	LDH A, (hFrameCounter - $FF00)
	AND A
	JR Z, VBlank.skipDec
; Data from 206E to 2070 (3 bytes)
.db $3D, $E0, $D5

VBlank.skipDec:
	CALL FadeOutAudio
; Data from 2074 to 20AE (59 bytes)
.db $FA, $EF, $C0, $E0, $B8, $EA, $00, $20, $FE, $02, $20, $05, $CD, $03, $51, $18
.db $0F, $FE, $08, $20, $08, $CD, $6E, $53, $CD, $79, $58, $18, $03, $CD, $77, $51
.db $06, $06, $21, $EE, $4D, $CD, $D6, $35, $F0, $F9, $A7, $CC, $5F, $01, $FA, $22
.db $D1, $E0, $B8, $EA, $00, $20, $E1, $D1, $C1, $F1, $D9

DelayFrame:
	LD A, $01
	LDH (hVBlankOccurred - $FF00), A
DelayFrame.halt:
	HALT
	LDH A, (hVBlankOccurred - $FF00)
	AND A
	JR NZ, DelayFrame.halt
	RET

LoadGBPal:
	LD A, (wMapPalOffset)
	LD B, A
	LD HL, $2116
	LD A, L
	SUB B
	LD L, A
	JR NC, LoadGBPal.ok
	DEC H
LoadGBPal.ok:
	LDI A, (HL)
	LDH (rBGP), A
	LDI A, (HL)
	LDH (rOBP0), A
	LDI A, (HL)
	LDH (rOBP1), A
	RET

; Data from 20D1 to 2124 (84 bytes)
.db $21, $0D, $21, $06, $04, $18, $05, $21, $1C, $21, $06, $03, $2A, $E0, $47, $2A
.db $E0, $48, $2A, $E0, $49, $0E, $08, $CD, $39, $37, $05, $20, $EF, $C9, $21, $18
.db $21, $06, $04, $18, $05, $21, $21, $21, $06, $03, $3A, $E0, $49, $3A, $E0, $48
.db $3A, $E0, $47, $0E, $08, $CD, $39, $37, $05, $20, $EF, $C9, $FF, $FF, $FF, $FE
.db $FE, $F8, $F9, $E4, $E4, $E4, $D0, $E0, $E4, $D0, $E0, $90, $80, $90, $40, $40
.db $40, $00, $00, $00

Serial:
	PUSH AF
	PUSH BC
	PUSH DE
	PUSH HL
	LDH A, (hSerialConnectionStatus - $FF00)
	INC A
	JR Z, Serial.connectionNotYetEstablished
	LDH A, (rSB)
	LDH (hSerialReceiveData - $FF00), A
	LDH A, (hSerialSendData - $FF00)
	LDH (rSB), A
	LDH A, (hSerialConnectionStatus - $FF00)
	CP $02
	JR Z, Serial.done
	LD A, $80
	LDH (rSC), A
	JR Serial.done

Serial.connectionNotYetEstablished:
	LDH A, (rSB)
	LDH (hSerialReceiveData - $FF00), A
	LDH (hSerialConnectionStatus - $FF00), A
	CP $02
	JR Z, Serial.usingInternalClock
	XOR A
	LDH (rSB), A
	LD A, $03
	LDH (rDIV), A
Serial.waitLoop:
	LDH A, (rDIV)
	BIT 7, A
	JR NZ, Serial.waitLoop
	LD A, $80
	LDH (rSC), A
	JR Serial.done

Serial.usingInternalClock:
	XOR A
	LDH (rSB), A
Serial.done:
	LD A, $01
	LDH (hSerialReceivedNewData - $FF00), A
	LD A, $FE
	LDH (hSerialSendData - $FF00), A
	POP HL
	POP DE
	POP BC
	POP AF
	RETI

; Data from 216F to 2236 (200 bytes)
.db $3E, $01, $E0, $AB, $7E, $E0, $AC, $CD, $9A, $21, $C5, $47, $23, $3E, $30, $3D
.db $20, $FD, $F0, $AB, $A7, $78, $C1, $28, $0A, $2B, $FE, $FD, $20, $E6, $AF, $E0
.db $AB, $18, $E1, $12, $13, $0B, $78, $B1, $20, $DA, $C9, $AF, $E0, $A9, $F0, $AA
.db $FE, $02, $20, $04, $3E, $81, $E0, $02, $F0, $A9, $A7, $20, $45, $F0, $AA, $FE
.db $01, $20, $1A, $CD, $37, $22, $28, $15, $CD, $31, $22, $E5, $21, $48, $CC, $34
.db $20, $02, $2B, $34, $E1, $CD, $37, $22, $20, $DE, $C3, $3F, $22, $F0, $FF, $E6
.db $0F, $FE, $08, $20, $D3, $FA, $74, $D0, $3D, $EA, $74, $D0, $20, $CA, $FA, $75
.db $D0, $3D, $EA, $75, $D0, $20, $C1, $F0, $AA, $FE, $01, $28, $05, $3E, $FF, $3D
.db $20, $FD, $AF, $E0, $A9, $F0, $FF, $E6, $0F, $D6, $08, $20, $08, $EA, $74, $D0
.db $3E, $50, $EA, $75, $D0, $F0, $AD, $FE, $FE, $C0, $CD, $37, $22, $28, $11, $E5
.db $21, $48, $CC, $7E, $3D, $32, $3C, $20, $01, $35, $E1, $CD, $37, $22, $28, $20
.db $F0, $FF, $E6, $0F, $FE, $08, $3E, $FE, $C8, $7E, $E0, $AC, $CD, $AF, $20, $C3
.db $9A, $21, $3E, $0F, $3D, $20, $FD, $C9

IsUnknownCounterZero:
	PUSH HL
	LD HL, wEnteringCableClub
	LDI A, (HL)
	OR (HL)
	POP HL
	RET

SetUnknownCounterToFFFF:
	DEC A
	LD (wEnteringCableClub), A
	LD (wEnteringCableClub + $1), A
	RET

; Data from 2247 to 226D (39 bytes)
.db $21, $42, $CC, $11, $3D, $CC, $0E, $02, $3E, $01, $E0, $AB, $CD, $AF, $20, $7E
.db $E0, $AC, $CD, $9A, $21, $47, $23, $F0, $AB, $A7, $3E, $00, $E0, $AB, $20, $EC
.db $78, $12, $13, $0D, $20, $E6, $C9

Serial_PrintWaitingTextAndSyncAndExchangeNybble:
	CALL SaveScreenTilesToBuffer1
	LD HL, PrintWaitingText
	LD B, $01
	CALL Bankswitch
	CALL Serial_SyncAndExchangeNybble
	JP LoadScreenTilesFromBuffer1

Serial_SyncAndExchangeNybble:
	LD A, $FF
	LD (wSerialExchangeNybbleReceiveData), A
Serial_SyncAndExchangeNybble.loop1:
	CALL Serial_ExchangeNybble
	CALL DelayFrame
	CALL IsUnknownCounterZero
	JR Z, Serial_SyncAndExchangeNybble.next1
	PUSH HL
	LD HL, wEnteringCableClub + $1
	DEC (HL)
	JR NZ, Serial_SyncAndExchangeNybble.next2
	DEC HL
	DEC (HL)
	JR NZ, Serial_SyncAndExchangeNybble.next2
	POP HL
	XOR A
	JP SetUnknownCounterToFFFF

Serial_SyncAndExchangeNybble.next2:
	POP HL
Serial_SyncAndExchangeNybble.next1:
	LD A, (wSerialExchangeNybbleReceiveData)
	INC A
	JR Z, Serial_SyncAndExchangeNybble.loop1
	LD B, $0A
Serial_SyncAndExchangeNybble.loop2:
	CALL DelayFrame
	CALL Serial_ExchangeNybble
	DEC B
	JR NZ, Serial_SyncAndExchangeNybble.loop2
	LD B, $0A
Serial_SyncAndExchangeNybble.loop3:
	CALL DelayFrame
	CALL Serial_SendZeroByte
	DEC B
	JR NZ, Serial_SyncAndExchangeNybble.loop3
	LD A, (wSerialExchangeNybbleReceiveData)
	LD (wLinkMenuSelectionReceiveBuffer), A
	RET

Serial_ExchangeNybble:
	CALL Serial_ExchangeNybble.doExchange
	LD A, (wLinkMenuSelectionSendBuffer)
	ADD $60
	LDH (hSerialSendData - $FF00), A
	LDH A, (hSerialConnectionStatus - $FF00)
	CP $02
	JR NZ, Serial_ExchangeNybble.doExchange
	LD A, $81
	LDH (rSC), A
Serial_ExchangeNybble.doExchange:
	LDH A, (hSerialReceiveData - $FF00)
	LD (wLinkMenuSelectionReceiveBuffer), A
	AND $F0
	CP $60
	RET NZ
	XOR A
	LDH (hSerialReceiveData - $FF00), A
	LD A, (wLinkMenuSelectionReceiveBuffer)
	AND $0F
	LD (wSerialExchangeNybbleReceiveData), A
	RET

Serial_SendZeroByte:
	XOR A
	LDH (hSerialSendData - $FF00), A
	LDH A, (hSerialConnectionStatus - $FF00)
	CP $02
	RET NZ
	LD A, $81
	LDH (rSC), A
	RET

; Data from 22FA to 2305 (12 bytes)
.db $3E, $02, $E0, $01, $AF, $E0, $AD, $3E, $80, $E0, $02, $C9

Timer:
	RETI

; Data from 2307 to 2311 (11 bytes)
.db $CD, $48, $37, $AF, $4F, $57, $EA, $CA, $CF, $18, $12

PlayDefaultMusicFadeOutCurrent:
	LD C, $0A
	LD D, $00
	LD A, (wStatusFlags4)
	BIT 5, A
	JR Z, PlayDefaultMusicCommon
	XOR A
	LD (wLastMusicSoundID), A
	LD C, $08
	LD D, C
PlayDefaultMusicCommon:
	LD A, (wWalkBikeSurfState)
	AND A
	JR Z, PlayDefaultMusicCommon.walking
	CP $02
	JR Z, PlayDefaultMusicCommon.surfing
	LD A, $D2
	JR PlayDefaultMusicCommon.next

PlayDefaultMusicCommon.surfing:
	LD A, $D6
PlayDefaultMusicCommon.next:
	LD B, A
	LD A, D
	AND A
	LD A, $1F
	JR NZ, PlayDefaultMusicCommon.next2
	LD (wAudioROMBank), A
PlayDefaultMusicCommon.next2:
	LD (wAudioSavedROMBank), A
	JR PlayDefaultMusicCommon.next3

PlayDefaultMusicCommon.walking:
	LD A, (wMapMusicSoundID)
	LD B, A
	CALL CompareMapMusicBankWithCurrentBank
	JR C, PlayDefaultMusicCommon.next4
PlayDefaultMusicCommon.next3:
	LD A, (wLastMusicSoundID)
	CP B
	RET Z
PlayDefaultMusicCommon.next4:
	LD A, C
	LD (wAudioFadeOutControl), A
	LD A, B
	LD (wLastMusicSoundID), A
	LD (wNewSoundID), A
	JP PlaySound

UpdateMusic6Times:
	LD A, (wAudioROMBank)
	LD B, A
	CP $02
	JR NZ, UpdateMusic6Times.checkForAudio2
	LD HL, $5103
	JR UpdateMusic6Times.next

UpdateMusic6Times.checkForAudio2:
	CP $08
	JR NZ, UpdateMusic6Times.audio3
	LD HL, $5879
	JR UpdateMusic6Times.next

UpdateMusic6Times.audio3:
	LD HL, $5177
UpdateMusic6Times.next:
	LD C, $06
UpdateMusic6Times.loop:
	PUSH BC
	PUSH HL
	CALL Bankswitch
	POP HL
	POP BC
	DEC C
	JR NZ, UpdateMusic6Times.loop
	RET

CompareMapMusicBankWithCurrentBank:
	LD A, (wMapMusicROMBank)
	LD E, A
	LD A, (wAudioROMBank)
	CP E
	JR NZ, CompareMapMusicBankWithCurrentBank.differentBanks
	LD (wAudioSavedROMBank), A
	AND A
	RET

CompareMapMusicBankWithCurrentBank.differentBanks:
	LD A, C
	AND A
	LD A, E
	JR NZ, CompareMapMusicBankWithCurrentBank.next
	LD (wAudioROMBank), A
CompareMapMusicBankWithCurrentBank.next:
	LD (wAudioSavedROMBank), A
	SCF
	RET

PlayMusic:
	LD B, A
	LD (wNewSoundID), A
	XOR A
	LD (wAudioFadeOutControl), A
	LD A, C
	LD (wAudioROMBank), A
	LD (wAudioSavedROMBank), A
	LD A, B
PlaySound:
	PUSH HL
	PUSH DE
	PUSH BC
	LD B, A
	LD A, (wNewSoundID)
	AND A
	JR Z, PlaySound.next
	XOR A
	LD (wChannelSoundIDs + $4), A
	LD (wChannelSoundIDs + $5), A
	LD (wChannelSoundIDs + $6), A
	LD (wChannelSoundIDs + $7), A
PlaySound.next:
	LD A, (wAudioFadeOutControl)
	AND A
	JR Z, PlaySound.noFadeOut
	LD A, (wNewSoundID)
	AND A
	JR Z, PlaySound.done
	XOR A
	LD (wNewSoundID), A
	LD A, (wLastMusicSoundID)
	CP $FF
	JR NZ, PlaySound.fadeOut
	XOR A
	LD (wAudioFadeOutControl), A
PlaySound.noFadeOut:
	XOR A
	LD (wNewSoundID), A
	LDH A, (hLoadedROMBank - $FF00)
	LDH (hSavedROMBank - $FF00), A
	LD A, (wAudioROMBank)
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	CP $02
	JR NZ, PlaySound.checkForAudio2
	LD A, B
	CALL Audio1_PlaySound
	JR PlaySound.next2

PlaySound.checkForAudio2:
	CP $08
	JR NZ, PlaySound.audio3
	LD A, B
	CALL Audio2_PlaySound
; Data from 2405 to 2406 (2 bytes)
.db $18, $04

PlaySound.audio3:
	LD A, B
	CALL $58EA	; Possibly invalid
PlaySound.next2:
	LDH A, (hSavedROMBank - $FF00)
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	JR PlaySound.done

PlaySound.fadeOut:
	LD A, B
	LD (wLastMusicSoundID), A
	LD A, (wAudioFadeOutControl)
	LD (wAudioFadeOutCounterReloadValue), A
	LD (wAudioFadeOutCounter), A
	LD A, B
	LD (wAudioFadeOutControl), A
PlaySound.done:
	POP BC
	POP DE
	POP HL
	RET

UpdateSprites:
	LD A, (wUpdateSpritesEnabled)
	DEC A
	RET NZ
	LDH A, (hLoadedROMBank - $FF00)
	PUSH AF
	LD A, $01
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	CALL _UpdateSprites
	POP AF
UpdateSprites.restoreBank:
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	RET

; Data from 2442 to 24FC (187 bytes)
.db $FE, $04, $04, $0B, $0F, $0C, $FF, $FE, $07, $04, $14, $1D, $0B, $0C, $0E, $0F
.db $FF, $FE, $07, $04, $14, $1E, $0B, $0C, $0E, $0F, $FF, $FE, $01, $06, $FF, $FE
.db $06, $04, $13, $0D, $0E, $0F, $1E, $FF, $FE, $09, $03, $13, $35, $1D, $38, $0B
.db $0C, $0D, $0F, $FF, $FE, $09, $03, $13, $35, $38, $0B, $0C, $0D, $0E, $0F, $FF
.db $FE, $09, $E8, $E9, $CA, $CF, $ED, $C9, $CD, $D1, $D9, $FF, $FE, $05, $33, $20
.db $21, $22, $2F, $FF, $FE, $07, $2E, $37, $3A, $41, $42, $43, $44, $FF, $FE, $05
.db $23, $24, $25, $26, $27, $FF, $FE, $06, $02, $03, $13, $35, $34, $38, $FF, $FE
.db $05, $03, $12, $13, $34, $35, $FF, $FE, $07, $02, $03, $12, $39, $1D, $34, $35
.db $FF, $FE, $06, $03, $12, $39, $1D, $34, $35, $FF, $FE, $07, $02, $03, $10, $11
.db $34, $35, $39, $FF, $50, $21, $D6, $24, $C9, $17, $93, $40, $20, $50, $17, $96
.db $40, $20, $50, $17, $B1, $40, $20, $50, $17, $D2, $40, $20, $50, $17, $FC, $40
.db $20, $50, $08, $3E, $5C, $CD, $6D, $3E, $C3, $D7, $24

UncompressSpriteData:
	LD B, A
	LDH A, (hLoadedROMBank - $FF00)
	PUSH AF
	LD A, B
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	LD A, $0A
	LD ($0000), A
	XOR A
	LD ($4000), A
	CALL _UncompressSpriteData
	POP AF
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	RET

_UncompressSpriteData:
	LD HL, sSpriteBuffer1
	LD C, $10
	LD B, $03
	XOR A
	CALL FillMemory
	LD A, $01
	LD (wSpriteInputBitCounter), A
	LD A, $03
	LD (wSpriteOutputBitOffset), A
	XOR A
	LD (wSpriteCurPosX), A
	LD (wSpriteCurPosY), A
	LD (wSpriteLoadFlags), A
	CALL ReadNextInputByte
	LD B, A
	AND $0F
	ADD A
	ADD A
	ADD A
	LD (wSpriteHeight), A
	LD A, B
	SWAP A
	AND $0F
	ADD A
	ADD A
	ADD A
	LD (wSpriteWidth), A
	CALL ReadNextInputBit
	LD (wSpriteLoadFlags), A
UncompressSpriteDataLoop:
	LD HL, sSpriteBuffer1
	LD A, (wSpriteLoadFlags)
	BIT 0, A
	JR Z, UncompressSpriteDataLoop.useSpriteBuffer1
	LD HL, sSpriteBuffer2
UncompressSpriteDataLoop.useSpriteBuffer1:
	CALL StoreSpriteOutputPointer
	LD A, (wSpriteLoadFlags)
	BIT 1, A
	JR Z, UncompressSpriteDataLoop.startDecompression
	CALL ReadNextInputBit
	AND A
	JR Z, UncompressSpriteDataLoop.unpackingMode0
	CALL ReadNextInputBit
	INC A
UncompressSpriteDataLoop.unpackingMode0:
	LD (wSpriteUnpackMode), A
UncompressSpriteDataLoop.startDecompression:
	CALL ReadNextInputBit
	AND A
	JR Z, UncompressSpriteDataLoop.readRLEncodedZeros
UncompressSpriteDataLoop.readNextInput:
	CALL ReadNextInputBit
	LD C, A
	CALL ReadNextInputBit
	SLA C
	OR C
	AND A
	JR Z, UncompressSpriteDataLoop.readRLEncodedZeros
	CALL WriteSpriteBitsToBuffer
	CALL MoveToNextBufferPosition
	JR UncompressSpriteDataLoop.readNextInput

UncompressSpriteDataLoop.readRLEncodedZeros:
	LD C, $00
UncompressSpriteDataLoop.countConsecutiveOnesLoop:
	CALL ReadNextInputBit
	AND A
	JR Z, UncompressSpriteDataLoop.countConsecutiveOnesFinished
	INC C
	JR UncompressSpriteDataLoop.countConsecutiveOnesLoop

UncompressSpriteDataLoop.countConsecutiveOnesFinished:
	LD A, C
	ADD A
	LD HL, $269F
	ADD L
	LD L, A
	JR NC, UncompressSpriteDataLoop.noCarry
	INC H
UncompressSpriteDataLoop.noCarry:
	LDI A, (HL)
	LD E, A
	LD D, (HL)
	PUSH DE
	INC C
	LD E, $00
	LD D, E
UncompressSpriteDataLoop.readNumberOfZerosLoop:
	CALL ReadNextInputBit
	OR E
	LD E, A
	DEC C
	JR Z, UncompressSpriteDataLoop.readNumberOfZerosDone
	SLA E
	RL D
	JR UncompressSpriteDataLoop.readNumberOfZerosLoop

UncompressSpriteDataLoop.readNumberOfZerosDone:
	POP HL
	ADD HL, DE
	LD E, L
	LD D, H
UncompressSpriteDataLoop.writeZerosLoop:
	LD B, E
	XOR A
	CALL WriteSpriteBitsToBuffer
	LD E, B
	CALL MoveToNextBufferPosition
	DEC DE
	LD A, D
	AND A
	JR NZ, UncompressSpriteDataLoop.continueLoop
	LD A, E
	AND A
UncompressSpriteDataLoop.continueLoop:
	JR NZ, UncompressSpriteDataLoop.writeZerosLoop
	JR UncompressSpriteDataLoop.readNextInput

MoveToNextBufferPosition:
	LD A, (wSpriteHeight)
	LD B, A
	LD A, (wSpriteCurPosY)
	INC A
	CP B
	JR Z, MoveToNextBufferPosition.curColumnDone
	LD (wSpriteCurPosY), A
	LD A, (wSpriteOutputPtr)
	INC A
	LD (wSpriteOutputPtr), A
	RET NZ
	LD A, (wSpriteOutputPtr + $1)
	INC A
	LD (wSpriteOutputPtr + $1), A
	RET

MoveToNextBufferPosition.curColumnDone:
	XOR A
	LD (wSpriteCurPosY), A
	LD A, (wSpriteOutputBitOffset)
	AND A
	JR Z, MoveToNextBufferPosition.bitOffsetsDone
	DEC A
	LD (wSpriteOutputBitOffset), A
	LD HL, wSpriteOutputPtrCached
	LDI A, (HL)
	LD (wSpriteOutputPtr), A
	LD A, (HL)
	LD (wSpriteOutputPtr + $1), A
	RET

MoveToNextBufferPosition.bitOffsetsDone:
	LD A, $03
	LD (wSpriteOutputBitOffset), A
	LD A, (wSpriteCurPosX)
	ADD $08
	LD (wSpriteCurPosX), A
	LD B, A
	LD A, (wSpriteWidth)
	CP B
	JR Z, MoveToNextBufferPosition.allColumnsDone
	LD A, (wSpriteOutputPtr)
	LD L, A
	LD A, (wSpriteOutputPtr + $1)
	LD H, A
MoveToNextBufferPosition.advanceOutputPtr:
	INC HL
	JP StoreSpriteOutputPointer

MoveToNextBufferPosition.allColumnsDone:
	POP HL
	XOR A
	LD (wSpriteCurPosX), A
	LD A, (wSpriteLoadFlags)
	BIT 1, A
	JR NZ, MoveToNextBufferPosition.done
	XOR $01
	SET 1, A
	LD (wSpriteLoadFlags), A
	JP UncompressSpriteDataLoop

MoveToNextBufferPosition.done:
	JP UnpackSprite

WriteSpriteBitsToBuffer:
	LD E, A
	LD A, (wSpriteOutputBitOffset)
	AND A
	JR Z, WriteSpriteBitsToBuffer.offset0
	CP $02
	JR C, WriteSpriteBitsToBuffer.offset1
	JR Z, WriteSpriteBitsToBuffer.offset2
	RRC E
	RRC E
	JR WriteSpriteBitsToBuffer.offset0

WriteSpriteBitsToBuffer.offset1:
	SLA E
	SLA E
	JR WriteSpriteBitsToBuffer.offset0

WriteSpriteBitsToBuffer.offset2:
	SWAP E
WriteSpriteBitsToBuffer.offset0:
	LD A, (wSpriteOutputPtr)
	LD L, A
	LD A, (wSpriteOutputPtr + $1)
	LD H, A
	LD A, (HL)
	OR E
	LD (HL), A
	RET

ReadNextInputBit:
	LD A, (wSpriteInputBitCounter)
	DEC A
	JR NZ, ReadNextInputBit.curByteHasMoreBitsToRead
	CALL ReadNextInputByte
	LD (wSpriteInputCurByte), A
	LD A, $08
ReadNextInputBit.curByteHasMoreBitsToRead:
	LD (wSpriteInputBitCounter), A
	LD A, (wSpriteInputCurByte)
	RLCA
	LD (wSpriteInputCurByte), A
	AND $01
	RET

ReadNextInputByte:
	LD A, (wSpriteInputPtr)
	LD L, A
	LD A, (wSpriteInputPtr + $1)
	LD H, A
	LDI A, (HL)
	LD B, A
	LD A, L
	LD (wSpriteInputPtr), A
	LD A, H
	LD (wSpriteInputPtr + $1), A
	LD A, B
	RET

; Data from 269F to 26BE (32 bytes)
.db $01, $00, $03, $00, $07, $00, $0F, $00, $1F, $00, $3F, $00, $7F, $00, $FF, $00
.db $FF, $01, $FF, $03, $FF, $07, $FF, $0F, $FF, $1F, $FF, $3F, $FF, $7F, $FF, $FF

UnpackSprite:
	LD A, (wSpriteUnpackMode)
	CP $02
	JP Z, UnpackSpriteMode2
	AND A
	JP NZ, XorSpriteChunks
	LD HL, sSpriteBuffer1
	CALL SpriteDifferentialDecode
	LD HL, sSpriteBuffer2
SpriteDifferentialDecode:
	XOR A
	LD (wSpriteCurPosX), A
	LD (wSpriteCurPosY), A
	CALL StoreSpriteOutputPointer
	LD A, (wSpriteFlipped)
	AND A
	JR Z, SpriteDifferentialDecode.notFlipped
	LD HL, DecodeNybble0TableFlipped
	LD DE, DecodeNybble1TableFlipped
	JR SpriteDifferentialDecode.storeDecodeTablesPointers

SpriteDifferentialDecode.notFlipped:
	LD HL, DecodeNybble0Table
	LD DE, DecodeNybble1Table
SpriteDifferentialDecode.storeDecodeTablesPointers:
	LD A, L
	LD (wSpriteDecodeTable0Ptr), A
	LD A, H
	LD (wSpriteDecodeTable0Ptr + $1), A
	LD A, E
	LD (wSpriteDecodeTable1Ptr), A
	LD A, D
	LD (wSpriteDecodeTable1Ptr + $1), A
	LD E, $00
SpriteDifferentialDecode.decodeNextByteLoop:
	LD A, (wSpriteOutputPtr)
	LD L, A
	LD A, (wSpriteOutputPtr + $1)
	LD H, A
	LD A, (HL)
	LD B, A
	SWAP A
	AND $0F
	CALL DifferentialDecodeNybble
	SWAP A
	LD D, A
	LD A, B
	AND $0F
	CALL DifferentialDecodeNybble
	OR D
	LD B, A
	LD A, (wSpriteOutputPtr)
	LD L, A
	LD A, (wSpriteOutputPtr + $1)
	LD H, A
	LD A, B
	LD (HL), A
	LD A, (wSpriteHeight)
	ADD L
	JR NC, SpriteDifferentialDecode.noCarry
	INC H
SpriteDifferentialDecode.noCarry:
	LD (wSpriteOutputPtr), A
	LD A, H
	LD (wSpriteOutputPtr + $1), A
	LD A, (wSpriteCurPosX)
	ADD $08
	LD (wSpriteCurPosX), A
	LD B, A
	LD A, (wSpriteWidth)
	CP B
	JR NZ, SpriteDifferentialDecode.decodeNextByteLoop
	XOR A
	LD E, A
	LD (wSpriteCurPosX), A
	LD A, (wSpriteCurPosY)
	INC A
	LD (wSpriteCurPosY), A
	LD B, A
	LD A, (wSpriteHeight)
	CP B
	JR Z, SpriteDifferentialDecode.done
	LD A, (wSpriteOutputPtrCached)
	LD L, A
	LD A, (wSpriteOutputPtrCached + $1)
	LD H, A
	INC HL
	CALL StoreSpriteOutputPointer
	JR SpriteDifferentialDecode.decodeNextByteLoop

SpriteDifferentialDecode.done:
	XOR A
	LD (wSpriteCurPosY), A
	RET

DifferentialDecodeNybble:
	SRL A
	LD C, $00
	JR NC, DifferentialDecodeNybble.evenNumber
	LD C, $01
DifferentialDecodeNybble.evenNumber:
	LD L, A
	LD A, (wSpriteFlipped)
	AND A
	JR Z, DifferentialDecodeNybble.notFlipped
	BIT 3, E
	JR DifferentialDecodeNybble.selectLookupTable

DifferentialDecodeNybble.notFlipped:
	BIT 0, E
DifferentialDecodeNybble.selectLookupTable:
	LD E, L
	JR NZ, DifferentialDecodeNybble.initialValue1
	LD A, (wSpriteDecodeTable0Ptr)
	LD L, A
	LD A, (wSpriteDecodeTable0Ptr + $1)
	JR DifferentialDecodeNybble.tableLookup

DifferentialDecodeNybble.initialValue1:
	LD A, (wSpriteDecodeTable1Ptr)
	LD L, A
	LD A, (wSpriteDecodeTable1Ptr + $1)
DifferentialDecodeNybble.tableLookup:
	LD H, A
	LD A, E
	ADD L
	LD L, A
	JR NC, DifferentialDecodeNybble.noCarry
	INC H
DifferentialDecodeNybble.noCarry:
	LD A, (HL)
	BIT 0, C
	JR NZ, DifferentialDecodeNybble.selectLowNybble
	SWAP A
DifferentialDecodeNybble.selectLowNybble:
	AND $0F
	LD E, A
	RET

; Data from 27A7 to 27AE (8 bytes)
DecodeNybble0Table:
.db $01, $32, $76, $45, $FE, $CD, $89, $BA

; Data from 27AF to 27B6 (8 bytes)
DecodeNybble1Table:
.db $FE, $CD, $89, $BA, $01, $32, $76, $45

; Data from 27B7 to 27BE (8 bytes)
DecodeNybble0TableFlipped:
.db $08, $C4, $E6, $2A, $F7, $3B, $19, $D5

; Data from 27BF to 27C6 (8 bytes)
DecodeNybble1TableFlipped:
.db $F7, $3B, $19, $D5, $08, $C4, $E6, $2A

XorSpriteChunks:
	XOR A
	LD (wSpriteCurPosX), A
	LD (wSpriteCurPosY), A
	CALL ResetSpriteBufferPointers
	LD A, (wSpriteOutputPtr)
	LD L, A
	LD A, (wSpriteOutputPtr + $1)
	LD H, A
	CALL SpriteDifferentialDecode
	CALL ResetSpriteBufferPointers
	LD A, (wSpriteOutputPtr)
	LD L, A
	LD A, (wSpriteOutputPtr + $1)
	LD H, A
	LD A, (wSpriteOutputPtrCached)
	LD E, A
	LD A, (wSpriteOutputPtrCached + $1)
	LD D, A
XorSpriteChunks.xorChunksLoop:
	LD A, (wSpriteFlipped)
	AND A
	JR Z, XorSpriteChunks.notFlipped
	PUSH DE
	LD A, (DE)
	LD B, A
	SWAP A
	AND $0F
	CALL ReverseNybble
	SWAP A
	LD C, A
	LD A, B
	AND $0F
	CALL ReverseNybble
	OR C
	POP DE
	LD (DE), A
XorSpriteChunks.notFlipped:
	LDI A, (HL)
	LD B, A
	LD A, (DE)
	XOR B
	LD (DE), A
	INC DE
	LD A, (wSpriteCurPosY)
	INC A
	LD (wSpriteCurPosY), A
	LD B, A
	LD A, (wSpriteHeight)
	CP B
	JR NZ, XorSpriteChunks.xorChunksLoop
	XOR A
	LD (wSpriteCurPosY), A
	LD A, (wSpriteCurPosX)
	ADD $08
	LD (wSpriteCurPosX), A
	LD B, A
	LD A, (wSpriteWidth)
	CP B
	JR NZ, XorSpriteChunks.xorChunksLoop
	XOR A
	LD (wSpriteCurPosX), A
	RET

ReverseNybble:
	LD DE, NybbleReverseTable
	ADD E
	LD E, A
	JR NC, ReverseNybble.noCarry
	INC D
ReverseNybble.noCarry:
	LD A, (DE)
	RET

ResetSpriteBufferPointers:
	LD A, (wSpriteLoadFlags)
	BIT 0, A
	JR NZ, ResetSpriteBufferPointers.buffer2Selected
	LD DE, sSpriteBuffer1
	LD HL, sSpriteBuffer2
	JR ResetSpriteBufferPointers.storeBufferPointers

ResetSpriteBufferPointers.buffer2Selected:
	LD DE, sSpriteBuffer2
	LD HL, sSpriteBuffer1
ResetSpriteBufferPointers.storeBufferPointers:
	LD A, L
	LD (wSpriteOutputPtr), A
	LD A, H
	LD (wSpriteOutputPtr + $1), A
	LD A, E
	LD (wSpriteOutputPtrCached), A
	LD A, D
	LD (wSpriteOutputPtrCached + $1), A
	RET

; Data from 2867 to 2876 (16 bytes)
NybbleReverseTable:
.db $00, $08, $04, $0C, $02, $0A, $06, $0E, $01, $09, $05, $0D, $03, $0B, $07, $0F

UnpackSpriteMode2:
	CALL ResetSpriteBufferPointers
	LD A, (wSpriteFlipped)
	PUSH AF
	XOR A
	LD (wSpriteFlipped), A
	LD A, (wSpriteOutputPtrCached)
	LD L, A
	LD A, (wSpriteOutputPtrCached + $1)
	LD H, A
	CALL SpriteDifferentialDecode
	CALL ResetSpriteBufferPointers
	POP AF
	LD (wSpriteFlipped), A
	JP XorSpriteChunks

StoreSpriteOutputPointer:
	LD A, L
	LD (wSpriteOutputPtr), A
	LD (wSpriteOutputPtrCached), A
	LD A, H
	LD (wSpriteOutputPtr + $1), A
	LD (wSpriteOutputPtrCached + $1), A
	RET

; Data from 28A6 to 28CA (37 bytes)
.db $21, $00, $C1, $CD, $C4, $28, $21, $00, $C2, $CD, $C4, $28, $3E, $01, $EA, $00
.db $C1, $EA, $0E, $C2, $21, $04, $C1, $36, $3C, $23, $23, $36, $40, $C9, $01, $10
.db $00, $AF, $C3, $E0, $36

FadeOutAudio:
	LD A, (wAudioFadeOutControl)
	AND A
	JR NZ, FadeOutAudio.fadingOut
; Data from 28D1 to 28DB (11 bytes)
.db $FA, $2C, $D7, $CB, $4F, $C0, $3E, $77, $E0, $24, $C9

FadeOutAudio.fadingOut:
	LD A, (wAudioFadeOutCounter)
	AND A
	JR Z, FadeOutAudio.counterReachedZero
; Data from 28E2 to 28E6 (5 bytes)
.db $3D, $EA, $C9, $CF, $C9

FadeOutAudio.counterReachedZero:
	LD A, (wAudioFadeOutCounterReloadValue)
	LD (wAudioFadeOutCounter), A
	LDH A, (rAUDVOL)
	AND A
	JR Z, FadeOutAudio.fadeOutComplete
; Data from 28F2 to 2902 (17 bytes)
.db $47, $E6, $0F, $3D, $4F, $78, $E6, $F0, $CB, $37, $3D, $CB, $37, $B1, $E0, $24
.db $C9

FadeOutAudio.fadeOutComplete:
	LD A, (wAudioFadeOutControl)
	LD B, A
	XOR A
	LD (wAudioFadeOutControl), A
	LD A, $FF
	LD (wNewSoundID), A
	CALL PlaySound
	LD A, (wAudioSavedROMBank)
	LD (wAudioROMBank), A
	LD A, B
	LD (wNewSoundID), A
	JP PlaySound

DisplayTextID:
	LDH A, (hLoadedROMBank - $FF00)
	PUSH AF
	LD B, $01
	LD HL, $7096
	CALL Bankswitch
	LD HL, wTextPredefFlag
	BIT 0, (HL)
	RES 0, (HL)
	JR NZ, DisplayTextID.skipSwitchToMapBank
; Data from 2934 to 2939 (6 bytes)
.db $FA, $5E, $D3, $CD, $BC, $12

DisplayTextID.skipSwitchToMapBank:
	LD A, $1E
	LDH (hFrameCounter - $FF00), A
	LD HL, wCurMapTextPtr
	LDI A, (HL)
	LD H, (HL)
	LD L, A
	LD D, $00
	LDH A, (hDownArrowBlinkCount2 - $FF00)
	LD (wSpriteIndex), A
	AND A
	JP Z, DisplayStartMenu
; Data from 294F to 29E7 (153 bytes)
.db $FE, $D3, $CA, $90, $2A, $FE, $D0, $CA, $9B, $2A, $FE, $D1, $CA, $A9, $2A, $FE
.db $D2, $CA, $BF, $2A, $FA, $E1, $D4, $5F, $F0, $8C, $BB, $28, $02, $30, $1C, $E5
.db $D5, $C5, $06, $04, $21, $74, $70, $CD, $D6, $35, $C1, $D1, $21, $E4, $D4, $F0
.db $8C, $3D, $87, $85, $6F, $30, $01, $24, $23, $7E, $E1, $3D, $5F, $CB, $23, $19
.db $2A, $66, $6F, $7E, $FE, $FE, $CA, $2E, $2A, $FE, $FF, $CA, $72, $2A, $FE, $FC
.db $CA, $60, $34, $FE, $FD, $CA, $6A, $34, $FE, $F9, $CA, $7F, $34, $FE, $F5, $20
.db $0A, $06, $1D, $21, $E0, $4E, $CD, $D6, $35, $18, $1C, $FE, $F7, $CA, $74, $34
.db $FE, $F6, $20, $0A, $21, $C5, $71, $06, $01, $CD, $D6, $35, $18, $09, $CD, $59
.db $3C, $FA, $3C, $CC, $A7, $20, $09, $FA, $47, $CC, $A7, $20, $03, $CD, $65, $38
.db $CD, $9A, $01, $F0, $B4, $CB, $47, $20, $F7

CloseTextDisplay:
	LD A, (wCurMap)
	CALL SwitchToMapRomBank
	LD A, $90
	LDH (hWY - $FF00), A
	CALL DelayFrame
	CALL LoadGBPal
	XOR A
	LDH (hAutoBGTransferEnabled - $FF00), A
	LD HL, wSprite01StateData2OrigFacingDirection
	LD C, $0F
	LD DE, $0010
CloseTextDisplay.restoreSpriteFacingDirectionLoop:
	LD A, (HL)
	DEC H
	LD (HL), A
	INC H
	ADD HL, DE
	DEC C
	JR NZ, CloseTextDisplay.restoreSpriteFacingDirectionLoop
	LD A, $05
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	CALL InitMapSprites
	LD HL, wFontLoaded
	RES 0, (HL)
	LD A, (wStatusFlags6)
	BIT 3, A
	CALL Z, LoadPlayerSpriteGraphics
	CALL LoadCurrentMapView
	POP AF
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	JP UpdateSprites

; Data from 2A2E to 2ACC (159 bytes)
.db $E5, $21, $55, $2A, $CD, $49, $3C, $E1, $23, $CD, $5A, $2A, $3E, $02, $EA, $94
.db $CF, $F0, $B8, $F5, $3E, $01, $E0, $B8, $EA, $00, $20, $CD, $20, $6C, $F1, $E0
.db $B8, $EA, $00, $20, $C3, $D6, $29, $17, $9C, $65, $28, $50, $3E, $01, $EA, $CB
.db $CF, $7C, $EA, $28, $D1, $7D, $EA, $29, $D1, $11, $7B, $CF, $2A, $12, $13, $FE
.db $FF, $20, $F9, $C9, $AF, $E0, $8B, $E0, $8C, $E0, $8D, $23, $F0, $B8, $F5, $3E
.db $01, $E0, $B8, $EA, $00, $20, $CD, $E6, $6F, $F1, $E0, $B8, $EA, $00, $20, $C3
.db $D6, $29, $21, $ED, $69, $06, $07, $CD, $D6, $35, $C3, $D6, $29, $21, $A4, $2A
.db $CD, $49, $3C, $C3, $D6, $29, $17, $B7, $65, $28, $50, $21, $BA, $2A, $CD, $49
.db $3C, $FA, $32, $D7, $CB, $AF, $EA, $32, $D7, $C3, $DF, $29, $17, $C5, $65, $28
.db $50, $21, $C8, $2A, $CD, $49, $3C, $C3, $D6, $29, $17, $EF, $65, $28, $50

DisplayStartMenu:
	LD A, $04
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	LD A, (wWalkBikeSurfState)
	LD (wWalkBikeSurfStateCopy), A
	LD A, $8F
	CALL PlaySound
	LD B, $01
	LD HL, DrawStartMenu
	CALL Bankswitch
	LD B, $03
	LD HL, $452F
	CALL Bankswitch
	CALL UpdateSprites
	CALL HandleMenuInput
	LD B, A
	BIT 6, A
	JR Z, RedisplayStartMenu.checkIfDownPressed
; Data from 2AFA to 2B17 (30 bytes)
.db $FA, $26, $CC, $A7, $20, $F2, $FA, $2A, $CC, $A7, $20, $EC, $FA, $4B, $D7, $CB
.db $6F, $3E, $06, $20, $01, $3D, $EA, $26, $CC, $CD, $F9, $3B, $18, $DA

RedisplayStartMenu.checkIfDownPressed:
	BIT 7, A
	JR Z, RedisplayStartMenu.buttonPressed
; Data from 2B1C to 2B34 (25 bytes)
.db $FA, $4B, $D7, $CB, $6F, $FA, $26, $CC, $0E, $07, $20, $01, $0D, $B9, $20, $C6
.db $AF, $EA, $26, $CC, $CD, $F9, $3B, $18, $BD

RedisplayStartMenu.buttonPressed:
	CALL PlaceUnfilledArrowMenuCursor
	LD A, (wCurrentMenuItem)
	LD (wBattleAndStartSavedMenuItem), A
	LD A, B
	AND $0A
	JP NZ, CloseStartMenu
	CALL SaveScreenTilesToBuffer2
	LD A, (wEventFlags_plus_4)
	BIT 5, A
	LD A, (wCurrentMenuItem)
	JR NZ, RedisplayStartMenu.displayMenuItem
	INC A
RedisplayStartMenu.displayMenuItem:
	CP $00
	JP Z, StartMenu_Pokedex
; Data from 2B57 to 2B6F (25 bytes)
.db $FE, $01, $CA, $A9, $70, $FE, $02, $CA, $02, $73, $FE, $03, $CA, $60, $74, $FE
.db $04, $CA, $E3, $75, $FE, $05, $CA, $F6, $75

CloseStartMenu:
	CALL Joypad
	LDH A, (hJoyPressed - $FF00)
	BIT 0, A
	JR NZ, CloseStartMenu
	CALL LoadTextBoxTilePatterns
	JP CloseTextDisplay

; Data from 2B7F to 2F9D (1055 bytes)
.db $0E, $00, $2A, $5F, $16, $08, $CB, $3B, $3E, $00, $89, $4F, $15, $20, $F7, $05
.db $20, $F0, $79, $EA, $1E, $D1, $C9, $06, $01, $21, $21, $6B, $C3, $D6, $35, $11
.db $49, $D3, $21, $A1, $FF, $0E, $03, $3E, $0B, $CD, $6D, $3E, $3E, $13, $EA, $25
.db $D1, $CD, $E8, $30, $3E, $B2, $CD, $40, $37, $C3, $48, $37, $F0, $B8, $F5, $3E
.db $03, $E0, $B8, $EA, $00, $20, $CD, $74, $4E, $F1, $E0, $B8, $EA, $00, $20, $C9
.db $C5, $F0, $B8, $F5, $3E, $03, $E0, $B8, $EA, $00, $20, $CD, $04, $4E, $C1, $78
.db $E0, $B8, $EA, $00, $20, $C1, $C9, $AF, $E0, $BA, $3E, $01, $E0, $B7, $FA, $5A
.db $D0, $A7, $20, $04, $3E, $01, $18, $02, $3E, $0F, $CD, $BC, $35, $21, $30, $D7
.db $CB, $F6, $AF, $EA, $35, $CC, $EA, $2A, $D1, $FA, $8B, $CF, $6F, $FA, $8C, $CF
.db $67, $7E, $EA, $2A, $D1, $3E, $0D, $EA, $25, $D1, $CD, $E8, $30, $CD, $29, $24
.db $21, $CC, $C3, $11, $0E, $09, $FA, $94, $CF, $A7, $20, $03, $CD, $29, $24, $3E
.db $01, $EA, $37, $CC, $FA, $2A, $D1, $FE, $02, $38, $02, $3E, $02, $EA, $28, $CC
.db $3E, $04, $EA, $24, $CC, $3E, $05, $EA, $25, $CC, $3E, $07, $EA, $29, $CC, $0E
.db $0A, $CD, $39, $37, $AF, $E0, $BA, $CD, $5A, $2E, $3E, $01, $E0, $BA, $CD, $D7
.db $3D, $FA, $5A, $D0, $A7, $28, $1B, $3E, $ED, $EA, $F5, $C3, $0E, $50, $CD, $39
.db $37, $AF, $EA, $26, $CC, $21, $F5, $C3, $7D, $EA, $30, $CC, $7C, $EA, $31, $CC
.db $18, $10, $CD, $BA, $20, $CD, $BE, $3A, $F5, $CD, $7C, $3B, $F1, $CB, $47, $CA
.db $2D, $2D, $FA, $26, $CC, $CD, $EC, $3B, $3E, $01, $EA, $2E, $D1, $EA, $2D, $D1
.db $AF, $EA, $37, $CC, $FA, $26, $CC, $4F, $FA, $36, $CC, $81, $4F, $FA, $2A, $D1
.db $A7, $CA, $3B, $2E, $3D, $B9, $DA, $3B, $2E, $79, $EA, $92, $CF, $FA, $94, $CF
.db $FE, $03, $20, $02, $CB, $21, $FA, $8B, $CF, $6F, $FA, $8C, $CF, $67, $23, $06
.db $00, $09, $7E, $EA, $91, $CF, $FA, $94, $CF, $A7, $28, $21, $E5, $CD, $DF, $37
.db $E1, $FA, $94, $CF, $FE, $03, $20, $05, $23, $7E, $EA, $97, $CF, $FA, $91, $CF
.db $EA, $B5, $D0, $3E, $01, $EA, $B7, $D0, $CD, $6B, $37, $18, $15, $21, $63, $D1
.db $FA, $8B, $CF, $BD, $21, $B5, $D2, $28, $03, $21, $06, $DE, $FA, $92, $CF, $CD
.db $BA, $15, $11, $6D, $CD, $CD, $26, $38, $3E, $01, $EA, $2E, $D1, $FA, $26, $CC
.db $EA, $2D, $D1, $AF, $E0, $B7, $21, $30, $D7, $CB, $B6, $C3, $CD, $35, $CB, $4F
.db $C2, $3B, $2E, $CB, $57, $C2, $44, $6B, $47, $CB, $78, $21, $36, $CC, $28, $0F
.db $7E, $C6, $03, $47, $FA, $2A, $D1, $B8, $DA, $53, $2C, $34, $C3, $53, $2C, $7E
.db $A7, $CA, $53, $2C, $35, $C3, $53, $2C, $21, $63, $C4, $06, $01, $0E, $03, $FA
.db $94, $CF, $FE, $02, $20, $07, $21, $5B, $C4, $06, $01, $0E, $0B, $CD, $22, $19
.db $21, $78, $C4, $FA, $94, $CF, $FE, $02, $20, $03, $21, $70, $C4, $11, $30, $2E
.db $CD, $55, $19, $AF, $EA, $96, $CF, $C3, $A2, $2D, $CD, $31, $38, $F0, $B3, $CB
.db $47, $C2, $24, $2E, $CB, $4F, $C2, $29, $2E, $CB, $77, $20, $06, $CB, $7F, $20
.db $14, $18, $E7, $FA, $97, $CF, $3C, $47, $21, $96, $CF, $34, $7E, $B8, $20, $0F
.db $3E, $01, $77, $18, $0A, $21, $96, $CF, $35, $20, $04, $FA, $97, $CF, $77, $21
.db $79, $C4, $FA, $94, $CF, $FE, $02, $20, $50, $0E, $03, $FA, $96, $CF, $47, $21
.db $9F, $FF, $AF, $22, $22, $77, $11, $A1, $FF, $21, $8D, $FF, $C5, $3E, $0B, $CD
.db $6D, $3E, $C1, $05, $20, $F0, $F0, $8E, $A7, $28, $1A, $AF, $E0, $A2, $E0, $A3
.db $3E, $02, $E0, $A4, $3E, $0D, $CD, $6D, $3E, $F0, $A2, $E0, $9F, $F0, $A3, $E0
.db $A0, $F0, $A4, $E0, $A1, $21, $74, $C4, $11, $34, $2E, $CD, $55, $19, $11, $9F
.db $FF, $0E, $A3, $CD, $CD, $15, $21, $71, $C4, $11, $96, $CF, $01, $02, $81, $CD
.db $5F, $3C, $C3, $89, $2D, $AF, $EA, $35, $CC, $C9, $AF, $EA, $35, $CC, $3E, $FF
.db $C9, $F1, $F6, $F7, $50, $7F, $7F, $7F, $7F, $7F, $7F, $50, $FA, $26, $CC, $EA
.db $2D, $D1, $3E, $02, $EA, $2E, $D1, $EA, $37, $CC, $AF, $E0, $B7, $21, $30, $D7
.db $CB, $B6, $CD, $CD, $35, $AF, $EA, $35, $CC, $37, $C9, $21, $E1, $C3, $06, $09
.db $0E, $0E, $CD, $C4, $18, $FA, $8B, $CF, $5F, $FA, $8C, $CF, $57, $13, $FA, $36
.db $CC, $4F, $FA, $94, $CF, $FE, $03, $79, $20, $04, $CB, $27, $CB, $21, $83, $5F
.db $30, $01, $14, $21, $F6, $C3, $06, $04, $78, $EA, $92, $CF, $1A, $EA, $1E, $D1
.db $FE, $FF, $CA, $91, $2F, $C5, $D5, $E5, $E5, $D5, $FA, $94, $CF, $A7, $28, $09
.db $FE, $01, $28, $27, $CD, $CF, $2F, $18, $25, $E5, $21, $63, $D1, $FA, $8B, $CF
.db $BD, $21, $B5, $D2, $28, $03, $21, $06, $DE, $FA, $92, $CF, $47, $3E, $04, $90
.db $47, $FA, $36, $CC, $80, $CD, $BA, $15, $E1, $18, $03, $CD, $58, $30, $CD, $55
.db $19, $D1, $E1, $FA, $93, $CF, $A7, $28, $15, $E5, $1A, $11, $08, $46, $EA, $91
.db $CF, $CD, $DF, $37, $E1, $01, $19, $00, $09, $0E, $A3, $CD, $CD, $15, $FA, $94
.db $CF, $A7, $20, $3E, $FA, $1E, $D1, $F5, $E5, $21, $63, $D1, $FA, $8B, $CF, $BD
.db $3E, $00, $28, $02, $3E, $02, $EA, $49, $CC, $21, $92, $CF, $7E, $47, $3E, $04
.db $90, $47, $FA, $36, $CC, $80, $77, $CD, $72, $13, $FA, $49, $CC, $A7, $28, $06
.db $FA, $9B, $CF, $EA, $B9, $CF, $E1, $01, $1C, $00, $09, $CD, $0B, $15, $F1, $EA
.db $1E, $D1, $E1, $D1, $13, $FA, $94, $CF, $FE, $03, $20, $44, $FA, $1E, $D1, $EA
.db $91, $CF, $CD, $D9, $30, $FA, $24, $D1, $A7, $20, $21, $E5, $01, $1C, $00, $09
.db $3E, $F1, $22, $FA, $1E, $D1, $F5, $1A, $EA, $97, $CF, $D5, $11, $1E, $D1, $12
.db $01, $02, $01, $CD, $5F, $3C, $D1, $F1, $EA, $1E, $D1, $E1, $13, $C1, $0C, $C5
.db $0C, $FA, $35, $CC, $A7, $28, $09, $CB, $27, $B9, $20, $04, $2B, $3E, $EC, $22
.db $01, $28, $00, $09, $C1, $0C, $05, $C2, $87, $2E, $01, $F8, $FF, $09, $3E, $EE
.db $77, $C9, $11, $97, $2F, $C3, $55, $19, $82, $80, $8D, $82, $84, $8B, $50

GetMonName:
	PUSH HL
	LDH A, (hLoadedROMBank - $FF00)
	PUSH AF
	LD A, $07
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	LD A, (wCalculateWhoseStats)
	DEC A
	LD HL, MonsterNames
	LD C, $0A
	LD B, $00
	CALL AddNTimes
	LD DE, wBattleMenuCurrentPP
	PUSH DE
	LD BC, $000A
	CALL CopyData
	LD HL, wPPUpCountAndMaxPP_plus_4
	LD (HL), $50
	POP DE
	POP AF
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	POP HL
	RET

; Data from 2FCF to 30E7 (281 bytes)
.db $E5, $C5, $FA, $1E, $D1, $FE, $C4, $30, $12, $EA, $B5, $D0, $3E, $04, $EA, $B6
.db $D0, $3E, $01, $EA, $B7, $D0, $CD, $6B, $37, $18, $03, $CD, $F3, $2F, $11, $6D
.db $CD, $C1, $E1, $C9, $E5, $D5, $C5, $FA, $1E, $D1, $F5, $FE, $C9, $30, $0D, $C6
.db $05, $EA, $1E, $D1, $21, $3E, $30, $01, $02, $00, $18, $06, $21, $3C, $30, $01
.db $02, $00, $11, $6D, $CD, $CD, $B5, $00, $FA, $1E, $D1, $D6, $C8, $06, $F6, $D6
.db $0A, $38, $03, $04, $18, $F9, $C6, $0A, $F5, $78, $12, $13, $F1, $06, $F6, $80
.db $12, $13, $3E, $50, $12, $F1, $EA, $1E, $D1, $C1, $D1, $E1, $C9, $93, $8C, $87
.db $8C, $FE, $C4, $38, $03, $FE, $C9, $C9, $A7, $C9, $21, $52, $30, $11, $01, $00
.db $C3, $AB, $3D, $0F, $13, $39, $46, $94, $FF, $E5, $3E, $02, $EA, $B6, $D0, $FA
.db $1E, $D1, $EA, $B5, $D0, $3E, $2C, $EA, $B7, $D0, $CD, $6B, $37, $11, $6D, $CD
.db $E1, $C9, $F0, $B8, $F5, $FA, $5E, $D3, $CD, $BC, $12, $CD, $61, $00, $CD, $A0
.db $36, $CD, $AA, $0C, $CD, $E8, $09, $CD, $7B, $00, $F1, $E0, $B8, $EA, $00, $20
.db $C9, $F0, $B8, $F5, $FA, $5E, $D3, $CD, $BC, $12, $CD, $61, $00, $CD, $E8, $09
.db $CD, $7B, $00, $F1, $E0, $B8, $EA, $00, $20, $C9, $21, $2E, $D7, $CB, $A6, $06
.db $1C, $21, $90, $4F, $C3, $D6, $35, $3E, $01, $EA, $3C, $CC, $C9, $06, $03, $21
.db $C7, $55, $C3, $D6, $35, $F0, $B8, $F5, $3E, $03, $E0, $B8, $EA, $00, $20, $CD
.db $F1, $66, $D1, $7A, $E0, $B8, $EA, $00, $20, $C9, $E5, $D5, $C5, $06, $03, $21
.db $64, $67, $CD, $D6, $35, $C1, $D1, $E1, $C9

DisplayTextBoxID:
	LDH A, (hLoadedROMBank - $FF00)
	PUSH AF
	LD A, $01
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	CALL DisplayTextBoxID_
; Data from 30F5 to 310D (25 bytes)
.db $C1, $78, $E0, $B8, $EA, $00, $20, $C9, $FA, $57, $CC, $A7, $C0, $FA, $36, $D7
.db $CB, $4F, $C0, $FA, $30, $D7, $E6, $80, $C9

RunNPCMovementScript:
	LD HL, wMovementFlags
	BIT 0, (HL)
	RES 0, (HL)
	JR NZ, RunNPCMovementScript.playerStepOutFromDoor
	LD A, (wNPCMovementScriptPointerTableNum)
	AND A
	RET Z
	DEC A
	ADD A
	LD D, $00
	LD E, A
	LD HL, RunNPCMovementScript.NPCMovementScriptPointerTables
	ADD HL, DE
	LDI A, (HL)
	LD H, (HL)
	LD L, A
	LDH A, (hLoadedROMBank - $FF00)
	PUSH AF
	LD A, (wNPCMovementScriptBank)
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	LD A, (wNPCMovementScriptFunctionNum)
	CALL CallFunctionInTable
	POP AF
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	RET

; Pointer Table from 3140 to 3145 (3 entries, indexed by wNPCMovementScriptPointerTableNum)
RunNPCMovementScript.NPCMovementScriptPointerTables:
.dw PalletMovementScriptPointerTable, PewterMuseumGuyMovementScriptPointerTable, PewterGymGuyMovementScriptPointerTable

RunNPCMovementScript.playerStepOutFromDoor:
	LD B, $06
	LD HL, $63E0
	JP Bankswitch

; Data from 314E to 3485 (824 bytes)
.db $06, $06, $21, $1D, $64, $C3, $D6, $35, $C9, $7C, $EA, $30, $DA, $7D, $EA, $31
.db $DA, $C9, $F5, $D5, $CD, $57, $31, $E1, $F1, $E5, $21, $33, $D7, $CB, $66, $CB
.db $A6, $28, $03, $FA, $39, $DA, $E1, $EA, $39, $DA, $CD, $97, $3D, $FA, $39, $DA
.db $C9, $D5, $11, $5F, $CF, $01, $11, $00, $CD, $B5, $00, $E1, $11, $70, $CF, $01
.db $0B, $00, $C3, $B5, $00, $D5, $F5, $16, $00, $5F, $21, $30, $DA, $2A, $6E, $67
.db $19, $F1, $A7, $20, $06, $7E, $EA, $55, $CC, $18, $1C, $FE, $02, $28, $15, $FE
.db $04, $28, $11, $FE, $06, $28, $0D, $FE, $08, $28, $09, $FE, $0A, $20, $08, $2A
.db $56, $5F, $18, $03, $2A, $66, $6F, $D1, $C9, $3E, $10, $C3, $6D, $3E, $CD, $57
.db $31, $AF, $CD, $93, $31, $3E, $02, $CD, $93, $31, $FA, $55, $CC, $4F, $06, $02
.db $CD, $C7, $31, $79, $A7, $28, $08, $3E, $06, $CD, $93, $31, $C3, $49, $3C, $3E
.db $04, $CD, $93, $31, $CD, $49, $3C, $3E, $0A, $CD, $93, $31, $D5, $3E, $08, $CD
.db $93, $31, $D1, $CD, $54, $33, $21, $33, $D7, $CB, $E6, $21, $60, $CD, $CB, $46
.db $C0, $CD, $6A, $33, $21, $39, $DA, $34, $C3, $5D, $32, $CD, $06, $33, $FA, $13
.db $CF, $FE, $FF, $20, $08, $AF, $EA, $13, $CF, $EA, $55, $CC, $C9, $21, $33, $D7
.db $CB, $DE, $EA, $4F, $CD, $AF, $EA, $50, $CD, $3E, $4C, $CD, $6D, $3E, $3E, $F0
.db $EA, $6B, $CD, $AF, $E0, $B4, $CD, $CF, $32, $21, $39, $DA, $34, $C9, $FA, $30
.db $D7, $E6, $01, $C0, $EA, $6B, $CD, $FA, $13, $CF, $E0, $8C, $CD, $20, $29, $AF
.db $EA, $6B, $CD, $CD, $D7, $32, $21, $2D, $D7, $CB, $F6, $CB, $FE, $21, $2E, $D7
.db $CB, $CE, $21, $39, $DA, $34, $C9, $21, $26, $D1, $CB, $EE, $CB, $F6, $21, $2D
.db $D7, $CB, $BE, $21, $60, $CD, $CB, $86, $FA, $57, $D0, $FE, $FF, $CA, $C1, $32
.db $3E, $02, $CD, $93, $31, $FA, $55, $CC, $4F, $06, $01, $CD, $C7, $31, $FA, $13
.db $D7, $FE, $C8, $30, $16, $21, $CE, $D5, $11, $02, $00, $FA, $13, $CF, $CD, $AB
.db $3D, $23, $7E, $EA, $4D, $CC, $3E, $11, $CD, $6D, $3E, $21, $30, $D7, $CB, $66
.db $CB, $A6, $C0, $AF, $EA, $6B, $CD, $E0, $B4, $E0, $B3, $E0, $B2, $EA, $39, $DA
.db $C9, $06, $15, $21, $81, $68, $C3, $D6, $35, $FA, $2D, $CD, $EA, $59, $D0, $EA
.db $13, $D7, $FE, $C8, $FA, $2E, $CD, $38, $04, $EA, $5D, $D0, $C9, $EA, $27, $D1
.db $C9, $21, $F9, $67, $18, $0D, $21, $19, $68, $18, $08, $21, $3D, $68, $18, $03
.db $21, $5D, $68, $06, $15, $C3, $D6, $35, $AF, $CD, $93, $31, $54, $5D, $CD, $57
.db $31, $1A, $EA, $13, $CF, $EA, $55, $CC, $FE, $FF, $C8, $3E, $02, $CD, $93, $31
.db $06, $02, $FA, $55, $CC, $4F, $CD, $C7, $31, $79, $A7, $20, $21, $E5, $D5, $E5
.db $AF, $CD, $93, $31, $23, $7E, $E1, $EA, $3E, $CD, $FA, $13, $CF, $CB, $37, $EA
.db $3D, $CD, $3E, $39, $CD, $6D, $3E, $D1, $E1, $FA, $3D, $CD, $A7, $C0, $21, $0C
.db $00, $19, $54, $5D, $18, $B8, $F0, $B8, $EA, $92, $D0, $7C, $EA, $8C, $D0, $7D
.db $EA, $8D, $D0, $7A, $EA, $8E, $D0, $7B, $EA, $8F, $D0, $C9, $21, $04, $D5, $16
.db $00, $FA, $13, $CF, $3D, $87, $5F, $19, $2A, $EA, $2D, $CD, $7E, $EA, $2E, $CD
.db $C3, $E8, $33, $E5, $21, $2D, $D7, $CB, $7E, $CB, $BE, $E1, $C8, $F0, $B8, $F5
.db $FA, $92, $D0, $E0, $B8, $EA, $00, $20, $E5, $06, $09, $21, $4A, $7E, $CD, $D6
.db $35, $21, $CF, $33, $CD, $49, $3C, $E1, $F1, $E0, $B8, $EA, $00, $20, $06, $06
.db $21, $E7, $65, $CD, $D6, $35, $C3, $48, $37, $FA, $0B, $CF, $A7, $20, $09, $FA
.db $8C, $D0, $67, $FA, $8D, $D0, $6F, $C9, $FA, $8E, $D0, $67, $FA, $8F, $D0, $6F
.db $C9, $17, $45, $40, $20, $08, $CD, $B7, $33, $CD, $40, $1B, $C3, $D7, $24, $FA
.db $60, $CD, $CB, $47, $C0, $CD, $6A, $33, $AF, $C9, $FA, $2D, $CD, $FE, $E1, $C8
.db $FE, $F2, $C8, $FE, $F3, $C8, $FA, $5C, $D0, $A7, $C0, $AF, $EA, $C7, $CF, $3E
.db $FF, $CD, $B1, $23, $3E, $1F, $EA, $EF, $C0, $EA, $F0, $C0, $FA, $2D, $CD, $47
.db $21, $39, $34, $2A, $FE, $FF, $28, $07, $B8, $20, $F8, $3E, $F6, $18, $11, $21
.db $34, $34, $2A, $FE, $FF, $28, $07, $B8, $20, $F8, $3E, $F9, $18, $02, $3E, $FC
.db $EA, $EE, $C0, $C3, $B1, $23, $CB, $CE, $DA, $E8, $FF, $D5, $D9, $DC, $DD, $E3
.db $E4, $E5, $E6, $FF, $2A, $FE, $FF, $C8, $B8, $20, $12, $2A, $B9, $20, $0F, $2A
.db $56, $5F, $21, $D3, $CC, $CD, $0C, $35, $3D, $EA, $38, $CD, $C9, $23, $23, $23
.db $18, $E2, $CD, $F4, $36, $06, $01, $21, $E6, $78, $18, $0F, $CD, $F4, $36, $06
.db $08, $21, $C2, $54, $18, $05, $06, $14, $21, $1B, $67, $CD, $D6, $35, $C3, $DF
.db $29, $06, $05, $21, $2C, $7E, $18, $F3

StartSimulatingJoypadStates:
	XOR A
	LD (wOverrideSimulatedJoypadStatesMask), A
	LD (wSpritePlayerStateData2MovementByte1), A
	LD HL, wStatusFlags5
	SET 7, (HL)
	RET

; Data from 3493 to 3540 (174 bytes)
.db $3E, $1C, $CD, $6D, $3E, $78, $A7, $C9, $EA, $1E, $D1, $06, $01, $21, $18, $7C
.db $C3, $D6, $35, $CD, $AE, $34, $0E, $06, $C3, $39, $37, $3E, $09, $E0, $8B, $CD
.db $FC, $34, $F0, $8D, $77, $C9, $11, $F9, $FF, $19, $77, $C9, $FA, $61, $D3, $47
.db $FA, $62, $D3, $4F, $AF, $EA, $3D, $CD, $2A, $FE, $FF, $28, $12, $E5, $21, $3D
.db $CD, $34, $E1, $B8, $28, $03, $23, $18, $EF, $2A, $B9, $20, $EB, $37, $C9, $A7
.db $C9, $E5, $21, $04, $C2, $F0, $8C, $CB, $37, $16, $00, $5F, $19, $2A, $D6, $04
.db $47, $7E, $D6, $04, $4F, $E1, $C3, $C7, $34, $26, $C1, $18, $02, $26, $C2, $F0
.db $8B, $47, $F0, $8C, $CB, $37, $80, $6F, $C9, $AF, $EA, $D2, $CC, $1A, $FE, $FF
.db $28, $16, $E0, $8B, $13, $1A, $06, $00, $4F, $FA, $D2, $CC, $81, $EA, $D2, $CC
.db $F0, $8B, $CD, $E0, $36, $13, $18, $E5, $3E, $FF, $77, $FA, $D2, $CC, $3C, $C9
.db $E5, $CD, $4E, $35, $36, $FE, $CD, $58, $35, $F0, $8D, $77, $E1, $C9

SetSpriteMovementBytesToFF:
	PUSH HL
	CALL GetSpriteMovementByte1Pointer
	LD (HL), $FF
	CALL GetSpriteMovementByte2Pointer
	LD (HL), $FF
	POP HL
	RET

GetSpriteMovementByte1Pointer:
	LD H, $C2
	LDH A, (hDownArrowBlinkCount2 - $FF00)
	SWAP A
	ADD $06
	LD L, A
	RET

GetSpriteMovementByte2Pointer:
	PUSH DE
	LD HL, wMapSpriteData
	LDH A, (hDownArrowBlinkCount2 - $FF00)
	DEC A
	ADD A
	LD D, $00
	LD E, A
	ADD HL, DE
	POP DE
	RET

; Data from 3566 to 35BB (86 bytes)
.db $CD, $9E, $35, $FA, $2B, $D1, $A7, $20, $25, $3E, $0E, $CD, $BC, $35, $FA, $31
.db $D0, $3D, $21, $14, $59, $01, $05, $00, $CD, $87, $3A, $11, $33, $D0, $2A, $12
.db $13, $2A, $12, $11, $46, $D0, $2A, $12, $13, $2A, $12, $C3, $CD, $35, $21, $33
.db $D0, $11, $DE, $6E, $73, $23, $72, $C9, $06, $04, $21, $58, $7A, $C3, $D6, $35
.db $11, $47, $D3, $21, $9F, $FF, $0E, $03, $C3, $8E, $3A, $11, $A4, $D5, $21, $A0
.db $FF, $0E, $02, $C3, $8E, $3A

BankswitchHome:
	LD (wBankswitchHomeTemp), A
	LDH A, (hLoadedROMBank - $FF00)
	LD (wBankswitchHomeSavedROMBank), A
	LD A, (wBankswitchHomeTemp)
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	RET

BankswitchBack:
	LD A, (wBankswitchHomeSavedROMBank)
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	RET

Bankswitch:
	LDH A, (hLoadedROMBank - $FF00)
	PUSH AF
	LD A, B
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	LD BC, Bankswitch.Return	; Overriding return address
	PUSH BC
	JP HL

Bankswitch.Return:
	POP BC
	LD A, B
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	RET

; Data from 35EC to 3639 (78 bytes)
.db $CD, $19, $37, $CD, $FF, $35, $18, $34, $3E, $14, $EA, $25, $D1, $CD, $FF, $35
.db $C3, $E8, $30, $AF, $EA, $2C, $D1, $21, $3A, $C4, $01, $0F, $08, $C9, $CD, $19
.db $37, $3E, $06, $EA, $2C, $D1, $21, $23, $C4, $01, $0C, $08, $18, $0E, $CD, $19
.db $37, $3E, $03, $EA, $2C, $D1, $21, $38, $C4, $01, $0D, $08, $3E, $14, $EA, $25
.db $D1, $CD, $E8, $30, $C3, $25, $37, $90, $D0, $2F, $C6, $01, $37, $C9

MoveSprite:
	CALL SetSpriteMovementBytesToFF
	PUSH HL
	PUSH BC
	CALL GetSpriteMovementByte1Pointer
	XOR A
	LD (HL), A
	LD HL, wAnimationType
	LD C, $00
MoveSprite_.loop:
	LD A, (DE)
	LDI (HL), A
	INC DE
	INC C
	CP $FF
	JR NZ, MoveSprite_.loop
	LD A, C
	LD (wNPCNumScriptedSteps), A
	POP BC
	LD HL, wStatusFlags5
	SET 0, (HL)
	POP HL
	XOR A
	LD (wOverrideSimulatedJoypadStatesMask), A
	LD (wAddedToParty), A
	DEC A
	LD (wJoyIgnore), A
	LD (wUnusedOverrideSimulatedJoypadStatesIndex), A
	RET

; Data from 366B to 367F (21 bytes)
.db $E5, $21, $E7, $FF, $AF, $32, $3A, $A7, $28, $09, $2A, $96, $38, $05, $23, $34
.db $2B, $18, $F8, $E1, $C9

LoadFontTilePatterns:
	LDH A, (rLCDC)
	BIT 7, A
	JR NZ, LoadFontTilePatterns.on
	LD HL, FontGraphics
	LD DE, $8800
	LD BC, $0400
	LD A, $04
	JP FarCopyDataDouble

LoadFontTilePatterns.on:
	LD DE, $5A80
	LD HL, $8800
	LD BC, $0480
	JP CopyVideoDataDouble

LoadTextBoxTilePatterns:
	LDH A, (rLCDC)
	BIT 7, A
	JR NZ, LoadTextBoxTilePatterns.on
	LD HL, GameFreakLogoGraphicsEnd
	LD DE, $9600
	LD BC, $0200
	LD A, $04
	JP FarCopyData2

LoadTextBoxTilePatterns.on:
	LD DE, $6288
	LD HL, $9600
	LD BC, $0420
	JP CopyVideoData

; Data from 36C0 to 36DF (32 bytes)
.db $F0, $40, $CB, $7F, $20, $0E, $21, $A0, $5E, $11, $20, $96, $01, $E0, $01, $3E
.db $04, $C3, $F7, $17, $11, $A0, $5E, $21, $20, $96, $01, $1E, $04, $C3, $48, $18

FillMemory:
	PUSH DE
	LD D, A
FillMemory.loop:
	LD A, D
	LDI (HL), A
	DEC BC
	LD A, B
	OR C
	JR NZ, FillMemory.loop
	POP DE
	RET

; Data from 36EB to 36F3 (9 bytes)
.db $21, $AB, $D0, $73, $23, $72, $C3, $FD, $24

SaveScreenTilesToBuffer2:
	LD HL, wShadowOAMEnd
	LD DE, wSerialOtherGameboyRandomNumberListBlock
	LD BC, $0168
	CALL CopyData
	RET

LoadScreenTilesFromBuffer2:
	CALL LoadScreenTilesFromBuffer2DisableBGTransfer
	LD A, $01
	LDH (hAutoBGTransferEnabled - $FF00), A
	RET

LoadScreenTilesFromBuffer2DisableBGTransfer:
	XOR A
	LDH (hAutoBGTransferEnabled - $FF00), A
	LD HL, wSerialOtherGameboyRandomNumberListBlock
	LD DE, wShadowOAMEnd
	LD BC, $0168
	CALL CopyData
	RET

SaveScreenTilesToBuffer1:
	LD HL, wShadowOAMEnd
	LD DE, wSerialPartyMonsPatchList
	LD BC, $0168
	JP CopyData

LoadScreenTilesFromBuffer1:
	XOR A
	LDH (hAutoBGTransferEnabled - $FF00), A
	LD HL, wSerialPartyMonsPatchList
	LD DE, wShadowOAMEnd
	LD BC, $0168
	CALL CopyData
	LD A, $01
	LDH (hAutoBGTransferEnabled - $FF00), A
	RET

DelayFrames:
	CALL DelayFrame
	DEC C
	JR NZ, DelayFrames
	RET

; Data from 3740 to 3830 (241 bytes)
.db $F5, $CD, $48, $37, $F1, $C3, $B1, $23, $FA, $83, $D0, $E6, $80, $C0, $E5, $21
.db $2A, $C0, $AF, $B6, $23, $B6, $23, $23, $B6, $20, $F4, $E1, $C9, $1E, $42, $00
.db $40, $92, $4A, $2B, $47, $73, $D2, $AC, $D9, $FF, $59, $FA, $B5, $D0, $EA, $1E
.db $D1, $FE, $C4, $D2, $F3, $2F, $F0, $B8, $F5, $E5, $C5, $D5, $FA, $B6, $D0, $3D
.db $20, $0B, $CD, $9E, $2F, $21, $0B, $00, $19, $5D, $54, $18, $40, $FA, $B7, $D0
.db $E0, $B8, $EA, $00, $20, $FA, $B6, $D0, $3D, $87, $16, $00, $5F, $30, $01, $14
.db $21, $5D, $37, $19, $2A, $E0, $96, $7E, $E0, $95, $F0, $95, $67, $F0, $96, $6F
.db $FA, $B5, $D0, $47, $0E, $00, $54, $5D, $2A, $FE, $50, $20, $FB, $0C, $78, $B9
.db $20, $F4, $62, $6B, $11, $6D, $CD, $01, $14, $00, $CD, $B5, $00, $7B, $EA, $8D
.db $CF, $7A, $EA, $8E, $CF, $D1, $C1, $E1, $F1, $E0, $B8, $EA, $00, $20, $C9, $F0
.db $B8, $F5, $FA, $94, $CF, $FE, $01, $3E, $01, $20, $02, $3E, $0F, $E0, $B8, $EA
.db $00, $20, $21, $8F, $CF, $2A, $66, $6F, $FA, $91, $CF, $FE, $C4, $30, $13, $01
.db $03, $00, $09, $3D, $20, $FC, $2B, $3A, $E0, $8D, $3A, $E0, $8C, $7E, $E0, $8B
.db $18, $0A, $3E, $1E, $E0, $B8, $EA, $00, $20, $CD, $86, $7F, $11, $8B, $FF, $F1
.db $E0, $B8, $EA, $00, $20, $C9, $21, $4B, $CF, $1A, $13, $22, $FE, $50, $20, $F9
.db $C9

JoypadLowSensitivity:
	CALL Joypad
	LDH A, (hJoy7 - $FF00)
	AND A
	LDH A, (hJoyPressed - $FF00)
	JR Z, JoypadLowSensitivity.storeButtonState
	LDH A, (hJoyHeld - $FF00)
JoypadLowSensitivity.storeButtonState:
	LDH (hJoy5 - $FF00), A
	LDH A, (hJoyPressed - $FF00)
	AND A
	JR Z, JoypadLowSensitivity.noNewlyPressedButtons
	LD A, $1E
	LDH (hFrameCounter - $FF00), A
	RET

JoypadLowSensitivity.noNewlyPressedButtons:
	LDH A, (hFrameCounter - $FF00)
	AND A
	JR Z, JoypadLowSensitivity.delayOver
	XOR A
	LDH (hJoy5 - $FF00), A
	RET

JoypadLowSensitivity.delayOver:
	LDH A, (hJoyHeld - $FF00)
	AND $03
	JR Z, JoypadLowSensitivity.setShortDelay
	LDH A, (hJoy6 - $FF00)
	AND A
	JR NZ, JoypadLowSensitivity.setShortDelay
	XOR A
	LDH (hJoy5 - $FF00), A
JoypadLowSensitivity.setShortDelay:
	LD A, $05
	LDH (hFrameCounter - $FF00), A
	RET

WaitForTextScrollButtonPress:
	LDH A, (hBaseTileID - $FF00)
	PUSH AF
	LDH A, (hDownArrowBlinkCount2 - $FF00)
	PUSH AF
	XOR A
	LDH (hBaseTileID - $FF00), A
	LD A, $06
	LDH (hDownArrowBlinkCount2 - $FF00), A
WaitForTextScrollButtonPress.loop:
	PUSH HL
	LD A, (wPartyMenuAnimMonEnabled)
	AND A
	JR Z, WaitForTextScrollButtonPress.skipAnimation
	CALL $56C6	; Possibly invalid
WaitForTextScrollButtonPress.skipAnimation:
	LD HL, wTileMap_plus_152
	CALL HandleDownArrowBlinkTiming
	POP HL
	CALL JoypadLowSensitivity
	LD A, $2D
	CALL Predef
	LDH A, (hJoy5 - $FF00)
	AND $03
	JR Z, WaitForTextScrollButtonPress.loop
; Data from 3891 to 3897 (7 bytes)
.db $F1, $E0, $8C, $F1, $E0, $8B, $C9

ManualTextScroll:
	LD A, (wLinkState)
	CP $04
	JR Z, ManualTextScroll.inLinkBattle
	CALL WaitForTextScrollButtonPress
; Data from 38A2 to 38A6 (5 bytes)
.db $3E, $90, $C3, $B1, $23

ManualTextScroll.inLinkBattle:
	LD C, $41
	JP DelayFrames

; Data from 38AC to 38B8 (13 bytes)
.db $E5, $C5, $21, $41, $7D, $06, $0D, $CD, $D6, $35, $C1, $E1, $C9

Divide:
	PUSH HL
	PUSH DE
	PUSH BC
	LDH A, (hLoadedROMBank - $FF00)
	PUSH AF
	LD A, $0D
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	CALL _Divide
	POP AF
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	POP BC
	POP DE
	POP HL
	RET

; Data from 38D3 to 3A86 (436 bytes)
.db $FA, $30, $D7, $CB, $77, $C0, $FA, $58, $D3, $CB, $4F, $C8, $E5, $D5, $C5, $FA
.db $58, $D3, $CB, $47, $28, $09, $FA, $55, $D3, $E6, $0F, $E0, $D5, $18, $04, $3E
.db $01, $E0, $D5, $CD, $9A, $01, $F0, $B4, $CB, $47, $28, $02, $18, $04, $CB, $4F
.db $28, $05, $CD, $AF, $20, $18, $05, $F0, $D5, $A7, $20, $E7, $C1, $D1, $E1, $C9
.db $2A, $12, $13, $7C, $B8, $20, $F9, $7D, $B9, $20, $F5, $C9, $21, $68, $7B, $06
.db $01, $C3, $D6, $35, $E5, $D5, $C5, $06, $03, $21, $E5, $72, $CD, $D6, $35, $C1
.db $D1, $E1, $C9, $0E, $00, $0C, $CD, $4A, $39, $F0, $97, $12, $13, $F0, $98, $12
.db $13, $79, $FE, $05, $20, $EF, $C9, $E5, $D5, $C5, $78, $57, $E5, $21, $B8, $D0
.db $06, $00, $09, $7E, $5F, $E1, $E5, $CB, $21, $7A, $A7, $28, $1F, $09, $AF, $E0
.db $96, $E0, $97, $04, $78, $FE, $FF, $28, $13, $E0, $98, $E0, $99, $CD, $AC, $38
.db $3A, $57, $F0, $98, $92, $2A, $57, $F0, $97, $9A, $38, $E2, $CB, $39, $E1, $C5
.db $01, $0B, $00, $09, $C1, $79, $FE, $02, $28, $32, $FE, $03, $28, $35, $FE, $04
.db $28, $36, $FE, $05, $28, $3A, $C5, $7E, $CB, $37, $E6, $01, $CB, $27, $CB, $27
.db $CB, $27, $47, $2A, $E6, $01, $CB, $27, $CB, $27, $80, $47, $7E, $CB, $37, $E6
.db $01, $CB, $27, $80, $47, $7E, $E6, $01, $80, $C1, $18, $18, $7E, $CB, $37, $E6
.db $0F, $18, $11, $7E, $E6, $0F, $18, $0C, $23, $7E, $CB, $37, $E6, $0F, $18, $04
.db $23, $7E, $E6, $0F, $16, $00, $83, $5F, $30, $01, $14, $CB, $23, $CB, $12, $CB
.db $38, $CB, $38, $78, $83, $30, $01, $14, $E0, $98, $7A, $E0, $97, $AF, $E0, $96
.db $FA, $27, $D1, $E0, $99, $CD, $AC, $38, $F0, $96, $E0, $95, $F0, $97, $E0, $96
.db $F0, $98, $E0, $97, $3E, $64, $E0, $99, $3E, $03, $47, $CD, $B9, $38, $79, $FE
.db $01, $3E, $05, $20, $12, $FA, $27, $D1, $47, $F0, $98, $80, $E0, $98, $30, $05
.db $F0, $97, $3C, $E0, $97, $3E, $0A, $47, $F0, $98, $80, $E0, $98, $30, $05, $F0
.db $97, $3C, $E0, $97, $F0, $97, $FE, $04, $30, $0A, $FE, $03, $38, $0E, $F0, $98
.db $FE, $E8, $38, $08, $3E, $03, $E0, $97, $3E, $E7, $E0, $98, $C1, $D1, $E1, $C9
.db $F0, $B8, $F5, $3E, $03, $E0, $B8, $EA, $00, $20, $CD, $9D, $74, $C1, $78, $E0
.db $B8, $EA, $00, $20, $C9, $F0, $B8, $F5, $3E, $03, $E0, $B8, $EA, $00, $20, $CD
.db $1E, $75, $C1, $78, $E0, $B8, $EA, $00, $20, $C9, $A7, $C8, $01, $0B, $00, $09
.db $3D, $20, $FC, $C9

AddNTimes:
	AND A
	RET Z
AddNTimes.loop:
	ADD HL, BC
	DEC A
	JR NZ, AddNTimes.loop
	RET

; Data from 3A8E to 3A96 (9 bytes)
.db $1A, $BE, $C0, $13, $23, $0D, $20, $F8, $C9

WriteOAMBlock:
	LD H, $C3
	SWAP A
	LD L, A
	CALL WriteOAMBlock.writeOneEntry
	PUSH BC
	LD A, $08
	ADD C
	LD C, A
	CALL WriteOAMBlock.writeOneEntry
	POP BC
	LD A, $08
	ADD B
	LD B, A
	CALL WriteOAMBlock.writeOneEntry
	LD A, $08
	ADD C
	LD C, A
WriteOAMBlock.writeOneEntry:
	LD (HL), B
	INC HL
	LD (HL), C
	INC HL
	LD A, (DE)
	INC DE
	LDI (HL), A
	LD A, (DE)
	INC DE
	LDI (HL), A
	RET

HandleMenuInput:
	XOR A
	LD (wPartyMenuAnimMonEnabled), A
	LDH A, (hBaseTileID - $FF00)
	PUSH AF
	LDH A, (hDownArrowBlinkCount2 - $FF00)
	PUSH AF
	XOR A
	LDH (hBaseTileID - $FF00), A
	LD A, $06
	LDH (hDownArrowBlinkCount2 - $FF00), A
HandleMenuInput_.loop1:
	XOR A
	LD (wAnimCounter), A
	CALL PlaceMenuCursor
	CALL Delay3
HandleMenuInput_.loop2:
	PUSH HL
	LD A, (wPartyMenuAnimMonEnabled)
	AND A
	JR Z, HandleMenuInput_.getJoypadState
	LD B, $1C
	LD HL, $56FF
	CALL Bankswitch
HandleMenuInput_.getJoypadState:
	POP HL
	CALL JoypadLowSensitivity
	LDH A, (hJoy5 - $FF00)
	AND A
	JR NZ, HandleMenuInput_.keyPressed
	PUSH HL
	LD HL, wTileMap_plus_EE
	CALL HandleDownArrowBlinkTiming
	POP HL
	LD A, (wMenuJoypadPollCount)
	DEC A
	JR Z, HandleMenuInput_.giveUpWaiting
	JR HandleMenuInput_.loop2

HandleMenuInput_.giveUpWaiting:
	POP AF
	LDH (hDownArrowBlinkCount2 - $FF00), A
	POP AF
	LDH (hBaseTileID - $FF00), A
	XOR A
	LD (wMenuWrappingEnabled), A
	RET

HandleMenuInput_.keyPressed:
	XOR A
	LD (wCheckFor180DegreeTurn), A
	LDH A, (hJoy5 - $FF00)
	LD B, A
	BIT 6, A
	JR Z, HandleMenuInput_.checkIfDownPressed
	LD A, (wCurrentMenuItem)
	AND A
	JR Z, HandleMenuInput_.alreadyAtTop
	DEC A
	LD (wCurrentMenuItem), A
	JR HandleMenuInput_.checkOtherKeys

HandleMenuInput_.alreadyAtTop:
	LD A, (wMenuWrappingEnabled)
	AND A
	JR Z, HandleMenuInput_.noWrappingAround
	LD A, (wMaxMenuItem)
	LD (wCurrentMenuItem), A
	JR HandleMenuInput_.checkOtherKeys

HandleMenuInput_.checkIfDownPressed:
	BIT 7, A
	JR Z, HandleMenuInput_.checkOtherKeys
	LD A, (wCurrentMenuItem)
	INC A
	LD C, A
	LD A, (wMaxMenuItem)
	CP C
	JR NC, HandleMenuInput_.notAtBottom
	LD A, (wMenuWrappingEnabled)
	AND A
	JR Z, HandleMenuInput_.noWrappingAround
	LD C, $00
HandleMenuInput_.notAtBottom:
	LD A, C
	LD (wCurrentMenuItem), A
HandleMenuInput_.checkOtherKeys:
	LD A, (wMenuWatchedKeys)
	AND B
	JP Z, HandleMenuInput_.loop1
HandleMenuInput_.checkIfAButtonOrBButtonPressed:
	LDH A, (hJoy5 - $FF00)
	AND $03
	JR Z, HandleMenuInput_.skipPlayingSound
	PUSH HL
	LD HL, wMiscFlags
	BIT 5, (HL)
	POP HL
	JR NZ, HandleMenuInput_.skipPlayingSound
	LD A, $90
	CALL PlaySound
HandleMenuInput_.skipPlayingSound:
	POP AF
	LDH (hDownArrowBlinkCount2 - $FF00), A
	POP AF
	LDH (hBaseTileID - $FF00), A
	XOR A
	LD (wMenuWrappingEnabled), A
	LDH A, (hJoy5 - $FF00)
	RET

HandleMenuInput_.noWrappingAround:
	LD A, (wMenuWatchMovingOutOfBounds)
	AND A
	JR Z, HandleMenuInput_.checkOtherKeys
	JR HandleMenuInput_.checkIfAButtonOrBButtonPressed

PlaceMenuCursor:
	LD A, (wTopMenuItemY)
	AND A
	JR Z, PlaceMenuCursor.adjustForXCoord
	LD HL, $C3A0
	LD BC, $0014
PlaceMenuCursor.topMenuItemLoop:
	ADD HL, BC
	DEC A
	JR NZ, PlaceMenuCursor.topMenuItemLoop
PlaceMenuCursor.adjustForXCoord:
	LD A, (wTopMenuItemX)
	LD B, $00
	LD C, A
	ADD HL, BC
	PUSH HL
	LD A, (wLastMenuItem)
	AND A
	JR Z, PlaceMenuCursor.checkForArrow1
	PUSH AF
	LDH A, (hUILayoutFlags - $FF00)
	BIT 1, A
	JR Z, PlaceMenuCursor.doubleSpaced1
	LD BC, $0014
	JR PlaceMenuCursor.getOldMenuItemScreenPosition

PlaceMenuCursor.doubleSpaced1:
	LD BC, $0028
PlaceMenuCursor.getOldMenuItemScreenPosition:
	POP AF
PlaceMenuCursor.oldMenuItemLoop:
	ADD HL, BC
	DEC A
	JR NZ, PlaceMenuCursor.oldMenuItemLoop
PlaceMenuCursor.checkForArrow1:
	LD A, (HL)
	CP $ED
	JR NZ, PlaceMenuCursor.skipClearingArrow
	LD A, (wTileBehindCursor)
	LD (HL), A
PlaceMenuCursor.skipClearingArrow:
	POP HL
	LD A, (wCurrentMenuItem)
	AND A
	JR Z, PlaceMenuCursor.checkForArrow2
	PUSH AF
	LDH A, (hUILayoutFlags - $FF00)
	BIT 1, A
	JR Z, PlaceMenuCursor.doubleSpaced2
	LD BC, $0014
	JR PlaceMenuCursor.getCurrentMenuItemScreenPosition

PlaceMenuCursor.doubleSpaced2:
	LD BC, $0028
PlaceMenuCursor.getCurrentMenuItemScreenPosition:
	POP AF
PlaceMenuCursor.currentMenuItemLoop:
	ADD HL, BC
	DEC A
	JR NZ, PlaceMenuCursor.currentMenuItemLoop
PlaceMenuCursor.checkForArrow2:
	LD A, (HL)
	CP $ED
	JR Z, PlaceMenuCursor.skipSavingTile
	LD (wTileBehindCursor), A
PlaceMenuCursor.skipSavingTile:
	LD A, $ED
	LD (HL), A
	LD A, L
	LD (wMenuCursorLocation), A
	LD A, H
	LD (wMenuCursorLocation + $1), A
	LD A, (wCurrentMenuItem)
	LD (wLastMenuItem), A
	RET

PlaceUnfilledArrowMenuCursor:
	LD B, A
	LD A, (wMenuCursorLocation)
	LD L, A
	LD A, (wMenuCursorLocation + $1)
	LD H, A
	LD (HL), $EC
	LD A, B
	RET

; Data from 3BF9 to 3C03 (11 bytes)
.db $FA, $30, $CC, $6F, $FA, $31, $CC, $67, $36, $7F, $C9

HandleDownArrowBlinkTiming:
	LD A, (HL)
	LD B, A
	LD A, $EE
	CP B
	JR NZ, HandleDownArrowBlinkTiming.downArrowOff
	LDH A, (hBaseTileID - $FF00)
	DEC A
	LDH (hBaseTileID - $FF00), A
	RET NZ
	LDH A, (hDownArrowBlinkCount2 - $FF00)
	DEC A
	LDH (hDownArrowBlinkCount2 - $FF00), A
	RET NZ
	LD A, $7F
	LD (HL), A
	LD A, $FF
	LDH (hBaseTileID - $FF00), A
	LD A, $06
	LDH (hDownArrowBlinkCount2 - $FF00), A
	RET

HandleDownArrowBlinkTiming.downArrowOff:
	LDH A, (hBaseTileID - $FF00)
	AND A
	RET Z
	DEC A
	LDH (hBaseTileID - $FF00), A
	RET NZ
	DEC A
	LDH (hBaseTileID - $FF00), A
	LDH A, (hDownArrowBlinkCount2 - $FF00)
	DEC A
	LDH (hDownArrowBlinkCount2 - $FF00), A
	RET NZ
	LD A, $06
	LDH (hDownArrowBlinkCount2 - $FF00), A
	LD A, $EE
	LD (HL), A
	RET

EnableAutoTextBoxDrawing:
	XOR A
	JR AutoTextBoxDrawingCommon

; Data from 3C3F to 3C40 (2 bytes)
.db $3E, $01

AutoTextBoxDrawingCommon:
	LD (wAutoTextBoxDrawingControl), A
	XOR A
	LD (wDoNotWaitForButtonPressAfterDisplayingText), A
	RET

; Data from 3C49 to 3C5E (22 bytes)
.db $E5, $3E, $01, $EA, $25, $D1, $CD, $E8, $30, $CD, $29, $24, $CD, $D7, $3D, $E1
.db $01, $B9, $C4, $C3, $40, $1B

PrintNumber:
	PUSH BC
	XOR A
	LDH (hDividend - $FF00), A
	LDH (hExperience - $FF00), A
	LDH (hFindPathNumSteps - $FF00), A
	LD A, B
	AND $0F
	CP $01
	JR Z, PrintNumber.byte
	CP $02
	JR Z, PrintNumber.word
	LD A, (DE)
	LDH (hExperience - $FF00), A
	INC DE
	LD A, (DE)
	LDH (hFindPathNumSteps - $FF00), A
	INC DE
	LD A, (DE)
	LDH (hFindPathFlags - $FF00), A
	JR PrintNumber.start

PrintNumber.word:
	LD A, (DE)
	LDH (hFindPathNumSteps - $FF00), A
	INC DE
	LD A, (DE)
	LDH (hFindPathFlags - $FF00), A
	JR PrintNumber.start

PrintNumber.byte:
	LD A, (DE)
	LDH (hFindPathFlags - $FF00), A
PrintNumber.start:
	PUSH DE
	LD D, B
	LD A, C
	LD B, A
	XOR A
	LD C, A
	LD A, B
	CP $02
	JR Z, PrintNumber.tens
	CP $03
	JR Z, PrintNumber.hundreds
	CP $04
	JR Z, PrintNumber.thousands
	CP $05
	JR Z, PrintNumber.ten_thousands
	CP $06
	JR Z, PrintNumber.hundred_thousands
	LD A, $0F
	LDH (hDivisor - $FF00), A
	LD A, $42
	LDH (hDivideBuffer - $FF00), A
	LD A, $40
	LDH (hMultiplyBuffer - $FF00), A
	CALL PrintNumber.PrintDigit
	CALL PrintNumber.NextDigit
PrintNumber.hundred_thousands:
	LD A, $01
	LDH (hDivisor - $FF00), A
	LD A, $86
	LDH (hDivideBuffer - $FF00), A
	LD A, $A0
	LDH (hMultiplyBuffer - $FF00), A
	CALL PrintNumber.PrintDigit
	CALL PrintNumber.NextDigit
PrintNumber.ten_thousands:
	XOR A
	LDH (hDivisor - $FF00), A
	LD A, $27
	LDH (hDivideBuffer - $FF00), A
	LD A, $10
	LDH (hMultiplyBuffer - $FF00), A
	CALL PrintNumber.PrintDigit
	CALL PrintNumber.NextDigit
PrintNumber.thousands:
	XOR A
	LDH (hDivisor - $FF00), A
	LD A, $03
	LDH (hDivideBuffer - $FF00), A
	LD A, $E8
	LDH (hMultiplyBuffer - $FF00), A
	CALL PrintNumber.PrintDigit
	CALL PrintNumber.NextDigit
PrintNumber.hundreds:
	XOR A
	LDH (hDivisor - $FF00), A
	XOR A
	LDH (hDivideBuffer - $FF00), A
	LD A, $64
	LDH (hMultiplyBuffer - $FF00), A
	CALL PrintNumber.PrintDigit
	CALL PrintNumber.NextDigit
PrintNumber.tens:
	LD C, $00
	LDH A, (hFindPathFlags - $FF00)
PrintNumber.mod:
	CP $0A
	JR C, PrintNumber.ok
	SUB $0A
	INC C
	JR PrintNumber.mod

PrintNumber.ok:
	LD B, A
	LDH A, (hDividend - $FF00)
	OR C
	LDH (hDividend - $FF00), A
	JR NZ, PrintNumber.past
	CALL PrintNumber.PrintLeadingZero
	JR PrintNumber.next

PrintNumber.past:
	LD A, $F6
	ADD C
	LD (HL), A
PrintNumber.next:
	CALL PrintNumber.NextDigit
	LD A, $F6
	ADD B
	LDI (HL), A
	POP DE
	DEC DE
	POP BC
	RET

PrintNumber.PrintDigit:
	LD C, $00
PrintNumber.loop:
	LDH A, (hDivisor - $FF00)
	LD B, A
	LDH A, (hExperience - $FF00)
	LDH (hSavedNumToPrint - $FF00), A
	CP B
	JR C, PrintNumber.underflow0
	SUB B
	LDH (hExperience - $FF00), A
	LDH A, (hDivideBuffer - $FF00)
	LD B, A
	LDH A, (hFindPathNumSteps - $FF00)
	LDH (hNPCPlayerRelativePosFlags - $FF00), A
	CP B
	JR NC, PrintNumber.noborrow1
	LDH A, (hExperience - $FF00)
	OR $00
	JR Z, PrintNumber.underflow1
	DEC A
	LDH (hExperience - $FF00), A
	LDH A, (hFindPathNumSteps - $FF00)
PrintNumber.noborrow1:
	SUB B
	LDH (hFindPathNumSteps - $FF00), A
	LDH A, (hMultiplyBuffer - $FF00)
	LD B, A
	LDH A, (hFindPathFlags - $FF00)
	LDH (hNPCPlayerRelativePosFlags + $1 - $FF00), A
	CP B
	JR NC, PrintNumber.noborrow2
	LDH A, (hFindPathNumSteps - $FF00)
	AND A
	JR NZ, PrintNumber.borrowed
	LDH A, (hExperience - $FF00)
	AND A
	JR Z, PrintNumber.underflow2
	DEC A
	LDH (hExperience - $FF00), A
	XOR A
PrintNumber.borrowed:
	DEC A
	LDH (hFindPathNumSteps - $FF00), A
	LDH A, (hFindPathFlags - $FF00)
PrintNumber.noborrow2:
	SUB B
	LDH (hFindPathFlags - $FF00), A
	INC C
	JR PrintNumber.loop

PrintNumber.underflow2:
	LDH A, (hNPCPlayerRelativePosFlags - $FF00)
	LDH (hFindPathNumSteps - $FF00), A
PrintNumber.underflow1:
	LDH A, (hSavedNumToPrint - $FF00)
	LDH (hExperience - $FF00), A
PrintNumber.underflow0:
	LDH A, (hDividend - $FF00)
	OR C
	JR Z, PrintNumber.PrintLeadingZero
	LD A, $F6
	ADD C
	LD (HL), A
	LDH (hDividend - $FF00), A
	RET

PrintNumber.PrintLeadingZero:
	BIT 7, D
	RET Z
	LD (HL), $F6
	RET

PrintNumber.NextDigit:
	BIT 7, D
	JR NZ, PrintNumber.inc
	BIT 6, D
	JR Z, PrintNumber.inc
	LDH A, (hDividend - $FF00)
	AND A
	RET Z
PrintNumber.inc:
	INC HL
	RET

CallFunctionInTable:
	PUSH HL
	PUSH DE
	PUSH BC
	ADD A
	LD D, $00
	LD E, A
	ADD HL, DE
	LDI A, (HL)
	LD H, (HL)
	LD L, A
	LD DE, CallFunctionInTable.returnAddress	; Overriding return address
	PUSH DE
	JP HL

CallFunctionInTable.returnAddress:
	POP BC
	POP DE
	POP HL
	RET

IsInArray:
	LD B, $00
	LD C, A
IsInRestOfArray.loop:
	LD A, (HL)
	CP $FF
	JR Z, IsInRestOfArray.notfound
	CP C
	JR Z, IsInRestOfArray.found
	INC B
	ADD HL, DE
	JR IsInRestOfArray.loop

IsInRestOfArray.notfound:
	AND A
	RET

IsInRestOfArray.found:
	SCF
	RET

; Data from 3DBE to 3DD3 (22 bytes)
.db $CD, $82, $00, $3E, $01, $EA, $CB, $CF, $CD, $08, $3E, $CD, $01, $37, $CD, $A0
.db $36, $CD, $ED, $3D, $18, $03

GBPalWhiteOutWithDelay3:
	CALL GBPalWhiteOut
Delay3:
	LD C, $03
	JP DelayFrames

GBPalNormal:
	LD A, $E4
	LDH (rBGP), A
	LD A, $D0
	LDH (rOBP0), A
	RET

GBPalWhiteOut:
	XOR A
	LDH (rBGP), A
	LDH (rOBP0), A
	LDH (rOBP1), A
	RET

; Data from 3DED to 3DEE (2 bytes)
.db $06, $FF

RunPaletteCommand:
	LD A, (wOnSGB)
	AND A
	RET Z
	LD A, $45
	JP Predef

; Data from 3DF9 to 3E5B (99 bytes)
.db $7B, $FE, $1B, $16, $00, $30, $06, $FE, $0A, $14, $30, $01, $14, $72, $C9, $21
.db $C4, $CF, $7E, $F5, $CB, $86, $E5, $AF, $EA, $A8, $D3, $CD, $61, $00, $06, $05
.db $21, $5B, $78, $CD, $D6, $35, $CD, $7B, $00, $E1, $F1, $77, $CD, $97, $09, $CD
.db $80, $36, $C3, $29, $24, $78, $EA, $1E, $D1, $EA, $91, $CF, $79, $EA, $96, $CF
.db $21, $1D, $D3, $CD, $CF, $2B, $D0, $CD, $CF, $2F, $CD, $26, $38, $37, $C9, $78
.db $EA, $91, $CF, $79, $EA, $27, $D1, $AF, $EA, $49, $CC, $06, $13, $21, $A5, $7D
.db $C3, $D6, $35

Random:
	PUSH HL
	PUSH DE
	PUSH BC
	LD B, $04
	LD HL, $7A8F
	CALL Bankswitch
	LDH A, (hRandomAdd - $FF00)
	POP BC
	POP DE
	POP HL
	RET

Predef:
	LD (wPredefID), A
	LDH A, (hLoadedROMBank - $FF00)
	LD (wPredefParentBank), A
	PUSH AF
	LD A, $13
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	CALL GetPredefPointer
	LD A, (wPredefBank)
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	LD DE, Predef.done	; Overriding return address
	PUSH DE
	JP HL

Predef.done:
	POP AF
	LDH (hLoadedROMBank - $FF00), A
	LD ($2000), A
	RET

; Data from 3E94 to 3FFF (364 bytes)
.db $FA, $4F, $CC, $67, $FA, $50, $CC, $6F, $FA, $51, $CC, $57, $FA, $52, $CC, $5F
.db $FA, $53, $CC, $47, $FA, $54, $CC, $4F, $C9, $06, $07, $21, $0A, $6B, $C3, $D6
.db $35, $F0, $B8, $F5, $F0, $B4, $CB, $47, $28, $2C, $3E, $11, $EA, $00, $20, $E0
.db $B8, $CD, $A0, $69, $F0, $EE, $A7, $20, $10, $FA, $3E, $CD, $EA, $00, $20, $E0
.db $B8, $11, $DA, $3E, $D5, $E9, $AF, $18, $0F, $06, $03, $21, $50, $7B, $CD, $D6
.db $35, $F0, $DB, $A7, $28, $02, $3E, $FF, $E0, $EB, $F1, $EA, $00, $20, $E0, $B8
.db $C9, $E0, $8C, $21, $22, $3F, $CD, $0F, $3F, $21, $11, $CF, $CB, $C6, $CD, $20
.db $29, $21, $6C, $D3, $F0, $EC, $22, $F0, $ED, $77, $C9, $FA, $6C, $D3, $E0, $EC
.db $FA, $6D, $D3, $E0, $ED, $7D, $EA, $6C, $D3, $7C, $EA, $6D, $D3, $C9, $EE, $66
.db $F8, $66, $8E, $5B, $81, $5B, $60, $69, $7E, $69, $83, $69, $BD, $6C, $BE, $5B
.db $A8, $5B, $D4, $5B, $53, $64, $58, $64, $11, $65, $A3, $64, $A8, $64, $AD, $64
.db $B2, $64, $D0, $64, $D5, $64, $02, $65, $DA, $64, $DF, $64, $E4, $64, $B7, $64
.db $BC, $64, $C1, $64, $C6, $64, $CB, $64, $08, $65, $29, $65, $AA, $69, $ED, $5C
.db $65, $58, $78, $58, $5B, $67, $94, $67, $F7, $5D, $3D, $6A, $79, $7E, $7E, $7E
.db $83, $7E, $47, $68, $4D, $68, $DD, $6B, $E2, $6B, $05, $6C, $69, $6B, $25, $6A
.db $37, $7F, $32, $7F, $29, $5C, $A4, $69, $2A, $6A, $10, $6A, $1D, $6A, $53, $69
.db $BF, $7B, $C8, $5E, $DB, $5E, $EF, $5E, $02, $5F, $12, $7C, $E8, $7B, $0D, $7C
.db $45, $7C
.dsb 90, $00

