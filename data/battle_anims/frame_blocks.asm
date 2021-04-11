FrameBlockPointers:
	table_width 2, FrameBlockPointers
	dw FrameBlock00
	dw FrameBlock01
	dw FrameBlock02
	dw FrameBlock03
	dw FrameBlock04
	dw FrameBlock05
	dw FrameBlock06
	dw FrameBlock07
	dw FrameBlock08
	dw FrameBlock09
	dw FrameBlock0a
	dw FrameBlock0b
	dw FrameBlock0c
	dw FrameBlock0d
	dw FrameBlock0e
	dw FrameBlock0f
	dw FrameBlock10
	dw FrameBlock11
	dw FrameBlock12
	dw FrameBlock13
	dw FrameBlock14
	dw FrameBlock15
	dw FrameBlock16
	dw FrameBlock17
	dw FrameBlock18
	dw FrameBlock19
	dw FrameBlock1a
	dw FrameBlock1b
	dw FrameBlock1c
	dw FrameBlock1d
	dw FrameBlock1e
	dw FrameBlock1f
	dw FrameBlock20
	dw FrameBlock21
	dw FrameBlock22
	dw FrameBlock23
	dw FrameBlock24
	dw FrameBlock25
	dw FrameBlock26
	dw FrameBlock27
	dw FrameBlock28
	dw FrameBlock29
	dw FrameBlock2a
	dw FrameBlock2b
	dw FrameBlock2c
	dw FrameBlock2d
	dw FrameBlock2e
	dw FrameBlock2f
	dw FrameBlock30
	dw FrameBlock31
	dw FrameBlock32
	dw FrameBlock33
	dw FrameBlock34
	dw FrameBlock35
	dw FrameBlock36
	dw FrameBlock37
	dw FrameBlock38
	dw FrameBlock39
	dw FrameBlock3a
	dw FrameBlock3b
	dw FrameBlock3c
	dw FrameBlock3d
	dw FrameBlock3e
	dw FrameBlock3f
	dw FrameBlock40
	dw FrameBlock41
	dw FrameBlock42
	dw FrameBlock43
	dw FrameBlock44
	dw FrameBlock45
	dw FrameBlock46
	dw FrameBlock47
	dw SmallBlackCircleFrameBlock
	dw LargeBlackCircleFrameBlock
	dw FrameBlock4a
	dw FrameBlock4b
	dw FrameBlock4c
	dw FrameBlock4d
	dw FrameBlock4e
	dw FrameBlock4f
	dw FrameBlock50
	dw FrameBlock51
	dw FrameBlock52
	dw FrameBlock53
	dw FrameBlock54
	dw FrameBlock55
	dw FrameBlock56
	dw FrameBlock57
	dw FrameBlock58
	dw FrameBlock59
	dw FrameBlock5a
	dw FrameBlock5b
	dw FrameBlock5c
	dw FrameBlock5d
	dw FrameBlock5e
	dw FrameBlock5f
	dw FrameBlock60
	dw FrameBlock61
	dw FrameBlock62
	dw FrameBlock63
	dw FrameBlock64
	dw FrameBlock65
	dw FrameBlock66
	dw FrameBlock67
	dw FrameBlock68
	dw FrameBlock69
	dw FrameBlock6a
	dw FrameBlock6b
	dw FrameBlock6c
	dw FrameBlock6d
	dw FrameBlock6e
	dw FrameBlock6f
	dw FrameBlock70
	dw FrameBlock71
	dw FrameBlock72
	dw FrameBlock73
	dw FrameBlock74
	dw FrameBlock75
	dw FrameBlock76
	dw FrameBlock77
	dw FrameBlock78
	dw FrameBlock79
	assert_table_length NUM_FRAMEBLOCKS

FrameBlock01:
	db 9 ; #
	dbsprite  0,  0,  0,  0, $2c, 0
	dbsprite  1,  0,  0,  0, $2d, 0
	dbsprite  2,  0,  0,  0, $2c, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $3c, 0
	dbsprite  1,  1,  0,  0, $3d, 0
	dbsprite  2,  1,  0,  0, $3c, OAM_HFLIP
	dbsprite  0,  2,  0,  0, $2c, OAM_VFLIP
	dbsprite  1,  2,  0,  0, $2d, OAM_VFLIP
	dbsprite  2,  2,  0,  0, $2c, OAM_HFLIP | OAM_VFLIP

FrameBlock02:
	db 16 ; #
	dbsprite  0,  0,  0,  0, $20, 0
	dbsprite  1,  0,  0,  0, $21, 0
	dbsprite  2,  0,  0,  0, $21, OAM_HFLIP
	dbsprite  3,  0,  0,  0, $20, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $30, 0
	dbsprite  1,  1,  0,  0, $31, 0
	dbsprite  2,  1,  0,  0, $31, OAM_HFLIP
	dbsprite  3,  1,  0,  0, $30, OAM_HFLIP
	dbsprite  0,  2,  0,  0, $30, OAM_VFLIP
	dbsprite  1,  2,  0,  0, $31, OAM_VFLIP
	dbsprite  2,  2,  0,  0, $31, OAM_HFLIP | OAM_VFLIP
	dbsprite  3,  2,  0,  0, $30, OAM_HFLIP | OAM_VFLIP
	dbsprite  0,  3,  0,  0, $20, OAM_VFLIP
	dbsprite  1,  3,  0,  0, $21, OAM_VFLIP
	dbsprite  2,  3,  0,  0, $21, OAM_HFLIP | OAM_VFLIP
	dbsprite  3,  3,  0,  0, $20, OAM_HFLIP | OAM_VFLIP

FrameBlock03:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $02, 0
	dbsprite  1,  0,  0,  0, $02, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $12, 0
	dbsprite  1,  1,  0,  0, $12, OAM_HFLIP

FrameBlock04:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $06, 0
	dbsprite  1,  0,  0,  0, $07, 0
	dbsprite  0,  1,  0,  0, $16, 0
	dbsprite  1,  1,  0,  0, $17, 0

FrameBlock05:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $07, OAM_HFLIP
	dbsprite  1,  0,  0,  0, $06, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $17, OAM_HFLIP
	dbsprite  1,  1,  0,  0, $16, OAM_HFLIP

FrameBlock06:
	db 12 ; #
	dbsprite  1,  0,  0,  0, $23, 0
	dbsprite  0,  1,  0,  0, $32, 0
	dbsprite  1,  1,  0,  0, $33, 0
	dbsprite  2,  0,  0,  0, $23, OAM_HFLIP
	dbsprite  2,  1,  0,  0, $33, OAM_HFLIP
	dbsprite  3,  1,  0,  0, $32, OAM_HFLIP
	dbsprite  0,  2,  0,  0, $32, OAM_VFLIP
	dbsprite  1,  2,  0,  0, $33, OAM_VFLIP
	dbsprite  1,  3,  0,  0, $23, OAM_VFLIP
	dbsprite  2,  2,  0,  0, $33, OAM_HFLIP | OAM_VFLIP
	dbsprite  3,  2,  0,  0, $32, OAM_HFLIP | OAM_VFLIP
	dbsprite  2,  3,  0,  0, $23, OAM_HFLIP | OAM_VFLIP

