function screenTransition_set_ST_FADE // Use this AFTER screenTransition to set specific variables
(
	fadeSpeedOut = DEFAULT_FADE_SPEED_0,  // Speed alpha will change by on out animation
	fadeAccelOut = DEFAULT_FADE_ACCEL_0,	 // Speed alpha change will speed up by
	fadeSpeedIn  = DEFAULT_FADE_SPEED_1,
	fadeAccelIn  = DEFAULT_FADE_ACCEL_1
)
{
	with (obj_stController)
	{
		_fadeSpeed[IS.OUT] = fadeSpeedOut
		_fadeAccel[IS.OUT] = fadeAccelOut
		_fadeSpeed[IS.IN]  = fadeSpeedIn
		_fadeAccel[IS.IN]  = fadeAccelIn
	}
}