.BANK 3
.ORG $0000

_Joypad:
	LDH A, (hJoyInput - $FF00)
	CP $0F
	JP Z, TrySoftReset
	LD B, A
	LDH A, (hJoyLast - $FF00)
	LD E, A
	XOR B
	LD D, A
	AND E
	LDH (hJoyReleased - $FF00), A
	LD A, D
	AND B
	LDH (hJoyPressed - $FF00), A
	LD A, B
	LDH (hJoyLast - $FF00), A
	LD A, (wStatusFlags5)
	BIT 5, A
	JR NZ, DiscardButtonPresses
	LDH A, (hJoyLast - $FF00)
	LDH (hJoyHeld - $FF00), A
	LD A, (wJoyIgnore)
	AND A
	RET Z
	CPL
	LD B, A
	LDH A, (hJoyHeld - $FF00)
	AND B
	LDH (hJoyHeld - $FF00), A
	LDH A, (hJoyPressed - $FF00)
	AND B
	LDH (hJoyPressed - $FF00), A
	RET

DiscardButtonPresses:
	XOR A
	LDH (hJoyHeld - $FF00), A
	LDH (hJoyPressed - $FF00), A
	LDH (hJoyReleased - $FF00), A
	RET

TrySoftReset:
	CALL DelayFrame
	LD A, $30
	LDH (rP1), A
	LD HL, hSoftReset
	DEC (HL)
	JP Z, SoftReset
	JP Joypad

; Data from C04D to C23C (496 bytes)
MapSongBanks:
.db $BA, $02, $C3, $02, $C3, $02, $C7, $02, $D4, $02, $D0, $02, $CA, $02, $C7, $02
.db $CD, $02, $FB, $02, $C3, $02, $C3, $02, $EB, $02, $EB, $02, $F3, $02, $F3, $02
.db $F3, $02, $F3, $02, $F3, $02, $F3, $02, $F3, $02, $F3, $02, $F7, $02, $F7, $02
.db $F7, $02, $F7, $02, $F7, $02, $F3, $02, $F3, $02, $F3, $02, $F3, $02, $F3, $02
.db $F3, $02, $F3, $02, $FB, $02, $EF, $02, $EF, $02, $BA, $02, $BA, $02, $BA, $02
.db $CD, $1F, $BD, $02, $BD, $02, $C3, $02, $C3, $02, $C0, $02, $E4, $1F, $C3, $02
.db $C3, $02, $C3, $02, $C3, $02, $E4, $1F, $C3, $02, $C3, $02, $C0, $02, $C3, $02
.db $BD, $02, $C3, $02, $BD, $02, $E8, $1F, $E8, $1F, $E8, $1F, $C7, $02, $C7, $02
.db $BD, $02, $C0, $02, $C7, $02, $BD, $02, $BD, $02, $E8, $1F, $C3, $02, $C3, $02
.db $C3, $02, $C3, $02, $C3, $02, $D0, $02, $C3, $02, $C3, $02, $CA, $02, $C3, $02
.db $C3, $02, $BD, $02, $E8, $1F, $E0, $1F, $D0, $02, $E4, $1F, $D0, $02, $C3, $02
.db $C7, $02, $BD, $02, $D0, $02, $BD, $02, $C0, $02, $D0, $02, $D8, $02, $D8, $02
.db $D8, $02, $D8, $02, $D8, $02, $D8, $02, $D8, $02, $D8, $02, $D8, $02, $D8, $02
.db $D8, $02, $E4, $1F, $E4, $1F, $D8, $02, $E8, $1F, $F0, $1F, $E0, $1F, $F3, $1F
.db $F3, $1F, $FB, $02, $D8, $02, $D8, $02, $D8, $02, $D8, $02, $BA, $02, $EB, $02
.db $FB, $02, $EB, $02, $BD, $02, $BD, $02, $BD, $02, $BD, $02, $BD, $02, $BD, $02
.db $CA, $02, $CA, $02, $CA, $02, $CA, $02, $CA, $02, $BD, $02, $C0, $02, $D9, $1F
.db $BD, $02, $CA, $02, $CA, $02, $CA, $02, $CA, $02, $BD, $02, $F0, $1F, $F0, $1F
.db $F0, $1F, $F0, $1F, $F0, $1F, $F0, $1F, $F0, $1F, $D4, $02, $BD, $02, $D4, $02
.db $BD, $02, $C7, $02, $BD, $02, $C7, $02, $C7, $02, $C0, $02, $C7, $02, $E4, $1F
.db $E4, $1F, $E4, $1F, $E4, $1F, $C7, $02, $C7, $02, $EC, $1F, $C0, $02, $CD, $02
.db $CD, $02, $CD, $02, $CD, $02, $BD, $02, $BD, $02, $CD, $02, $FB, $02, $C3, $02
.db $C3, $02, $C3, $02, $C0, $02, $C3, $02, $BD, $02, $F3, $1F, $BD, $02, $C3, $02
.db $C3, $02, $C3, $02, $C3, $02, $C3, $02, $CA, $02, $CA, $02, $C3, $02, $C3, $02
.db $E4, $1F, $E4, $1F, $E8, $1F, $C3, $02, $D0, $02, $E4, $1F, $E8, $1F, $E0, $1F
.db $E0, $1F, $E0, $1F, $E0, $1F, $E0, $1F, $E0, $1F, $E0, $1F, $E0, $1F, $F3, $1F
.db $F3, $1F, $F3, $1F, $F3, $1F, $F3, $1F, $F3, $1F, $F3, $1F, $EC, $1F, $EC, $1F
.db $EC, $1F, $E5, $02, $E5, $02, $E5, $02, $E5, $02, $E5, $02, $E5, $02, $E5, $02
.db $E5, $02, $E5, $02, $E0, $1F, $E0, $1F, $E0, $1F, $C7, $02, $C3, $02, $CD, $02
.db $E8, $1F, $F3, $1F, $F3, $1F, $F3, $1F, $F3, $1F, $F3, $1F, $F3, $1F, $CA, $02
.db $CA, $02, $F3, $1F, $F3, $1F, $F3, $1F, $F3, $1F, $C0, $02, $E0, $1F, $F0, $1F

; Data from C23D to C52E (754 bytes)
MapHeaderBanks:
.db $06, $06, $06, $06, $11, $06, $06, $06, $07, $14, $14, $01, $07, $15, $15, $15
.db $15, $16, $12, $16, $15, $16, $16, $16, $15, $15, $16, $16, $15, $16, $15, $14
.db $15, $14, $14, $14, $14, $12, $17, $06, $07, $11, $07, $07, $07, $1D, $07, $17
.db $07, $17, $17, $18, $17, $17, $17, $07, $1D, $07, $17, $12, $14, $12, $07, $07
.db $17, $17, $07, $17, $12, $07, $07, $17, $15, $07, $17, $17, $07, $17, $17, $07
.db $07, $12, $11, $07, $12, $07, $12, $12, $07, $17, $16, $17, $17, $07, $07, $18
.db $18, $11, $18, $18, $18, $18, $18, $18, $18, $1D, $1D, $1D, $17, $1D, $1D, $1D
.db $1D, $16, $1D, $1D, $1D, $1D, $16, $18, $1D, $18, $18, $15, $12, $12, $12, $12
.db $12, $12, $12, $12, $07, $12, $12, $12, $12, $12, $12, $12, $12, $17, $18, $18
.db $18, $18, $18, $18, $18, $07, $17, $07, $07, $1D, $1D, $1D, $1D, $1D, $1D, $11
.db $11, $11, $11, $15, $15, $11, $1D, $1D, $1D, $1D, $1D, $1D, $1D, $1D, $06, $1D
.db $17, $17, $17, $07, $17, $17, $17, $07, $12, $12, $12, $12, $07, $15, $12, $12
.db $11, $07, $14, $12, $06, $18, $11, $11, $11, $11, $11, $11, $01, $01, $01, $16
.db $16, $06, $06, $06, $14, $15, $14, $14, $14, $11, $11, $12, $11, $11, $12, $11
.db $11, $11, $11, $11, $1D, $07, $1D, $01, $11, $17, $16, $18, $11, $11, $11, $13
.db $13, $11, $11, $11, $11, $1D, $1D, $1D, $3E, $90, $E0, $B0, $E0, $4A, $AF, $E0
.db $BA, $EA, $3B, $D1, $EA, $5C, $D0, $E0, $B3, $E0, $B2, $E0, $B4, $EA, $6A, $CD
.db $EA, $A3, $D5, $21, $3F, $D7, $22, $77, $21, $3D, $CD, $01, $1E, $00, $CD, $E0
.db $36, $C9, $FA, $AE, $D3, $A7, $C8, $4F, $21, $AF, $D3, $FA, $61, $D3, $BE, $20
.db $15, $23, $FA, $62, $D3, $BE, $20, $0F, $23, $2A, $EA, $2F, $D4, $7E, $E0, $8B
.db $21, $36, $D7, $CB, $D6, $C9, $23, $23, $23, $23, $0D, $20, $DE, $C9, $21, $32
.db $D7, $CB, $6E, $C0, $21, $E6, $43, $FA, $61, $D3, $47, $FA, $62, $D3, $4F, $FA
.db $5E, $D3, $57, $2A, $FE, $FF, $C8, $BA, $20, $30, $2A, $B8, $20, $2D, $2A, $B9
.db $20, $F1, $FA, $5E, $D3, $FE, $A1, $3E, $02, $EA, $66, $D6, $28, $20, $FA, $5E
.db $D3, $FE, $A2, $3E, $02, $EA, $68, $D6, $28, $14, $21, $32, $D7, $CB, $EE, $3E
.db $01, $EA, $00, $D7, $EA, $1A, $D1, $C3, $ED, $12, $23, $23, $18, $C5, $3E, $02
.db $EA, $00, $D7, $EA, $1A, $D1, $C3, $ED, $12, $1B, $0A, $11, $1B, $0B, $11, $1D
.db $08, $21, $1D, $09, $21, $A1, $07, $12, $A1, $07, $13, $A2, $0E, $04, $A2, $0E
.db $05, $FF, $E5, $D5, $C5, $FA, $09, $C1, $CB, $3F, $4F, $06, $00, $21, $22, $44
.db $09, $2A, $66, $6F, $FA, $61, $D3, $47, $FA, $62, $D3, $4F, $11, $1E, $44, $D5
.db $E9, $C1, $D1, $E1, $C9, $2A, $44, $34, $44, $3A, $44, $40, $44, $FA, $68, $D3
.db $87, $3D, $B8, $28, $1A, $18, $16, $78, $A7, $28, $14, $18, $10, $79, $A7, $28
.db $0E, $18, $0A, $FA, $69, $D3, $87, $3D, $B9, $28, $04, $18, $00, $A7, $C9, $37
.db $C9, $E5, $D5, $C5, $CD, $89, $45, $FA, $5E, $D3, $FE, $63, $28, $35, $FA, $09
.db $C1, $CB, $3F, $4F, $06, $00, $21, $77, $44, $09, $2A, $66, $6F, $FA, $C6, $CF
.db $11, $01, $00, $CD, $AB, $3D, $C1, $D1, $E1, $C9, $7F, $44, $87, $44, $8A, $44
.db $8D, $44, $01, $12, $17, $3D, $04, $18, $33, $FF, $01, $5C, $FF, $1A, $4B, $FF
.db $0F, $4E, $FF, $FA, $C6, $CF, $FE, $15, $20, $03, $37, $18, $D9, $A7, $18, $D6
.db $E5, $D5, $C5, $06, $06, $21, $09, $66, $CD, $D6, $35, $38, $1E, $FA, $67, $D3
.db $87, $4F, $06, $00, $21, $CC, $44, $09, $2A, $66, $6F, $11, $01, $00, $FA, $5C
.db $C4, $CD, $AB, $3D, $30, $05, $21, $36, $D7, $CB, $96, $C1, $D1, $E1, $C9, $FC
.db $44, $00, $45, $03, $45, $05, $45, $00, $45, $09, $45, $03, $45, $09, $45, $0B
.db $45, $FF, $44, $FF, $44, $2A, $45, $FF, $44, $0F, $45, $2E, $45, $29, $45, $14
.db $45, $18, $45, $1C, $45, $20, $45, $24, $45, $2E, $45, $26, $45, $2C, $45, $1B
.db $58, $FF, $3B, $1A, $1C, $FF, $5E, $FF, $5A, $5C, $3A, $FF, $4A, $FF, $54, $5C
.db $32, $FF, $37, $39, $1E, $4A, $FF, $15, $55, $04, $FF, $18, $1A, $22, $FF, $1A
.db $1C, $38, $FF, $1A, $1C, $53, $FF, $34, $FF, $43, $58, $20, $1B, $13, $FF, $1B
.db $3B, $FF

PrintSafariZoneSteps:
	LD A, (wCurMap)
	CP $D9
	RET C
	CP $E2
	RET NC
	LD HL, wShadowOAMEnd
	LD B, $03
	LD C, $07
	CALL TextBoxBorder
	LD HL, wTileMap_plus_15
	LD DE, wSafariSteps
	LD BC, $0203
	CALL PrintNumber
	LD HL, $C3B8
	LD DE, SafariSteps
	CALL PlaceString
	LD HL, $C3DD
	LD DE, SafariBallText
	CALL PlaceString
	LD A, (wNumSafariBalls)
	CP $0A
	JR NC, PrintSafariZoneSteps.tenOrMore
	LD HL, wTileMap_plus_41
	LD A, $7F
	LD (HL), A
PrintSafariZoneSteps.tenOrMore:
	LD HL, $C3E2
	LD DE, wNumSafariBalls
	LD BC, $0102
	JP PrintNumber

; Data from C579 to C57D (5 bytes)
SafariSteps:
.db $F3, $FB, $F6, $F6, $50

; Data from C57E to C8F4 (887 bytes)
SafariBallText:
.db $81, $80, $8B, $8B, $F1, $F1, $7F, $50, $CD, $94, $3E, $FA, $61, $D3, $57, $FA
.db $62, $D3, $5F, $FA, $09, $C1, $A7, $20, $06, $FA, $84, $C4, $14, $18, $1C, $FE
.db $04, $20, $06, $FA, $34, $C4, $15, $18, $12, $FE, $08, $20, $06, $FA, $5A, $C4
.db $1D, $18, $08, $FE, $0C, $20, $04, $FA, $5E, $C4, $1C, $4F, $EA, $C6, $CF, $C9
.db $AF, $E0, $DB, $21, $61, $D3, $2A, $57, $5E, $FA, $09, $C1, $A7, $20, $0B, $21
.db $DB, $FF, $CB, $C6, $FA, $AC, $C4, $14, $18, $2B, $FE, $04, $20, $0B, $21, $DB
.db $FF, $CB, $CE, $FA, $0C, $C4, $15, $18, $1C, $FE, $08, $20, $0B, $21, $DB, $FF
.db $CB, $D6, $FA, $58, $C4, $1D, $18, $0D, $FE, $0C, $20, $09, $21, $DB, $FF, $CB
.db $DE, $FA, $60, $C4, $1C, $4F, $EA, $1C, $D7, $EA, $C6, $CF, $C9, $CD, $BE, $45
.db $21, $30, $D5, $2A, $66, $6F, $2A, $FE, $FF, $28, $19, $B9, $20, $F8, $21, $7E
.db $0C, $CD, $44, $0C, $3E, $FF, $38, $0C, $FA, $1C, $D7, $FE, $15, $3E, $FF, $28
.db $03, $CD, $36, $46, $EA, $1C, $D7, $C9, $FA, $18, $D7, $3D, $CB, $37, $16, $00
.db $5F, $21, $14, $C2, $19, $2A, $E0, $DC, $7E, $E0, $DD, $FA, $E1, $D4, $4F, $11
.db $0F, $00, $21, $14, $C2, $F0, $DB, $E6, $03, $28, $1F, $23, $F0, $DD, $BE, $20
.db $13, $2B, $2A, $47, $F0, $DB, $0F, $38, $05, $F0, $DC, $3D, $18, $03, $F0, $DC
.db $3C, $B8, $28, $25, $0D, $28, $25, $19, $18, $E1, $2A, $47, $F0, $DC, $B8, $20
.db $12, $46, $F0, $DB, $CB, $57, $20, $05, $F0, $DD, $3C, $18, $03, $F0, $DD, $3D
.db $B8, $28, $06, $0D, $28, $06, $19, $18, $E1, $3E, $FF, $C9, $AF, $C9, $FA, $30
.db $D7, $87, $DA, $4F, $47, $FA, $63, $D1, $A7, $CA, $4F, $47, $CD, $DE, $48, $FA
.db $3B, $D1, $E6, $03, $C2, $4F, $47, $EA, $92, $CF, $21, $6F, $D1, $11, $64, $D1
.db $7E, $E6, $08, $28, $3A, $2B, $2B, $3A, $47, $2A, $B0, $28, $30, $7E, $3D, $32
.db $3C, $20, $04, $35, $23, $18, $26, $2A, $B6, $20, $22, $E5, $23, $23, $77, $1A
.db $EA, $1E, $D1, $D5, $FA, $92, $CF, $21, $B5, $D2, $CD, $BA, $15, $AF, $EA, $6B
.db $CD, $CD, $3C, $3C, $3E, $D0, $E0, $8C, $CD, $20, $29, $D1, $E1, $23, $23, $13
.db $1A, $3C, $28, $0C, $01, $2C, $00, $09, $E5, $21, $92, $CF, $34, $E1, $18, $B0
.db $21, $6F, $D1, $FA, $63, $D1, $57, $1E, $00, $7E, $E6, $08, $B3, $5F, $01, $2C
.db $00, $09, $15, $20, $F4, $7B, $A7, $28, $0C, $06, $02, $3E, $1F, $CD, $6D, $3E
.db $3E, $97, $CD, $B1, $23, $3E, $14, $CD, $6D, $3E, $7A, $A7, $20, $13, $CD, $3C
.db $3C, $3E, $D1, $E0, $8C, $CD, $20, $29, $21, $2E, $D7, $CB, $EE, $3E, $FF, $18
.db $01, $AF, $EA, $2D, $D1, $C9, $CD, $94, $3E, $E5, $16, $00, $FA, $67, $D3, $87
.db $87, $47, $87, $80, $30, $01, $14, $5F, $21, $BE, $47, $19, $11, $2B, $D5, $0E
.db $0B, $2A, $12, $13, $0D, $20, $FA, $7E, $E0, $D7, $AF, $E0, $D8, $E1, $FA, $67
.db $D3, $E5, $D5, $21, $B2, $47, $11, $01, $00, $CD, $AB, $3D, $D1, $E1, $38, $09
.db $FA, $67, $D3, $47, $F0, $8B, $B8, $28, $1A, $FA, $2F, $D4, $FE, $FF, $28, $13
.db $CD, $13, $13, $FA, $61, $D3, $E6, $01, $EA, $63, $D3, $FA, $62, $D3, $E6, $01
.db $EA, $64, $D3, $C9, $03, $0A, $0D, $11, $12, $13, $0C, $14, $16, $0F, $07, $FF
.db $19, $E0, $45, $00, $40, $35, $17, $FF, $FF, $FF, $52, $02, $19, $70, $52, $E0
.db $4D, $49, $17, $FF, $FF, $FF, $FF, $00, $1A, $BF, $53, $BF, $4D, $53, $17, $18
.db $19, $1E, $FF, $00, $1A, $FF, $69, $FF, $63, $65, $17, $FF, $FF, $FF, $20, $01
.db $19, $70, $52, $E0, $4D, $49, $17, $FF, $FF, $FF, $FF, $00, $1A, $7F, $46, $7F
.db $40, $59, $17, $3A, $FF, $FF, $FF, $02, $1A, $BF, $53, $BF, $4D, $53, $17, $18
.db $19, $1E, $FF, $00, $1A, $7F, $46, $7F, $40, $59, $17, $3A, $FF, $FF, $FF, $02
.db $19, $80, $59, $A0, $53, $75, $17, $FF, $FF, $FF, $FF, $00, $1A, $FF, $5B, $0F
.db $56, $7F, $17, $17, $32, $FF, $FF, $00, $1A, $FF, $5B, $0F, $56, $7F, $17, $17
.db $32, $FF, $FF, $00, $1B, $F0, $7E, $60, $7D, $2F, $17, $FF, $FF, $FF, $FF, $00
.db $1A, $FF, $5B, $0F, $56, $7F, $17, $17, $32, $FF, $FF, $00, $1B, $30, $69, $90
.db $63, $8A, $17, $FF, $FF, $FF, $FF, $01, $19, $F0, $6B, $10, $66, $95, $17, $FF
.db $FF, $FF, $FF, $01, $1B, $C0, $45, $00, $40, $9A, $17, $12, $FF, $FF, $FF, $00
.db $19, $50, $73, $60, $6D, $A2, $17, $FF, $FF, $FF, $FF, $00, $1B, $C0, $50, $A0
.db $4C, $AC, $17, $FF, $FF, $FF, $FF, $01, $1B, $A0, $5E, $C0, $58, $B8, $17, $15
.db $36, $FF, $FF, $00, $19, $90, $61, $B0, $5B, $C0, $17, $FF, $FF, $FF, $FF, $00
.db $1B, $D0, $72, $10, $6D, $CA, $17, $FF, $FF, $FF, $FF, $00, $1B, $20, $7B, $70
.db $76, $D1, $17, $07, $17, $FF, $FF, $00, $1A, $FF, $77, $FF, $71, $DD, $17, $12
.db $FF, $FF, $FF, $01, $19, $50, $7B, $F0, $76, $F0, $17, $FF, $FF, $FF, $45, $01
.db $FA, $48, $DA, $A7, $C8, $21, $6F, $DA, $34, $C0, $2B, $34, $C0, $2B, $34, $7E
.db $FE, $50, $D8, $3E, $50, $77, $C9