FrameBlock07:
	db 16 ; #
	dbsprite  0,  0,  0,  0, $20, 0
	dbsprite  1,  0,  0,  0, $21, 0
	dbsprite  0,  1,  0,  0, $30, 0
	dbsprite  1,  1,  0,  0, $31, 0
	dbsprite  2,  0,  0,  0, $21, OAM_HFLIP
	dbsprite  3,  0,  0,  0, $20, OAM_HFLIP
	dbsprite  2,  1,  0,  0, $31, OAM_HFLIP
	dbsprite  3,  1,  0,  0, $30, OAM_HFLIP
	dbsprite  0,  2,  0,  0, $30, OAM_VFLIP
	dbsprite  1,  2,  0,  0, $31, OAM_VFLIP
	dbsprite  0,  3,  0,  0, $20, OAM_VFLIP
	dbsprite  1,  3,  0,  0, $21, OAM_VFLIP
	dbsprite  2,  2,  0,  0, $31, OAM_HFLIP | OAM_VFLIP
	dbsprite  3,  2,  0,  0, $30, OAM_HFLIP | OAM_VFLIP
	dbsprite  2,  3,  0,  0, $21, OAM_HFLIP | OAM_VFLIP
	dbsprite  3,  3,  0,  0, $20, OAM_HFLIP | OAM_VFLIP

FrameBlock08:
	db 16 ; #
	dbsprite  0,  0,  0,  0, $20, 0
	dbsprite  1,  0,  0,  0, $21, 0
	dbsprite  0,  1,  0,  0, $30, 0
	dbsprite  1,  1,  0,  0, $31, 0
	dbsprite  3,  0,  0,  0, $21, OAM_HFLIP
	dbsprite  4,  0,  0,  0, $20, OAM_HFLIP
	dbsprite  3,  1,  0,  0, $31, OAM_HFLIP
	dbsprite  4,  1,  0,  0, $30, OAM_HFLIP
	dbsprite  0,  3,  0,  0, $30, OAM_VFLIP
	dbsprite  1,  3,  0,  0, $31, OAM_VFLIP
	dbsprite  0,  4,  0,  0, $20, OAM_VFLIP
	dbsprite  1,  4,  0,  0, $21, OAM_VFLIP
	dbsprite  3,  3,  0,  0, $31, OAM_HFLIP | OAM_VFLIP
	dbsprite  4,  3,  0,  0, $30, OAM_HFLIP | OAM_VFLIP
	dbsprite  3,  4,  0,  0, $21, OAM_HFLIP | OAM_VFLIP
	dbsprite  4,  4,  0,  0, $20, OAM_HFLIP | OAM_VFLIP

FrameBlock09:
	db 12 ; #
	dbsprite  0,  0,  0,  0, $24, 0
	dbsprite  1,  0,  0,  0, $25, 0
	dbsprite  0,  1,  0,  0, $34, 0
	dbsprite  3,  0,  0,  0, $25, OAM_HFLIP
	dbsprite  4,  0,  0,  0, $24, OAM_HFLIP
	dbsprite  4,  1,  0,  0, $34, OAM_HFLIP
	dbsprite  0,  3,  0,  0, $34, OAM_VFLIP
	dbsprite  0,  4,  0,  0, $24, OAM_VFLIP
	dbsprite  1,  4,  0,  0, $25, OAM_VFLIP
	dbsprite  4,  3,  0,  0, $34, OAM_HFLIP | OAM_VFLIP
	dbsprite  3,  4,  0,  0, $25, OAM_HFLIP | OAM_VFLIP
	dbsprite  4,  4,  0,  0, $24, OAM_HFLIP | OAM_VFLIP

FrameBlock0a:
	db 12 ; #
	dbsprite  0,  0,  0,  0, $24, 0
	dbsprite  1,  0,  0,  0, $25, 0
	dbsprite  0,  1,  0,  0, $34, 0
	dbsprite  4,  0,  0,  0, $25, OAM_HFLIP
	dbsprite  5,  0,  0,  0, $24, OAM_HFLIP
	dbsprite  5,  1,  0,  0, $34, OAM_HFLIP
	dbsprite  0,  4,  0,  0, $34, OAM_VFLIP
	dbsprite  0,  5,  0,  0, $24, OAM_VFLIP
	dbsprite  1,  5,  0,  0, $25, OAM_VFLIP
	dbsprite  5,  4,  0,  0, $34, OAM_HFLIP | OAM_VFLIP
	dbsprite  4,  5,  0,  0, $25, OAM_HFLIP | OAM_VFLIP
	dbsprite  5,  5,  0,  0, $24, OAM_HFLIP | OAM_VFLIP

FrameBlock0b:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $05, 0
	dbsprite  1,  0,  0,  0, $05, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $15, 0
	dbsprite  1,  1,  0,  0, $15, OAM_HFLIP

FrameBlock0c:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $04, 0
	dbsprite  1,  0,  0,  0, $04, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $14, 0
	dbsprite  1,  1,  0,  0, $14, OAM_HFLIP

FrameBlock0d:
	db 8 ; #
	dbsprite  0,  0,  0,  0, $0c, 0
	dbsprite  1,  0,  0,  0, $0d, 0
	dbsprite  0,  1,  0,  0, $1c, 0
	dbsprite  1,  1,  0,  0, $1d, 0
	dbsprite  0,  2,  0,  0, $1d, OAM_HFLIP | OAM_VFLIP
	dbsprite  1,  2,  0,  0, $1c, OAM_HFLIP | OAM_VFLIP
	dbsprite  0,  3,  0,  0, $0d, OAM_HFLIP | OAM_VFLIP
	dbsprite  1,  3,  0,  0, $0c, OAM_HFLIP | OAM_VFLIP

FrameBlock0e:
	db 4 ; #
	dbsprite  0,  4,  0,  0, $0c, 0
	dbsprite  1,  4,  0,  0, $0d, 0
	dbsprite  0,  5,  0,  0, $1c, 0
	dbsprite  1,  5,  0,  0, $1d, 0

FrameBlock0f:
	db 4 ; #
	dbsprite  0,  6,  0,  0, $1d, OAM_HFLIP | OAM_VFLIP
	dbsprite  1,  6,  0,  0, $1c, OAM_HFLIP | OAM_VFLIP
	dbsprite  0,  7,  0,  0, $0d, OAM_HFLIP | OAM_VFLIP
	dbsprite  1,  7,  0,  0, $0c, OAM_HFLIP | OAM_VFLIP

FrameBlock10:
	db 8 ; #
	dbsprite  0,  0,  0,  0, $0e, 0
	dbsprite  1,  0,  0,  0, $0f, 0
	dbsprite  0,  1,  0,  0, $1e, 0
	dbsprite  1,  1,  0,  0, $1f, 0
	dbsprite  2,  0,  0,  0, $0f, OAM_HFLIP
	dbsprite  3,  0,  0,  0, $0e, OAM_HFLIP
	dbsprite  2,  1,  0,  0, $1f, OAM_HFLIP
	dbsprite  3,  1,  0,  0, $1e, OAM_HFLIP

FrameBlock11:
	db 8 ; #
	dbsprite  0,  0,  0,  0, $0e, 0
	dbsprite  1,  0,  0,  0, $0f, 0
	dbsprite  0,  1,  0,  0, $1e, 0
	dbsprite  1,  1,  0,  0, $1f, 0
	dbsprite  4,  0,  0,  0, $0f, OAM_HFLIP
	dbsprite  5,  0,  0,  0, $0e, OAM_HFLIP
	dbsprite  4,  1,  0,  0, $1f, OAM_HFLIP
	dbsprite  5,  1,  0,  0, $1e, OAM_HFLIP

