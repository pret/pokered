SilphCo1F_Script:
	call EnableAutoTextBoxDrawing
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ret z
	CheckAndSetEvent EVENT_SILPH_CO_RECEPTIONIST_AT_DESK
	ret nz
	ld a, HS_SILPH_CO_1F_RECEPTIONIST
	ld [wMissableObjectIndex], a
	predef_jump ShowObject

SilphCo1F_TextPointers:
	def_text_pointers
	dw_const SilphCo1FLinkReceptionistText, TEXT_SILPHCO1F_LINK_RECEPTIONIST

SilphCo1FLinkReceptionistText:
	text_far _SilphCo1FLinkReceptionistText
	text_end