; Pointer Table from C8F5 to CAE4 (248 entries, indexed by wCurMap)
ToggleableObjectMapPointers:
.dw ToggleData_PALLET_TOWN, ToggleData_VIRIDIAN_CITY, ToggleData_PEWTER_CITY, ToggleData_CERULEAN_CITY, NoToggleData, NoToggleData, NoToggleData, NoToggleData
.dw NoToggleData, NoToggleData, ToggleData_SAFFRON_CITY, NoToggleData, NoToggleData, ToggleData_ROUTE_2, NoToggleData, ToggleData_ROUTE_4
.dw NoToggleData, NoToggleData, NoToggleData, NoToggleData, ToggleData_ROUTE_9, NoToggleData, NoToggleData, ToggleData_ROUTE_12
.dw NoToggleData, NoToggleData, ToggleData_ROUTE_15, ToggleData_ROUTE_16, NoToggleData, NoToggleData, NoToggleData, NoToggleData
.dw NoToggleData, ToggleData_ROUTE_22, NoToggleData, ToggleData_ROUTE_24, ToggleData_ROUTE_25, NoToggleData, NoToggleData, ToggleData_BLUES_HOUSE
.dw ToggleData_OAKS_LAB, NoToggleData, NoToggleData, NoToggleData, NoToggleData, ToggleData_VIRIDIAN_GYM, NoToggleData, NoToggleData
.dw NoToggleData, NoToggleData, NoToggleData, ToggleData_VIRIDIAN_FOREST, ToggleData_MUSEUM_1F, NoToggleData, NoToggleData, NoToggleData
.dw NoToggleData, NoToggleData, NoToggleData, ToggleData_MT_MOON_1F, NoToggleData, ToggleData_MT_MOON_B2F, NoToggleData, NoToggleData
.dw NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData
.dw NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData
.dw NoToggleData, NoToggleData, NoToggleData, ToggleData_POWER_PLANT, NoToggleData, NoToggleData, NoToggleData, NoToggleData
.dw ToggleData_BILLS_HOUSE, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData
.dw ToggleData_SS_ANNE_2F, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, ToggleData_SS_ANNE_1F_ROOMS, ToggleData_SS_ANNE_2F_ROOMS
.dw ToggleData_SS_ANNE_B1F_ROOMS, NoToggleData, NoToggleData, NoToggleData, ToggleData_VICTORY_ROAD_1F, NoToggleData, NoToggleData, NoToggleData
.dw NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData
.dw ToggleData_CHAMPIONS_ROOM, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData
.dw NoToggleData, NoToggleData, NoToggleData, NoToggleData, ToggleData_CELADON_MANSION_ROOF_HOUSE, NoToggleData, NoToggleData, ToggleData_GAME_CORNER
.dw NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, ToggleData_POKEMON_TOWER_2F
.dw ToggleData_POKEMON_TOWER_3F, ToggleData_POKEMON_TOWER_4F, ToggleData_POKEMON_TOWER_5F, ToggleData_POKEMON_TOWER_6F, ToggleData_POKEMON_TOWER_7F, ToggleData_MR_FUJIS_HOUSE, NoToggleData, NoToggleData
.dw NoToggleData, NoToggleData, NoToggleData, ToggleData_WARDENS_HOUSE, NoToggleData, NoToggleData, NoToggleData, ToggleData_SEAFOAM_ISLANDS_B1F
.dw ToggleData_SEAFOAM_ISLANDS_B2F, ToggleData_SEAFOAM_ISLANDS_B3F, ToggleData_SEAFOAM_ISLANDS_B4F, NoToggleData, NoToggleData, ToggleData_POKEMON_MANSION_1F, NoToggleData, NoToggleData
.dw NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData
.dw NoToggleData, ToggleData_FIGHTING_DOJO, NoToggleData, NoToggleData, NoToggleData, ToggleData_SILPH_CO_1F, NoToggleData, NoToggleData
.dw NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData, NoToggleData
.dw ToggleData_SEAFOAM_ISLANDS_1F, NoToggleData, ToggleData_VICTORY_ROAD_2F, NoToggleData, NoToggleData, NoToggleData, ToggleData_VICTORY_ROAD_3F, ToggleData_ROCKET_HIDEOUT_B1F
.dw ToggleData_ROCKET_HIDEOUT_B2F, ToggleData_ROCKET_HIDEOUT_B3F, ToggleData_ROCKET_HIDEOUT_B4F, NoToggleData, NoToggleData, NoToggleData, NoToggleData, ToggleData_SILPH_CO_2F
.dw ToggleData_SILPH_CO_3F, ToggleData_SILPH_CO_4F, ToggleData_SILPH_CO_5F, ToggleData_SILPH_CO_6F, ToggleData_SILPH_CO_7F, ToggleData_SILPH_CO_8F, ToggleData_POKEMON_MANSION_2F, ToggleData_POKEMON_MANSION_3F
.dw ToggleData_POKEMON_MANSION_B1F, ToggleData_SAFARI_ZONE_EAST, ToggleData_SAFARI_ZONE_NORTH, ToggleData_SAFARI_ZONE_WEST, ToggleData_SAFARI_ZONE_CENTER, NoToggleData, NoToggleData, NoToggleData
.dw NoToggleData, NoToggleData, ToggleData_CERULEAN_CAVE_2F, ToggleData_CERULEAN_CAVE_B1F, ToggleData_CERULEAN_CAVE_1F, NoToggleData, NoToggleData, NoToggleData
.dw NoToggleData, ToggleData_SILPH_CO_9F, ToggleData_SILPH_CO_10F, ToggleData_SILPH_CO_11F, NoToggleData, NoToggleData, NoToggleData, NoToggleData
.dw NoToggleData, NoToggleData, NoToggleData, NoToggleData, ToggleData_UNUSED_MAP_F4, NoToggleData, NoToggleData, NoToggleData

; Data from CAE5 to CAE6 (2 bytes)
.db $FF, $FF

; 5th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CAE7 to CAE9 (3 bytes)
NoToggleData:
.db $FF, $FF, $FF

; 1st entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CAEA to CAEC (3 bytes)
ToggleData_PALLET_TOWN:
.db $00, $01, $11

; 2nd entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CAED to CAF2 (6 bytes)
ToggleData_VIRIDIAN_CITY:
.db $01, $05, $15, $01, $07, $11

; 3rd entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CAF3 to CAF8 (6 bytes)
ToggleData_PEWTER_CITY:
.db $02, $03, $15, $02, $05, $15

; 4th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CAF9 to CB07 (15 bytes)
ToggleData_CERULEAN_CITY:
.db $03, $01, $11, $03, $02, $15, $03, $06, $11, $03, $0A, $15, $03, $0B, $15

; 11th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CB08 to CB34 (45 bytes)
ToggleData_SAFFRON_CITY:
.db $0A, $01, $15, $0A, $02, $15, $0A, $03, $15, $0A, $04, $15, $0A, $05, $15, $0A
.db $06, $15, $0A, $07, $15, $0A, $08, $11, $0A, $09, $11, $0A, $0A, $11, $0A, $0B
.db $11, $0A, $0C, $11, $0A, $0D, $11, $0A, $0E, $15, $0A, $0F, $11

; 14th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CB35 to CB3A (6 bytes)
ToggleData_ROUTE_2:
.db $0D, $01, $15, $0D, $02, $15

; 16th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CB3B to CB3D (3 bytes)
ToggleData_ROUTE_4:
.db $0F, $03, $15

; 21st entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CB3E to CB40 (3 bytes)
ToggleData_ROUTE_9:
.db $14, $0A, $15

; 24th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CB41 to CB49 (9 bytes)
ToggleData_ROUTE_12:
.db $17, $01, $15, $17, $09, $15, $17, $0A, $15

; 27th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CB4A to CB4C (3 bytes)
ToggleData_ROUTE_15:
.db $1A, $0B, $15

; 28th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CB4D to CB4F (3 bytes)
ToggleData_ROUTE_16:
.db $1B, $07, $15

; 34th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CB50 to CB55 (6 bytes)
ToggleData_ROUTE_22:
.db $21, $01, $11, $21, $02, $11

; 36th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CB56 to CB5B (6 bytes)
ToggleData_ROUTE_24:
.db $23, $01, $15, $23, $08, $15

; 37th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CB5C to CB5E (3 bytes)
ToggleData_ROUTE_25:
.db $24, $0A, $15

; 40th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CB5F to CB67 (9 bytes)
ToggleData_BLUES_HOUSE:
.db $27, $01, $15, $27, $02, $11, $27, $03, $15

; 41st entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CB68 to CB7F (24 bytes)
ToggleData_OAKS_LAB:
.db $28, $01, $15, $28, $02, $15, $28, $03, $15, $28, $04, $15, $28, $05, $11, $28
.db $06, $15, $28, $07, $15, $28, $08, $11

; 46th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CB80 to CB85 (6 bytes)
ToggleData_VIRIDIAN_GYM:
.db $2D, $01, $15, $2D, $0B, $15

; 53rd entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CB86 to CB88 (3 bytes)
ToggleData_MUSEUM_1F:
.db $34, $05, $15

; 229th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CB89 to CB91 (9 bytes)
ToggleData_CERULEAN_CAVE_1F:
.db $E4, $01, $15, $E4, $02, $15, $E4, $03, $15

; 144th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CB92 to CB94 (3 bytes)
ToggleData_POKEMON_TOWER_2F:
.db $8F, $01, $15

; 145th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CB95 to CB97 (3 bytes)
ToggleData_POKEMON_TOWER_3F:
.db $90, $04, $15

; 146th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CB98 to CBA0 (9 bytes)
ToggleData_POKEMON_TOWER_4F:
.db $91, $04, $15, $91, $05, $15, $91, $06, $15

; 147th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CBA1 to CBA3 (3 bytes)
ToggleData_POKEMON_TOWER_5F:
.db $92, $06, $15

; 148th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CBA4 to CBA9 (6 bytes)
ToggleData_POKEMON_TOWER_6F:
.db $93, $04, $15, $93, $05, $15

; 149th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CBAA to CBB5 (12 bytes)
ToggleData_POKEMON_TOWER_7F:
.db $94, $01, $15, $94, $02, $15, $94, $03, $15, $94, $04, $15

; 150th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CBB6 to CBB8 (3 bytes)
ToggleData_MR_FUJIS_HOUSE:
.db $95, $05, $11

; 133rd entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CBB9 to CBBB (3 bytes)
ToggleData_CELADON_MANSION_ROOF_HOUSE:
.db $84, $02, $15

; 136th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CBBC to CBBE (3 bytes)
ToggleData_GAME_CORNER:
.db $87, $0B, $15

; 156th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CBBF to CBC1 (3 bytes)
ToggleData_WARDENS_HOUSE:
.db $9B, $02, $15

; 166th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CBC2 to CBC7 (6 bytes)
ToggleData_POKEMON_MANSION_1F:
.db $A5, $02, $15, $A5, $03, $15

; 178th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CBC8 to CBCD (6 bytes)
ToggleData_FIGHTING_DOJO:
.db $B1, $06, $15, $B1, $07, $15

; 182nd entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CBCE to CBD0 (3 bytes)
ToggleData_SILPH_CO_1F:
.db $B5, $01, $11

; 84th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CBD1 to CBFA (42 bytes)
ToggleData_POWER_PLANT:
.db $53, $01, $15, $53, $02, $15, $53, $03, $15, $53, $04, $15, $53, $05, $15, $53
.db $06, $15, $53, $07, $15, $53, $08, $15, $53, $09, $15, $53, $0A, $15, $53, $0B
.db $15, $53, $0C, $15, $53, $0D, $15, $53, $0E, $15

; 195th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CBFB to CC0C (18 bytes)
ToggleData_VICTORY_ROAD_2F:
.db $C2, $06, $15, $C2, $07, $15, $C2, $08, $15, $C2, $09, $15, $C2, $0A, $15, $C2
.db $0D, $15

; 89th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CC0D to CC15 (9 bytes)
ToggleData_BILLS_HOUSE:
.db $58, $01, $15, $58, $02, $11, $58, $03, $11

; 52nd entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CC16 to CC1E (9 bytes)
ToggleData_VIRIDIAN_FOREST:
.db $33, $05, $15, $33, $06, $15, $33, $07, $15

; 60th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CC1F to CC30 (18 bytes)
ToggleData_MT_MOON_1F:
.db $3B, $08, $15, $3B, $09, $15, $3B, $0A, $15, $3B, $0B, $15, $3B, $0C, $15, $3B
.db $0D, $15

; 62nd entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CC31 to CC3C (12 bytes)
ToggleData_MT_MOON_B2F:
.db $3D, $06, $15, $3D, $07, $15, $3D, $08, $15, $3D, $09, $15

; 97th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CC3D to CC3F (3 bytes)
ToggleData_SS_ANNE_2F:
.db $60, $02, $11

; 103rd entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CC40 to CC42 (3 bytes)
ToggleData_SS_ANNE_1F_ROOMS:
.db $66, $0A, $15

; 104th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CC43 to CC48 (6 bytes)
ToggleData_SS_ANNE_2F_ROOMS:
.db $67, $06, $15, $67, $09, $15

; 105th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CC49 to CC51 (9 bytes)
ToggleData_SS_ANNE_B1F_ROOMS:
.db $68, $09, $15, $68, $0A, $15, $68, $0B, $15

; 199th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CC52 to CC5A (9 bytes)
ToggleData_VICTORY_ROAD_3F:
.db $C6, $05, $15, $C6, $06, $15, $C6, $0A, $15

; 200th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CC5B to CC60 (6 bytes)
ToggleData_ROCKET_HIDEOUT_B1F:
.db $C7, $06, $15, $C7, $07, $15

; 201st entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CC61 to CC6C (12 bytes)
ToggleData_ROCKET_HIDEOUT_B2F:
.db $C8, $02, $15, $C8, $03, $15, $C8, $04, $15, $C8, $05, $15

; 202nd entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CC6D to CC72 (6 bytes)
ToggleData_ROCKET_HIDEOUT_B3F:
.db $C9, $03, $15, $C9, $04, $15

; 203rd entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CC73 to CC84 (18 bytes)
ToggleData_ROCKET_HIDEOUT_B4F:
.db $CA, $01, $15, $CA, $05, $15, $CA, $06, $15, $CA, $07, $15, $CA, $08, $11, $CA
.db $09, $11

; 208th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CC85 to CC93 (15 bytes)
ToggleData_SILPH_CO_2F:
.db $CF, $01, $15, $CF, $02, $15, $CF, $03, $15, $CF, $04, $15, $CF, $05, $15

; 209th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CC94 to CC9C (9 bytes)
ToggleData_SILPH_CO_3F:
.db $D0, $02, $15, $D0, $03, $15, $D0, $04, $15

; 210th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CC9D to CCAE (18 bytes)
ToggleData_SILPH_CO_4F:
.db $D1, $02, $15, $D1, $03, $15, $D1, $04, $15, $D1, $05, $15, $D1, $06, $15, $D1
.db $07, $15

; 211th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CCAF to CCC3 (21 bytes)
ToggleData_SILPH_CO_5F:
.db $D2, $02, $15, $D2, $03, $15, $D2, $04, $15, $D2, $05, $15, $D2, $06, $15, $D2
.db $07, $15, $D2, $08, $15

; 212th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CCC4 to CCD2 (15 bytes)
ToggleData_SILPH_CO_6F:
.db $D3, $06, $15, $D3, $07, $15, $D3, $08, $15, $D3, $09, $15, $D3, $0A, $15

; 213th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CCD3 to CCEA (24 bytes)
ToggleData_SILPH_CO_7F:
.db $D4, $05, $15, $D4, $06, $15, $D4, $07, $15, $D4, $08, $15, $D4, $09, $15, $D4
.db $0A, $15, $D4, $0B, $15, $D4, $0C, $15

; 214th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CCEB to CCF3 (9 bytes)
ToggleData_SILPH_CO_8F:
.db $D5, $02, $15, $D5, $03, $15, $D5, $04, $15

; 234th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CCF4 to CCFC (9 bytes)
ToggleData_SILPH_CO_9F:
.db $E9, $02, $15, $E9, $03, $15, $E9, $04, $15

; 235th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CCFD to CD0E (18 bytes)
ToggleData_SILPH_CO_10F:
.db $EA, $01, $15, $EA, $02, $15, $EA, $03, $15, $EA, $04, $15, $EA, $05, $15, $EA
.db $06, $15

; 236th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CD0F to CD17 (9 bytes)
ToggleData_SILPH_CO_11F:
.db $EB, $03, $15, $EB, $04, $15, $EB, $05, $15

; 245th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CD18 to CD1A (3 bytes)
ToggleData_UNUSED_MAP_F4:
.db $F4, $02, $15

; 215th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CD1B to CD1D (3 bytes)
ToggleData_POKEMON_MANSION_2F:
.db $D6, $02, $15

; 216th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CD1E to CD23 (6 bytes)
ToggleData_POKEMON_MANSION_3F:
.db $D7, $03, $15, $D7, $04, $15

