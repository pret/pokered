LoadWildData::
	ld hl, WildDataPointers
	ld a, [wCurMap]
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld [wGrassRate], a ; same as [wLinkEnemyTrainerName]
	and a
	jr z, .NoGrassData
	push hl
	ld de, wGrassMons
	ld bc, $14
	call CopyData
	pop hl
	ld bc, $14
	add hl, bc
.NoGrassData
	ld a, [hli]
	ld [wWaterRate], a
	and a
	ret z
	ld de, wWaterMons
	ld bc, $14
	jp CopyData

INCLUDE "data/wild/grass_water.asm"