FrameBlock12:
	db 3 ; #
	dbsprite  0,  0,  0,  0, $37, 0
	dbsprite  2,  1,  0,  0, $37, 0
	dbsprite  4,  0,  0,  0, $37, 0

FrameBlock13:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $36, 0
	dbsprite  1,  0,  0,  0, $36, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $36, OAM_VFLIP
	dbsprite  1,  1,  0,  0, $36, OAM_HFLIP | OAM_VFLIP

FrameBlock14:
	db 8 ; #
	dbsprite  2,  0,  0,  0, $28, 0
	dbsprite  3,  0,  0,  0, $28, OAM_HFLIP
	dbsprite  2,  1,  0,  0, $38, 0
	dbsprite  3,  1,  0,  0, $38, OAM_HFLIP
	dbsprite  4,  0,  0,  0, $36, 0
	dbsprite  5,  0,  0,  0, $36, OAM_HFLIP
	dbsprite  4,  1,  0,  0, $36, OAM_VFLIP
	dbsprite  5,  1,  0,  0, $36, OAM_HFLIP | OAM_VFLIP

FrameBlock15:
	db 12 ; #
	dbsprite  0,  0,  0,  0, $28, 0
	dbsprite  1,  0,  0,  0, $28, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $38, 0
	dbsprite  1,  1,  0,  0, $38, OAM_HFLIP
	dbsprite  2,  0,  0,  0, $29, 0
	dbsprite  3,  0,  0,  0, $29, OAM_HFLIP
	dbsprite  2,  1,  0,  0, $39, 0
	dbsprite  3,  1,  0,  0, $39, OAM_HFLIP
	dbsprite  4,  0,  0,  0, $28, 0
	dbsprite  5,  0,  0,  0, $28, OAM_HFLIP
	dbsprite  4,  1,  0,  0, $38, 0
	dbsprite  5,  1,  0,  0, $38, OAM_HFLIP

FrameBlock16:
	db 8 ; #
	dbsprite  0,  0,  0,  0, $29, 0
	dbsprite  1,  0,  0,  0, $29, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $39, 0
	dbsprite  1,  1,  0,  0, $39, OAM_HFLIP
	dbsprite  4,  0,  0,  0, $29, 0
	dbsprite  5,  0,  0,  0, $29, OAM_HFLIP
	dbsprite  4,  1,  0,  0, $39, 0
	dbsprite  5,  1,  0,  0, $39, OAM_HFLIP

FrameBlock17:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $08, 0
	dbsprite  1,  0,  0,  0, $09, 0
	dbsprite  0,  1,  0,  0, $18, 0
	dbsprite  1,  1,  0,  0, $19, 0

FrameBlock18:
	db 1 ; #
	dbsprite  0,  3,  0,  0, $45, OAM_HFLIP | OAM_VFLIP

FrameBlock19:
	db 2 ; #
	dbsprite  1,  3,  0,  0, $45, 0
	dbsprite  1,  2,  0,  0, $46, OAM_HFLIP | OAM_VFLIP

FrameBlock1a:
	db 2 ; #
	dbsprite  2,  2,  0,  0, $45, OAM_HFLIP | OAM_VFLIP
	dbsprite  2,  3,  0,  0, $46, 0

FrameBlock1b:
	db 2 ; #
	dbsprite  3,  2,  0,  0, $45, 0
	dbsprite  3,  1,  0,  0, $46, OAM_HFLIP | OAM_VFLIP

FrameBlock1c:
	db 2 ; #
	dbsprite  4,  1,  0,  0, $45, OAM_HFLIP | OAM_VFLIP
	dbsprite  4,  2,  0,  0, $46, 0

FrameBlock1d:
	db 2 ; #
	dbsprite  5,  1,  0,  0, $45, 0
	dbsprite  5,  0,  0,  0, $46, OAM_HFLIP | OAM_VFLIP

FrameBlock1e:
	db 2 ; #
	dbsprite  6,  0,  0,  0, $45, OAM_HFLIP | OAM_VFLIP
	dbsprite  6,  1,  0,  0, $46, 0

FrameBlock75:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $43, 0
	dbsprite  1,  0,  0,  0, $43, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $22, 0
	dbsprite  1,  1,  0,  0, $43, OAM_HFLIP | OAM_VFLIP

FrameBlock1f:
	db 2 ; #
	dbsprite  0,  0,  0,  0, $03, 0
	dbsprite  6,  0,  0,  0, $03, OAM_HFLIP

FrameBlock20:
	db 6 ; #
	dbsprite  0,  0,  0,  0, $03, 0
	dbsprite  6,  0,  0,  0, $03, OAM_HFLIP
	dbsprite  1,  1,  0,  0, $03, 0
	dbsprite  5,  1,  0,  0, $03, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $13, 0
	dbsprite  6,  1,  0,  0, $13, OAM_HFLIP

FrameBlock21:
	db 12 ; #
	dbsprite  0,  0,  0,  0, $03, 0
	dbsprite  6,  0,  0,  0, $03, OAM_HFLIP
	dbsprite  1,  1,  0,  0, $03, 0
	dbsprite  5,  1,  0,  0, $03, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $13, 0
	dbsprite  6,  1,  0,  0, $13, OAM_HFLIP
	dbsprite  2,  2,  0,  0, $03, 0
	dbsprite  4,  2,  0,  0, $03, OAM_HFLIP
	dbsprite  1,  2,  0,  0, $13, 0
	dbsprite  5,  2,  0,  0, $13, OAM_HFLIP
	dbsprite  0,  2,  0,  0, $03, 0
	dbsprite  6,  2,  0,  0, $03, OAM_HFLIP

FrameBlock22:
	db 19 ; #
	dbsprite  0,  0,  0,  0, $03, 0
	dbsprite  0,  1,  0,  0, $13, 0
	dbsprite  0,  2,  0,  0, $03, 0
	dbsprite  0,  3,  0,  0, $13, 0
	dbsprite  1,  1,  0,  0, $03, 0
	dbsprite  1,  2,  0,  0, $13, 0
	dbsprite  1,  3,  0,  0, $03, 0
	dbsprite  2,  2,  0,  0, $03, 0
	dbsprite  2,  3,  0,  0, $13, 0
	dbsprite  3,  3,  0,  0, $03, 0
	dbsprite  4,  2,  0,  0, $03, OAM_HFLIP
	dbsprite  4,  3,  0,  0, $13, OAM_HFLIP
	dbsprite  5,  1,  0,  0, $03, OAM_HFLIP
	dbsprite  5,  2,  0,  0, $13, OAM_HFLIP
	dbsprite  5,  3,  0,  0, $03, OAM_HFLIP
	dbsprite  6,  0,  0,  0, $03, OAM_HFLIP
	dbsprite  6,  1,  0,  0, $13, OAM_HFLIP
	dbsprite  6,  2,  0,  0, $03, OAM_HFLIP
	dbsprite  6,  3,  0,  0, $13, OAM_HFLIP

FrameBlock23:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $0a, 0
	dbsprite  1,  0,  0,  0, $0b, 0
	dbsprite  0,  1,  0,  0, $1a, 0
	dbsprite  1,  1,  0,  0, $1b, 0