; 217th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CD24 to CD32 (15 bytes)
ToggleData_POKEMON_MANSION_B1F:
.db $D8, $03, $15, $D8, $04, $15, $D8, $05, $15, $D8, $06, $15, $D8, $08, $15

; 218th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CD33 to CD3E (12 bytes)
ToggleData_SAFARI_ZONE_EAST:
.db $D9, $01, $15, $D9, $02, $15, $D9, $03, $15, $D9, $04, $15

; 219th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CD3F to CD44 (6 bytes)
ToggleData_SAFARI_ZONE_NORTH:
.db $DA, $01, $15, $DA, $02, $15

; 220th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CD45 to CD50 (12 bytes)
ToggleData_SAFARI_ZONE_WEST:
.db $DB, $01, $15, $DB, $02, $15, $DB, $03, $15, $DB, $04, $15

; 221st entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CD51 to CD53 (3 bytes)
ToggleData_SAFARI_ZONE_CENTER:
.db $DC, $01, $15

; 227th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CD54 to CD5C (9 bytes)
ToggleData_CERULEAN_CAVE_2F:
.db $E2, $01, $15, $E2, $02, $15, $E2, $03, $15

; 228th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CD5D to CD65 (9 bytes)
ToggleData_CERULEAN_CAVE_B1F:
.db $E3, $01, $15, $E3, $02, $15, $E3, $03, $15

; 109th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CD66 to CD6B (6 bytes)
ToggleData_VICTORY_ROAD_1F:
.db $6C, $03, $15, $6C, $04, $15

; 121st entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CD6C to CD6E (3 bytes)
ToggleData_CHAMPIONS_ROOM:
.db $78, $02, $11

; 193rd entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CD6F to CD74 (6 bytes)
ToggleData_SEAFOAM_ISLANDS_1F:
.db $C0, $01, $15, $C0, $02, $15

; 160th entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CD75 to CD7A (6 bytes)
ToggleData_SEAFOAM_ISLANDS_B1F:
.db $9F, $01, $11, $9F, $02, $11

; 161st entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CD7B to CD80 (6 bytes)
ToggleData_SEAFOAM_ISLANDS_B2F:
.db $A0, $01, $11, $A0, $02, $11

; 162nd entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CD81 to CD8C (12 bytes)
ToggleData_SEAFOAM_ISLANDS_B3F:
.db $A1, $02, $15, $A1, $03, $15, $A1, $05, $11, $A1, $06, $11

; 163rd entry of Pointer Table from C8F5 (indexed by wCurMap)
; Data from CD8D to CEB7 (299 bytes)
ToggleData_SEAFOAM_ISLANDS_B4F:
.db $A2, $01, $11, $A2, $02, $11, $A2, $03, $15, $FF, $01, $15, $21, $28, $D7, $CB
.db $C6, $21, $AA, $4D, $CD, $49, $3C, $21, $BB, $4D, $C3, $49, $3C, $17, $3C, $40
.db $29, $08, $FA, $91, $CF, $CD, $D0, $13, $CD, $D7, $3D, $C3, $D7, $24, $17, $51
.db $40, $29, $50, $21, $28, $D7, $CB, $CE, $FA, $32, $D7, $CB, $6F, $20, $20, $FA
.db $5E, $D3, $FE, $A2, $C0, $FA, $81, $D8, $E6, $03, $FE, $03, $C8, $21, $F7, $4D
.db $CD, $BF, $34, $D0, $21, $28, $D7, $CB, $8E, $21, $FA, $4D, $C3, $49, $3C, $21
.db $28, $D7, $CB, $8E, $21, $FF, $4D, $C3, $49, $3C, $0B, $07, $FF, $17, $69, $40
.db $29, $50, $17, $88, $40, $29, $50, $FA, $96, $CF, $F5, $C5, $D5, $E5, $E5, $16
.db $32, $3E, $1D, $BD, $20, $07, $3E, $D3, $BC, $20, $02, $16, $14, $7E, $92, $57
.db $2A, $A7, $28, $0F, $2A, $47, $FA, $91, $CF, $B8, $CA, $4A, $4E, $23, $7E, $FE
.db $FF, $20, $F1, $E1, $7A, $A7, $28, $36, $34, $7E, $87, $3D, $4F, $06, $00, $09
.db $FA, $91, $CF, $22, $FA, $96, $CF, $22, $36, $FF, $C3, $6A, $4E, $FA, $96, $CF
.db $47, $7E, $80, $FE, $64, $DA, $68, $4E, $D6, $63, $EA, $96, $CF, $7A, $A7, $28
.db $06, $3E, $63, $22, $C3, $21, $4E, $E1, $A7, $18, $03, $77, $E1, $37, $E1, $D1
.db $C1, $C1, $78, $EA, $96, $CF, $C9, $E5, $23, $FA, $92, $CF, $CB, $27, $85, $6F
.db $30, $01, $24, $23, $FA, $96, $CF, $5F, $7E, $93, $32, $EA, $97, $CF, $A7, $20
.db $28, $5D, $54, $13, $13, $1A, $13, $22, $FE, $FF, $20, $F9, $AF, $EA, $36, $CC
.db $EA, $26, $CC, $EA, $2C, $CC, $EA, $7E, $D0, $E1, $7E, $3D, $77, $EA, $2A, $D1
.db $FE, $02, $38, $06, $EA, $28, $CC, $18, $01, $E1, $C9

LoadWildData:
	LD HL, WildDataPointers
	LD A, (wCurMap)
	LD C, A
	LD B, $00
	ADD HL, BC
	ADD HL, BC
	LDI A, (HL)
	LD H, (HL)
	LD L, A
	LDI A, (HL)
	LD (wGrassRate), A
	AND A
	JR Z, LoadWildData.NoGrassData
	PUSH HL
	LD DE, wGrassMons
	LD BC, WILDDATA_LENGTH - 1
	CALL CopyData
	POP HL
	LD BC, WILDDATA_LENGTH - 1
	ADD HL, BC
LoadWildData.NoGrassData:
	LDI A, (HL)
	LD (wEnemyMon1), A
	AND A
	RET Z
	LD DE, wEnemyMon1HP
	LD BC, WILDDATA_LENGTH - 1
	JP CopyData

; Pointer Table from CEEB to D0DA (248 entries, indexed by wCurMap)
WildDataPointers:
.dw NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, Route1WildMons, Route2WildMons, Route3WildMons, Route4WildMons
.dw Route5WildMons, Route6WildMons, Route7WildMons, Route8WildMons, Route9WildMons, Route10WildMons, Route11WildMons, Route12WildMons
.dw Route13WildMons, Route14WildMons, Route15WildMons, Route16WildMons, Route17WildMons, Route18WildMons, SeaRoutesWildMons, SeaRoutesWildMons
.dw Route21WildMons, Route22WildMons, Route23WildMons, Route24WildMons, Route25WildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, NothingWildMons, ViridianForestWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, NothingWildMons, MtMoon1FWildMons, MtMoonB1FWildMons, MtMoonB2FWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, RockTunnel1FWildMons, PowerPlantWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, VictoryRoad1FWildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, PokemonTower1FWildMons, PokemonTower2FWildMons
.dw PokemonTower3FWildMons, PokemonTower4FWildMons, PokemonTower5FWildMons, PokemonTower6FWildMons, PokemonTower7FWildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, SeafoamIslandsB1FWildMons
.dw SeafoamIslandsB2FWildMons, SeafoamIslandsB3FWildMons, SeafoamIslandsB4FWildMons, NothingWildMons, NothingWildMons, PokemonMansion1FWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw SeafoamIslands1FWildMons, NothingWildMons, VictoryRoad2FWildMons, NothingWildMons, NothingWildMons, DiglettsCaveWildMons, VictoryRoad3FWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, PokemonMansion2FWildMons, PokemonMansion3FWildMons
.dw PokemonMansionB1FWildMons, SafariZoneEastWildMons, SafariZoneNorthWildMons, SafariZoneWestWildMons, SafariZoneCenterWildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, CeruleanCave2FWildMons, CeruleanCaveB1FWildMons, CeruleanCave1FWildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw RockTunnelB1FWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons
.dw NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons, NothingWildMons

; Data from D0DB to D0DC (2 bytes)
.db $FF, $FF

; 1st entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D0DD to D0DE (2 bytes)
NothingWildMons:
.db $00, $00

; 13th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D0DF to D0F4 (22 bytes)
Route1WildMons:
.db $19, $03, $24, $03, $A5, $03, $A5, $02, $A5, $02, $24, $03, $24, $03, $24, $04
.db $A5, $04, $24, $05, $24, $00

; 14th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D0F5 to D10A (22 bytes)
Route2WildMons:
.db $19, $03, $A5, $03, $24, $04, $24, $04, $A5, $05, $24, $03, $70, $02, $A5, $05
.db $A5, $04, $70, $05, $70, $00

; 34th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D10B to D120 (22 bytes)
Route22WildMons:
.db $19, $03, $A5, $03, $03, $04, $A5, $04, $03, $02, $A5, $02, $03, $03, $05, $05
.db $05, $03, $0F, $04, $0F, $00

; 52nd entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D121 to D136 (22 bytes)
ViridianForestWildMons:
.db $08, $04, $70, $05, $71, $03, $70, $05, $70, $04, $71, $06, $71, $04, $7C, $03
.db $7B, $03, $54, $05, $54, $00

; 15th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D137 to D14C (22 bytes)
Route3WildMons:
.db $14, $06, $24, $05, $05, $07, $24, $06, $05, $07, $05, $08, $24, $08, $05, $03
.db $64, $05, $64, $07, $64, $00

; 60th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D14D to D162 (22 bytes)
MtMoon1FWildMons:
.db $0A, $08, $6B, $07, $6B, $09, $6B, $08, $A9, $06, $6B, $0A, $6B, $0A, $A9, $08
.db $6D, $0B, $6B, $08, $04, $00

; 61st entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D163 to D178 (22 bytes)
MtMoonB1FWildMons:
.db $0A, $08, $6B, $07, $6B, $07, $A9, $08, $A9, $09, $6B, $0A, $6D, $0A, $6B, $0B
.db $6B, $09, $04, $09, $A9, $00

; 62nd entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D179 to D18E (22 bytes)
MtMoonB2FWildMons:
.db $0A, $09, $6B, $09, $A9, $0A, $6B, $0A, $A9, $0B, $6B, $0A, $6D, $0C, $6D, $0A
.db $04, $0C, $6B, $0C, $04, $00

; 16th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D18F to D1A4 (22 bytes)
Route4WildMons:
.db $14, $0A, $A5, $0A, $05, $08, $A5, $06, $6C, $08, $05, $0A, $6C, $0C, $A5, $0C
.db $05, $08, $6C, $0C, $6C, $00

; 36th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D1A5 to D1BA (22 bytes)
Route24WildMons:
.db $19, $07, $70, $08, $71, $0C, $24, $0C, $B9, $0D, $B9, $0A, $94, $0E, $B9, $0D
.db $24, $08, $94, $0C, $94, $00

; 37th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D1BB to D1D0 (22 bytes)
Route25WildMons:
.db $0F, $08, $70, $09, $71, $0D, $24, $0C, $B9, $0D, $B9, $0C, $94, $0E, $B9, $0A
.db $94, $07, $7C, $08, $7B, $00

; 21st entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D1D1 to D1E6 (22 bytes)
Route9WildMons:
.db $0F, $10, $A5, $10, $05, $0E, $A5, $0B, $6C, $0D, $05, $0F, $6C, $11, $A5, $11
.db $05, $0D, $6C, $11, $6C, $00

; 17th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D1E7 to D1FC (22 bytes)
Route5WildMons:
.db $0F, $0D, $B9, $0D, $24, $0F, $24, $0A, $39, $0C, $39, $0F, $B9, $10, $B9, $10
.db $24, $0E, $39, $10, $39, $00

; 18th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D1FD to D212 (22 bytes)
Route6WildMons:
.db $0F, $0D, $B9, $0D, $24, $0F, $24, $0A, $39, $0C, $39, $0F, $B9, $10, $B9, $10
.db $24, $0E, $39, $10, $39, $00

; 23rd entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D213 to D228 (22 bytes)
Route11WildMons:
.db $0F, $0E, $6C, $0F, $05, $0C, $6C, $09, $30, $0D, $05, $0D, $30, $0F, $6C, $11
.db $05, $0B, $30, $0F, $30, $00

; 83rd entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D229 to D23E (22 bytes)
RockTunnel1FWildMons:
.db $0F, $10, $6B, $11, $6B, $11, $A9, $0F, $6A, $10, $A9, $12, $6B, $0F, $6B, $11
.db $6A, $0D, $22, $0F, $22, $00

; 233rd entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D23F to D254 (22 bytes)
RockTunnelB1FWildMons:
.db $0F, $10, $6B, $11, $6B, $11, $A9, $0F, $6A, $10, $A9, $12, $6B, $11, $6A, $11
.db $22, $0D, $22, $12, $A9, $00

; 22nd entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D255 to D26A (22 bytes)
Route10WildMons:
.db $0F, $10, $06, $10, $05, $0E, $06, $0B, $6C, $0D, $05, $0F, $6C, $11, $06, $11
.db $05, $0D, $6C, $11, $6C, $00

; 24th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D26B to D280 (22 bytes)
Route12WildMons:
.db $0F, $18, $B9, $19, $24, $17, $24, $18, $41, $16, $B9, $1A, $41, $1A, $B9, $1B
.db $24, $1C, $BA, $1E, $BA, $00

; 20th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D281 to D296 (22 bytes)
Route8WildMons:
.db $0F, $12, $24, $12, $39, $11, $6C, $10, $21, $14, $24, $14, $39, $13, $6C, $11
.db $21, $0F, $21, $12, $21, $00

; 19th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D297 to D2AC (22 bytes)
Route7WildMons:
.db $0F, $13, $24, $13, $B9, $11, $39, $16, $B9, $16, $24, $12, $39, $12, $21, $14
.db $21, $13, $39, $14, $39, $00

; 143rd entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D2AD to D2AE (2 bytes)
PokemonTower1FWildMons:
.db $00, $00

; 144th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D2AF to D2B0 (2 bytes)
PokemonTower2FWildMons:
.db $00, $00

; 145th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D2B1 to D2C6 (22 bytes)
PokemonTower3FWildMons:
.db $0A, $14, $19, $15, $19, $16, $19, $17, $19, $13, $19, $12, $19, $18, $19, $14
.db $11, $16, $11, $19, $93, $00

; 146th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D2C7 to D2DC (22 bytes)
PokemonTower4FWildMons:
.db $0A, $14, $19, $15, $19, $16, $19, $17, $19, $13, $19, $12, $19, $19, $93, $14
.db $11, $16, $11, $18, $19, $00

; 147th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D2DD to D2F2 (22 bytes)
PokemonTower5FWildMons:
.db $0A, $14, $19, $15, $19, $16, $19, $17, $19, $13, $19, $12, $19, $19, $93, $14
.db $11, $16, $11, $18, $19, $00

; 148th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D2F3 to D308 (22 bytes)
PokemonTower6FWildMons:
.db $0F, $15, $19, $16, $19, $17, $19, $18, $19, $14, $19, $13, $19, $1A, $93, $16
.db $11, $18, $11, $1C, $93, $00

; 149th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D309 to D31E (22 bytes)
PokemonTower7FWildMons:
.db $0F, $15, $19, $16, $19, $17, $19, $18, $19, $14, $19, $1C, $93, $16, $11, $18
.db $11, $1C, $93, $1E, $93, $00

; 25th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D31F to D334 (22 bytes)
Route13WildMons:
.db $14, $18, $B9, $19, $24, $1B, $24, $18, $41, $16, $B9, $1A, $41, $1A, $B9, $19
.db $4C, $1C, $BA, $1E, $BA, $00

; 26th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D335 to D34A (22 bytes)
Route14WildMons:
.db $0F, $18, $B9, $1A, $24, $17, $4C, $18, $41, $16, $B9, $1A, $41, $1A, $B9, $1E
.db $BA, $1C, $96, $1E, $96, $00

; 27th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D34B to D360 (22 bytes)
Route15WildMons:
.db $0F, $18, $B9, $1A, $4C, $17, $24, $1A, $41, $16, $B9, $1C, $41, $1A, $B9, $1E
.db $BA, $1C, $96, $1E, $96, $00

; 28th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D361 to D376 (22 bytes)
Route16WildMons:
.db $19, $14, $05, $16, $05, $12, $A5, $14, $46, $14, $A5, $12, $46, $16, $46, $16
.db $A5, $17, $A6, $19, $A6, $00

; 29th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D377 to D38C (22 bytes)
Route17WildMons:
.db $19, $14, $05, $16, $05, $19, $A6, $18, $46, $1B, $A6, $1A, $46, $1C, $46, $1D
.db $A6, $19, $23, $1B, $23, $00

; 30th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D38D to D3A2 (22 bytes)
Route18WildMons:
.db $19, $14, $05, $16, $05, $19, $A6, $18, $46, $19, $23, $1A, $46, $1C, $46, $1D
.db $A6, $1B, $23, $1D, $23, $00

; 221st entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D3A3 to D3B8 (22 bytes)
SafariZoneCenterWildMons:
.db $1E, $16, $03, $19, $12, $16, $41, $18, $0C, $1F, $A7, $19, $0C, $1F, $A8, $1E
.db $2E, $17, $1A, $17, $28, $00

; 218th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D3B9 to D3CE (22 bytes)
SafariZoneEastWildMons:
.db $1E, $18, $03, $1A, $46, $16, $6D, $19, $0C, $21, $A7, $17, $0C, $18, $0F, $19
.db $2E, $19, $02, $1C, $1A, $00

; 219th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D3CF to D3E4 (22 bytes)
SafariZoneNorthWildMons:
.db $1E, $16, $03, $1A, $12, $17, $6D, $19, $0C, $1E, $A7, $1B, $0C, $1E, $A8, $20
.db $77, $1A, $28, $1C, $3C, $00

; 220th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D3E5 to D3FA (22 bytes)
SafariZoneWestWildMons:
.db $1E, $19, $03, $1A, $46, $17, $41, $18, $0C, $21, $A7, $1A, $0C, $19, $0F, $1F
.db $77, $1A, $3C, $1C, $02, $00

; 31st entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D3FB to D410 (22 bytes)
SeaRoutesWildMons:
.db $00, $05, $05, $18, $0A, $18, $0F, $18, $05, $18, $0A, $18, $0F, $18, $14, $18
.db $1E, $18, $23, $18, $28, $18

; 193rd entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D411 to D426 (22 bytes)
SeafoamIslands1FWildMons:
.db $0F, $1E, $3A, $1E, $25, $1E, $17, $1E, $5C, $1C, $5C, $15, $6B, $1D, $82, $1C
.db $2F, $1C, $17, $26, $80, $00

; 160th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D427 to D43C (22 bytes)
SeafoamIslandsB1FWildMons:
.db $0A, $1E, $1B, $1E, $5C, $20, $17, $20, $5C, $1C, $25, $1E, $3A, $1E, $25, $1C
.db $3A, $26, $78, $25, $5D, $00

; 161st entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D43D to D452 (22 bytes)
SeafoamIslandsB2FWildMons:
.db $0A, $1E, $3A, $1E, $25, $20, $3A, $20, $25, $1C, $5C, $1E, $1B, $1E, $5C, $1C
.db $17, $1E, $82, $25, $08, $00

