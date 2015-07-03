; bankswitches and runs _UncompressSpriteData
; bank is given in a, sprite input stream is pointed to in W_SPRITEINPUTPTR
UncompressSpriteData:: ; 24fd (0:24fd)
	ld b, a
	ld a, [H_LOADEDROMBANK]
	push af
	ld a, b
	ld [H_LOADEDROMBANK], a
	ld [MBC1RomBank], a
	ld a, $a
	ld [$0], a
	xor a
	ld [$4000], a
	call _UncompressSpriteData
	pop af
	ld [H_LOADEDROMBANK], a
	ld [MBC1RomBank], a
	ret

; initializes necessary data to load a sprite and runs UncompressSpriteDataLoop
_UncompressSpriteData:: ; 251a (0:251a)
	ld hl, S_SPRITEBUFFER1
	ld c, (2*SPRITEBUFFERSIZE) % $100
	ld b, (2*SPRITEBUFFERSIZE) / $100
	xor a
	call FillMemory           ; clear sprite buffer 1 and 2
	ld a, $1
	ld [W_SPRITEINPUTBITCOUNTER], a
	ld a, $3
	ld [W_SPRITEOUTPUTBITOFFSET], a
	xor a
	ld [W_SPRITECURPOSX], a
	ld [W_SPRITECURPOSY], a
	ld [W_SPRITELOADFLAGS], a
	call ReadNextInputByte    ; first byte of input determines sprite width (high nybble) and height (low nybble) in tiles (8x8 pixels)
	ld b, a
	and $f
	add a
	add a
	add a
	ld [W_SPRITEHEIGHT], a
	ld a, b
	swap a
	and $f
	add a
	add a
	add a
	ld [W_SPRITEWITDH], a
	call ReadNextInputBit
	ld [W_SPRITELOADFLAGS], a ; initialite bit1 to 0 and bit0 to the first input bit
				  ; this will load two chunks of data to S_SPRITEBUFFER1 and S_SPRITEBUFFER2
				  ; bit 0 decides in which one the first chunk is placed
	; fall through

; uncompresses a chunk from the sprite input data stream (pointed to at wd0da) into S_SPRITEBUFFER1 or S_SPRITEBUFFER2
; each chunk is a 1bpp sprite. A 2bpp sprite consist of two chunks which are merged afterwards
; note that this is an endless loop which is terminated during a call to MoveToNextBufferPosition by manipulating the stack
UncompressSpriteDataLoop:: ; 2556 (0:2556)
	ld hl, S_SPRITEBUFFER1
	ld a, [W_SPRITELOADFLAGS]
	bit 0, a
	jr z, .useSpriteBuffer1    ; check which buffer to use
	ld hl, S_SPRITEBUFFER2
.useSpriteBuffer1
	call StoreSpriteOutputPointer
	ld a, [W_SPRITELOADFLAGS]
	bit 1, a
	jr z, .startDecompression  ; check if last iteration
	call ReadNextInputBit      ; if last chunk, read 1-2 bit unpacking mode
	and a
	jr z, .unpackingMode0      ; 0   -> mode 0
	call ReadNextInputBit      ; 1 0 -> mode 1
	inc a                      ; 1 1 -> mode 2
.unpackingMode0
	ld [W_SPRITEUNPACKMODE], a
.startDecompression
	call ReadNextInputBit
	and a
	jr z, .readRLEncodedZeros ; if first bit is 0, the input starts with zeroes, otherwise with (non-zero) input
.readNextInput
	call ReadNextInputBit
	ld c, a
	call ReadNextInputBit
	sla c
	or c                       ; read next two bits into c
	and a
	jr z, .readRLEncodedZeros ; 00 -> RLEncoded zeroes following
	call WriteSpriteBitsToBuffer  ; otherwise write input to output and repeat
	call MoveToNextBufferPosition
	jr .readNextInput
.readRLEncodedZeros
	ld c, $0                   ; number of zeroes it length encoded, the number
.countConsecutiveOnesLoop      ; of consecutive ones determines the number of bits the number has
	call ReadNextInputBit
	and a
	jr z, .countConsecutiveOnesFinished
	inc c
	jr .countConsecutiveOnesLoop