FrameBlock24:
	db 2 ; #
	dbsprite  0,  1,  0,  0, $0a, 0
	dbsprite  1,  1,  0,  0, $0b, 0

FrameBlock25:
	db 12 ; #
	dbsprite  0,  2,  0,  0, $0a, 0
	dbsprite  1,  2,  0,  0, $0b, 0
	dbsprite  0,  3,  0,  0, $1a, 0
	dbsprite  1,  3,  0,  0, $1b, 0
	dbsprite  2,  0,  0,  0, $0a, 0
	dbsprite  3,  0,  0,  0, $0b, 0
	dbsprite  2,  1,  0,  0, $1a, 0
	dbsprite  3,  1,  0,  0, $1b, 0
	dbsprite  4,  1,  0,  0, $0a, 0
	dbsprite  5,  1,  0,  0, $0b, 0
	dbsprite  4,  2,  0,  0, $1a, 0
	dbsprite  5,  2,  0,  0, $1b, 0

FrameBlock26:
	db 4 ; #
	dbsprite  2,  0,  0,  0, $44, 0
	dbsprite  3,  0,  0,  0, $44, OAM_HFLIP
	dbsprite  2,  1,  0,  0, $44, OAM_VFLIP
	dbsprite  3,  1,  0,  0, $44, OAM_HFLIP | OAM_VFLIP

FrameBlock27:
	db 5 ; #
	dbsprite  1,  1,  0,  0, $44, 0
	dbsprite  2,  1,  0,  0, $44, OAM_HFLIP
	dbsprite  1,  2,  0,  0, $44, OAM_VFLIP
	dbsprite  2,  2,  0,  0, $44, OAM_HFLIP | OAM_VFLIP
	dbsprite  3,  0,  0,  0, $47, 0

FrameBlock28:
	db 6 ; #
	dbsprite  0,  2,  0,  0, $44, 0
	dbsprite  1,  2,  0,  0, $44, OAM_HFLIP
	dbsprite  0,  3,  0,  0, $44, OAM_VFLIP
	dbsprite  1,  3,  0,  0, $44, OAM_HFLIP | OAM_VFLIP
	dbsprite  2,  1,  0,  0, $47, 0
	dbsprite  2,  0,  6,  2, $47, 0

FrameBlock29:
	db 4 ; #
	dbsprite  0,  3,  0,  0, $47, 0
	dbsprite  0,  2,  6,  2, $47, 0
	dbsprite  1,  1,  4,  4, $47, 0
	dbsprite  2,  0,  2,  6, $47, 0

FrameBlock2a:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $44, 0
	dbsprite  1,  0,  0,  0, $44, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $44, OAM_VFLIP
	dbsprite  1,  1,  0,  0, $44, OAM_HFLIP | OAM_VFLIP

FrameBlock2b:
	db 2 ; #
	dbsprite  0,  0,  2,  6, $47, 0
	dbsprite  1,  0,  0,  0, $47, 0

FrameBlock2c:
	db 1 ; #
	dbsprite  0, 20,  0,  0, $4d, 0

FrameBlock2d:
	db 8 ; #
	dbsprite  0,  0,  0,  0, $26, 0
	dbsprite  1,  0,  0,  0, $27, 0
	dbsprite  0,  1,  0,  0, $36, 0
	dbsprite  1,  1,  0,  0, $37, 0
	dbsprite  0,  2,  0,  0, $28, 0
	dbsprite  1,  2,  0,  0, $29, 0
	dbsprite  0,  3,  0,  0, $38, 0
	dbsprite  1,  3,  0,  0, $39, 0

FrameBlock2e:
	db 8 ; #
	dbsprite  0,  0,  0,  0, $27, OAM_HFLIP
	dbsprite  1,  0,  0,  0, $26, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $37, OAM_HFLIP
	dbsprite  1,  1,  0,  0, $36, OAM_HFLIP
	dbsprite  0,  2,  0,  0, $29, OAM_HFLIP
	dbsprite  1,  2,  0,  0, $28, OAM_HFLIP
	dbsprite  0,  3,  0,  0, $39, OAM_HFLIP
	dbsprite  1,  3,  0,  0, $38, OAM_HFLIP

FrameBlock2f:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $0c, 0
	dbsprite  1,  0,  0,  0, $0d, 0
	dbsprite  0,  1,  0,  0, $0c, OAM_VFLIP
	dbsprite  1,  1,  0,  0, $0d, OAM_VFLIP

FrameBlock30:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $44, 0
	dbsprite  1,  0,  0,  0, $44, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $44, OAM_VFLIP
	dbsprite  1,  1,  0,  0, $44, OAM_HFLIP | OAM_VFLIP

FrameBlock31:
	db 1 ; #
	dbsprite  0,  0,  0,  0, $45, 0

FrameBlock32:
	db 7 ; #
	dbsprite  0,  0,  0,  0, $4d, 0
	dbsprite  1,  0,  0,  0, $2f, 0
	dbsprite  2,  0,  0,  0, $4d, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $4e, 0
	dbsprite  1,  1,  0,  0, $07, 0
	dbsprite  2,  1,  0,  0, $4e, OAM_HFLIP
	dbsprite  1,  2,  0,  0, $3f, 0

FrameBlock33:
	db 7 ; #
	dbsprite  1,  0,  0,  0, $3f, OAM_VFLIP
	dbsprite  0,  1,  0,  0, $4e, OAM_VFLIP
	dbsprite  1,  1,  0,  0, $07, OAM_VFLIP
	dbsprite  2,  1,  0,  0, $4e, OAM_HFLIP | OAM_VFLIP
	dbsprite  0,  2,  0,  0, $4d, OAM_VFLIP
	dbsprite  1,  2,  0,  0, $2f, OAM_VFLIP
	dbsprite  2,  2,  0,  0, $4d, OAM_HFLIP | OAM_VFLIP

FrameBlock34:
	db 1 ; #
	dbsprite  0, 20,  0,  0, $00, OAM_OBP1

FrameBlock35:
	db 6 ; #
	dbsprite  0,  0,  0,  0, $2a, 0
	dbsprite  1,  0,  0,  0, $2b, 0
	dbsprite  0,  1,  0,  0, $3a, 0
	dbsprite  0,  2,  0,  0, $3a, OAM_VFLIP
	dbsprite  0,  3,  0,  0, $2a, OAM_VFLIP
	dbsprite  1,  3,  0,  0, $2b, OAM_VFLIP

FrameBlock36:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $00, 0
	dbsprite  1,  0,  0,  0, $01, 0
	dbsprite  0,  1,  0,  0, $10, 0
	dbsprite  1,  1,  0,  0, $11, 0

FrameBlock37:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $01, OAM_BEHIND_BG | OAM_HFLIP
	dbsprite  1,  0,  0,  0, $00, OAM_BEHIND_BG | OAM_HFLIP
	dbsprite  0,  1,  0,  0, $11, OAM_BEHIND_BG | OAM_HFLIP
	dbsprite  1,  1,  0,  0, $10, OAM_BEHIND_BG | OAM_HFLIP

FrameBlock38:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $0a, 0
	dbsprite  1,  0,  0,  0, $0b, 0
	dbsprite  0,  1,  0,  0, $1a, 0
	dbsprite  1,  1,  0,  0, $1b, 0

