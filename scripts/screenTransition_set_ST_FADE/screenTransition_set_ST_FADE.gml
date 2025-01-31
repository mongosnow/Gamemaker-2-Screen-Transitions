function screenTransition_set_ST_FADE // Use this AFTER screenTransition to set specific variables
(
	fadeSpeedOut = DEFAULT_FADE_SPEED_0,	// Speed alpha will change by on out animation
	fadeAccelOut = DEFAULT_FADE_ACCEL_0,	// Speed alpha change will speed up by
	fadeSpeedIn  = DEFAULT_FADE_SPEED_1,	// (In)
	fadeAccelIn  = DEFAULT_FADE_ACCEL_1		// (In)
)
{
	with (obj_stController)
	{
		_fadeSpeed = [fadeSpeedOut, fadeSpeedIn]
		_fadeAccel = [fadeAccelOut, fadeAccelIn]
	}
}