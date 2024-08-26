def variable = 1
	println variable
def variable = 2
	println variable
redef variable = 3
	println variable
redef variable = 4
	println variable

DEF constant EQU 42
	println constant

DEF string EQUS "here"
	println "{string}"

rsreset
def _x rb
def _y rw 2
def _z rl
def _size rb 0
	println "{_x} {_y} {_z} {_size}"

def constant equ 6*7 ; fails
	println constant

redef string equs "there"
	println "{string}"

redef constant equ 6*9
	println constant