FrameBlock39:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $0b, OAM_HFLIP
	dbsprite  1,  0,  0,  0, $0a, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $1b, OAM_HFLIP
	dbsprite  1,  1,  0,  0, $1a, OAM_HFLIP

FrameBlock3a:
	db 4 ; #
	dbsprite  0,  4,  0,  0, $05, 0
	dbsprite  1,  4,  0,  0, $05, OAM_HFLIP
	dbsprite  0,  5,  0,  0, $15, 0
	dbsprite  1,  5,  0,  0, $15, OAM_HFLIP

FrameBlock3b:
	db 5 ; #
	dbsprite  0,  3,  0,  0, $04, 0
	dbsprite  1,  3,  0,  0, $04, OAM_HFLIP
	dbsprite  0,  4,  0,  0, $14, 0
	dbsprite  1,  4,  0,  0, $14, OAM_HFLIP
	dbsprite  0,  5,  4,  0, $41, 0

FrameBlock3c:
	db 6 ; #
	dbsprite  0,  2,  0,  0, $05, 0
	dbsprite  1,  2,  0,  0, $05, OAM_HFLIP
	dbsprite  0,  3,  0,  0, $15, 0
	dbsprite  1,  3,  0,  0, $15, OAM_HFLIP
	dbsprite  0,  4,  4,  0, $42, 0
	dbsprite  0,  5,  4,  0, $42, 0

FrameBlock3d:
	db 7 ; #
	dbsprite  0,  1,  0,  0, $04, 0
	dbsprite  1,  1,  0,  0, $04, OAM_HFLIP
	dbsprite  0,  2,  0,  0, $14, 0
	dbsprite  1,  2,  0,  0, $14, OAM_HFLIP
	dbsprite  0,  3,  4,  0, $41, 0
	dbsprite  0,  4,  4,  0, $41, 0
	dbsprite  0,  5,  4,  0, $41, 0

FrameBlock3e:
	db 8 ; #
	dbsprite  0,  0,  0,  0, $05, 0
	dbsprite  1,  0,  0,  0, $05, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $15, 0
	dbsprite  1,  1,  0,  0, $15, OAM_HFLIP
	dbsprite  0,  2,  4,  0, $42, 0
	dbsprite  0,  3,  4,  0, $42, 0
	dbsprite  0,  4,  4,  0, $42, 0
	dbsprite  0,  5,  4,  0, $42, 0

FrameBlock3f:
	db 8 ; #
	dbsprite  0,  0,  0,  0, $04, 0
	dbsprite  1,  0,  0,  0, $04, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $14, 0
	dbsprite  1,  1,  0,  0, $14, OAM_HFLIP
	dbsprite  0,  2,  4,  0, $41, 0
	dbsprite  0,  3,  4,  0, $41, 0
	dbsprite  0,  4,  4,  0, $41, 0
	dbsprite  0,  5,  4,  0, $41, 0

FrameBlock40:
	db 3 ; #
	dbsprite  0,  0,  0,  0, $3d, 0
	dbsprite  1,  0,  0,  0, $3d, 0
	dbsprite  1,  1,  0,  0, $3d, 0

FrameBlock41:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $06, 0
	dbsprite  1,  0,  0,  0, $06, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $16, 0
	dbsprite  1,  1,  0,  0, $17, 0

FrameBlock42:
	db 11 ; #
	dbsprite  2,  0,  0,  0, $42, 0
	dbsprite  0,  1,  0,  0, $42, 0
	dbsprite  1,  1,  0,  0, $42, 0
	dbsprite  2,  1,  0,  0, $42, 0
	dbsprite  3,  1,  0,  0, $42, 0
	dbsprite  4,  1,  0,  0, $42, 0
	dbsprite  2,  2,  0,  0, $42, 0
	dbsprite  1,  3,  0,  0, $42, 0
	dbsprite  3,  3,  0,  0, $42, 0
	dbsprite  0,  4,  0,  0, $42, 0
	dbsprite  4,  4,  0,  0, $42, 0

FrameBlock43:
	db 11 ; #
	dbsprite  2,  0,  0,  0, $41, 0
	dbsprite  0,  1,  0,  0, $41, 0
	dbsprite  1,  1,  0,  0, $41, 0
	dbsprite  2,  1,  0,  0, $41, 0
	dbsprite  3,  1,  0,  0, $41, 0
	dbsprite  4,  1,  0,  0, $41, 0
	dbsprite  2,  2,  0,  0, $41, 0
	dbsprite  1,  3,  0,  0, $41, 0
	dbsprite  3,  3,  0,  0, $41, 0
	dbsprite  0,  4,  0,  0, $41, 0
	dbsprite  4,  4,  0,  0, $41, 0

FrameBlock44:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $49, 0
	dbsprite  5,  0,  0,  0, $49, 0
	dbsprite  0,  5,  0,  0, $49, 0
	dbsprite  5,  5,  0,  0, $49, 0

FrameBlock45:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $49, 0
	dbsprite  3,  0,  0,  0, $49, 0
	dbsprite  0,  3,  0,  0, $49, 0
	dbsprite  3,  3,  0,  0, $49, 0

FrameBlock46:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $49, 0
	dbsprite  1,  0,  0,  0, $49, 0
	dbsprite  0,  1,  0,  0, $49, 0
	dbsprite  1,  1,  0,  0, $49, 0

FrameBlock47:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $43, 0
	dbsprite  1,  0,  0,  0, $43, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $43, OAM_VFLIP
	dbsprite  1,  1,  0,  0, $43, OAM_HFLIP | OAM_VFLIP

SmallBlackCircleFrameBlock:
	db 4 ; #
	dbsprite  1,  1,  0,  0, $33, 0
	dbsprite  2,  1,  0,  0, $33, OAM_HFLIP
	dbsprite  1,  2,  0,  0, $33, OAM_VFLIP
	dbsprite  2,  2,  0,  0, $33, OAM_HFLIP | OAM_VFLIP

LargeBlackCircleFrameBlock:
	db 16 ; #
	dbsprite  0,  0,  0,  0, $22, 0
	dbsprite  1,  0,  0,  0, $23, 0
	dbsprite  2,  0,  0,  0, $23, OAM_HFLIP
	dbsprite  3,  0,  0,  0, $22, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $32, 0
	dbsprite  1,  1,  0,  0, $43, 0
	dbsprite  2,  1,  0,  0, $43, OAM_HFLIP
	dbsprite  3,  1,  0,  0, $32, OAM_HFLIP
	dbsprite  0,  2,  0,  0, $32, OAM_VFLIP
	dbsprite  1,  2,  0,  0, $43, OAM_VFLIP
	dbsprite  2,  2,  0,  0, $43, OAM_HFLIP | OAM_VFLIP
	dbsprite  3,  2,  0,  0, $32, OAM_HFLIP | OAM_VFLIP
	dbsprite  0,  3,  0,  0, $22, OAM_VFLIP
	dbsprite  1,  3,  0,  0, $23, OAM_VFLIP
	dbsprite  2,  3,  0,  0, $23, OAM_HFLIP | OAM_VFLIP
	dbsprite  3,  3,  0,  0, $22, OAM_HFLIP | OAM_VFLIP

