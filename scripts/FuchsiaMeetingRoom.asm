FuchsiaMeetingRoom_Script:
	call EnableAutoTextBoxDrawing
	ret

FuchsiaMeetingRoom_TextPointers:
	def_text_pointers
	dw_const FuchsiaMeetingRoomSafariZoneWorker1, TEXT_FUCHSIAMEETINGROOM_SAFARI_ZONE_WORKER1
	dw_const FuchsiaMeetingRoomSafariZoneWorker2, TEXT_FUCHSIAMEETINGROOM_SAFARI_ZONE_WORKER2
	dw_const FuchsiaMeetingRoomSafariZoneWorker3, TEXT_FUCHSIAMEETINGROOM_SAFARI_ZONE_WORKER3
	dw_const FuchsiaMeetingRoomPoster,            TEXT_FUCHSIAMEETINGROOM_POSTER
	dw_const FuchsiaMeetingRoomDeskPapers,        TEXT_FUCHSIAMEETINGROOM_DESK_PAPERS

FuchsiaMeetingRoomSafariZoneWorker1:
	text_far _FuchsiaMeetingRoomSafariZoneWorker1
	text_end

FuchsiaMeetingRoomSafariZoneWorker2:
	text_far _FuchsiaMeetingRoomSafariZoneWorker2
	text_end

FuchsiaMeetingRoomSafariZoneWorker3:
	text_far _FuchsiaMeetingRoomSafariZoneWorker3
	text_end

; PureRGBnote: ADDED: text entries for the poster and the papers on the desk in this room

FuchsiaMeetingRoomPoster:
	text_far _FuchsiaMeetingRoomPoster
	text_end

FuchsiaMeetingRoomDeskPapers:
	text_far _FuchsiaMeetingRoomDeskPapers
	text_end