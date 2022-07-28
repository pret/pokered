MACRO vend_item
	db \1
	bcd3 \2
ENDM

VendingPrices:
	; item id, price
	vend_item FRESH_WATER, 200
	vend_item SODA_POP,    300
	vend_item LEMONADE,    350
	vend_item RARE_CANDY,  2000 ; PureRGBnote: ADDED: not available in normal vending machines, but it's available in a secret one
	