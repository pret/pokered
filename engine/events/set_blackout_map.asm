;SetLastBlackoutMap::
; Set the map to return to when
; blacking out or using Teleport or Dig.
; Safari rest houses don't count.
; called upon entering pokemon centers
;
;	push hl
;	ld hl, SafariZoneRestHouses
;	ld a, [wCurMap]
;	ld b, a
;.loop
;	ld a, [hli]
;	cp -1
;	jr z, .notresthouse
;	cp b
;	jr nz, .loop
;	jr .done

;.notresthouse
;	ld a, [wLastMap]
;	ld [wLastBlackoutMap], a
;.done
;	pop hl
;	ret

;INCLUDE "data/maps/rest_house_maps.asm"

;PureRGBnote: FIXED: not needed since safari zone rest houses will never get set as the blackout map anyway
