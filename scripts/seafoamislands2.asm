SeafoamIslands2Script: ; 46315 (11:6315)
	call EnableAutoTextBoxDrawing
	ld hl, wFlags_0xcd60
	bit 7, [hl]
	res 7, [hl]
	jr z, .asm_46362 ; 0x4631f $41
	ld hl, Seafoam2HolesCoords
	call CheckBoulderCoords
	ret nc
	ld hl, wd87f
	ld a, [wWhichTrade]
	cp $1
	jr nz, .asm_46340 ; 0x46330 $e
	set 0, [hl]
	ld a, $d9
	ld [wd079], a
	ld a, $db
	ld [wd07a], a
	jr .asm_4634c ; 0x4633e $c
.asm_46340
	set 1, [hl]
	ld a, $da
	ld [wd079], a
	ld a, $dc
	ld [wd07a], a
.asm_4634c
	ld a, [wd079]
	ld [wcc4d], a
	predef HideObject
	ld a, [wd07a]
	ld [wcc4d], a
	predef_jump ShowObject
.asm_46362
	ld a, $a0
	ld [wDungeonWarpDestinationMap], a
	ld hl, Seafoam2HolesCoords
	jp Func_46981

Seafoam2HolesCoords: ; 4636d (11:636d)
	db $06,$12
	db $06,$17
	db $ff

SeafoamIslands2TextPointers: ; 46372 (11:6372)
	dw BoulderText
	dw BoulderText