; 162nd entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D453 to D468 (22 bytes)
SeafoamIslandsB3FWildMons:
.db $0A, $1F, $25, $1F, $3A, $21, $25, $21, $3A, $1D, $5C, $1F, $17, $1F, $5C, $1D
.db $17, $27, $5D, $25, $78, $00

; 163rd entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D469 to D47E (22 bytes)
SeafoamIslandsB4FWildMons:
.db $0A, $1F, $5C, $1F, $17, $21, $5C, $21, $17, $1D, $25, $1F, $3A, $1F, $25, $1D
.db $3A, $27, $08, $20, $82, $00

; 166th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D47F to D494 (22 bytes)
PokemonMansion1FWildMons:
.db $0A, $20, $37, $1E, $37, $22, $A3, $1E, $A3, $22, $21, $20, $A3, $1E, $0D, $1C
.db $A3, $25, $8F, $27, $88, $00

; 215th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D495 to D4AA (22 bytes)
PokemonMansion2FWildMons:
.db $0A, $20, $21, $22, $37, $22, $37, $1E, $A3, $1E, $37, $20, $A3, $1E, $0D, $1C
.db $A3, $27, $8F, $25, $88, $00

; 216th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D4AB to D4C0 (22 bytes)
PokemonMansion3FWildMons:
.db $0A, $1F, $37, $21, $21, $23, $37, $20, $A3, $22, $A3, $28, $8F, $22, $0D, $26
.db $8F, $24, $A3, $2A, $88, $00

; 217th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D4C1 to D4D6 (22 bytes)
PokemonMansionB1FWildMons:
.db $0A, $21, $37, $1F, $37, $23, $21, $20, $A3, $1F, $37, $28, $8F, $22, $A3, $23
.db $0D, $2A, $8F, $2A, $88, $00

; 33rd entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D4D7 to D500 (42 bytes)
Route21WildMons:
.db $19, $15, $A5, $17, $24, $1E, $A6, $17, $A5, $15, $24, $1E, $96, $20, $96, $1C
.db $1E, $1E, $1E, $20, $1E, $05, $05, $18, $0A, $18, $0F, $18, $05, $18, $0A, $18
.db $0F, $18, $14, $18, $1E, $18, $23, $18, $28, $18

; 229th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D501 to D516 (22 bytes)
CeruleanCave1FWildMons:
.db $0A, $2E, $82, $2E, $81, $2E, $36, $31, $74, $31, $77, $34, $2D, $31, $26, $34
.db $2E, $35, $55, $35, $4C, $00

; 227th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D517 to D52C (22 bytes)
CeruleanCave2FWildMons:
.db $0F, $33, $74, $33, $77, $33, $26, $34, $01, $34, $91, $34, $8D, $38, $28, $36
.db $65, $37, $4C, $3C, $4C, $00

; 228th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D52D to D542 (22 bytes)
CeruleanCaveB1FWildMons:
.db $19, $37, $01, $37, $91, $37, $8D, $40, $28, $40, $2E, $40, $55, $39, $2D, $41
.db $4C, $3F, $4C, $43, $4C, $00

; 84th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D543 to D558 (22 bytes)
PowerPlantWildMons:
.db $0A, $15, $06, $15, $AD, $14, $54, $18, $54, $17, $AD, $17, $06, $20, $36, $23
.db $36, $21, $35, $24, $35, $00

; 35th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D559 to D56E (22 bytes)
Route23WildMons:
.db $0A, $1A, $6C, $21, $4C, $1A, $05, $26, $23, $26, $4C, $26, $23, $29, $2D, $2B
.db $4C, $29, $23, $2B, $23, $00

; 195th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D56F to D584 (22 bytes)
VictoryRoad2FWildMons:
.db $0A, $16, $6A, $18, $A9, $1A, $6B, $24, $22, $27, $22, $2A, $22, $29, $29, $28
.db $82, $28, $91, $2B, $27, $00

; 199th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D585 to D59A (22 bytes)
VictoryRoad3FWildMons:
.db $0F, $18, $6A, $1A, $A9, $16, $6B, $2A, $22, $28, $77, $2D, $22, $2B, $27, $29
.db $82, $2A, $29, $2D, $29, $00

; 109th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D59B to D5B0 (22 bytes)
VictoryRoad1FWildMons:
.db $0F, $18, $6A, $1A, $A9, $16, $6B, $24, $22, $27, $22, $2A, $22, $29, $27, $29
.db $82, $2A, $29, $2B, $91, $00

