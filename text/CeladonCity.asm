_CeladonCityLittleGirlText::
	text "I got my KOFFING"
	line "in CINNABAR!"

	para "It's nice, but it"
	line "breathes poison"
	cont "when it's angry!"
	done

_CeladonCityGramps1Text::
	text "Heheh! This GYM"
	line "is great! It's"
	cont "full of women!"
	done

_CeladonCityGirlText::
	text "The GAME CORNER"
	line "is bad for our"
	cont "city's image!"
	done

_CeladonCityGramps2Text::
	text "Moan! I blew it"
	line "all at the slots!"

	para "I knew I should"
	line "have cashed in my"
	cont "coins for prizes!"
	done

_CeladonCityGramps3Text::
	text "Hello, there!"

	para "I've seen you,"
	line "but I never had a"
	cont "chance to talk!"

	para "Here's a gift for"
	line "dropping by!"
	prompt

_PewterGymReceivedTM34Text::
_CeruleanGymMistyReceivedTM11Text::
_VermilionGymLTSurgeReceivedTM24Text::
_CeladonGymReceivedTM21Text::
_CeladonCityGramps3ReceivedTM41Text::
_CeladonMart3FClerkReceivedTM18Text::
_CeladonMartRoofLittleGirlReceivedTM13Text::
_CeladonMartRoofLittleGirlReceivedTM48Text::
_CopycatsHouse2FCopycatReceivedTM31Text::
_MrPsychicsHouseMrPsychicReceivedTM29Text::
_SaffronGymSabrinaReceivedTM46Text::
_FuchsiaGymKogaReceivedTM06Text::
_WardensHouseWardenReceivedHM04Text::
_SafariZoneSecretHouseFishingGuruReceivedHM03Text::
_CinnabarGymBlaineReceivedTM38Text::
_CinnabarLabMetronomeRoomScientist1ReceivedTM35Text::
_ViridianCityFisherReceivedTM42Text::
_ViridianGymGiovanniReceivedTM27Text::
_Route12Gate2FBrunetteGirlReceivedTM39Text::
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_CeladonCityGramps3TM41ExplanationText::
	text "<TM>41 teaches"
	line "MEDITATE!"

	para "It raises ATTACK,"
	line "SPECIAL and SPEED"
	cont "all by one stage!"

	para "Your #MON will"
	line "be unstoppable!"
	done

_CeladonCityGramps3TM41NoRoomText::
	text "Oh, your pack is"
	line "full of items!"
	done

_CeladonCityFisherText::
	text "This is my trusted"
	line "pal, POLIWRATH!"

	para "It evolved from"
	line "POLIWHIRL when I"
	cont "used WATER STONE!"
	done

_CeladonCityPoliwrathText::
	text "POLIWRATH: Ribi"
	line "ribit!@"
	text_end

_CeladonCityRocket1Text::
	text "What are you"
	line "staring at?"
	done

_CeladonCityRocket2Text::
	text "Keep out of <TEAM>"
	line "<ROCKET>'s way!"
	done

_CeladonCityTrainerTips1Text::
	text "<TIPS>" ; TODO: genericize message?

	para "X ACCURACY boosts"
	line "the accuracy of"
	cont "techniques!"

	para "DIRE HIT jacks up"
	line "the likelihood of"
	cont "critical hits!"
	; fall through
_GetYourItemsAtDeptStore::
	para "Get your items at"
	line "CELADON DEPT."
	cont "STORE!"
	done

_CeladonCitySignText::
	text "CELADON CITY"
	para "The City of"
	line "Rainbow Dreams"
	done

_CeladonCityGymSignText::
	text "CELADON CITY"
	line "#MON GYM"
	cont "LEADER: ERIKA"

	para "The Nature Loving"
	line "Princess!"
	done

_CeladonCityMansionSignText::
	text "CELADON MANSION"
	done

_CeladonCityDeptStoreSignText::
	text "Find what you"
	line "need at CELADON"
	cont "DEPT. STORE!"
	done

_CeladonCityTrainerTips2Text::
	text "<TIPS>"

	para "GUARD SPEC."
	line "protects #MON"
	cont "against status"
	cont "moves like LEER"
	cont "or SAND-ATTACK!@"

	text_jump _GetYourItemsAtDeptStore

_CeladonCityPrizeExchangeSignText::
	text "Coins exchanged"
	line "for prizes!"
	cont "PRIZE EXCHANGE"
	done

_CeladonCityGameCornerSignText::
	text "<ROCKET> GAME CORNER"
	line "The playground"
	cont "for grown-ups!"
	done

_CeladonCityText19::
	text "<TIPS>"
	para "Open the START"
	line "menu and scroll"
	cont "down to the SAVE"
	cont "option."
	para "Then press SELECT"
	line "to change <PC>"
	cont "boxes whenever"
	cont "you like!"
	done