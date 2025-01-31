function screenTransition_set_ST_FADE // Use this AFTER screenTransition to set specific variables
(
	fadeSpeed = DEFAULT_FADE_SPEED_0,	// Speed alpha will change by on  animation
	fadeAccel = DEFAULT_FADE_ACCEL_0,	// Speed alpha change will speed up by
	
	useDifferentIn = false,	// false = in will be same as above, true = will use below
	
	fadeSpeedIn  = DEFAULT_FADE_SPEED_1,	// (In)
	fadeAccelIn  = DEFAULT_FADE_ACCEL_1		// (In)
)
{
	if !useDifferentIn // Copy  values to in
	{
		fadeSpeedIn  = fadeSpeed,
		fadeAccelIn  = fadeAccel	
	}
	
	with (obj_stController)
	{
		_fadeSpeed = [fadeSpeed, fadeSpeedIn]
		_fadeAccel = [fadeAccel, fadeAccelIn]
	}
}