FrameBlock71:
	db 16 ; #
	dbsprite  0,  0,  0,  0, $22, 0
	dbsprite  1,  0,  0,  0, $3b, 0
	dbsprite  2,  0,  0,  0, $23, OAM_HFLIP
	dbsprite  3,  0,  0,  0, $22, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $32, 0
	dbsprite  1,  1,  0,  0, $43, 0
	dbsprite  2,  1,  0,  0, $43, OAM_HFLIP
	dbsprite  3,  1,  0,  0, $32, OAM_HFLIP
	dbsprite  0,  2,  0,  0, $32, OAM_VFLIP
	dbsprite  1,  2,  0,  0, $43, OAM_VFLIP
	dbsprite  2,  2,  0,  0, $43, OAM_HFLIP | OAM_VFLIP
	dbsprite  3,  2,  0,  0, $32, OAM_HFLIP | OAM_VFLIP
	dbsprite  0,  3,  0,  0, $22, OAM_VFLIP
	dbsprite  1,  3,  0,  0, $23, OAM_VFLIP
	dbsprite  2,  3,  0,  0, $23, OAM_HFLIP | OAM_VFLIP
	dbsprite  3,  3,  0,  0, $22, OAM_HFLIP | OAM_VFLIP

FrameBlock72:
	db 12 ; #
	dbsprite  0,  0,  0,  0, $32, 0
	dbsprite  1,  0,  0,  0, $43, 0
	dbsprite  2,  0,  0,  0, $43, OAM_HFLIP
	dbsprite  3,  0,  0,  0, $32, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $32, OAM_VFLIP
	dbsprite  1,  1,  0,  0, $43, OAM_VFLIP
	dbsprite  2,  1,  0,  0, $43, OAM_HFLIP | OAM_VFLIP
	dbsprite  3,  1,  0,  0, $32, OAM_HFLIP | OAM_VFLIP
	dbsprite  0,  2,  0,  0, $22, OAM_VFLIP
	dbsprite  1,  2,  0,  0, $23, OAM_VFLIP
	dbsprite  2,  2,  0,  0, $23, OAM_HFLIP | OAM_VFLIP
	dbsprite  3,  2,  0,  0, $22, OAM_HFLIP | OAM_VFLIP

FrameBlock73:
	db 8 ; #
	dbsprite  0,  0,  0,  0, $32, OAM_VFLIP
	dbsprite  1,  0,  0,  0, $43, OAM_VFLIP
	dbsprite  2,  0,  0,  0, $43, OAM_HFLIP | OAM_VFLIP
	dbsprite  3,  0,  0,  0, $32, OAM_HFLIP | OAM_VFLIP
	dbsprite  0,  1,  0,  0, $22, OAM_VFLIP
	dbsprite  1,  1,  0,  0, $23, OAM_VFLIP
	dbsprite  2,  1,  0,  0, $23, OAM_HFLIP | OAM_VFLIP
	dbsprite  3,  1,  0,  0, $22, OAM_HFLIP | OAM_VFLIP

FrameBlock74:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $22, OAM_VFLIP
	dbsprite  1,  0,  0,  0, $23, OAM_VFLIP
	dbsprite  2,  0,  0,  0, $23, OAM_HFLIP | OAM_VFLIP
	dbsprite  3,  0,  0,  0, $22, OAM_HFLIP | OAM_VFLIP

FrameBlock4a:
	db 4 ; #
	dbsprite  3,  1,  0,  0, $4c, OAM_HFLIP
	dbsprite  1,  4,  0,  0, $4b, 0
	dbsprite  4,  6,  0,  0, $4c, 0
	dbsprite  6,  3,  0,  0, $4b, OAM_VFLIP

FrameBlock4b:
	db 4 ; #
	dbsprite  3,  0,  0,  0, $4c, 0
	dbsprite  0,  4,  0,  0, $4b, OAM_VFLIP
	dbsprite  4,  7,  0,  0, $4c, OAM_HFLIP
	dbsprite  7,  3,  0,  0, $4b, 0

FrameBlock4c:
	db 4 ; #
	dbsprite  1,  2,  0,  0, $4a, OAM_VFLIP
	dbsprite  2,  6,  0,  0, $4a, 0
	dbsprite  6,  5,  0,  0, $4a, OAM_HFLIP
	dbsprite  5,  1,  0,  0, $4a, OAM_HFLIP | OAM_VFLIP

FrameBlock4d:
	db 4 ; #
	dbsprite  0,  1,  0,  0, $4a, OAM_HFLIP
	dbsprite  1,  7,  0,  0, $4a, OAM_HFLIP | OAM_VFLIP
	dbsprite  7,  6,  0,  0, $4a, OAM_VFLIP
	dbsprite  6,  0,  0,  0, $4a, 0

FrameBlock4e:
	db 8 ; #
	dbsprite  6,  0,  0,  0, $44, 0
	dbsprite  7,  0,  0,  0, $44, OAM_HFLIP
	dbsprite  6,  1,  0,  0, $44, OAM_VFLIP
	dbsprite  7,  1,  0,  0, $44, OAM_HFLIP | OAM_VFLIP
	dbsprite  1,  4,  2,  6, $44, 0
	dbsprite  2,  4,  2,  6, $44, OAM_HFLIP
	dbsprite  1,  5,  2,  6, $44, OAM_VFLIP
	dbsprite  2,  5,  2,  6, $44, OAM_HFLIP | OAM_VFLIP

FrameBlock4f:
	db 12 ; #
	dbsprite  4,  1,  2,  6, $44, 0
	dbsprite  5,  1,  2,  6, $44, OAM_HFLIP
	dbsprite  4,  2,  2,  6, $44, OAM_VFLIP
	dbsprite  5,  2,  2,  6, $44, OAM_HFLIP | OAM_VFLIP
	dbsprite  6,  0,  2,  6, $47, 0
	dbsprite  7,  0,  0,  0, $47, 0
	dbsprite  2,  3,  6,  2, $44, 0
	dbsprite  3,  3,  6,  2, $44, OAM_HFLIP
	dbsprite  2,  4,  6,  2, $44, OAM_VFLIP
	dbsprite  3,  4,  6,  2, $44, OAM_HFLIP | OAM_VFLIP
	dbsprite  1,  6,  0,  0, $47, 0
	dbsprite  1,  5,  6,  2, $47, 0

FrameBlock50:
	db 8 ; #
	dbsprite  6,  0,  2,  6, $47, 0
	dbsprite  7,  0,  0,  0, $47, 0
	dbsprite  4,  2,  6,  2, $47, 0
	dbsprite  5,  1,  4,  4, $47, 0
	dbsprite  3,  3,  2,  6, $47, 0
	dbsprite  4,  3,  0,  0, $47, 0
	dbsprite  1,  5,  6,  2, $47, 0
	dbsprite  2,  4,  4,  4, $47, 0

FrameBlock51:
	db 8 ; #
	dbsprite  0,  0,  0,  0, $35, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $35, OAM_VFLIP
	dbsprite  0,  2,  0,  0, $35, 0
	dbsprite  0,  3,  0,  0, $35, OAM_HFLIP | OAM_VFLIP
	dbsprite  8,  0,  0,  0, $35, 0
	dbsprite  8,  1,  0,  0, $35, OAM_HFLIP | OAM_VFLIP
	dbsprite  8,  2,  0,  0, $35, OAM_HFLIP
	dbsprite  8,  3,  0,  0, $35, OAM_VFLIP

