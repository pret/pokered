LeechSeedEffect_: ; 2bea9 (a:7ea9)
	callab MoveHitTest
	ld a, [W_MOVEMISSED] ; $d05f
	and a
	jr nz, .asm_2bee7
	ld hl, W_ENEMYBATTSTATUS2 ; $d068
	ld de, W_ENEMYMONTYPE1 ; $cfea (aliases: W_ENEMYMONTYPES)
	ld a, [H_WHOSETURN] ; $fff3
	and a
	jr z, .asm_2bec8
	ld hl, W_PLAYERBATTSTATUS2 ; $d063
	ld de, W_PLAYERMONTYPE1 ; $d019 (aliases: W_PLAYERMONTYPES)
.asm_2bec8
	ld a, [de]
	cp GRASS
	jr z, .asm_2bee7
	inc de
	ld a, [de]
	cp GRASS
	jr z, .asm_2bee7
	bit 7, [hl]
	jr nz, .asm_2bee7
	set 7, [hl]
	callab Func_3fba8
	ld hl, WasSeededText ; $7ef2
	jp PrintText
.asm_2bee7
	ld c, $32
	call DelayFrames
	ld hl, EvadedAttackText ; $7ef7
	jp PrintText

WasSeededText: ; 2bef2 (a:7ef2)
	TX_FAR _WasSeededText
	db "@"

EvadedAttackText: ; 2bef7 (a:7ef7)
	TX_FAR _EvadedAttackText
	db "@"