.countConsecutiveOnesFinished
	ld a, c
	add a
	ld hl, LengthEncodingOffsetList
	add l
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	ld a, [hli]                ; read offset that is added to the number later on
	ld e, a                    ; adding an offset of 2^length - 1 makes every integer uniquely
	ld d, [hl]                 ; representable in the length encoding and saves bits
	push de
	inc c
	ld e, $0
	ld d, e
.readNumberOfZerosLoop        ; reads the next c+1 bits of input
	call ReadNextInputBit
	or e
	ld e, a
	dec c
	jr z, .readNumberOfZerosDone
	sla e
	rl d
	jr .readNumberOfZerosLoop
.readNumberOfZerosDone
	pop hl                     ; add the offset
	add hl, de
	ld e, l
	ld d, h
.writeZerosLoop
	ld b, e
	xor a                      ; write 00 to buffer
	call WriteSpriteBitsToBuffer
	ld e, b
	call MoveToNextBufferPosition
	dec de
	ld a, d
	and a
	jr nz, .continueLoop
	ld a, e
	and a
.continueLoop
	jr nz, .writeZerosLoop
	jr .readNextInput

; moves output pointer to next position
; also cancels the calling function if the all output is done (by removing the return pointer from stack)
; and calls postprocessing functions according to the unpack mode
MoveToNextBufferPosition:: ; 25d8 (0:25d8)
	ld a, [W_SPRITEHEIGHT]
	ld b, a
	ld a, [W_SPRITECURPOSY]
	inc a
	cp b
	jr z, .curColumnDone
	ld [W_SPRITECURPOSY], a
	ld a, [W_SPRITEOUTPUTPTR]
	inc a
	ld [W_SPRITEOUTPUTPTR], a
	ret nz
	ld a, [W_SPRITEOUTPUTPTR+1]
	inc a
	ld [W_SPRITEOUTPUTPTR+1], a
	ret
.curColumnDone
	xor a
	ld [W_SPRITECURPOSY], a
	ld a, [W_SPRITEOUTPUTBITOFFSET]
	and a
	jr z, .bitOffsetsDone
	dec a
	ld [W_SPRITEOUTPUTBITOFFSET], a
	ld hl, W_SPRITEOUTPUTPTRCACHED
	ld a, [hli]
	ld [W_SPRITEOUTPUTPTR], a
	ld a, [hl]
	ld [W_SPRITEOUTPUTPTR+1], a
	ret
.bitOffsetsDone
	ld a, $3
	ld [W_SPRITEOUTPUTBITOFFSET], a
	ld a, [W_SPRITECURPOSX]
	add $8
	ld [W_SPRITECURPOSX], a
	ld b, a
	ld a, [W_SPRITEWITDH]
	cp b
	jr z, .allColumnsDone
	ld a, [W_SPRITEOUTPUTPTR]
	ld l, a
	ld a, [W_SPRITEOUTPUTPTR+1]
	ld h, a
	inc hl
	jp StoreSpriteOutputPointer
.allColumnsDone
	pop hl
	xor a
	ld [W_SPRITECURPOSX], a
	ld a, [W_SPRITELOADFLAGS]
	bit 1, a
	jr nz, .done            ; test if there is one more sprite to go
	xor $1
	set 1, a
	ld [W_SPRITELOADFLAGS], a
	jp UncompressSpriteDataLoop
.done
	jp UnpackSprite

; writes 2 bits (from a) to the output buffer (pointed to from W_SPRITEOUTPUTPTR)
WriteSpriteBitsToBuffer:: ; 2649 (0:2649)
	ld e, a
	ld a, [W_SPRITEOUTPUTBITOFFSET]
	and a
	jr z, .offset0
	cp $2
	jr c, .offset1
	jr z, .offset2
	rrc e ; offset 3
	rrc e
	jr .offset0
.offset1
	sla e
	sla e
	jr .offset0
.offset2
	swap e
.offset0
	ld a, [W_SPRITEOUTPUTPTR]
	ld l, a
	ld a, [W_SPRITEOUTPUTPTR+1]
	ld h, a
	ld a, [hl]
	or e
	ld [hl], a
	ret

