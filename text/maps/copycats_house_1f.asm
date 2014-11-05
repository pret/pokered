_CopycatsHouse1FText1:: ; a14f7 (28:54f7)
	text "My daughter is so"
	line "self-centered."
	cont "She only has a"
	cont "few friends."
	done

_CopycatsHouse1FText2:: ; a1535 (28:5535)
	text "My daughter likes"
	line "to mimic people."

	para "Her mimicry has"
	line "earned her the"
	cont "nickname COPYCAT"
	cont "around here!"
	done

_CopycatsHouse1FText3:: ; a1596 (28:5596)
IF DEF(_YELLOW)
	text "CHANSEY: Chaan"
	line "sey!@@"
ELSE
	text "CHANSEY: Chaan!"
	line "Sii!@@"
ENDC