; 198th entry of Pointer Table from CEEB (indexed by wCurMap)
; Data from D5B1 to F054 (6820 bytes)
DiglettsCaveWildMons:
.db $14, $12, $3B, $13, $3B, $11, $3B, $14, $3B, $10, $3B, $0F, $3B, $15, $3B, $16
.db $3B, $1D, $76, $1F, $76, $00, $3E, $01, $EA, $6A, $CD, $FA, $91, $CF, $FE, $C4
.db $D2, $79, $64, $21, $E1, $55, $3D, $87, $4F, $06, $00, $09, $2A, $66, $6F, $E9
.db $87, $56, $87, $56, $87, $56, $87, $56, $68, $59, $77, $59, $B4, $59, $87, $56
.db $56, $5A, $5B, $5A, $BB, $5A, $BB, $5A, $BB, $5A, $BB, $5A, $BB, $5A, $BB, $5A
.db $BB, $5A, $BB, $5A, $BB, $5A, $BB, $5A, $52, $5F, $67, $5F, $76, $64, $76, $64
.db $76, $64, $76, $64, $76, $64, $76, $64, $AF, $5F, $03, $60, $76, $64, $5B, $5A
.db $5B, $5A, $5B, $5A, $B4, $5A, $B4, $5A, $B4, $5A, $B4, $5A, $B4, $5A, $B4, $5A
.db $76, $64, $76, $64, $76, $64, $76, $64, $76, $64, $13, $60, $5B, $5A, $22, $60
.db $76, $64, $76, $64, $CD, $60, $BB, $5A, $BB, $5A, $BB, $5A, $DC, $60, $EB, $60
.db $F0, $60, $F5, $60, $76, $64, $BB, $5A, $BB, $5A, $BB, $5A, $76, $64, $76, $64
.db $04, $61, $04, $61, $04, $61, $04, $61, $3A, $62, $DE, $62, $E1, $62, $76, $64
.db $40, $61, $76, $64, $76, $64, $4C, $62, $59, $62, $83, $62, $17, $63, $1E, $63
.db $1E, $63, $1E, $63, $1E, $63, $FA, $57, $D0, $A7, $CA, $81, $65, $3D, $C2, $8B
.db $65, $FA, $5A, $D0, $3D, $28, $0F, $FA, $63, $D1, $FE, $06, $20, $08, $FA, $80
.db $DA, $FE, $14, $CA, $B1, $65, $AF, $EA, $1C, $D1, $FA, $5A, $D0, $FE, $02, $20
.db $04, $21, $47, $DA, $35, $CD, $ED, $3D, $3E, $43, $EA, $1E, $D1, $CD, $25, $37
.db $21, $E8, $65, $CD, $49, $3C, $21, $3A, $58, $06, $0F, $CD, $D6, $35, $06, $10
.db $CA, $01, $58, $FA, $5A, $D0, $3D, $20, $0F, $21, $87, $D8, $11, $58, $D1, $01
.db $0B, $00, $CD, $B5, $00, $C3, $8B, $57, $FA, $5E, $D3, $FE, $93, $20, $0A, $FA
.db $D8, $CF, $FE, $91, $06, $10, $CA, $01, $58, $CD, $5C, $3E, $47, $21, $91, $CF
.db $7E, $FE, $01, $CA, $8B, $57, $FE, $04, $28, $0F, $3E, $C8, $B8, $38, $EA, $7E
.db $FE, $03, $28, $05, $3E, $96, $B8, $38, $E0, $FA, $E9, $CF, $A7, $28, $0E, $E6
.db $27, $0E, $0C, $28, $02, $0E, $19, $78, $91, $DA, $8B, $57, $47, $C5, $AF, $E0
.db $96, $21, $F4, $CF, $2A, $E0, $97, $7E, $E0, $98, $3E, $FF, $E0, $99, $CD, $AC
.db $38, $FA, $91, $CF, $FE, $03, $3E, $0C, $20, $02, $3E, $08, $E0, $99, $06, $04
.db $CD, $B9, $38, $21, $E6, $CF, $2A, $47, $7E, $CB, $38, $CB, $1F, $CB, $38, $CB
.db $1F, $A7, $20, $01, $3C, $E0, $99, $06, $04, $CD, $B9, $38, $F0, $97, $A7, $28
.db $04, $3E, $FF, $E0, $98, $C1, $FA, $07, $D0, $B8, $38, $10, $F0, $97, $A7, $20
.db $09, $CD, $5C, $3E, $47, $F0, $98, $B8, $38, $02, $18, $78, $F0, $98, $EA, $1E
.db $D1, $AF, $E0, $96, $E0, $97, $FA, $07, $D0, $E0, $98, $3E, $64, $E0, $99, $CD
.db $AC, $38, $FA, $91, $CF, $06, $FF, $FE, $04, $28, $0C, $06, $C8, $FE, $03, $28
.db $06, $06, $96, $FE, $02, $28, $00, $78, $E0, $99, $06, $04, $CD, $B9, $38, $F0
.db $97, $A7, $06, $63, $20, $3A, $FA, $1E, $D1, $E0, $99, $CD, $AC, $38, $3E, $FF
.db $E0, $99, $06, $04, $CD, $B9, $38, $FA, $E9, $CF, $A7, $28, $0D, $E6, $27, $06
.db $05, $28, $02, $06, $0A, $F0, $98, $80, $E0, $98, $F0, $98, $FE, $0A, $06, $20
.db $38, $0E, $FE, $1E, $06, $61, $38, $08, $FE, $46, $06, $62, $38, $02, $06, $63
.db $78, $EA, $1E, $D1, $0E, $14, $CD, $39, $37, $3E, $C1, $EA, $7C, $D0, $AF, $E0
.db $F3, $EA, $5B, $CC, $EA, $5B, $D0, $FA, $92, $CF, $F5, $FA, $91, $CF, $F5, $3E
.db $08, $CD, $6D, $3E, $F1, $EA, $91, $CF, $F1, $EA, $92, $CF, $FA, $1E, $D1, $FE
.db $10, $21, $37, $59, $CA, $22, $59, $FE, $20, $21, $3C, $59, $CA, $22, $59, $FE
.db $61, $21, $41, $59, $CA, $22, $59, $FE, $62, $21, $46, $59, $CA, $22, $59, $FE
.db $63, $21, $4B, $59, $CA, $22, $59, $21, $E6, $CF, $2A, $F5, $2A, $F5, $23, $7E
.db $F5, $E5, $21, $69, $D0, $CB, $5E, $28, $07, $3E, $4C, $EA, $D8, $CF, $18, $0D
.db $CB, $DE, $21, $EB, $CC, $FA, $F1, $CF, $22, $FA, $F2, $CF, $77, $FA, $91, $CF
.db $F5, $FA, $D8, $CF, $EA, $91, $CF, $FA, $F3, $CF, $EA, $27, $D1, $21, $01, $6B
.db $06, $0F, $CD, $D6, $35, $F1, $EA, $91, $CF, $E1, $F1, $32, $2B, $F1, $32, $F1
.db $77, $FA, $E5, $CF, $EA, $1C, $D1, $EA, $91, $CF, $EA, $1E, $D1, $FA, $5A, $D0
.db $3D, $28, $6B, $21, $50, $59, $CD, $49, $3C, $3E, $3A, $CD, $6D, $3E, $FA, $1E
.db $D1, $3D, $4F, $06, $02, $21, $F7, $D2, $3E, $10, $CD, $6D, $3E, $79, $F5, $FA
.db $1E, $D1, $3D, $4F, $06, $01, $3E, $10, $CD, $6D, $3E, $F1, $A7, $20, $14, $21
.db $61, $59, $CD, $49, $3C, $CD, $82, $00, $FA, $E5, $CF, $EA, $1E, $D1, $3E, $3D
.db $CD, $6D, $3E, $FA, $63, $D1, $FE, $06, $28, $0C, $AF, $EA, $49, $CC, $CD, $82
.db $00, $CD, $27, $39, $18, $21, $CD, $82, $00, $CD, $A4, $67, $21, $57, $59, $FA
.db $F1, $D7, $CB, $47, $20, $03, $21, $5C, $59, $CD, $49, $3C, $18, $09, $21, $50
.db $59, $CD, $49, $3C, $CD, $82, $00, $FA, $5A, $D0, $A7, $C0, $21, $1D, $D3, $3C
.db $EA, $96, $CF, $C3, $BB, $2B, $17, $29, $67, $29, $50, $17, $5F, $67, $29, $50
.db $17, $75, $67, $29, $50, $17, $91, $67, $29, $50, $17, $B2, $67, $29, $50, $17
.db $CF, $67, $29, $12, $06, $50, $17, $EE, $67, $29, $50, $17, $10, $68, $29, $50
.db $17, $35, $68, $29, $13, $06, $50, $FA, $57, $D0, $A7, $C2, $81, $65, $06, $1C
.db $21, $3E, $4E, $C3, $D6, $35, $FA, $57, $D0, $A7, $C2, $81, $65, $FA, $00, $D7
.db $EA, $1A, $D1, $FE, $02, $CA, $81, $65, $3D, $20, $0F, $CD, $C5, $69, $AF, $EA
.db $00, $D7, $CD, $07, $23, $21, $FC, $65, $18, $16, $CD, $C5, $09, $D2, $AC, $65
.db $CD, $C5, $69, $AF, $E0, $B4, $3C, $EA, $00, $D7, $21, $F2, $65, $CD, $07, $23
.db $C3, $49, $3C, $FA, $00, $D7, $EA, $1A, $D1, $FE, $02, $28, $25, $CD, $B8, $68
.db $DA, $B6, $65, $21, $A0, $0C, $CD, $4A, $0C, $DA, $B6, $65, $CD, $28, $5A, $21
.db $30, $D7, $CB, $FE, $3E, $02, $EA, $00, $D7, $CD, $07, $23, $21, $4C, $5A, $C3
.db $49, $3C, $AF, $E0, $8C, $16, $10, $CD, $6D, $0B, $CB, $BE, $F0, $8C, $A7, $20
.db $1A, $21, $A0, $0C, $CD, $4A, $0C, $38, $12, $21, $30, $D5, $2A, $66, $6F, $FA
.db $C6, $CF, $47, $2A, $B8, $28, $0A, $FE, $FF, $20, $F8, $21, $51, $5A, $C3, $49
.db $3C, $CD, $28, $5A, $21, $30, $D7, $CB, $FE, $AF, $EA, $00, $D7, $3D, $EA, $6B
.db $CD, $CD, $07, $23, $C3, $4D, $10, $FA, $2A, $D5, $CB, $5F, $06, $40, $20, $0E
.db $CB, $57, $06, $80, $20, $08, $CB, $4F, $06, $20, $20, $02, $06, $10, $78, $EA
.db $D3, $CC, $AF, $EA, $39, $CD, $3C, $EA, $38, $CD, $C9, $17, $5E, $68, $29, $50
.db $17, $6F, $68, $29, $50, $3E, $29, $C3, $6D, $3E, $FA, $57, $D0, $A7, $C2, $81
.db $65, $FA, $92, $CF, $F5, $FA, $91, $CF, $EA, $56, $D1, $F5, $3E, $05, $EA, $7D
.db $D0, $3E, $FF, $EA, $CB, $CF, $CD, $FC, $13, $C1, $38, $31, $78, $EA, $91, $CF
.db $3E, $01, $EA, $D4, $CC, $3E, $8E, $CD, $40, $37, $CD, $48, $37, $21, $0E, $6D
.db $06, $0E, $CD, $D6, $35, $FA, $21, $D1, $A7, $28, $0F, $F1, $EA, $92, $CF, $21
.db $1D, $D3, $3E, $01, $EA, $96, $CF, $C3, $BB, $2B, $CD, $7C, $65, $AF, $EA, $6A
.db $CD, $F1, $C9, $FA, $57, $D0, $A7, $C2, $81, $65, $FA, $63, $D1, $A7, $CA, $DF
.db $5A, $FA, $92, $CF, $F5, $FA, $91, $CF, $F5, $3E, $01, $EA, $7D, $D0, $3E, $FF
.db $EA, $CB, $CF, $FA, $52, $D1, $A7, $28, $28, $CD, $11, $14, $18, $26, $21, $E9
.db $5A, $AF, $EA, $6A, $CD, $C3, $49, $3C, $00, $98, $AE, $B4, $7F, $A3, $AE, $AD
.db $BE, $7F, $A7, $A0, $B5, $A4, $4F, $A0, $AD, $B8, $7F, $54, $8C, $8E, $8D, $E7
.db $58, $CD, $FC, $13, $DA, $E1, $5D, $21, $6B, $D1, $01, $2C, $00, $FA, $92, $CF
.db $CD, $87, $3A, $FA, $92, $CF, $EA, $06, $CF, $57, $FA, $91, $CF, $5F, $EA, $B5
.db $D0, $F1, $EA, $91, $CF, $F1, $EA, $92, $CF, $FA, $52, $D1, $A7, $28, $06, $FA
.db $92, $CF, $BA, $28, $85, $FA, $91, $CF, $FE, $35, $30, $6C, $FE, $34, $28, $09
.db $FE, $23, $D2, $FA, $5D, $FE, $10, $30, $5F, $01, $04, $00, $09, $FA, $91, $CF
.db $01, $08, $F0, $FE, $0B, $28, $1F, $01, $10, $F1, $FE, $0C, $28, $18, $01, $20
.db $F2, $FE, $0D, $28, $11, $01, $07, $F3, $FE, $0E, $28, $0A, $01, $40, $F4, $FE
.db $0F, $28, $03, $01, $FF, $F6, $7E, $A1, $CA, $73, $5D, $AF, $77, $78, $EA, $7D
.db $D0, $FA, $2F, $CC, $BA, $C2, $79, $5D, $AF, $EA, $18, $D0, $E5, $21, $64, $D0
.db $CB, $86, $E1, $01, $1E, $00, $09, $11, $23, $D0, $01, $0A, $00, $CD, $B5, $00
.db $3E, $28, $CD, $6D, $3E, $C3, $79, $5D, $23, $2A, $47, $EA, $EC, $CE, $7E, $4F
.db $EA, $EB, $CE, $B0, $20, $3C, $FA, $91, $CF, $FE, $35, $28, $07, $FE, $36, $28
.db $03, $C3, $73, $5D, $FA, $57, $D0, $A7, $28, $35, $E5, $D5, $C5, $FA, $06, $CF
.db $4F, $21, $F5, $CC, $06, $02, $3E, $10, $CD, $6D, $3E, $79, $A7, $28, $0E, $FA
.db $06, $CF, $4F, $21, $58, $D0, $06, $01, $3E, $10, $CD, $6D, $3E, $C1, $D1, $E1
.db $18, $0D, $FA, $91, $CF, $FE, $35, $CA, $73, $5D, $FE, $36, $CA, $73, $5D, $E5
.db $C5, $01, $20, $00, $09, $C1, $2A, $B8, $20, $02, $7E, $B9, $E1, $20, $1A, $FA
.db $91, $CF, $FE, $10, $C2, $73, $5D, $23, $23, $3A, $A7, $CA, $73, $5D, $3E, $34
.db $EA, $91, $CF, $2B, $2B, $2B, $C3, $4A, $5B, $AF, $EA, $83, $D0, $EA, $2A, $C0
.db $E5, $D5, $01, $20, $00, $09, $2A, $EA, $EA, $CE, $7E, $EA, $E9, $CE, $FA, $52
.db $D1, $A7, $CA, $C5, $5C, $21, $E9, $CE, $2A, $F5, $2A, $F5, $2A, $F5, $7E, $F5
.db $21, $8D, $D1, $FA, $92, $CF, $01, $2C, $00, $CD, $87, $3A, $2A, $EA, $EA, $CE
.db $E0, $95, $7E, $EA, $E9, $CE, $E0, $96, $3E, $05, $E0, $99, $06, $02, $CD, $B9
.db $38, $01, $DF, $FF, $09, $F0, $98, $F5, $47, $7E, $EA, $EB, $CE, $90, $32, $EA
.db $ED, $CE, $F0, $97, $47, $7E, $EA, $EC, $CE, $98, $77, $EA, $EE, $CE, $21, $B8
.db $C3, $FA, $92, $CF, $01, $28, $00, $CD, $87, $3A, $3E, $8D, $CD, $40, $37, $F0
.db $F6, $CB, $C7, $E0, $F6, $3E, $02, $EA, $94, $CF, $3E, $48, $CD, $6D, $3E, $F0
.db $F6, $CB, $87, $E0, $F6, $F1, $47, $21, $EC, $CE, $F1, $32, $F1, $32, $F1, $32
.db $F1, $77, $18, $1F, $FA, $91, $CF, $FE, $3D, $06, $3C, $28, $16, $06, $50, $30
.db $12, $FE, $3C, $06, $32, $28, $0C, $FE, $13, $06, $C8, $38, $06, $06, $32, $28
.db $02, $06, $14, $D1, $E1, $7E, $80, $32, $EA, $ED, $CE, $7E, $EA, $EE, $CE, $30
.db $05, $34, $7E, $EA, $EE, $CE, $D5, $23, $54, $5D, $21, $21, $00, $19, $FA, $91
.db $CF, $FE, $35, $28, $17, $3A, $47, $1A, $90, $1B, $46, $1A, $98, $30, $21, $FA
.db $91, $CF, $FE, $12, $38, $1A, $FE, $36, $28, $16, $18, $2D, $2B, $1B, $2A, $CB
.db $3F, $12, $EA, $EE, $CE, $7E, $CB, $1F, $13, $12, $EA, $ED, $CE, $1B, $18, $0C
.db $2A, $12, $EA, $EE, $CE, $13, $7E, $12, $EA, $ED, $CE, $1B, $FA, $91, $CF, $FE
.db $10, $20, $06, $01, $E1, $FF, $09, $AF, $77, $62, $6B, $D1, $FA, $2F, $CC, $BA
.db $20, $13, $2A, $EA, $15, $D0, $3A, $EA, $16, $D0, $FA, $91, $CF, $FE, $10, $20
.db $04, $AF, $EA, $18, $D0, $21, $90, $C3, $01, $28, $00, $14, $09, $15, $20, $FC
.db $18, $06, $CD, $7C, $65, $C3, $E7, $5D, $FA, $52, $D1, $A7, $20, $05, $E5, $CD
.db $71, $65, $E1, $FA, $91, $CF, $FE, $10, $38, $36, $FE, $34, $28, $32, $3E, $8D
.db $CD, $40, $37, $F0, $F6, $CB, $C7, $E0, $F6, $3E, $02, $EA, $94, $CF, $3E, $48
.db $CD, $6D, $3E, $F0, $F6, $CB, $87, $E0, $F6, $3E, $F7, $EA, $7D, $D0, $FA, $91
.db $CF, $FE, $35, $28, $10, $FE, $36, $28, $0C, $3E, $F5, $EA, $7D, $D0, $18, $05
.db $3E, $8E, $CD, $40, $37, $AF, $E0, $BA, $CD, $0F, $19, $3D, $EA, $CB, $CF, $CD
.db $D9, $14, $3E, $01, $E0, $BA, $0E, $32, $CD, $39, $37, $CD, $65, $38, $18, $06
.db $AF, $EA, $6A, $CD, $F1, $F1, $FA, $52, $D1, $A7, $C0, $CD, $E5, $3D, $CC, $ED
.db $3D, $FA, $57, $D0, $A7, $C0, $C3, $71, $30, $E5, $7E, $EA, $B5, $D0, $EA, $1E
.db $D1, $01, $21, $00, $09, $7E, $EA, $27, $D1, $CD, $37, $15, $D5, $7A, $21, $B5
.db $D2, $CD, $BA, $15, $D1, $E1, $FA, $91, $CF, $FE, $28, $CA, $83, $5E, $E5, $D6
.db $23, $87, $01, $11, $00, $09, $85, $6F, $30, $01, $24, $3E, $0A, $47, $7E, $FE
.db $64, $30, $36, $80, $30, $02, $3E, $FF, $77, $E1, $CD, $74, $5E, $21, $2E, $5F
.db $FA, $91, $CF, $D6, $22, $4F, $0D, $28, $09, $2A, $47, $3E, $50, $B8, $20, $F9
.db $18, $F4, $11, $4B, $CF, $01, $0A, $00, $CD, $B5, $00, $3E, $8E, $CD, $B1, $23
.db $21, $24, $5F, $CD, $49, $3C, $C3, $71, $65, $E1, $21, $29, $5F, $CD, $49, $3C
.db $C3, $E5, $3D, $01, $22, $00, $09, $54, $5D, $01, $EE, $FF, $09, $06, $01, $C3
.db $36, $39, $E5, $01, $21, $00, $09, $7E, $FE, $64, $28, $DD, $3C, $77, $EA, $27
.db $D1, $E5, $D5, $57, $21, $6A, $4F, $06, $16, $CD, $D6, $35, $D1, $E1, $01, $ED
.db $FF, $09, $F0, $96, $22, $F0, $97, $22, $F0, $98, $77, $E1, $FA, $92, $CF, $F5
.db $FA, $91, $CF, $F5, $D5, $E5, $01, $22, $00, $09, $2A, $47, $4E, $E1, $C5, $E5
.db $CD, $74, $5E, $E1, $01, $23, $00, $09, $C1, $3A, $91, $4F, $7E, $98, $47, $11
.db $E0, $FF, $19, $7E, $81, $32, $7E, $88, $77, $3E, $F8, $EA, $7D, $D0, $CD, $D9
.db $14, $D1, $7A, $EA, $92, $CF, $7B, $EA, $1E, $D1, $AF, $EA, $49, $CC, $CD, $72
.db $13, $16, $01, $21, $E4, $6A, $06, $04, $CD, $D6, $35, $CD, $65, $38, $AF, $EA
.db $49, $CC, $3E, $1A, $CD, $6D, $3E, $AF, $EA, $D4, $CC, $21, $0E, $6D, $06, $0E
.db $CD, $D6, $35, $3E, $01, $EA, $CB, $CF, $F1, $EA, $91, $CF, $F1, $EA, $92, $CF
.db $C3, $71, $65, $17, $8C, $68, $29, $50, $17, $9E, $68, $29, $50, $87, $84, $80
.db $8B, $93, $87, $50, $80, $93, $93, $80, $82, $8A, $50, $83, $84, $85, $84, $8D
.db $92, $84, $50, $92, $8F, $84, $84, $83, $50, $92, $8F, $84, $82, $88, $80, $8B
.db $50, $21, $A5, $5F, $CD, $49, $3C, $21, $07, $D0, $CB, $3E, $3E, $CA, $21, $E9
.db $CC, $11, $E8, $CC, $18, $18, $21, $AA, $5F, $CD, $49, $3C, $21, $07, $D0, $7E
.db $87, $30, $02, $3E, $FF, $77, $3E, $C9, $21, $E8, $CC, $11, $E9, $CC, $EA, $7C
.db $D0, $AF, $EA, $5B, $CC, $E0, $F3, $12, $CD, $5C, $3E, $E6, $07, $FE, $05, $30
.db $F7, $3C, $47, $7E, $80, $30, $02, $3E, $FF, $77, $3E, $08, $CD, $6D, $3E, $0E
.db $46, $C3, $39, $37, $17, $B8, $68, $29, $50, $17, $CC, $68, $29, $50, $FA, $57
.db $D0, $A7, $20, $45, $FA, $5E, $D3, $FE, $F7, $28, $3E, $FA, $67, $D3, $47, $21
.db $FD, $5F, $2A, $FE, $FF, $28, $32, $B8, $20, $F8, $21, $32, $D7, $CB, $DE, $CB
.db $F6, $21, $2E, $D7, $CB, $A6, $21, $90, $D7, $CB, $BE, $AF, $EA, $47, $DA, $EA
.db $1F, $D6, $3C, $EA, $78, $D0, $EA, $6A, $CD, $FA, $52, $D1, $A7, $C0, $CD, $C5
.db $69, $0E, $1E, $CD, $39, $37, $C3, $71, $65, $C3, $81, $65, $03, $0F, $11, $16
.db $10, $FF, $06, $64, $FA, $57, $D0, $A7, $C2, $81, $65, $78, $EA, $DB, $D0, $C3
.db $63, $65, $FA, $57, $D0, $A7, $CA, $81, $65, $21, $63, $D0, $CB, $C6, $C3, $63
.db $65, $AF, $EA, $1F, $D7, $CD, $86, $45, $FA, $86, $45, $FE, $18, $20, $05, $21
.db $72, $60, $18, $11, $FE, $24, $20, $05, $21, $9B, $60, $18, $08, $FE, $5E, $C2
.db $81, $65, $21, $C4, $60, $FA, $5E, $D3, $47, $2A, $FE, $FF, $CA, $81, $65, $B8
.db $20, $0E, $2A, $BA, $20, $0B, $2A, $BB, $20, $08, $7E, $EA, $1F, $D7, $18, $05
.db $23, $23, $23, $18, $E4, $21, $E8, $65, $CD, $49, $3C, $21, $28, $D7, $CB, $FE
.db $C9, $CF, $04, $04, $00, $CF, $04, $05, $01, $D1, $0C, $04, $02, $D1, $0C, $05
.db $03, $D4, $06, $0A, $04, $D4, $06, $0B, $05, $E9, $04, $12, $06, $E9, $04, $13
.db $07, $EA, $08, $0A, $08, $EA, $08, $0B, $09, $FF, $D0, $08, $09, $0A, $D0, $09
.db $09, $0B, $D2, $04, $07, $0C, $D2, $05, $07, $0D, $D3, $0C, $05, $0E, $D3, $0D
.db $05, $0F, $D5, $08, $07, $10, $D5, $09, $07, $11, $E9, $08, $03, $12, $E9, $09
.db $03, $13, $FF, $EB, $08, $09, $14, $EB, $09, $09, $15, $FF, $FA, $57, $D0, $3D
.db $C2, $81, $65, $3E, $01, $EA, $78, $D0, $C3, $63, $65, $FA, $57, $D0, $A7, $CA
.db $81, $65, $21, $63, $D0, $CB, $CE, $C3, $63, $65, $06, $C8, $C3, $05, $60, $06
.db $FA, $C3, $05, $60, $FA, $57, $D0, $A7, $CA, $81, $65, $21, $63, $D0, $CB, $D6
.db $C3, $63, $65, $FA, $57, $D0, $A7, $20, $09, $CD, $81, $65, $3E, $02, $EA, $6A
.db $CD, $C9, $21, $D2, $CF, $2A, $F5, $7E, $F5, $E5, $FA, $91, $CF, $D6, $37, $77
.db $CD, $63, $65, $3E, $AE, $EA, $D2, $CF, $CD, $25, $37, $CD, $D7, $3D, $AF, $E0
.db $F3, $06, $0F, $21, $28, $74, $CD, $D6, $35, $E1, $F1, $32, $F1, $77, $C9, $FA
.db $57, $D0, $A7, $20, $4A, $CD, $C5, $69, $FA, $5E, $D3, $FE, $17, $20, $1B, $FA
.db $D8, $D7, $CB, $7F, $20, $33, $21, $FD, $61, $CD, $BF, $34, $30, $2B, $21, $15
.db $62, $CD, $49, $3C, $21, $D8, $D7, $CB, $F6, $C9, $FE, $1B, $20, $1B, $FA, $E0
.db $D7, $CB, $4F, $20, $14, $21, $06, $62, $CD, $BF, $34, $30, $0C, $21, $15, $62
.db $CD, $49, $3C, $21, $E0, $D7, $CB, $C6, $C9, $21, $0B, $62, $C3, $49, $3C, $AF
.db $EA, $3D, $CD, $06, $F8, $21, $6F, $D1, $CD, $E5, $61, $FA, $57, $D0, $3D, $28
.db $06, $21, $A8, $D8, $CD, $E5, $61, $21, $18, $D0, $7E, $A0, $77, $21, $E9, $CF
.db $7E, $A0, $77, $CD, $01, $37, $FA, $3D, $CD, $A7, $21, $0B, $62, $CA, $49, $3C
.db $21, $15, $62, $CD, $49, $3C, $FA, $83, $D0, $E6, $80, $20, $11, $CD, $48, $37
.db $06, $08, $21, $06, $63, $CD, $D6, $35, $FA, $2C, $C0, $A7, $20, $FA, $21, $10
.db $62, $C3, $49, $3C, $11, $2C, $00, $0E, $06, $7E, $F5, $E6, $07, $28, $05, $3E
.db $01, $EA, $3D, $CD, $F1, $A0, $77, $19, $0D, $20, $EE, $C9, $3E, $09, $3D, $0A
.db $3F, $0A, $3E, $0B, $FF, $0A, $1B, $0A, $19, $FF, $17, $DD, $68, $29, $50, $17
.db $0C, $69, $29, $50, $17, $28, $69, $29, $06, $08, $FA, $57, $D0, $A7, $20, $16
.db $3E, $FF, $CD, $B1, $23, $3E, $B8, $0E, $02, $CD, $A1, $23, $FA, $28, $C0, $FE
.db $B8, $28, $F9, $CD, $07, $23, $C3, $D7, $24, $FA, $57, $D0, $A7, $C2, $81, $65
.db $21, $47, $62, $C3, $49, $3C, $17, $40, $69, $29, $50, $CD, $B4, $62, $DA, $81
.db $65, $01, $85, $05, $3E, $01, $18, $34, $CD, $B4, $62, $DA, $81, $65, $CD, $5C
.db $3E, $CB, $3F, $38, $12, $E6, $03, $FE, $02, $30, $F3, $21, $7F, $62, $87, $4F
.db $06, $00, $09, $46, $23, $4E, $A7, $3E, $00, $17, $EE, $01, $18, $0E, $0A, $9D
.db $0A, $47, $CD, $B4, $62, $DA, $81, $65, $CD, $EA, $68, $7B, $EA, $3D, $CD, $3D
.db $20, $0D, $3E, $01, $EA, $5F, $D0, $78, $EA, $27, $D1, $79, $EA, $59, $D0, $21
.db $00, $D7, $7E, $F5, $E5, $36, $00, $06, $1C, $21, $B6, $47, $CD, $D6, $35, $E1
.db $F1, $77, $C9, $FA, $57, $D0, $A7, $28, $02, $37, $C9, $CD, $B8, $68, $D8, $FA
.db $00, $D7, $FE, $02, $28, $15, $CD, $C5, $69, $21, $E8, $65, $CD, $49, $3C, $3E
.db $8E, $CD, $B1, $23, $0E, $50, $CD, $39, $37, $A7, $C9, $37, $C9, $C3, $86, $65
.db $FA, $57, $D0, $A7, $C2, $81, $65, $CD, $C5, $69, $06, $1D, $21, $1F, $48, $CD
.db $D6, $35, $21, $12, $63, $30, $12, $0E, $04, $3E, $9E, $CD, $40, $37, $3E, $B2
.db $CD, $40, $37, $0D, $20, $F3, $21, $0D, $63, $C3, $49, $3C, $17, $4F, $69, $29
.db $50, $17, $81, $69, $29, $50, $FA, $57, $D0, $A7, $C2, $81, $65, $FA, $92, $CF
.db $F5, $FA, $91, $CF, $EA, $3D, $CD, $AF, $EA, $CB, $CF, $3E, $01, $EA, $7D, $D0
.db $CD, $FC, $13, $30, $03, $C3, $51, $64, $FA, $3D, $CD, $FE, $52, $D2, $1B, $64
.db $3E, $02, $EA, $DB, $CC, $21, $5D, $64, $FA, $3D, $CD, $FE, $50, $38, $03, $21
.db $62, $64, $CD, $49, $3C, $AF, $EA, $2E, $CC, $21, $19, $52, $06, $0F, $CD, $D6
.db $35, $3E, $00, $EA, $2E, $CC, $20, $BF, $21, $73, $D1, $01, $2C, $00, $CD, $E3
.db $66, $E5, $7E, $EA, $1E, $D1, $CD, $58, $30, $CD, $26, $38, $E1, $FA, $3D, $CD
.db $FE, $50, $30, $59, $01, $15, $00, $09, $7E, $FE, $C0, $38, $08, $21, $67, $64
.db $CD, $49, $3C, $18, $A3, $7E, $C6, $40, $77, $3E, $01, $EA, $1E, $D1, $CD, $06
.db $66, $21, $6C, $64, $CD, $49, $3C, $F1, $EA, $92, $CF, $CD, $E5, $3D, $CD, $ED
.db $3D, $C3, $71, $65, $FA, $92, $CF, $47, $FA, $2F, $CC, $B8, $20, $12, $21, $88
.db $D1, $01, $2C, $00, $CD, $87, $3A, $11, $2D, $D0, $01, $04, $00, $CD, $B5, $00
.db $3E, $8E, $CD, $B1, $23, $21, $71, $64, $CD, $49, $3C, $18, $CA, $CD, $E6, $63
.db $20, $D2, $C3, $4E, $64, $AF, $EA, $49, $CC, $CD, $77, $66, $21, $73, $D1, $01
.db $2C, $00, $CD, $E3, $66, $01, $15, $00, $09, $FA, $1E, $D1, $47, $FA, $3D, $CD
.db $FE, $51, $28, $11, $7E, $E6, $3F, $B8, $C8, $C6, $0A, $B8, $30, $01, $47, $7E
.db $E6, $C0, $80, $77, $C9, $7E, $B8, $C8, $18, $F5, $21, $3D, $CD, $35, $35, $AF
.db $21, $26, $CC, $22, $77, $06, $04, $C5, $21, $73, $D1, $01, $2C, $00, $CD, $E3
.db $66, $7E, $A7, $28, $09, $CD, $E6, $63, $28, $04, $21, $27, $CC, $34, $21, $26
.db $CC, $34, $C1, $05, $20, $E1, $FA, $27, $CC, $A7, $C2, $B5, $63, $CD, $7C, $65
.db $CD, $E5, $3D, $CD, $ED, $3D, $F1, $AF, $EA, $6A, $CD, $C9, $17, $A4, $69, $29
.db $50, $17, $C2, $69, $29, $50, $17, $E2, $69, $29, $50, $17, $F9, $69, $29, $50
.db $17, $0D, $6A, $29, $50, $C3, $81, $65, $FA, $57, $D0, $A7, $C2, $81, $65, $FA
.db $91, $CF, $D6, $C9, $F5, $30, $02, $C6, $37, $3C, $EA, $1E, $D1, $3E, $44, $CD
.db $6D, $3E, $FA, $1E, $D1, $EA, $E0, $D0, $CD, $58, $30, $CD, $26, $38, $F1, $21
.db $4F, $65, $30, $03, $21, $54, $65, $CD, $49, $3C, $21, $59, $65, $CD, $49, $3C
.db $21, $3A, $C4, $01, $0F, $08, $3E, $14, $EA, $25, $D1, $CD, $E8, $30, $FA, $26
.db $CC, $A7, $28, $06, $3E, $02, $EA, $6A, $CD, $C9, $FA, $92, $CF, $F5, $FA, $91
.db $CF, $F5, $21, $4B, $CF, $11, $36, $D0, $01, $0E, $00, $CD, $B5, $00, $3E, $FF
.db $EA, $CB, $CF, $3E, $03, $EA, $7D, $D0, $CD, $FC, $13, $F5, $21, $36, $D0, $11
.db $4B, $CF, $01, $0E, $00, $CD, $B5, $00, $F1, $30, $0E, $F1, $F1, $CD, $D4, $3D
.db $CD, $82, $00, $CD, $ED, $3D, $C3, $25, $37, $3E, $43, $CD, $6D, $3E, $C5, $FA
.db $92, $CF, $21, $B5, $D2, $CD, $BA, $15, $C1, $79, $A7, $20, $0D, $3E, $A5, $CD
.db $40, $37, $21, $5E, $65, $CD, $49, $3C, $18, $A8, $21, $18, $7E, $06, $0B, $CD
.db $D6, $35, $38, $9E, $3E, $1B, $CD, $6D, $3E, $F1, $EA, $91, $CF, $F1, $EA, $92
.db $CF, $78, $A7, $C8, $FA, $91, $CF, $CD, $40, $30, $D8, $C3, $71, $65, $17, $1F
.db $6A, $29, $50, $17, $30, $6A, $29, $50, $17, $42, $6A, $29, $50, $17, $6E, $6A
.db $29, $50, $21, $E8, $65, $CD, $49, $3C, $3E, $8E, $CD, $B1, $23, $CD, $65, $38
.db $21, $1D, $D3, $3E, $01, $EA, $96, $CF, $C3, $BB, $2B, $21, $CA, $65, $18, $38
.db $21, $C0, $65, $18, $33, $21, $C5, $65, $18, $2E, $CD, $ED, $3D, $CD, $25, $37
.db $CD, $D7, $3D, $3E, $C1, $EA, $7C, $D0, $3E, $08, $CD, $6D, $3E, $21, $CF, $65
.db $CD, $49, $3C, $21, $D4, $65, $CD, $49, $3C, $18, $C5, $21, $D9, $65, $18, $08
.db $21, $E3, $65, $18, $03, $21, $DE, $65, $AF, $EA, $6A, $CD, $C3, $49, $3C, $17
.db $A6, $6A, $29, $50, $17, $D0, $6A, $29, $50, $17, $E9, $6A, $29, $50, $17, $03
.db $6B, $29, $50, $17, $22, $6B, $29, $50, $17, $34, $6B, $29, $50, $17, $4E, $6B
.db $29, $50, $17, $69, $6B, $29, $50, $17, $00, $40, $2A, $05, $17, $09, $40, $2A
.db $50, $17, $0F, $40, $2A, $05, $17, $1E, $40, $2A, $50, $17, $24, $40, $2A, $05
.db $17, $30, $40, $2A, $50, $21, $73, $D1, $01, $2C, $00, $FA, $92, $CF, $CD, $87
.db $3A, $E5, $11, $77, $CD, $3E, $5E, $CD, $6D, $3E, $E1, $0E, $15, $06, $00, $09
.db $11, $78, $CD, $06, $00, $04, $78, $FE, $05, $C8, $FA, $1E, $D1, $3D, $20, $07
.db $FA, $26, $CC, $3C, $B8, $20, $06, $7E, $E6, $C0, $C4, $42, $66, $23, $13, $18
.db $E4, $C5, $1A, $E0, $98, $AF, $E0, $95, $E0, $96, $E0, $97, $3E, $05, $E0, $99
.db $06, $04, $CD, $B9, $38, $7E, $47, $CB, $37, $E6, $0F, $CB, $3F, $CB, $3F, $4F
.db $F0, $98, $FE, $08, $38, $02, $3E, $07, $80, $47, $FA, $1E, $D1, $3D, $28, $03
.db $0D, $20, $ED, $70, $C1, $C9, $FA, $49, $CC, $A7, $21, $73, $D1, $01, $2C, $00
.db $28, $1D, $21, $AC, $D8, $3D, $28, $17, $21, $9E, $DA, $01, $21, $00, $3D, $28
.db $0E, $21, $67, $DA, $3D, $28, $03, $21, $1C, $D0, $CD, $E9, $66, $18, $03, $CD
.db $E3, $66, $7E, $3D, $E5, $21, $00, $40, $01, $06, $00, $CD, $87, $3A, $11, $6D
.db $CD, $3E, $0E, $CD, $9D, $00, $11, $72, $CD, $1A, $47, $E1, $C5, $01, $15, $00
.db $FA, $49, $CC, $FE, $04, $20, $03, $01, $11, $00, $09, $7E, $E6, $C0, $C1, $B0
.db $62, $6B, $23, $77, $AF, $EA, $1E, $D1, $CD, $42, $66, $7E, $E6, $3F, $EA, $1E
.db $D1, $C9, $FA, $92, $CF, $CD, $87, $3A, $FA, $26, $CC, $4F, $06, $00, $09, $C9
.db $E5, $FA, $91, $CF, $CD, $40, $30, $E1, $38, $50, $E5, $CD, $64, $67, $FA, $24
.db $D1, $E1, $A7, $20, $45, $E5, $FA, $91, $CF, $EA, $1E, $D1, $CD, $CF, $2F, $CD
.db $26, $38, $21, $5A, $67, $CD, $49, $3C, $21, $3A, $C4, $01, $0F, $08, $3E, $14
.db $EA, $25, $D1, $CD, $E8, $30, $FA, $2E, $D1, $FE, $02, $E1, $37, $C8, $E5, $FA
.db $92, $CF, $CD, $BB, $2B, $FA, $91, $CF, $EA, $1E, $D1, $CD, $CF, $2F, $CD, $26
.db $38, $21, $55, $67, $CD, $49, $3C, $E1, $A7, $C9, $E5, $21, $5F, $67, $CD, $49
.db $3C, $E1, $37, $C9, $17, $3C, $40, $2A, $50, $17, $4F, $40, $2A, $50, $17, $68
.db $40, $2A, $50, $3E, $01, $EA, $24, $D1, $FA, $91, $CF, $FE, $C4, $30, $1D, $F5
.db $21, $99, $67, $11, $E9, $CE, $01, $0F, $00, $CD, $B5, $00, $F1, $3D, $4F, $21
.db $E9, $CE, $06, $02, $3E, $10, $CD, $6D, $3E, $79, $A7, $C0, $FA, $91, $CF, $CD
.db $40, $30, $D8, $AF, $EA, $24, $D1, $C9, $F0, $01, $F0, $4F, $00, $9F, $00, $C0
.db $F0, $3B, $00, $11, $80, $DA, $1A, $3C, $12, $FA, $91, $CF, $EA, $B5, $D0, $4F
.db $13, $1A, $47, $79, $48, $12, $FE, $FF, $20, $F6, $CD, $37, $15, $21, $2A, $DD
.db $01, $0B, $00, $FA, $80, $DA, $3D, $28, $24, $3D, $CD, $87, $3A, $E5, $01, $0B
.db $00, $09, $54, $5D, $E1, $FA, $80, $DA, $3D, $47, $C5, $E5, $01, $0B, $00, $CD
.db $B5, $00, $E1, $54, $5D, $01, $F5, $FF, $09, $C1, $05, $20, $ED, $21, $58, $D1
.db $11, $2A, $DD, $01, $0B, $00, $CD, $B5, $00, $FA, $80, $DA, $3D, $28, $2A, $21
.db $06, $DE, $01, $0B, $00, $3D, $CD, $87, $3A, $E5, $01, $0B, $00, $09, $54, $5D
.db $E1, $FA, $80, $DA, $3D, $47, $C5, $E5, $01, $0B, $00, $CD, $B5, $00, $E1, $54
.db $5D, $01, $F5, $FF, $09, $C1, $05, $20, $ED, $21, $06, $DE, $3E, $02, $EA, $7D
.db $D0, $3E, $4E, $CD, $6D, $3E, $FA, $80, $DA, $3D, $28, $2A, $21, $96, $DA, $01
.db $21, $00, $3D, $CD, $87, $3A, $E5, $01, $21, $00, $09, $54, $5D, $E1, $FA, $80
.db $DA, $3D, $47, $C5, $E5, $01, $21, $00, $CD, $B5, $00, $E1, $54, $5D, $01, $DF
.db $FF, $09, $C1, $05, $20, $ED, $FA, $F3, $CF, $EA, $E8, $CF, $21, $E5, $CF, $11
.db $96, $DA, $01, $0C, $00, $CD, $B5, $00, $21, $59, $D3, $2A, $12, $13, $7E, $12
.db $13, $D5, $FA, $27, $D1, $57, $21, $6A, $4F, $06, $16, $CD, $D6, $35, $D1, $F0
.db $96, $12, $13, $F0, $97, $12, $13, $F0, $98, $12, $13, $AF, $06, $0A, $12, $13
.db $05, $20, $FB, $21, $F1, $CF, $2A, $12, $13, $2A, $12, $21, $FE, $CF, $06, $04
.db $2A, $13, $12, $05, $20, $FA, $C9, $FA, $67, $D3, $21, $E0, $68, $11, $01, $00
.db $CD, $AB, $3D, $30, $16, $FA, $67, $D3, $FE, $0E, $FA, $C6, $CF, $28, $08, $FE
.db $48, $28, $0A, $FE, $32, $28, $06, $FE, $14, $28, $02, $37, $C9, $A7, $C9, $00
.db $03, $05, $07, $0D, $0E, $11, $16, $17, $FF, $FA, $5E, $D3, $11, $03, $00, $21
.db $19, $69, $CD, $AB, $3D, $38, $03, $1E, $02, $C9, $23, $2A, $66, $6F, $46, $23
.db $1E, $00, $CD, $5C, $3E, $CB, $3F, $D8, $E6, $03, $B8, $30, $F5, $87, $4F, $06
.db $00, $09, $46, $23, $4E, $1E, $01, $C9, $00, $7D, $69, $01, $7D, $69, $03, $87
.db $69, $05, $8E, $69, $06, $93, $69, $07, $BC, $69, $08, $AA, $69, $0F, $87, $69
.db $11, $8E, $69, $15, $93, $69, $16, $8E, $69, $17, $A1, $69, $18, $A1, $69, $1C
.db $A1, $69, $1D, $A1, $69, $1E, $AA, $69, $1F, $AA, $69, $20, $AA, $69, $21, $82
.db $69, $22, $B3, $69, $23, $87, $69, $24, $87, $69, $41, $87, $69, $5E, $8E, $69
.db $A1, $AA, $69, $A2, $AA, $69, $D9, $98, $69, $DA, $98, $69, $DB, $98, $69, $DC
.db $98, $69, $E2, $B3, $69, $E3, $B3, $69, $E4, $B3, $69, $FF, $02, $0F, $18, $0F
.db $47, $02, $0F, $9D, $0F, $47, $03, $0F, $2F, $0F, $9D, $0F, $4E, $02, $0F, $4E
.db $0F, $17, $02, $17, $6E, $0F, $25, $04, $0F, $58, $0F, $4E, $0F, $2F, $0F, $25
.db $04, $05, $18, $0F, $4E, $0F, $9D, $0F, $85, $04, $0F, $1B, $0F, $5C, $0F, $17
.db $0F, $9D, $04, $17, $08, $17, $9E, $17, $8A, $17, $5D, $04, $17, $9E, $0F, $4E
.db $0F, $9D, $0F, $85, $CD, $AA, $0C, $C3, $29, $24, $21, $EB, $4E, $11, $E9, $CE
.db $0E, $00, $23, $3A, $3C, $28, $14, $E5, $2A, $66, $6F, $2A, $A7, $C4, $F0, $69
.db $2A, $A7, $C4, $F0, $69, $E1, $23, $23, $0C, $18, $E7, $3E, $FF, $12, $C9, $23
.db $06, $0A, $FA, $1E, $D1, $BE, $20, $03, $79, $12, $13, $23, $23, $05, $20, $F2
.db $2B, $C9, $11, $3F, $CD, $21, $96, $6A, $01, $08, $00, $CD, $B5, $00, $21, $49
.db $CD, $01, $08, $00, $AF, $CD, $E0, $36, $11, $49, $CD, $21, $3F, $CD, $FA, $56
.db $D3, $47, $0E, $08, $CB, $38, $30, $07, $7E, $C6, $04, $77, $3E, $01, $12, $23
.db $13, $0D, $20, $F0, $21, $3D, $CD, $3E, $D8, $22, $36, $60, $21, $7E, $C4, $11
.db $49, $CD, $CD, $4C, $6A, $21, $BA, $C4, $11, $4D, $CD, $0E, $04, $D5, $E5, $FA
.db $3D, $CD, $22, $3C, $EA, $3D, $CD, $1A, $A7, $FA, $3E, $CD, $20, $05, $CD, $91
.db $6A, $18, $03, $3C, $3C, $23, $EA, $3E, $CD, $11, $13, $00, $19, $FA, $3F, $CD
.db $CD, $91, $6A, $19, $CD, $91, $6A, $C5, $21, $40, $CD, $11, $3F, $CD, $01, $08
.db $00, $CD, $B5, $00, $C1, $E1, $11, $04, $00, $19, $D1, $13, $0D, $20, $BE, $C9
.db $22, $3C, $77, $3C, $C9, $20, $28, $30, $38, $40, $48, $50, $58, $1F, $3F, $3F
.db $7F, $FB, $FF, $F7, $FA, $EF, $F0, $7F, $E0, $54, $78, $FC, $C6, $FC, $FE, $FE
.db $FE, $7F, $FF, $EF, $3F, $F7, $0F, $FE, $07, $6A, $1E, $3F, $63, $3F, $4E, $2E
.db $40, $E1, $21, $E0, $A0, $61, $73, $00, $10, $18, $08, $06, $06, $FC, $72, $74
.db $02, $07, $04, $07, $05, $86, $CE, $00, $08, $18, $10, $60, $60, $00, $00, $03
.db $03, $04, $04, $08, $08, $10, $10, $23, $20, $47, $40, $47, $40, $00, $00, $C0
.db $C0, $20, $20, $10, $30, $08, $38, $C4, $3C, $E2, $1E, $E2, $1E, $47, $40, $47
.db $40, $3F, $20, $1C, $13, $0C, $0B, $04, $07, $03, $03, $00, $00, $E2, $1E, $E2
.db $1E, $C4, $3C, $08, $F8, $10, $F0, $20, $E0, $C0, $C0, $00, $00, $1E, $1D, $3C
.db $3F, $78, $7F, $F8, $FF, $FC, $FF, $EF, $FF, $EF, $FF, $C6, $FF, $75, $B6, $1C
.db $EF, $1C, $E7, $03, $FF, $82, $FE, $41, $FF, $E1, $7F, $F9, $7F, $B3, $DC, $6F
.db $49, $4F, $68, $4F, $68, $5F, $20, $3D, $23, $0F, $18, $07, $06, $DE, $DE, $A9
.db $89, $A1, $85, $C1, $85, $8A, $0A, $9C, $1C, $E0, $60, $F8, $D8, $00, $00, $01
.db $01, $03, $02, $03, $02, $06, $05, $06, $05, $0C, $0B, $18, $17, $00, $00, $00
.db $00, $80, $80, $80, $80, $40, $C0, $40, $C0, $20, $E0, $10, $F0, $18, $17, $30
.db $2F, $30, $2C, $30, $2C, $18, $17, $0C, $0F, $03, $03, $00, $00, $10, $F0, $08
.db $F8, $08, $F8, $08, $F8, $10, $F0, $60, $E0, $80, $80, $00, $00, $00, $00, $00
.db $C0, $86, $7E, $48, $B9, $B1, $50, $E3, $A4, $63, $62, $21, $A5, $00, $00, $00
.db $00, $1C, $00, $FF, $C1, $DE, $3D, $FE, $02, $BC, $42, $BA, $46, $01, $85, $44
.db $43, $C7, $C0, $26, $E1, $F4, $F2, $8C, $7C, $13, $7F, $21, $F9, $FC, $8C, $D4
.db $34, $48, $38, $F8, $E8, $38, $48, $30, $50, $60, $A0, $C0, $C0, $00, $00, $01
.db $01, $1E, $1E, $13, $13, $14, $14, $3B, $38, $57, $50, $97, $90, $80, $80, $40
.db $40, $20, $20, $FC, $FC, $24, $24, $D4, $34, $EC, $1C, $EA, $1A, $57, $50, $37
.db $30, $2B, $28, $24, $27, $3F, $3F, $04, $04, $02, $02, $01, $01, $E9, $19, $EA
.db $1A, $DC, $3C, $28, $E8, $C8, $C8, $78, $78, $80, $80, $00, $00, $1F, $10, $3F
.db $20, $3E, $7F, $7D, $FF, $FB, $FF, $FB, $FF, $FF, $FA, $F5, $FA, $7F, $FF, $EF
.db $1F, $7B, $87, $DD, $E3, $F7, $FB, $FF, $FF, $FD, $FF, $B6, $CF, $EF, $F0, $7F
.db $70, $7F, $7C, $7F, $70, $74, $7A, $7B, $7D, $7F, $7E, $7F, $7F, $F5, $07, $87
.db $47, $67, $77, $07, $07, $07, $07, $1F, $0F, $17, $17, $D7, $97, $01, $01, $02
.db $03, $18, $1F, $26, $3A, $25, $37, $18, $2D, $52, $7A, $89, $ED, $80, $80, $40
.db $C0, $18, $F8, $64, $5C, $A4, $EC, $1C, $B4, $4A, $5E, $91, $B7, $89, $ED, $52
.db $7A, $18, $2D, $25, $37, $26, $3A, $18, $1F, $02, $03, $01, $01, $91, $B7, $4A
.db $5E, $18, $B4, $A4, $EC, $64, $5C, $18, $F8, $40, $C0, $80, $80, $7F, $7F, $FF
.db $FF, $FF, $EE, $F7, $CC, $7B, $C4, $7F, $40, $3D, $62, $7D, $72, $FF, $FF, $7F
.db $9F, $FF, $0F, $87, $0F, $87, $27, $B7, $77, $F4, $76, $C2, $E5, $3F, $31, $2B
.db $2C, $12, $1C, $0F, $10, $0F, $0B, $07, $04, $03, $04, $01, $03, $82, $A1, $A2
.db $C0, $E3, $03, $C4, $17, $8C, $CF, $B8, $3F, $E8, $7F, $93, $9F, $00, $00, $0C
.db $0C, $12, $12, $2D, $21, $2E, $20, $5F, $40, $5F, $40, $5F, $40, $00, $00, $30
.db $30, $78, $48, $C4, $BC, $84, $7C, $02, $FE, $02, $FE, $02, $FE, $2F, $20, $2F
.db $20, $17, $18, $0B, $0C, $05, $06, $02, $03, $01, $01, $00, $00, $04, $FC, $04
.db $FC, $08, $F8, $10, $F0, $20, $E0, $40, $C0, $80, $80, $00, $00, $FF, $FF, $FF
.db $FF, $FF, $FF, $66, $9F, $9E, $E7, $E7, $FF, $FF, $FF, $EF, $FF, $F0, $F8, $F8
.db $FC, $FC, $FE, $F6, $FB, $7B, $E7, $EF, $7F, $BF, $7F, $BF, $7F, $33, $6B, $23
.db $AA, $43, $A6, $E7, $00, $E3, $C0, $E3, $F1, $F7, $F8, $38, $B7, $FC, $3C, $E8
.db $28, $E0, $28, $60, $10, $20, $50, $40, $A0, $A0, $70, $78, $88, $00, $00, $03
.db $03, $0C, $0C, $13, $10, $2C, $23, $2B, $24, $57, $48, $57, $48, $00, $00, $C0
.db $C0, $30, $30, $C8, $08, $34, $CC, $D4, $2C, $EA, $16, $EA, $16, $57, $48, $57
.db $48, $2B, $24, $2C, $23, $13, $1C, $0C, $0F, $03, $03, $00, $00, $EA, $16, $EA
.db $16, $D4, $2C, $34, $CC, $C8, $38, $30, $F0, $C0, $C0, $00, $00, $1C, $10, $1C
.db $00, $3F, $20, $3F, $20, $2F, $30, $1F, $48, $7E, $4D, $73, $5F, $08, $08, $00
.db $08, $00, $04, $84, $04, $FC, $1C, $EA, $32, $FE, $6A, $9E, $FA, $33, $3E, $1D
.db $0E, $1D, $12, $14, $1C, $06, $09, $0F, $08, $07, $04, $02, $07, $94, $FC, $E8
.db $68, $C8, $08, $10, $30, $10, $D0, $C0, $20, $A0, $30, $70, $F0, $00, $00, $01
.db $01, $02, $02, $22, $22, $55, $54, $5D, $4C, $5E, $41, $2E, $21, $00, $00, $00
.db $00, $80, $80, $88, $88, $54, $DC, $74, $EC, $F4, $0C, $F8, $08, $2C, $23, $58
.db $47, $58, $47, $28, $27, $14, $13, $0F, $0C, $03, $03, $00, $00, $78, $88, $34
.db $CC, $34, $CC, $28, $D8, $50, $B0, $E0, $60, $80, $80, $00, $00, $0F, $0F, $1F
.db $1F, $3F, $3F, $38, $38, $30, $30, $73, $73, $FF, $FF, $FF, $FF, $F0, $F0, $F8
.db $F8, $FC, $FC, $1C, $1C, $0C, $0C, $CE, $CE, $CF, $CF, $1F, $1F, $FE, $FE, $FE
.db $FE, $FF, $FF, $FE, $FE, $FE, $FE, $FF, $FF, $FF, $FF, $FF, $FF, $3F, $3F, $7F
.db $7F, $FF, $FF, $7F, $7F, $7F, $7F, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $1F
.db $1F, $3F, $24, $60, $5F, $60, $5F, $60, $7F, $60, $5F, $60, $5F, $00, $00, $00
.db $00, $80, $80, $80, $80, $C0, $C0, $E0, $A0, $20, $E0, $30, $30, $3C, $3E, $0C
.db $0A, $07, $07, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $A8, $28, $48
.db $08, $A8, $88, $18, $18, $F4, $F4, $0A, $0A, $06, $06, $00, $00, $CD, $94, $3E
.db $21, $E8, $C6, $FA, $69, $D3, $C6, $06, $5F, $16, $00, $19, $19, $19, $1E, $03
.db $19, $5F, $78, $A7, $28, $04, $19, $05, $20, $FC, $09, $FA, $9F, $D0, $77, $FA
.db $5F, $D3, $4F, $FA, $60, $D3, $47, $CD, $4E, $6F, $D8, $E5, $6B, $26, $00, $1E
.db $06, $54, $29, $29, $19, $09, $C1, $CD, $4E, $6F, $D8, $FA, $57, $D0, $3C, $C8
.db $F0, $BA, $F5, $F0, $D7, $F5, $AF, $E0, $BA, $E0, $D7, $CD, $AA, $0C, $CD, $ED
.db $3D, $21, $26, $D5, $2A, $66, $6F, $11, $C0, $FF, $19, $7C, $E6, $03, $F6, $98
.db $7D, $EA, $E9, $CE, $7C, $EA, $EA, $CE, $3E, $02, $E0, $BE, $0E, $09, $C5, $E5
.db $E5, $21, $78, $C3, $11, $14, $00, $F0, $BE, $19, $3D, $20, $FC, $CD, $A6, $0E
.db $E1, $11, $20, $00, $F0, $BE, $4F, $19, $7C, $E6, $03, $F6, $98, $0D, $20, $F7
.db $E0, $D2, $7D, $E0, $D1, $3E, $02, $E0, $D0, $CD, $AF, $20, $21, $BE, $FF, $34
.db $34, $E1, $C1, $0D, $20, $C8, $F1, $E0, $D7, $F1, $E0, $BA, $C9, $7C, $90, $C0
.db $7D, $91, $C9, $AF, $EA, $6A, $CD, $FA, $67, $D3, $A7, $28, $0D, $FE, $07, $20
.db $15, $FA, $C6, $CF, $FE, $50, $20, $0E, $18, $17, $3D, $FA, $C6, $CF, $FE, $3D
.db $28, $0F, $FE, $52, $28, $0B, $21, $7D, $6F, $C3, $49, $3C, $17, $F8, $42, $2A
.db $50, $EA, $4D, $CD, $3E, $01, $EA, $6A, $CD, $FA, $92, $CF, $21, $B5, $D2, $CD
.db $BA, $15, $21, $30, $D7, $CB, $F6, $CD, $D4, $3D, $CD, $82, $00, $CD, $BE, $3D
.db $3E, $90, $E0, $B0, $CD, $D7, $3D, $CD, $BA, $20, $CD, $AA, $0C, $CD, $F4, $36
.db $CD, $D7, $3D, $AF, $E0, $B0, $21, $F2, $6F, $CD, $49, $3C, $CD, $01, $37, $21
.db $30, $D7, $CB, $B6, $3E, $FF, $EA, $CB, $CF, $CD, $F7, $6F, $11, $00, $71, $CD
.db $9F, $70, $CD, $DC, $6E, $06, $1E, $21, $96, $5E, $CD, $D6, $35, $3E, $01, $EA
.db $CB, $CF, $3E, $AC, $CD, $B1, $23, $3E, $90, $E0, $B0, $CD, $29, $24, $C3, $DC
.db $6E, $17, $15, $43, $2A, $50, $AF, $EA, $50, $CD, $3E, $E4, $E0, $49, $FA, $4D
.db $CD, $FE, $52, $28, $1A, $11, $D0, $42, $21, $C0, $8F, $01, $02, $19, $CD, $48
.db $18, $11, $D0, $43, $21, $E0, $8F, $01, $02, $19, $CD, $48, $18, $18, $35, $21
.db $C0, $8F, $CD, $4C, $70, $21, $D0, $8F, $CD, $4C, $70, $21, $E0, $8F, $CD, $4C
.db $70, $21, $F0, $8F, $CD, $4C, $70, $CD, $55, $70, $21, $93, $C3, $11, $04, $00
.db $3E, $30, $4B, $77, $19, $EE, $60, $0D, $20, $F9, $C9, $11, $4E, $47, $01, $01
.db $1E, $C3, $48, $18

