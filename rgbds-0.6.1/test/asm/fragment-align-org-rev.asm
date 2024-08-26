
SECTION "Word", ROM0/*[5]*/

	dw $78df

SECTION FRAGMENT "Frag", ROM0/*[1]*/

	db $40

SECTION FRAGMENT "Frag", ROM0/*[2]*/

	db $2e

SECTION FRAGMENT "Frag", ROM0/*[3]*/,ALIGN[1,1]

	db $1f

SECTION "Byte", ROM0/*[0]*/

	db $44

SECTION FRAGMENT "Frag", ROM0/*[4]*/

	db $7b
	align 2, 1

SECTION FRAGMENT "Frag", ROM0[5]
