MACRO between
	assert (\1) <= (\2) && (\2) <= (\3)
ENDM

	between 0, __UTC_YEAR__, 9999 ; Y10K problem...
	between 1, __UTC_MONTH__, 12
	between 1, __UTC_DAY__, 31
	between 0, __UTC_HOUR__, 23
	between 0, __UTC_MINUTE__, 59
	between 0, __UTC_SECOND__, 60 ; leap seconds!

UTC_TIME EQUS STRCAT("{04d:__UTC_YEAR__}-{02d:__UTC_MONTH__}-{02d:__UTC_DAY__}T", \
                     "{02d:__UTC_HOUR__}:{02d:__UTC_MINUTE__}:{02d:__UTC_SECOND__}Z")
	assert !STRCMP("{UTC_TIME}", __ISO_8601_UTC__)
