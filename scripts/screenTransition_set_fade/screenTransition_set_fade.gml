function screenTransition_set_fade // Use this AFTER screenTransition to set specific variables
(
	fadeSpeedIn = DEFAULT_FADESPEED,  // Speed alpha will change on in animation
	fadeSpeedOut = DEFAULT_FADESPEED, // Speed alpha will change on out animation
	color = DEFAULT_COLOR // Color of rectangle covering screen
)
{
	with (obj_stController)
	{
		_fadeSpeed = [fadeSpeedIn, fadeSpeedOut]
		_color = color
	}
}