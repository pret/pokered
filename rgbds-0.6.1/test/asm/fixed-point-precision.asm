f1 = 3.1
f2 = 5.2
pm = MUL(f1, f2)
pr = 16.12
	println "`3.1`:   {9.6f:f1} -> ${08x:f1}"
	println "`5.2`:   {9.6f:f2} -> ${08x:f2}"
	println "`MUL`:   {9.6f:pm} -> ${08x:pm}"
	println "`16.12`: {9.6f:pr} -> ${08x:pr}"

fl = 6.283185
	println "`6.283185`: {.6f:fl} -> ${08x:fl}"

fr = MUL(20.0, 0.32)
	println "32% of 20 = {f:fr} (~{.2f:fr}) (~~{.0f:fr})"

q8 = 1.25q8
q16 = 1.25Q16
q24 = 1.25q.24
	println "Q8 ${x:q8} Q16 ${x:q16} Q24 ${x:q24}"

qerr = 1.25q32
	println qerr
