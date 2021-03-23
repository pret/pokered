vend_item: MACRO
	db \1
	money \2
ENDM

VendingPrices:
	; item id, price
	vend_item FRESH_WATER, 200
	vend_item SODA_POP,    300
	vend_item LEMONADE,    350