FrameBlock52:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $2a, 0
	dbsprite  1,  0,  0,  0, $2b, 0
	dbsprite  0,  1,  0,  0, $3a, 0
	dbsprite  1,  1,  0,  0, $3b, 0

FrameBlock53:
	db 3 ; #
	dbsprite  0,  0,  0,  0, $3f, 0
	dbsprite  1,  0,  0,  0, $3f, 0
	dbsprite  0,  1,  6,  0, $3f, 0

FrameBlock54:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $0e, 0
	dbsprite  1,  0,  0,  0, $0e, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $0f, 0
	dbsprite  1,  1,  0,  0, $0f, OAM_HFLIP

FrameBlock55:
	db 3 ; #
	dbsprite  0,  2,  0,  0, $2c, 0
	dbsprite  1,  2,  0,  0, $3c, 0
	dbsprite  2,  2,  0,  0, $2d, 0

FrameBlock56:
	db 6 ; #
	dbsprite  2,  2,  0,  0, $31, 0
	dbsprite  3,  2,  0,  0, $31, 0
	dbsprite  2,  1,  0,  0, $2c, 0
	dbsprite  3,  1,  0,  0, $3c, 0
	dbsprite  4,  1,  0,  0, $2d, 0
	dbsprite  4,  2,  0,  0, $2d, 0

FrameBlock57:
	db 9 ; #
	dbsprite  4,  1,  0,  0, $31, 0
	dbsprite  4,  2,  0,  0, $31, 0
	dbsprite  5,  1,  0,  0, $31, 0
	dbsprite  5,  2,  0,  0, $31, 0
	dbsprite  4,  0,  0,  0, $2c, 0
	dbsprite  5,  0,  0,  0, $3c, 0
	dbsprite  6,  0,  0,  0, $2d, 0
	dbsprite  6,  1,  0,  0, $2d, 0
	dbsprite  6,  2,  0,  0, $2d, 0

FrameBlock58:
	db 7 ; #
	dbsprite  0,  0,  0,  0, $46, 0
	dbsprite  0,  1,  2,  0, $47, 0
	dbsprite  0,  2,  3,  0, $48, 0
	dbsprite  0,  3,  4,  0, $48, 0
	dbsprite  0,  4,  5,  0, $48, 0
	dbsprite  0,  5,  5,  0, $48, 0
	dbsprite  0,  6,  5,  0, $48, 0

FrameBlock59:
	db 1 ; #
	dbsprite  0,  0,  0,  0, $42, 0

FrameBlock5a:
	db 12 ; #
	dbsprite  0,  0,  0,  0, $24, 0
	dbsprite  1,  0,  0,  0, $25, 0
	dbsprite  0,  1,  0,  0, $34, 0
	dbsprite  2,  0,  0,  0, $25, OAM_HFLIP
	dbsprite  3,  0,  0,  0, $24, OAM_HFLIP
	dbsprite  3,  1,  0,  0, $34, OAM_HFLIP
	dbsprite  0,  2,  0,  0, $34, OAM_VFLIP
	dbsprite  0,  3,  0,  0, $24, OAM_VFLIP
	dbsprite  1,  3,  0,  0, $25, OAM_VFLIP
	dbsprite  3,  2,  0,  0, $34, OAM_HFLIP | OAM_VFLIP
	dbsprite  2,  3,  0,  0, $25, OAM_HFLIP | OAM_VFLIP
	dbsprite  3,  3,  0,  0, $24, OAM_HFLIP | OAM_VFLIP

FrameBlock5b:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $43, 0
	dbsprite  1,  0,  0,  0, $43, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $43, OAM_VFLIP
	dbsprite  1,  1,  0,  0, $43, OAM_HFLIP | OAM_VFLIP

FrameBlock5c:
	db 8 ; #
	dbsprite  0,  0,  0,  0, $49, 0
	dbsprite  1,  0,  0,  2, $49, 0
	dbsprite  0,  3,  0,  0, $49, 0
	dbsprite  2,  2,  0,  0, $49, 0
	dbsprite  0,  1,  0,  0, $43, 0
	dbsprite  1,  1,  0,  0, $43, OAM_HFLIP
	dbsprite  0,  2,  0,  0, $43, OAM_VFLIP
	dbsprite  1,  2,  0,  0, $43, OAM_HFLIP | OAM_VFLIP

FrameBlock5d:
	db 11 ; #
	dbsprite  0,  0,  0,  0, $49, 0
	dbsprite  0,  3,  2,  0, $49, 0
	dbsprite  2,  2,  0,  4, $49, 0
	dbsprite  0,  1,  0,  0, $43, 0
	dbsprite  1,  0,  0,  0, $43, OAM_HFLIP
	dbsprite  0,  2,  0,  0, $43, OAM_VFLIP
	dbsprite  1,  2,  0,  0, $43, OAM_HFLIP | OAM_VFLIP
	dbsprite  1,  0,  0,  4, $43, 0
	dbsprite  2,  0,  0,  4, $43, OAM_HFLIP
	dbsprite  1,  1,  0,  4, $43, OAM_VFLIP
	dbsprite  2,  1,  0,  4, $43, OAM_HFLIP | OAM_VFLIP

FrameBlock5e:
	db 15 ; #
	dbsprite  1,  0,  0,  0, $49, 0
	dbsprite  2,  1,  0,  0, $49, 0
	dbsprite  0,  4,  0,  0, $49, 0
	dbsprite  0,  1,  0,  0, $43, 0
	dbsprite  1,  1,  0,  0, $43, OAM_HFLIP
	dbsprite  0,  2,  0,  0, $43, OAM_VFLIP
	dbsprite  1,  2,  0,  0, $43, OAM_HFLIP | OAM_VFLIP
	dbsprite  2,  2,  0,  0, $43, 0
	dbsprite  3,  2,  0,  0, $43, OAM_HFLIP
	dbsprite  2,  3,  0,  0, $43, OAM_VFLIP
	dbsprite  3,  3,  0,  0, $43, OAM_HFLIP | OAM_VFLIP
	dbsprite  1,  4,  0,  0, $43, 0
	dbsprite  2,  4,  0,  0, $43, OAM_HFLIP
	dbsprite  1,  5,  0,  0, $43, OAM_VFLIP
	dbsprite  2,  5,  0,  0, $43, OAM_HFLIP | OAM_VFLIP

FrameBlock5f:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $49, 0
	dbsprite  2,  0,  0,  0, $49, 0
	dbsprite  4,  0,  0,  0, $49, 0
	dbsprite  6,  0,  0,  0, $49, 0

FrameBlock60:
	db 8 ; #
	dbsprite  0,  0,  0,  0, $49, 0
	dbsprite  2,  0,  0,  0, $49, 0
	dbsprite  4,  0,  0,  0, $49, 0
	dbsprite  6,  0,  0,  0, $49, 0
	dbsprite  1,  1,  0,  0, $49, 0
	dbsprite  3,  1,  0,  0, $49, 0
	dbsprite  5,  1,  0,  0, $49, 0
	dbsprite  7,  1,  0,  0, $49, 0

