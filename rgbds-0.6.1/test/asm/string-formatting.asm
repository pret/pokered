n equ 300
m equ -42
f equ -123.0456
pi equ 3.14159
s equs "hello"

	println "<{ -6d:n}> <{+06u:n}> <{5x:n}> <{#16b:n}>"
	println "<{u:m}> <{+3d:m}> <{#016o:m}>"
	println "<{f:pi}> <{06.f:f}> <{.10f:f}>"
	println "<{#-10s:s}> <{10s:s}>"

macro foo
	println "<{\1}>"
endm

	foo  -6d:n ; space is trimmed
