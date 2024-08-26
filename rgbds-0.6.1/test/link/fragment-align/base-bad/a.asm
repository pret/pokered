
SECTION FRAGMENT "Frag", ROM0/*[1]*/

	db $40

SECTION "Word", ROM0/*[6]*/

	dw $78d5

SECTION FRAGMENT "Frag", ROM0/*[2]*/,ALIGN[1]

	db $2e

SECTION FRAGMENT "Frag", ROM0/*[3]*/

	db $1f

SECTION "Byte", ROM0/*[0]*/

	db $44