WriteCutOrBoulderDustAnimationOAMBlock:
	CALL GetCutOrBoulderDustAnimationOffsets
	LD A, $09
	LD DE, WriteCutOrBoulderDustAnimationOAMBlock.OAMBlock
	JP WriteOAMBlock

; Data from F060 to F067 (8 bytes)
WriteCutOrBoulderDustAnimationOAMBlock.OAMBlock:
.db $FC, $10, $FD, $10, $FE, $10, $FF, $10

GetCutOrBoulderDustAnimationOffsets:
	LD HL, wSpritePlayerStateData1YPixels
	LDI A, (HL)
	LD B, A
	INC HL
	LDI A, (HL)
	LD C, A
	INC HL
	INC HL
	LD A, (HL)
	SRL A
	LD E, A
	LD D, $00
	LD A, (wSavedPlayerFacingDirection)
	AND A
	LD HL, CutAnimationOffsets
	JR Z, GetCutOrBoulderDustAnimationOffsets.next
	LD HL, BoulderDustAnimationOffsets
GetCutOrBoulderDustAnimationOffsets.next:
	ADD HL, DE
	LD E, (HL)
	INC HL
	LD D, (HL)
	LD A, B
	ADD D
	LD B, A
	LD A, C
	ADD E
	LD C, A
	RET

