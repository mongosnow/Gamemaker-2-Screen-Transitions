function screenTransition_set_fade // Use this AFTER screenTransition to set specific variables
(
	fadeSpeedOut = DEFAULT_FADESPEED_0,  // Speed alpha will change by on out animation
	fadeSpeedIn  =  DEFAULT_FADESPEED_1, // Speed alpha will change by on in animation
	color = DEFAULT_COLOR // Color of rectangle covering screen
)
{
	with (obj_stController)
	{
		_fadeSpeed[IS.OUT] = fadeSpeedOut
		_fadeSpeed[IS.IN]  = fadeSpeedIn
		_color = color
	}
}