; reads next bit from input stream and returns it in a
ReadNextInputBit:: ; 2670 (0:2670)
	ld a, [W_SPRITEINPUTBITCOUNTER]
	dec a
	jr nz, .curByteHasMoreBitsToRead
	call ReadNextInputByte
	ld [W_SPRITEINPUTCURBYTE], a
	ld a, $8
.curByteHasMoreBitsToRead
	ld [W_SPRITEINPUTBITCOUNTER], a
	ld a, [W_SPRITEINPUTCURBYTE]
	rlca
	ld [W_SPRITEINPUTCURBYTE], a
	and $1
	ret

; reads next byte from input stream and returns it in a
ReadNextInputByte:: ; 268b (0:268b)
	ld a, [W_SPRITEINPUTPTR]
	ld l, a
	ld a, [W_SPRITEINPUTPTR+1]
	ld h, a
	ld a, [hli]
	ld b, a
	ld a, l
	ld [W_SPRITEINPUTPTR], a
	ld a, h
	ld [W_SPRITEINPUTPTR+1], a
	ld a, b
	ret

; the nth item is 2^n - 1
LengthEncodingOffsetList:: ; 269f (0:269f)
	dw %0000000000000001
	dw %0000000000000011
	dw %0000000000000111
	dw %0000000000001111
	dw %0000000000011111
	dw %0000000000111111
	dw %0000000001111111
	dw %0000000011111111
	dw %0000000111111111
	dw %0000001111111111
	dw %0000011111111111
	dw %0000111111111111
	dw %0001111111111111
	dw %0011111111111111
	dw %0111111111111111
	dw %1111111111111111

; unpacks the sprite data depending on the unpack mode
UnpackSprite:: ; 26bf (0:26bf)
	ld a, [W_SPRITEUNPACKMODE]
	cp $2
	jp z, UnpackSpriteMode2
	and a
	jp nz, XorSpriteChunks
	ld hl, S_SPRITEBUFFER1
	call SpriteDifferentialDecode
	ld hl, S_SPRITEBUFFER2
	; fall through

; decodes differential encoded sprite data
; input bit value 0 preserves the current bit value and input bit value 1 toggles it (starting from initial value 0).
SpriteDifferentialDecode:: ; 26d4 (0:26d4)
	xor a
	ld [W_SPRITECURPOSX], a
	ld [W_SPRITECURPOSY], a
	call StoreSpriteOutputPointer
	ld a, [W_SPRITEFLIPPED]
	and a
	jr z, .notFlipped
	ld hl, DecodeNybble0TableFlipped
	ld de, DecodeNybble1TableFlipped
	jr .storeDecodeTablesPointers
.notFlipped
	ld hl, DecodeNybble0Table
	ld de, DecodeNybble1Table
.storeDecodeTablesPointers
	ld a, l
	ld [W_SPRITEDECODETABLE0PTR], a
	ld a, h
	ld [W_SPRITEDECODETABLE0PTR+1], a
	ld a, e
	ld [W_SPRITEDECODETABLE1PTR], a
	ld a, d
	ld [W_SPRITEDECODETABLE1PTR+1], a
	ld e, $0                          ; last decoded nybble, initialized to 0
.decodeNextByteLoop
	ld a, [W_SPRITEOUTPUTPTR]
	ld l, a
	ld a, [W_SPRITEOUTPUTPTR+1]
	ld h, a
	ld a, [hl]
	ld b, a
	swap a
	and $f
	call DifferentialDecodeNybble     ; decode high nybble
	swap a
	ld d, a
	ld a, b
	and $f
	call DifferentialDecodeNybble     ; decode low nybble
	or d
	ld b, a
	ld a, [W_SPRITEOUTPUTPTR]
	ld l, a
	ld a, [W_SPRITEOUTPUTPTR+1]
	ld h, a
	ld a, b
	ld [hl], a                        ; write back decoded data
	ld a, [W_SPRITEHEIGHT]
	add l                             ; move on to next column
	jr nc, .noCarry
	inc h
