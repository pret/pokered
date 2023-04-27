_ZapdosGuy::
	text "Sometimes, a BIRD"
	line "#MON with"
	cont "strong legs comes"
	cont "to race all the"
	cont "#MON here."
	done

_FakeTreeNoCut::
	text "This tree can be"
	line "CUT!"
	done

_FakeTreePrompt::
	text "This tree can be"
	line "CUT!"
	
	para "Would you like to"
	line "use CUT?"
	prompt

; The Cut script currently doesn't load what I want it to. Sp, I commented out the RAM and made it "you".
; For this to work, I need to make a special version of HasPartyMove.
_FakeTreeAttack::
	;text_ram wcd6d
	text "You tried"
	line "to hack away..."
	
	para "But it was a"
	line "CACTUS!"
	
	para "CACTUS retaliated"
	line "in a rage!"
	prompt

_GalarianZapdosBattleText::
	text "Gyaoo!"
	prompt

; Martha can do the text for her things...
