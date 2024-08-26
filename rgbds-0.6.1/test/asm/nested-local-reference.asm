SECTION "sec", ROM0

Parent:
Parent.child:
	db 0
.grandchild:
	db 1
	dw Parent.child.grandchild