; Data from F08F to F096 (8 bytes)
CutAnimationOffsets:
.db $08, $24, $08, $04, $F8, $14, $18, $14

; Data from F097 to F112 (124 bytes)
BoulderDustAnimationOffsets:
.db $08, $34, $08, $F4, $E8, $14, $28, $14, $D5, $FA, $69, $D3, $C6, $06, $4F, $06
.db $00, $16, $00, $21, $5F, $D3, $2A, $66, $6F, $09, $FA, $09, $C1, $A7, $28, $10
.db $FE, $04, $28, $14, $FE, $08, $28, $18, $FA, $64, $D3, $A7, $28, $1B, $18, $25
.db $FA, $63, $D3, $A7, $28, $13, $18, $10, $FA, $63, $D3, $A7, $28, $0C, $18, $09
.db $FA, $64, $D3, $A7, $28, $09, $18, $01, $09, $09, $1E, $02, $19, $18, $0A, $1E
.db $01, $09, $19, $18, $04, $1E, $03, $09, $19, $D1, $7E, $4F, $1A, $13, $13, $FE
.db $FF, $C8, $B9, $20, $F7, $1B, $1A, $77, $C9, $32, $6D, $33, $6C, $34, $6F, $35
.db $4C, $60, $6E, $0B, $0A, $3C, $35, $3F, $35, $3D, $36, $FF

MarkTownVisitedAndLoadToggleableObjects:
	LD A, (wCurMap)
	CP $0C
	JR NC, MarkTownVisitedAndLoadToggleableObjects.notInTown
	LD C, A
	LD B, $01
	LD HL, $D70B
	LD A, $10
	CALL Predef
MarkTownVisitedAndLoadToggleableObjects.notInTown:
	LD HL, ToggleableObjectMapPointers
	LD A, (wCurMap)
	LD B, $00
	LD C, A
	ADD HL, BC
	ADD HL, BC
	LDI A, (HL)
	LD H, (HL)
	LD L, A
	PUSH HL
	LD DE, $4AEA
	LD A, L
	SUB E
	JR NC, MarkTownVisitedAndLoadToggleableObjects.noCarry
	DEC H
MarkTownVisitedAndLoadToggleableObjects.noCarry:
	LD L, A
	LD A, H
	SUB D
	LD H, A
	LD A, H
	LDH (hDividend - $FF00), A
	LD A, L
	LDH (hExperience - $FF00), A
	XOR A
	LDH (hFindPathNumSteps - $FF00), A
	LDH (hFindPathFlags - $FF00), A
	LD A, $03
	LDH (hDivisor - $FF00), A
	LD B, $02
	CALL Divide
	LD A, (wCurMap)
	LD B, A
	LDH A, (hFindPathFlags - $FF00)
	LD C, A
	LD DE, wToggleableObjectList
	POP HL
MarkTownVisitedAndLoadToggleableObjects.writeToggleableObjectsListLoop:
	LDI A, (HL)
	CP $FF
	JR Z, MarkTownVisitedAndLoadToggleableObjects.done
	CP B
	JR NZ, MarkTownVisitedAndLoadToggleableObjects.done
	LDI A, (HL)
	INC HL
	LD (DE), A
	INC DE
	LD A, C
	INC C
	LD (DE), A
	INC DE
	JR MarkTownVisitedAndLoadToggleableObjects.writeToggleableObjectsListLoop

MarkTownVisitedAndLoadToggleableObjects.done:
	LD A, $FF
	LD (DE), A
	RET

; Data from F175 to F224 (176 bytes)
.db $21, $A6, $D5, $01, $20, $00, $AF, $CD, $E0, $36, $21, $EA, $4A, $AF, $EA, $48
.db $D0, $2A, $FE, $FF, $C8, $E5, $23, $7E, $FE, $11, $20, $0C, $21, $A6, $D5, $FA
.db $48, $D0, $4F, $06, $01, $CD, $E6, $71, $21, $48, $D0, $34, $E1, $23, $23, $18
.db $E0, $F0, $DA, $CB, $37, $47, $21, $CE, $D5, $2A, $FE, $FF, $28, $11, $B8, $2A
.db $20, $F7, $4F, $06, $02, $21, $A6, $D5, $CD, $E6, $71, $79, $A7, $20, $01, $AF
.db $E0, $E5, $C9, $21, $A6, $D5, $FA, $4D, $CC, $4F, $06, $00, $CD, $E6, $71, $C3
.db $29, $24, $21, $A6, $D5, $FA, $4D, $CC, $4F, $06, $01, $CD, $E6, $71, $C3, $29
.db $24, $E5, $D5, $C5, $79, $57, $E6, $07, $5F, $7A, $CB, $3F, $CB, $3F, $CB, $3F
.db $85, $6F, $30, $01, $24, $1C, $16, $01, $1D, $28, $04, $CB, $22, $18, $F9, $78
.db $A7, $28, $0B, $FE, $02, $28, $10, $7E, $47, $7A, $B0, $77, $18, $0D, $7E, $47
.db $7A, $EE, $FF, $A0, $77, $18, $04, $7E, $47, $7A, $A0, $C1, $D1, $E1, $4F, $C9

TryPushingBoulder:
	LD A, (wStatusFlags1)
	BIT 0, A
	RET Z
	LD A, (wMiscFlags)
	BIT 1, A
	RET NZ
	XOR A
	LDH (hDownArrowBlinkCount2 - $FF00), A
	CALL IsSpriteInFrontOfPlayer
	LDH A, (hDownArrowBlinkCount2 - $FF00)
	LD (wBoulderSpriteIndex), A
	AND A
	JP Z, ResetBoulderPushFlags
	LD HL, wSpritePlayerStateData1MovementStatus
	LD D, $00
	LDH A, (hDownArrowBlinkCount2 - $FF00)
	SWAP A
	LD E, A
	ADD HL, DE
	RES 7, (HL)
	CALL GetSpriteMovementByte2Pointer
	LD A, (HL)
	CP $10
	JP NZ, ResetBoulderPushFlags
	LD HL, wMiscFlags
	BIT 6, (HL)
	SET 6, (HL)
	RET Z
	LDH A, (hJoyHeld - $FF00)
	AND $F0
	RET Z
	LD A, $5A
	CALL Predef
	LD A, (wTileInFrontOfBoulderAndBoulderCollisionResult)
	AND A
	JP NZ, ResetBoulderPushFlags
	LDH A, (hJoyHeld - $FF00)
	LD B, A
	LD A, (wSpritePlayerStateData1FacingDirection)
	CP $04
	JR Z, TryPushingBoulder.pushBoulderUp
	CP $08
	JR Z, TryPushingBoulder.pushBoulderLeft
	CP $0C
	JR Z, TryPushingBoulder.pushBoulderRight
	BIT 7, B
	RET Z
	LD DE, PushBoulderLeftMovementData - 2
	JR TryPushingBoulder.done

TryPushingBoulder.pushBoulderUp:
	BIT 6, B
	RET Z
	LD DE, PushBoulderUpMovementData
	JR TryPushingBoulder.done

TryPushingBoulder.pushBoulderLeft:
	BIT 5, B
	RET Z
	LD DE, PushBoulderLeftMovementData
	JR TryPushingBoulder.done

TryPushingBoulder.pushBoulderRight:
	BIT 4, B
	RET Z
	LD DE, PushBoulderLeftMovementData + 2
TryPushingBoulder.done:
	CALL MoveSprite
	LD A, $A8
	CALL PlaySound
	LD HL, wMiscFlags
	SET 1, (HL)
	RET

; Data from F2AD to F2B0 (4 bytes)
PushBoulderUpMovementData:
.db $40, $FF, $00, $FF

; Data from F2B1 to F2B4 (4 bytes)
PushBoulderLeftMovementData:
.db $80, $FF, $C0, $FF

DoBoulderDustAnimation:
	LD A, (wStatusFlags5)
	BIT 0, A
	RET NZ
	LD HL, $5F54
	LD B, $1E
	CALL Bankswitch
	CALL DiscardButtonPresses
	LD (wJoyIgnore), A
	CALL ResetBoulderPushFlags
	SET 7, (HL)
	LD A, (wBoulderSpriteIndex)
	LDH (hDownArrowBlinkCount2 - $FF00), A
	CALL GetSpriteMovementByte2Pointer
	LD (HL), $10
	LD A, $AC
	JP PlaySound

ResetBoulderPushFlags:
	LD HL, wMiscFlags
	RES 1, (HL)
	RES 6, (HL)
	RET

