_DaisyInitialText:
	db 0,"Hi ",$52,"!",$4F
	db $53," is out at",$55
	db "Grandpa's lab.",$57

_DaisyOfferMapText:
	db 0,"Grandpa asked you",$4F
	db "to run an errand?",$55
	db "Here, this will",$55
	db "help you!",$58

_GotMapText:
	db 0,$52," got a",$4F,"@",1
	dw $CF4B
	db 0,"!@@"

_DaisyBagFullText:
	db 0,"You have too much",$4F
	db "stuff with you.",$57

_DaisyUseMapText:
	db 0,"Use the TOWN MAP",$4F
	db "to find out where",$55
	db "you are.",$57

_BluesHouseText2:
	db 0,"#MON are living",$4F
	db "things! If they",$55
	db "get tired, give",$55
	db "them a rest!",$57

_BluesHouseText3:
	db 0,"It's a big map!",$4F
	db "This is useful!",$57
