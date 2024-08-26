SECTION "A", ROM0
AData::
LOAD UNION "RAM", WRAM0
AMem::
	db 0, 1, 2
AMemEnd::
ENDL
ADataEnd::
	dw AMem

SECTION "B", ROM0
BData::
LOAD UNION "RAM", WRAM0
BMem::
	db 3, 4, 5, 6, 7
BMemEnd::
ENDL
BDataEnd::
	dw BMem

SECTION "C", ROM0
CData::
LOAD UNION "RAM", WRAM0
CMem::
	db 8, 9
CMemEnd::
ENDL
CDataEnd::
	dw CMem