FrameBlock61:
	db 12 ; #
	dbsprite  0,  0,  0,  0, $49, 0
	dbsprite  2,  0,  0,  0, $49, 0
	dbsprite  4,  0,  0,  0, $49, 0
	dbsprite  6,  0,  0,  0, $49, 0
	dbsprite  1,  1,  0,  0, $49, 0
	dbsprite  3,  1,  0,  0, $49, 0
	dbsprite  5,  1,  0,  0, $49, 0
	dbsprite  7,  1,  0,  0, $49, 0
	dbsprite  0,  2,  0,  0, $49, 0
	dbsprite  2,  2,  0,  0, $49, 0
	dbsprite  4,  2,  0,  0, $49, 0
	dbsprite  6,  2,  0,  0, $49, 0

FrameBlock62:
	db 15 ; #
	dbsprite  0,  0,  0,  0, $49, 0
	dbsprite  2,  0,  0,  0, $49, 0
	dbsprite  4,  0,  0,  0, $49, 0
	dbsprite  6,  0,  0,  0, $49, 0
	dbsprite  1,  1,  0,  0, $49, 0
	dbsprite  3,  1,  0,  0, $49, 0
	dbsprite  5,  1,  0,  0, $49, 0
	dbsprite  7,  1,  0,  0, $49, 0
	dbsprite  0,  2,  0,  0, $49, 0
	dbsprite  2,  2,  0,  0, $49, 0
	dbsprite  4,  2,  0,  0, $49, 0
	dbsprite  6,  2,  0,  0, $49, 0
	dbsprite  1,  3,  0,  0, $49, 0
	dbsprite  3,  3,  0,  0, $49, 0
	dbsprite  5,  3,  0,  0, $49, 0
	dbsprite  7,  3,  0,  0, $49, 0

FrameBlock63:
	db 6 ; #
	dbsprite  0,  2,  0,  0, $26, 0
	dbsprite  1,  2,  0,  0, $27, 0
	dbsprite  2,  1,  0,  0, $26, 0
	dbsprite  3,  1,  0,  0, $27, 0
	dbsprite  4,  0,  0,  0, $26, 0
	dbsprite  5,  0,  0,  0, $27, 0

FrameBlock64:
	db 6 ; #
	dbsprite  0,  3,  0,  0, $27, 0
	dbsprite  1,  2,  0,  0, $26, 0
	dbsprite  2,  2,  0,  0, $27, 0
	dbsprite  3,  1,  0,  0, $26, 0
	dbsprite  4,  1,  0,  0, $27, 0
	dbsprite  5,  0,  0,  0, $26, 0

FrameBlock65:
	db 6 ; #
	dbsprite  0,  0,  0,  0, $1c, 0
	dbsprite  1,  0,  0,  0, $1d, 0
	dbsprite  0,  2,  0,  0, $1c, 0
	dbsprite  1,  2,  0,  0, $1d, 0
	dbsprite  0,  4,  0,  0, $1c, 0
	dbsprite  1,  4,  0,  0, $1d, 0

FrameBlock66:
	db 2 ; #
	dbsprite  0,  0,  0,  0, $03, 0
	dbsprite  0,  1,  0,  0, $13, 0

FrameBlock67:
	db 1 ; #
	dbsprite  0,  0,  0,  0, $03, 0

FrameBlock68:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $03, 0
	dbsprite  1,  0,  0,  0, $03, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $13, 0
	dbsprite  1,  1,  0,  0, $13, OAM_HFLIP

FrameBlock69:
	db 1 ; #
	dbsprite  0,  0,  0,  0, $06, 0

FrameBlock6a:
	db 8 ; #
	dbsprite  0,  0,  0,  0, $2e, 0
	dbsprite  6,  0,  0,  0, $2e, OAM_HFLIP
	dbsprite  0,  6,  0,  0, $2e, OAM_VFLIP
	dbsprite  6,  6,  0,  0, $2e, OAM_HFLIP | OAM_VFLIP
	dbsprite  3,  0,  0,  0, $2f, 0
	dbsprite  3,  6,  0,  0, $2f, OAM_VFLIP
	dbsprite  0,  3,  0,  0, $3e, 0
	dbsprite  6,  3,  0,  0, $3e, OAM_HFLIP

FrameBlock6b:
	db 8 ; #
	dbsprite  0,  0,  0,  0, $2e, 0
	dbsprite  4,  0,  0,  0, $2e, OAM_HFLIP
	dbsprite  0,  4,  0,  0, $2e, OAM_VFLIP
	dbsprite  4,  4,  0,  0, $2e, OAM_HFLIP | OAM_VFLIP
	dbsprite  2,  0,  0,  0, $2f, 0
	dbsprite  2,  4,  0,  0, $2f, OAM_VFLIP
	dbsprite  0,  2,  0,  0, $3e, 0
	dbsprite  4,  2,  0,  0, $3e, OAM_HFLIP

FrameBlock6c:
	db 8 ; #
	dbsprite  0,  0,  0,  0, $2e, 0
	dbsprite  2,  0,  0,  0, $2e, OAM_HFLIP
	dbsprite  0,  2,  0,  0, $2e, OAM_VFLIP
	dbsprite  2,  2,  0,  0, $2e, OAM_HFLIP | OAM_VFLIP
	dbsprite  1,  0,  0,  0, $2f, 0
	dbsprite  1,  2,  0,  0, $2f, OAM_VFLIP
	dbsprite  0,  1,  0,  0, $3e, 0
	dbsprite  2,  1,  0,  0, $3e, OAM_HFLIP

FrameBlock6d:
	db 2 ; #
	dbsprite  0,  0,  0,  0, $1e, 0
	dbsprite  1,  0,  0,  0, $1f, 0

FrameBlock6e:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $48, 0
	dbsprite  1,  0,  0,  0, $48, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $12, 0
	dbsprite  1,  1,  0,  0, $12, OAM_HFLIP

FrameBlock6f:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $4a, 0
	dbsprite  1,  0,  0,  0, $07, 0
	dbsprite  0,  1,  0,  0, $16, 0
	dbsprite  1,  1,  0,  0, $17, 0

FrameBlock70:
	db 4 ; #
	dbsprite  0,  0,  0,  0, $07, OAM_HFLIP
	dbsprite  1,  0,  0,  0, $4a, OAM_HFLIP
	dbsprite  0,  1,  0,  0, $17, OAM_HFLIP
	dbsprite  1,  1,  0,  0, $16, OAM_HFLIP

FrameBlock76:
	db 7 ; #
	dbsprite  2,  0,  0,  0, $2f, 0
	dbsprite  1,  0,  0,  1, $2f, 0
	dbsprite  3,  0,  0,  1, $2f, 0
	dbsprite  0,  0,  0,  2, $2e, 0
	dbsprite  4,  0,  0,  2, $2e, OAM_HFLIP
	dbsprite  0,  1,  0,  2, $3e, 0
	dbsprite  4,  1,  0,  2, $3e, OAM_HFLIP

FrameBlock77:
	db 4 ; #
	dbsprite  0,  0,  2,  0, $4b, 0
	dbsprite  1,  0,  2,  0, $4c, 0
	dbsprite  0,  1,  0,  0, $4c, OAM_HFLIP | OAM_VFLIP
	dbsprite  1,  1,  0,  0, $4b, OAM_HFLIP | OAM_VFLIP

FrameBlock78:
	db 1 ; #
	dbsprite  0,  0,  0,  0, $4d, 0

FrameBlock79:
	db 1 ; #
	dbsprite  0,  0,  0,  0, $4e, 0

INCLUDE "data/battle_anims/base_coords.asm"

FrameBlock00:
	db 0 ; #

	db $00 ; unused
