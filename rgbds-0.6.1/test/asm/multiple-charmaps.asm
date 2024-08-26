opt Wno-unmapped-char

MACRO new_
	IF _NARG > 1
	println "newcharmap \1, \2"
	newcharmap \1, \2
	ELSE
	println "newcharmap \1"
	newcharmap \1
	ENDC
ENDM

MACRO set_
	println "setcharmap \1"
	setcharmap \1
ENDM

MACRO push_
	println "pushc"
	pushc
ENDM

MACRO pop_
	println "popc"
	popc
ENDM

MACRO print_mapped
x = \1
println "{x}"
ENDM

println "main charmap"

charmap "ab", $0

	print_mapped "ab"

	new_ map1

	print_mapped "ab"

	new_ map2, main

	print_mapped "ab"

	set_ map1

	print_mapped "ab"

	new_ map3

charmap "ab", $1

	print_mapped "ab"

	new_ map4, map3

charmap "ab", $1
charmap "cd", $2

	print_mapped "ab"
	print_mapped "cd"

	set_ map3

	print_mapped "ab"
	print_mapped "cd"

	set_ main

SECTION "sec0", ROM0

	print_mapped "ab"

println "modify main charmap"
charmap "ef", $3

	print_mapped "ab"
	print_mapped "ef"

	set_ map1

	push_
	set_ map2
	push_

	set_ map3

	print_mapped "ab"
	print_mapped "cd"
	print_mapped "ef"

	pop_

	print_mapped "ab"

	pop_

	print_mapped "ab"

	new_ map1

	set_ map5

	pop_
