LavenderPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

LavenderPokecenter_TextPointers:
	def_text_pointers
	dw_const LavenderPokecenterNurseText,            TEXT_LAVENDERPOKECENTER_NURSE
	dw_const LavenderPokecenterGentlemanText,        TEXT_LAVENDERPOKECENTER_GENTLEMAN
	dw_const LavenderPokecenterLittleGirlText,       TEXT_LAVENDERPOKECENTER_LITTLE_GIRL
	dw_const LavenderPokecenterLinkReceptionistText, TEXT_LAVENDERPOKECENTER_LINK_RECEPTIONIST

LavenderPokecenterLinkReceptionistText:
	script_cable_club_receptionist

LavenderPokecenterNurseText:
	script_pokecenter_nurse

LavenderPokecenterGentlemanText:
	text_far _LavenderPokecenterGentlemanText
	text_end

LavenderPokecenterLittleGirlText:
	text_far _LavenderPokecenterLittleGirlText
	text_end
