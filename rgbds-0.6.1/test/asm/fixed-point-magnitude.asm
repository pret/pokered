for precision, 1, 32
	opt Q{d:precision}
	def magnitude = 32 - precision

	def maxInt = 1 << magnitude - 1
	redef defMaxValue equs "def maxValue = {d:maxInt}.0"
	{defMaxValue}
	println "Q.{2d:precision}: max ok  = 1 << {2d:magnitude} - 1  = {11d:maxInt}.0 = {#09x:maxValue}"

	def minBadInt = maxInt + 1
	redef defMinBadValue equs "def minBadValue = {d:minBadInt}.0"
	{defMinBadValue}
	println "Q.{2d:precision}: min bad = 1 << {2d:magnitude}      = {11d:minBadInt}.0 = {#09x:minBadValue}"

	def worseInt = minBadInt + 42
	redef defWorseValue equs "def worseValue = {d:worseInt}.0"
	{defWorseValue}
	println "Q.{2d:precision}: worse   = 1 << {2d:magnitude} + 42 = {11d:worseInt}.0 = {#09x:worseValue}"
endr
