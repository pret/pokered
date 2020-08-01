TalkToTrainer::
	call StoreTrainerHeaderPointer
	xor a
	call ReadTrainerHeaderInfo     ; read flag's bit
	ld a, $2
	call ReadTrainerHeaderInfo     ; read flag's byte ptr
	ld a, $4
	call ReadTrainerHeaderInfo     ; print before battle text
	call PrintText
	ld a, $a
	call ReadTrainerHeaderInfo     ; (?) does nothing apparently (maybe bug in ReadTrainerHeaderInfo)
	push de
	ld a, $8
	call ReadTrainerHeaderInfo     ; read end battle text
	pop de
	call SaveEndBattleTextPointers
	ld hl, wFlags_D733
	set 4, [hl]                    ; activate map script index override (index is set below)
	ld hl, wFlags_0xcd60
	bit 0, [hl]                    ; test if player is already engaging the trainer (because the trainer saw the player)
	ret nz
; if the player talked to the trainer of his own volition
	call EngageMapTrainer
	ld hl, wCurMapScript
	inc [hl]      ; increment map script index before StartTrainerBattle increments it again (next script function is usually EndTrainerBattle)
	jp StartTrainerBattle
