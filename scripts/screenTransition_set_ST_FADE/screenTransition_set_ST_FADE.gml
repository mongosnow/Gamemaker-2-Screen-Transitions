function screenTransition_set_ST_FADE // Use this AFTER screenTransition to set specific variables
(
	fadeSpeedOut = DEFAULT_FADESPEED_0,  // Speed alpha will change by on out animation
	fadeAccelOut = DEFAULT_FADEACCEL_0,	 // Speed alpha change will speed up by
	fadeSpeedIn  = DEFAULT_FADESPEED_1,
	fadeAccelIn  = DEFAULT_FADEACCEL_1,
	color = DEFAULT_COLOR // Color of rectangle covering screen
)
{
	with (obj_stController)
	{
		_fadeSpeed[IS.OUT] = fadeSpeedOut
		_fadeAccel[IS.OUT] = fadeAccelOut
		_fadeSpeed[IS.IN]  = fadeSpeedIn
		_fadeAccel[IS.IN]  = fadeAccelIn
		_color = color
	}
}