.noCarry
	ld [W_SPRITEOUTPUTPTR], a
	ld a, h
	ld [W_SPRITEOUTPUTPTR+1], a
	ld a, [W_SPRITECURPOSX]
	add $8
	ld [W_SPRITECURPOSX], a
	ld b, a
	ld a, [W_SPRITEWITDH]
	cp b
	jr nz, .decodeNextByteLoop        ; test if current row is done
	xor a
	ld e, a
	ld [W_SPRITECURPOSX], a
	ld a, [W_SPRITECURPOSY]           ; move on to next row
	inc a
	ld [W_SPRITECURPOSY], a
	ld b, a
	ld a, [W_SPRITEHEIGHT]
	cp b
	jr z, .done                       ; test if all rows finished
	ld a, [W_SPRITEOUTPUTPTRCACHED]
	ld l, a
	ld a, [W_SPRITEOUTPUTPTRCACHED+1]
	ld h, a
	inc hl
	call StoreSpriteOutputPointer
	jr .decodeNextByteLoop
.done
	xor a
	ld [W_SPRITECURPOSY], a
	ret

; decodes the nybble stored in a. Last decoded data is assumed to be in e (needed to determine if initial value is 0 or 1)
DifferentialDecodeNybble:: ; 276d (0:276d)
	srl a               ; c=a%2, a/=2
	ld c, $0
	jr nc, .evenNumber
	ld c, $1
.evenNumber
	ld l, a
	ld a, [W_SPRITEFLIPPED]
	and a
	jr z, .notFlipped     ; determine if initial value is 0 or one
	bit 3, e              ; if flipped, consider MSB of last data
	jr .selectLookupTable
.notFlipped
	bit 0, e              ; else consider LSB
.selectLookupTable
	ld e, l
	jr nz, .initialValue1 ; load the appropriate table
	ld a, [W_SPRITEDECODETABLE0PTR]
	ld l, a
	ld a, [W_SPRITEDECODETABLE0PTR+1]
	jr .tableLookup
.initialValue1
	ld a, [W_SPRITEDECODETABLE1PTR]
	ld l, a
	ld a, [W_SPRITEDECODETABLE1PTR+1]
.tableLookup
	ld h, a
	ld a, e
	add l
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	ld a, [hl]
	bit 0, c
	jr nz, .selectLowNybble
	swap a  ; select high nybble
.selectLowNybble
	and $f
	ld e, a ; update last decoded data
	ret

DecodeNybble0Table:: ; 27a7 (0:27a7)
	dn $0, $1
	dn $3, $2
	dn $7, $6
	dn $4, $5
	dn $f, $e
	dn $c, $d
	dn $8, $9
	dn $b, $a
DecodeNybble1Table:: ; 27af (0:27af)
	dn $f, $e
	dn $c, $d
	dn $8, $9
	dn $b, $a
	dn $0, $1
	dn $3, $2
	dn $7, $6
	dn $4, $5
DecodeNybble0TableFlipped:: ; 27b7 (0:27b7)
	dn $0, $8
	dn $c, $4
	dn $e, $6
	dn $2, $a
	dn $f, $7
	dn $3, $b
	dn $1, $9
	dn $d, $5
DecodeNybble1TableFlipped:: ; 27bf (0:27bf)
	dn $f, $7
	dn $3, $b
	dn $1, $9
	dn $d, $5
	dn $0, $8
	dn $c, $4
	dn $e, $6
	dn $2, $a

; combines the two loaded chunks with xor (the chunk loaded second is the destination). The source chunk is differeintial decoded beforehand.
XorSpriteChunks:: ; 27c7 (0:27c7)
	xor a
	ld [W_SPRITECURPOSX], a
	ld [W_SPRITECURPOSY], a
	call ResetSpriteBufferPointers
	ld a, [W_SPRITEOUTPUTPTR]          ; points to buffer 1 or 2, depending on flags
	ld l, a
	ld a, [W_SPRITEOUTPUTPTR+1]
	ld h, a
	call SpriteDifferentialDecode      ; decode buffer 1 or 2, depending on flags
	call ResetSpriteBufferPointers
	ld a, [W_SPRITEOUTPUTPTR]          ; source buffer, points to buffer 1 or 2, depending on flags
	ld l, a
	ld a, [W_SPRITEOUTPUTPTR+1]
	ld h, a
	ld a, [W_SPRITEOUTPUTPTRCACHED]    ; destination buffer, points to buffer 2 or 1, depending on flags
	ld e, a
	ld a, [W_SPRITEOUTPUTPTRCACHED+1]
	ld d, a
