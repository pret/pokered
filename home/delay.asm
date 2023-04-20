DelayFrames::
; wait c frames
	call DelayFrame
	dec c
	jr nz, DelayFrames
	ret
