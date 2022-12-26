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

; PureRGBnote: CHANGED: refactored the below code a bit to use less space. Does the same thing it always did but with less space taken up.

SaveScreenTilesToBuffer2::
	ld de, wTileMapBackup2
	jr SaveScreenTilesCommon

SaveScreenTilesToBuffer1::
	ld de, wTileMapBackup
	; fall through
SaveScreenTilesCommon:
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	jp CopyData

LoadScreenTilesFromBuffer2::
	call LoadScreenTilesFromBuffer2DisableBGTransfer
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	ret

; loads screen tiles stored in wTileMapBackup2 but leaves hAutoBGTransferEnabled disabled
LoadScreenTilesFromBuffer2DisableBGTransfer::
	ld hl, wTileMapBackup2
	jp LoadScreenTilesCommon

LoadScreenTilesFromBuffer1::
	ld hl, wTileMapBackup
	call LoadScreenTilesCommon
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	ret

LoadScreenTilesCommon:
	xor a
	ldh [hAutoBGTransferEnabled], a
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	jp CopyData
	