.xorChunksLoop
	ld a, [W_SPRITEFLIPPED]
	and a
	jr z, .notFlipped
	push de
	ld a, [de]
	ld b, a
	swap a
	and $f
	call ReverseNybble                 ; if flipped reverse the nybbles in the destination buffer
	swap a
	ld c, a
	ld a, b
	and $f
	call ReverseNybble
	or c
	pop de
	ld [de], a
.notFlipped
	ld a, [hli]
	ld b, a
	ld a, [de]
	xor b
	ld [de], a
	inc de
	ld a, [W_SPRITECURPOSY]
	inc a
	ld [W_SPRITECURPOSY], a             ; go to next row
	ld b, a
	ld a, [W_SPRITEHEIGHT]
	cp b
	jr nz, .xorChunksLoop               ; test if column finished
	xor a
	ld [W_SPRITECURPOSY], a
	ld a, [W_SPRITECURPOSX]
	add $8
	ld [W_SPRITECURPOSX], a             ; go to next column
	ld b, a
	ld a, [W_SPRITEWITDH]
	cp b
	jr nz, .xorChunksLoop               ; test if all columns finished
	xor a
	ld [W_SPRITECURPOSX], a
	ret

; reverses the bits in the nybble given in register a
ReverseNybble:: ; 2837 (0:2837)
	ld de, NybbleReverseTable
	add e
	ld e, a
	jr nc, .asm_283f
	inc d
.asm_283f
	ld a, [de]
	ret

; resets sprite buffer pointers to buffer 1 and 2, depending on W_SPRITELOADFLAGS
ResetSpriteBufferPointers:: ; 2841 (0:2841)
	ld a, [W_SPRITELOADFLAGS]
	bit 0, a
	jr nz, .buffer2Selected
	ld de, S_SPRITEBUFFER1
	ld hl, S_SPRITEBUFFER2
	jr .storeBufferPointers
.buffer2Selected
	ld de, S_SPRITEBUFFER2
	ld hl, S_SPRITEBUFFER1
.storeBufferPointers
	ld a, l
	ld [W_SPRITEOUTPUTPTR], a
	ld a, h
	ld [W_SPRITEOUTPUTPTR+1], a
	ld a, e
	ld [W_SPRITEOUTPUTPTRCACHED], a
	ld a, d
	ld [W_SPRITEOUTPUTPTRCACHED+1], a
	ret

; maps each nybble to its reverse
NybbleReverseTable:: ; 2867 (0:2867)
	db $0, $8, $4, $c, $2, $a, $6 ,$e, $1, $9, $5, $d, $3, $b, $7 ,$f

; combines the two loaded chunks with xor (the chunk loaded second is the destination). Both chunks are differeintial decoded beforehand.
UnpackSpriteMode2:: ; 2877 (0:2877)
	call ResetSpriteBufferPointers
	ld a, [W_SPRITEFLIPPED]
	push af
	xor a
	ld [W_SPRITEFLIPPED], a            ; temporarily clear flipped flag for decoding the destination chunk
	ld a, [W_SPRITEOUTPUTPTRCACHED]
	ld l, a
	ld a, [W_SPRITEOUTPUTPTRCACHED+1]
	ld h, a
	call SpriteDifferentialDecode
	call ResetSpriteBufferPointers
	pop af
	ld [W_SPRITEFLIPPED], a
	jp XorSpriteChunks

; stores hl into the output pointers
StoreSpriteOutputPointer:: ; 2897 (0:2897)
	ld a, l
	ld [W_SPRITEOUTPUTPTR], a
	ld [W_SPRITEOUTPUTPTRCACHED], a
	ld a, h
	ld [W_SPRITEOUTPUTPTR+1], a
	ld [W_SPRITEOUTPUTPTRCACHED+1], a
	ret
