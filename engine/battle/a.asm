LeechSeedEffect_: ; 2bea9 (a:7ea9)
	callab MoveHitTest
	ld a, [W_MOVEMISSED] ; W_MOVEMISSED
	and a
	jr nz, .asm_2bee7
	ld hl, W_ENEMYBATTSTATUS2 ; W_ENEMYBATTSTATUS2
	ld de, wEnemyMonType1 ; wcfea (aliases: wEnemyMonType)
	ld a, [H_WHOSETURN] ; $fff3
	and a
	jr z, .asm_2bec8
	ld hl, W_PLAYERBATTSTATUS2 ; W_PLAYERBATTSTATUS2
	ld de, wBattleMonType1 ; wd019 (aliases: wBattleMonType)
.asm_2bec8
	ld a, [de]
	cp GRASS
	jr z, .asm_2bee7
	inc de
	ld a, [de]
	cp GRASS
	jr z, .asm_2bee7
	bit Seeded, [hl]
	jr nz, .asm_2bee7
	set Seeded, [hl]
	callab PlayCurrentMoveAnimation
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
