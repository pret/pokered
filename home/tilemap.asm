FillMemory::
; Fill bc bytes at hl with a.
	push de
	ld d, a
.loop
	ld a, d
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	pop de
	ret

UncompressSpriteFromDE::
; Decompress pic at a:de.
	ld hl, wSpriteInputPtr
	ld [hl], e
	inc hl
	ld [hl], d
	jp UncompressSpriteData

SaveScreenTilesToBuffer2::
	hlcoord 0, 0
	ld de, wTileMapBackup2
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyData
	ret

LoadScreenTilesFromBuffer2::
	call LoadScreenTilesFromBuffer2DisableBGTransfer
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	ret

; loads screen tiles stored in wTileMapBackup2 but leaves hAutoBGTransferEnabled disabled
LoadScreenTilesFromBuffer2DisableBGTransfer::
	xor a
	ldh [hAutoBGTransferEnabled], a
	ld hl, wTileMapBackup2
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyData
	ret

SaveScreenTilesToBuffer1::
	hlcoord 0, 0
	ld de, wTileMapBackup
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	jp CopyData

LoadScreenTilesFromBuffer1::
	xor a
	ldh [hAutoBGTransferEnabled], a
	ld hl, wTileMapBackup
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyData
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	ret
