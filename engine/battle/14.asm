Func_525af: ; 525af (14:65af)
	ld a, [$ffd7]
	ld [$d0d4], a
	xor a
	ld [$cd6a], a
	ld [$cf0b], a
	ld hl, $cc2b
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [wListScrollOffset], a ; $cc36
	ld [$d05e], a
	ld [W_PLAYERMONID], a
	ld [W_PLAYERMONSALIVEFLAGS], a
	ld [wPlayerMonNumber], a ; $cc2f
	ld [$d078], a
	ld [$d35d], a
	ld hl, $cf1d
	ld [hli], a
	ld [hl], a
	ld hl, $ccd3
	ld b, $3c
.asm_525e1
	ld [hli], a
	dec b
	jr nz, .asm_525e1
	inc a
	ld [$ccd9], a
	ld a, [W_CURMAP] ; $d35e
	cp SAFARI_ZONE_EAST
	jr c, .asm_525f9
	cp SAFARI_ZONE_REST_HOUSE_1
	jr nc, .asm_525f9
	ld a, $2
	ld [W_BATTLETYPE], a ; $d05a
.asm_525f9
	ld hl, PlayBattleMusic
	ld b, BANK(PlayBattleMusic)
	jp Bankswitch

ParalyzeEffect_: ; 52601 (14:6601)
	ld hl, W_ENEMYMONSTATUS ; $cfe9
	ld de, W_PLAYERMOVETYPE ; $cfd5
	ld a, [H_WHOSETURN] ; $fff3
	and a
	jp z, .asm_52613
	ld hl, W_PLAYERMONSTATUS ; $d018
	ld de, W_ENEMYMOVETYPE ; $cfcf

.asm_52613
	ld a, [hl]
	and a
	jr nz, .asm_52659
	ld a, [de]
	cp EVASION_DOWN1_EFFECT
	jr nz, .asm_5262a
	ld b, h
	ld c, l
	inc bc
	ld a, [bc]
	cp $4
	jr z, .asm_52666
	inc bc
	ld a, [bc]
	cp $4
	jr z, .asm_52666
.asm_5262a
	push hl
	callab MoveHitTest
	pop hl
	ld a, [W_MOVEMISSED] ; $d05f
	and a
	jr nz, .asm_52659
	set 6, [hl]
	callab Func_3ed27
	ld c, $1e
	call DelayFrames
	callab Func_3fba8
	ld hl, PrintMayNotAttackText
	ld b, BANK(PrintMayNotAttackText)
	jp Bankswitch
.asm_52659
	ld c, $32
	call DelayFrames
	ld hl, PrintDidntAffectText
	ld b, BANK(PrintDidntAffectText)
	jp Bankswitch
.asm_52666
	ld c, $32
	call DelayFrames
	ld hl, PrintDoesntAffectText
	ld b, BANK(PrintDoesntAffectText)
	jp Bankswitch