; Data from F2E5 to FFFF (3355 bytes)
.db $11, $63, $D1, $FA, $49, $CC, $E6, $0F, $28, $03, $11, $9C, $D8, $1A, $3C, $FE
.db $07, $D0, $12, $1A, $E0, $E4, $83, $5F, $30, $01, $14, $FA, $91, $CF, $12, $13
.db $3E, $FF, $12, $21, $73, $D2, $FA, $49, $CC, $E6, $0F, $28, $03, $21, $AC, $D9
.db $F0, $E4, $3D, $CD, $7D, $3A, $54, $5D, $21, $58, $D1, $01, $0B, $00, $CD, $B5
.db $00, $FA, $49, $CC, $A7, $20, $13, $21, $B5, $D2, $F0, $E4, $3D, $CD, $7D, $3A
.db $3E, $02, $EA, $7D, $D0, $3E, $4E, $CD, $6D, $3E, $21, $6B, $D1, $FA, $49, $CC
.db $E6, $0F, $28, $03, $21, $A4, $D8, $F0, $E4, $3D, $01, $2C, $00, $CD, $87, $3A
.db $5D, $54, $E5, $FA, $91, $CF, $EA, $B5, $D0, $CD, $37, $15, $21, $B8, $D0, $2A
.db $12, $13, $E1, $E5, $FA, $49, $CC, $E6, $0F, $3E, $98, $06, $88, $20, $3F, $FA
.db $91, $CF, $EA, $1E, $D1, $D5, $3E, $3A, $CD, $6D, $3E, $D1, $FA, $1E, $D1, $3D
.db $4F, $06, $02, $21, $F7, $D2, $CD, $69, $76, $79, $EA, $53, $D1, $FA, $1E, $D1
.db $3D, $4F, $06, $01, $C5, $CD, $69, $76, $C1, $21, $0A, $D3, $CD, $69, $76, $E1
.db $E5, $FA, $57, $D0, $A7, $20, $2A, $CD, $5C, $3E, $47, $CD, $5C, $3E, $C5, $01
.db $1B, $00, $09, $C1, $22, $70, $01, $F4, $FF, $09, $3E, $01, $4F, $AF, $47, $CD
.db $4A, $39, $F0, $97, $12, $13, $F0, $98, $12, $13, $AF, $12, $13, $12, $13, $18
.db $1E, $01, $1B, $00, $09, $FA, $F1, $CF, $22, $FA, $F2, $CF, $77, $FA, $E6, $CF
.db $12, $13, $FA, $E7, $CF, $12, $13, $AF, $12, $13, $FA, $E9, $CF, $12, $13, $21
.db $BE, $D0, $2A, $12, $13, $2A, $12, $13, $2A, $12, $21, $C7, $D0, $2A, $13, $D5
.db $12, $2A, $13, $12, $2A, $13, $12, $2A, $13, $12, $D5, $1B, $1B, $1B, $AF, $EA
.db $E9, $CE, $3E, $3E, $CD, $6D, $3E, $D1, $FA, $59, $D3, $13, $12, $FA, $5A, $D3
.db $13, $12, $D5, $FA, $27, $D1, $57, $21, $6A, $4F, $06, $16, $CD, $D6, $35, $D1
.db $13, $F0, $96, $12, $13, $F0, $97, $12, $13, $F0, $98, $12, $AF, $06, $0A, $13
.db $12, $05, $20, $FB, $13, $13, $E1, $CD, $76, $74, $13, $FA, $27, $D1, $12, $13
.db $FA, $57, $D0, $3D, $20, $0C, $21, $F4, $CF, $01, $0A, $00, $CD, $B5, $00, $E1
.db $18, $0A, $E1, $01, $10, $00, $09, $06, $00, $CD, $36, $39, $37, $C9, $CD, $94
.db $3E, $06, $04, $2A, $A7, $28, $1B, $3D, $E5, $D5, $C5, $21, $00, $40, $01, $06
.db $00, $CD, $87, $3A, $11, $6D, $CD, $3E, $0E, $CD, $9D, $00, $C1, $D1, $E1, $FA
.db $72, $CD, $13, $12, $05, $20, $DC, $C9, $21, $63, $D1, $7E, $FE, $06, $37, $C8
.db $3C, $77, $4F, $06, $00, $09, $FA, $91, $CF, $22, $36, $FF, $21, $6B, $D1, $FA
.db $63, $D1, $3D, $01, $2C, $00, $CD, $87, $3A, $5D, $54, $21, $98, $CF, $CD, $B5
.db $00, $21, $73, $D2, $FA, $63, $D1, $3D, $CD, $7D, $3A, $54, $5D, $21, $AC, $D9
.db $FA, $92, $CF, $CD, $7D, $3A, $01, $0B, $00, $CD, $B5, $00, $21, $B5, $D2, $FA
.db $63, $D1, $3D, $CD, $7D, $3A, $54, $5D, $21, $EE, $D9, $FA, $92, $CF, $CD, $7D
.db $3A, $01, $0B, $00, $CD, $B5, $00, $FA, $91, $CF, $EA, $1E, $D1, $3E, $3A, $CD
.db $6D, $3E, $FA, $1E, $D1, $3D, $4F, $06, $01, $21, $F7, $D2, $C5, $CD, $69, $76
.db $C1, $21, $0A, $D3, $CD, $69, $76, $A7, $C9, $FA, $95, $CF, $A7, $28, $15, $FE
.db $02, $28, $11, $FE, $03, $21, $5F, $DA, $28, $46, $21, $80, $DA, $7E, $FE, $14
.db $20, $0C, $18, $08, $21, $63, $D1, $7E, $FE, $06, $20, $02, $37, $C9, $3C, $77
.db $4F, $06, $00, $09, $FA, $95, $CF, $FE, $02, $FA, $5F, $DA, $28, $03, $FA, $91
.db $CF, $22, $36, $FF, $FA, $95, $CF, $3D, $21, $6B, $D1, $01, $2C, $00, $FA, $63
.db $D1, $20, $09, $21, $96, $DA, $01, $21, $00, $FA, $80, $DA, $3D, $CD, $87, $3A
.db $E5, $5D, $54, $FA, $95, $CF, $A7, $21, $96, $DA, $01, $21, $00, $28, $0D, $FE
.db $02, $21, $5F, $DA, $28, $0C, $21, $6B, $D1, $01, $2C, $00, $FA, $92, $CF, $CD
.db $87, $3A, $E5, $D5, $01, $21, $00, $CD, $B5, $00, $D1, $E1, $FA, $95, $CF, $A7
.db $28, $0D, $FE, $02, $28, $09, $01, $21, $00, $09, $7E, $13, $13, $13, $12, $FA
.db $95, $CF, $FE, $03, $11, $54, $DA, $28, $15, $3D, $21, $73, $D2, $FA, $63, $D1
.db $20, $06, $21, $2A, $DD, $FA, $80, $DA, $3D, $CD, $7D, $3A, $54, $5D, $21, $2A
.db $DD, $FA, $95, $CF, $A7, $28, $0A, $21, $54, $DA, $FE, $02, $28, $09, $21, $73
.db $D2, $FA, $92, $CF, $CD, $7D, $3A, $01, $0B, $00, $CD, $B5, $00, $FA, $95, $CF
.db $FE, $03, $11, $49, $DA, $28, $15, $3D, $21, $B5, $D2, $FA, $63, $D1, $20, $06
.db $21, $06, $DE, $FA, $80, $DA, $3D, $CD, $7D, $3A, $54, $5D, $21, $06, $DE, $FA
.db $95, $CF, $A7, $28, $0A, $21, $49, $DA, $FE, $02, $28, $09, $21, $B5, $D2, $FA
.db $92, $CF, $CD, $7D, $3A, $01, $0B, $00, $CD, $B5, $00, $E1, $FA, $95, $CF, $FE
.db $01, $28, $2C, $FE, $03, $28, $28, $E5, $CB, $3F, $C6, $02, $EA, $49, $CC, $CD
.db $72, $13, $06, $16, $21, $43, $4F, $CD, $D6, $35, $7A, $EA, $27, $D1, $E1, $01
.db $21, $00, $09, $22, $54, $5D, $01, $EE, $FF, $09, $06, $01, $CD, $36, $39, $A7
.db $C9, $CD, $94, $3E, $E5, $D5, $C5, $79, $57, $E6, $07, $5F, $7A, $CB, $3F, $CB
.db $3F, $CB, $3F, $85, $6F, $30, $01, $24, $1C, $16, $01, $1D, $28, $04, $CB, $22
.db $18, $F9, $78, $A7, $28, $0A, $FE, $02, $28, $0E, $46, $7A, $B0, $77, $18, $0B
.db $46, $7A, $EE, $FF, $A0, $77, $18, $03, $46, $7A, $A0, $C1, $D1, $E1, $4F, $C9
.db $21, $64, $D1, $11, $6C, $D1, $2A, $FE, $FF, $28, $56, $E5, $D5, $21, $03, $00
.db $19, $AF, $77, $D5, $06, $04, $21, $07, $00, $19, $7E, $A7, $28, $28, $3D, $21
.db $1C, $00, $19, $E5, $D5, $C5, $21, $00, $40, $01, $06, $00, $CD, $87, $3A, $11
.db $6D, $CD, $3E, $0E, $CD, $9D, $00, $FA, $72, $CD, $C1, $D1, $E1, $13, $C5, $47
.db $7E, $E6, $C0, $80, $77, $C1, $05, $20, $CD, $D1, $21, $21, $00, $19, $2A, $12
.db $13, $7E, $12, $D1, $E1, $E5, $01, $2C, $00, $62, $6B, $09, $54, $5D, $E1, $18
.db $A5, $AF, $EA, $92, $CF, $EA, $1E, $D1, $FA, $63, $D1, $47, $C5, $CD, $06, $66
.db $C1, $21, $92, $CF, $34, $05, $20, $F4, $C9, $CD, $94, $3E, $AF, $E0, $A5, $E0
.db $A6, $E0, $A7, $16, $01, $F0, $A2, $E6, $F0, $20, $2B, $14, $F0, $A2, $CB, $37
.db $E6, $F0, $47, $F0, $A3, $CB, $37, $E0, $A3, $E6, $0F, $B0, $E0, $A2, $F0, $A3
.db $E6, $F0, $47, $F0, $A4, $CB, $37, $E0, $A4, $E6, $0F, $B0, $E0, $A3, $F0, $A4
.db $E6, $F0, $E0, $A4, $18, $CF, $D5, $D5, $CD, $00, $78, $D1, $78, $CB, $37, $E6
.db $F0, $E0, $A5, $15, $28, $51, $D5, $CD, $D7, $77, $CD, $00, $78, $D1, $F0, $A5
.db $B0, $E0, $A5, $15, $28, $41, $D5, $CD, $D7, $77, $CD, $00, $78, $D1, $78, $CB
.db $37, $E6, $F0, $E0, $A6, $15, $28, $2F, $D5, $CD, $D7, $77, $CD, $00, $78, $D1
.db $F0, $A6, $B0, $E0, $A6, $15, $28, $1F, $D5, $CD, $D7, $77, $CD, $00, $78, $D1
.db $78, $CB, $37, $E6, $F0, $E0, $A7, $15, $28, $0D, $D5, $CD, $D7, $77, $CD, $00
.db $78, $D1, $F0, $A7, $B0, $E0, $A7, $F0, $A5, $E0, $A2, $F0, $A6, $E0, $A3, $F0
.db $A7, $E0, $A4, $D1, $3E, $06, $92, $A7, $C8, $F5, $CD, $D7, $77, $F1, $3D, $20
.db $F8, $C9, $F0, $A4, $CB, $37, $E6, $0F, $47, $F0, $A3, $CB, $37, $E0, $A3, $E6
.db $F0, $B0, $E0, $A4, $F0, $A3, $E6, $0F, $47, $F0, $A2, $CB, $37, $E0, $A2, $E6
.db $F0, $B0, $E0, $A3, $F0, $A2, $E6, $0F, $E0, $A2, $C9, $01, $03, $00, $11, $9F
.db $FF, $21, $A2, $FF, $C5, $CD, $8E, $3A, $C1, $D8, $04, $11, $A1, $FF, $21, $A4
.db $FF, $C5, $CD, $39, $78, $C1, $18, $E6, $CD, $94, $3E, $A7, $41, $1A, $8E, $27
.db $12, $1B, $2B, $0D, $20, $F7, $30, $08, $3E, $99, $13, $12, $13, $05, $20, $FB
.db $C9, $CD, $94, $3E, $A7, $41, $1A, $9E, $27, $12, $1B, $2B, $0D, $20, $F7, $30
.db $09, $3E, $00, $13, $12, $13, $05, $20, $FB, $37, $C9, $CD, $5C, $3E, $F0, $D4
.db $EA, $59, $D3, $CD, $5C, $3E, $F0, $D3, $EA, $5A, $D3, $3E, $FF, $EA, $1B, $D7
.db $21, $63, $D1, $CD, $A0, $78, $21, $80, $DA, $CD, $A0, $78, $21, $1D, $D3, $CD
.db $A0, $78, $21, $3A, $D5, $CD, $A0, $78, $21, $48, $D3, $3E, $30, $32, $AF, $22
.db $23, $77, $EA, $49, $CC, $21, $56, $D3, $22, $77, $21, $A4, $D5, $22, $77, $21
.db $F0, $D5, $01, $C8, $00, $CD, $E0, $36, $C3, $75, $71, $AF, $22, $3D, $77, $C9
.db $CD, $94, $3E, $21, $1D, $D3, $23, $2A, $FE, $FF, $28, $06, $B8, $20, $F7, $7E
.db $47, $C9, $06, $00, $C9, $AF, $21, $97, $FF, $22, $22, $22, $77, $21, $97, $CC
.db $11, $00, $00, $F0, $99, $47, $F0, $95, $CD, $33, $36, $57, $A7, $20, $06, $F0
.db $98, $CB, $C7, $E0, $98, $F0, $9A, $47, $F0, $96, $CD, $33, $36, $5F, $A7, $20
.db $06, $F0, $98, $CB, $CF, $E0, $98, $F0, $98, $FE, $03, $28, $34, $7B, $BA, $38
.db $14, $F0, $9D, $CB, $4F, $20, $04, $16, $C0, $18, $02, $16, $80, $F0, $9A, $C6
.db $01, $E0, $9A, $18, $12, $F0, $9D, $CB, $47, $20, $04, $16, $00, $18, $02, $16
.db $40, $F0, $99, $C6, $01, $E0, $99, $7A, $22, $F0, $97, $3C, $E0, $97, $C3, $C8
.db $78, $36, $FF, $C9, $AF, $E0, $9D, $FA, $04, $C1, $57, $FA, $06, $C1, $5F, $21
.db $00, $C1, $F0, $95, $85, $C6, $04, $6F, $30, $01, $24, $7A, $47, $2A, $CD, $33
.db $36, $30, $0B, $E5, $21, $9D, $FF, $CB, $46, $CB, $C6, $E1, $18, $09, $E5, $21
.db $9D, $FF, $CB, $46, $CB, $86, $E1, $E5, $21, $E5, $FF, $22, $3E, $10, $22, $CD
.db $6B, $36, $7E, $E0, $95, $E1, $23, $43, $7E, $CD, $33, $36, $30, $0B, $E5, $21
.db $9D, $FF, $CB, $4E, $CB, $CE, $E1, $18, $09, $E5, $21, $9D, $FF, $CB, $4E, $CB
.db $8E, $E1, $E0, $E5, $3E, $10, $E0, $E6, $CD, $6B, $36, $F0, $E7, $E0, $96, $F0
.db $9B, $A7, $C8, $F0, $9D, $2F, $E6, $03, $E0, $9D, $C9, $F0, $95, $EA, $37, $CD
.db $3D, $11, $D3, $CC, $21, $97, $CC, $85, $6F, $30, $01, $24, $3A, $CD, $BF, $79
.db $12, $13, $F0, $95, $3D, $E0, $95, $20, $F3, $C9, $E5, $47, $21, $D2, $79, $2A
.db $FE, $FF, $28, $07, $B8, $28, $03, $23, $18, $F5, $7E, $E1, $C9, $40, $40, $00
.db $80, $80, $20, $C0, $10, $FF, $C9, $CD, $94, $3E, $E5, $AF, $21, $96, $FF, $22
.db $78, $22, $79, $22, $36, $30, $CD, $AC, $38, $7A, $A7, $28, $1A, $CB, $3A, $CB
.db $1B, $CB, $3A, $CB, $1B, $F0, $97, $47, $F0, $98, $CB, $38, $CB, $1F, $CB, $38
.db $CB, $1F, $E0, $98, $78, $E0, $97, $7B, $E0, $99, $06, $04, $CD, $B9, $38, $F0
.db $98, $5F, $E1, $A7, $C0, $1E, $01, $C9, $E5, $21, $EB, $CE, $2A, $4F, $2A, $47
.db $2A, $5F, $56, $E1, $D5, $C5, $CD, $D7, $7A, $7B, $EA, $FE, $CE, $7A, $EA, $FD
.db $CE, $C1, $D1, $CD, $D1, $7A, $C8, $3E, $FF, $38, $02, $3E, $01, $EA, $EF, $CE
.db $CD, $94, $3E, $FA, $ED, $CE, $5F, $FA, $EE, $CE, $57, $D5, $FA, $EB, $CE, $4F
.db $FA, $EC, $CE, $47, $CD, $D1, $7A, $28, $38, $30, $10, $0B, $79, $EA, $ED, $CE
.db $78, $EA, $EE, $CE, $CD, $30, $7B, $7B, $92, $18, $0E, $03, $79, $EA, $ED, $CE
.db $78, $EA, $EE, $CE, $CD, $30, $7B, $7A, $93, $CD, $F5, $7A, $A7, $28, $03, $CD
.db $B1, $7A, $FA, $ED, $CE, $EA, $EB, $CE, $FA, $EE, $CE, $EA, $EC, $CE, $D1, $18
.db $BA, $D1, $7B, $EA, $EB, $CE, $7A, $EA, $EC, $CE, $B3, $28, $04, $CD, $30, $7B
.db $53, $CD, $F5, $7A, $3E, $01, $CD, $B1, $7A, $C3, $D7, $3D, $E5, $F5, $D5, $16
.db $06, $CD, $36, $13, $0E, $02, $CD, $39, $37, $D1, $FA, $EF, $CE, $83, $FE, $31
.db $30, $07, $5F, $F1, $3D, $20, $E6, $E1, $C9, $F1, $E1, $C9, $7A, $90, $C0, $7B
.db $91, $C9, $7A, $90, $38, $09, $28, $0E, $7B, $91, $5F, $7A, $98, $57, $C9, $79
.db $93, $5F, $78, $9A, $57, $C9, $7B, $91, $38, $F5, $20, $EC, $11, $00, $00, $C9
.db $F5, $D5, $FA, $94, $CF, $A7, $28, $30, $FA, $EB, $CE, $EA, $F1, $CE, $FA, $EC
.db $CE, $EA, $F0, $CE, $E5, $F0, $F6, $CB, $47, $28, $05, $11, $09, $00, $18, $03
.db $11, $15, $00, $19, $E5, $3E, $7F, $22, $22, $22, $E1, $11, $F0, $CE, $01, $03
.db $02, $CD, $5F, $3C, $CD, $AF, $20, $E1, $D1, $F1, $C9, $E5, $21, $E9, $CE, $2A
.db $5F, $2A, $57, $2A, $4F, $2A, $47, $2A, $66, $6F, $E5, $D5, $CD, $DF, $79, $7B
.db $D1, $C1, $F5, $CD, $DF, $79, $F1, $53, $5F, $E1, $C9, $FA, $09, $C1, $FE, $04
.db $20, $28, $FA, $67, $D3, $47, $FA, $34, $C4, $4F, $21, $8B, $7B, $2A, $FE, $FF
.db $28, $18, $B8, $20, $11, $2A, $B9, $20, $0E, $7E, $F5, $CD, $3C, $3C, $F1, $CD
.db $F5, $3E, $AF, $E0, $DB, $C9, $23, $23, $18, $E3, $3E, $FF, $E0, $DB, $06, $14
.db $21, $73, $66, $C3, $D6, $35, $17, $30, $3A, $08, $3D, $3F, $08, $1E, $40, $13
.db $32, $40, $01, $32, $40, $14, $28, $40, $12, $16, $41, $07, $1D, $40, $05, $1D
.db $40, $0C, $22, $40, $02, $54, $42, $02, $55, $42, $06, $54, $42, $06, $55, $42
.db $12, $50, $42, $12, $52, $42, $0D, $36, $40, $FF, $08, $21, $D9, $7B, $CD, $49
.db $3C, $FA, $62, $D3, $CB, $47, $21, $DE, $7B, $20, $03, $21, $E3, $7B, $CD, $49
.db $3C, $C3, $D7, $24, $17, $57, $55, $22, $50, $17, $67, $55, $22, $50, $17, $96
.db $55, $22, $50, $08, $21, $03, $7C, $FA, $67, $D3, $FE, $13, $20, $0A, $FA, $20
.db $C4, $FE, $38, $20, $03, $21, $08, $7C, $CD, $49, $3C, $C3, $D7, $24, $17, $C1
.db $55, $22, $50, $17, $DE, $55, $22, $50, $17, $FB, $55, $22, $50, $17, $11, $56
.db $22, $06, $08, $3E, $01, $EA, $3C, $CC, $21, $30, $D7, $CB, $F6, $CD, $D4, $3D
.db $AF, $E0, $B0, $3C, $E0, $BA, $CD, $80, $36, $06, $1C, $21, $3E, $4E, $CD, $D6
.db $35, $21, $30, $D7, $CB, $B6, $11, $D7, $24, $D5, $F0, $B8, $F5, $C3, $E8, $29
.db $17, $1F, $56, $22, $50
.dsb 950, $00

