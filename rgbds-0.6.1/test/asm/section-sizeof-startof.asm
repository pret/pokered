SECTION "sect", ROMX[$4567], BANK[$23]
	ds 42

W = BANK("sect")
X = SIZEOF("sect") ; unknown
Y = STARTOF("sect")

	println "sect1: {W} {X} {Y}"

SECTION "sect2", ROMX

W = BANK("sect")
X = SIZEOF("sect")
Y = STARTOF("sect")

	println "sect1: {W} {X} {Y}"

PUSHS
SECTION FRAGMENT "sect3", ROMX[$4567], BANK[$12]

W = BANK("sect2") ; unknown
X = SIZEOF("sect2") ; unknown
Y = STARTOF("sect2") ; unknown

	println "sect2: {W} {X} {Y}"

POPS

W = BANK("sect3")
X = SIZEOF("sect3") ; unknown
Y = STARTOF("sect3")

	println "sect3: {W} {X} {Y}"
