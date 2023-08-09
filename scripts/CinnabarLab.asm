CinnabarLab_Script:
	call EnableAutoTextBoxDrawing
	ret

CinnabarLab_TextPointers:
	def_text_pointers
	dw_const CinnabarLabFishingGuruText,     TEXT_CINNABARLAB_FISHING_GURU
	dw_const CinnabarLabPhotoText,           TEXT_CINNABARLAB_PHOTO
	dw_const CinnabarLabMeetingRoomSignText, TEXT_CINNABARLAB_MEETING_ROOM_SIGN
	dw_const CinnabarLabRAndDSignText,       TEXT_CINNABARLAB_R_AND_D_SIGN
	dw_const CinnabarLabTestingRoomSignText, TEXT_CINNABARLAB_TESTING_ROOM_SIGN

CinnabarLabFishingGuruText:
	text_far _CinnabarLabFishingGuruText
	text_end

CinnabarLabPhotoText:
	text_far _CinnabarLabPhotoText
	text_end

CinnabarLabMeetingRoomSignText:
	text_far _CinnabarLabMeetingRoomSignText
	text_end

CinnabarLabRAndDSignText:
	text_far _CinnabarLabRAndDSignText
	text_end

CinnabarLabTestingRoomSignText:
	text_far _CinnabarLabTestingRoomSignText
	text_end
