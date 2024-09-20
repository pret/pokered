_BikeShopClerkWelcomeText::
	text "Hi! Welcome to"
	line "our BIKE SHOP."

	para "Have we got just"
	line "the BIKE for you!"
	prompt

_BikeShopClerkDoYouLikeItText::
	text "It's a cool BIKE!"
	line "Do you want it?"
	done

_BikeShopCantAffordText::
	text "Sorry! You can't"
	line "afford it!"
	prompt

_BikeShopClerkOhThatsAVoucherText::
	text "Oh, that's<...>"

	para "A BIKE VOUCHER!" ; TODO: load item name into string buffer?

	para "OK! Here you go!" ; TODO: generic Here you go! text?
	prompt

_BikeShopExchangedVoucherText::
	text "<PLAYER> exchanged"
	line "the BIKE VOUCHER"
	cont "for a BICYCLE.@"
	text_end

_BikeShopComeAgainText::
	text "Come back again"
	line "some time!"
	done

_BikeShopClerkHowDoYouLikeYourBicycleText::
	text "How do you like"
	line "your new BICYCLE?"

	para "You can take it"
	line "on CYCLING ROAD"
	cont "and in caves!"
	done

_CeruleanGymMistyTM11NoRoomText::
_BikeShopBagFullText::
	text "You better make"
	line "room for this!"
	done

_BikeShopMiddleAgedWomanText::
	text "A plain city BIKE"
	line "is good enough"
	cont "for me!"

	para "You can't put a"
	line "shopping basket"
	cont "on an MTB!"
	done

_BikeShopYoungsterTheseBikesAreExpensiveText::
	text "These BIKEs are"
	line "cool, but they're"
	cont "way expensive!"
	done

_BikeShopYoungsterCoolBikeText::
	text "Wow. Your BIKE is"
	line "really cool!"
	done

_BikeShopBasketBikeText::
	text "This BIKE has a"
	line "basket attached."
	para "Very practical!"
	done

_BikeShopToolboxText::
	text "A toolbox for"
	line "repairing BIKEs!"
	para "Tire patches,"
	line "a pump, hex keys,"
	cont "tools galore!"
	done