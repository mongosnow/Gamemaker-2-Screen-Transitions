function screenTransition_set_ST_TSCALE // Use this AFTER screenTransition to set specific variables
(
	animSpeedOut = DEFAULT_TSCALE_SPEED_0,	// Speed of animation, lower = faster
	animAccelOut = DEFAULT_TSCALE_SPEED_0,	// Speed animation will change | negative makes it slower
	xOriginOut	 = DEFAULT_TSCALE_X_0,		// Middle point of animation, x axis
	yOriginOut	 = DEFAULT_TSCALE_Y_0,		// Middle point of animation, y axis
	fadeOut		 = DEFAULT_TSCALE_FADE_0,	// Will the transparency change? (true/false)
	rotateSpdOut = DEFAULT_TSCALE_ROTSPD_0,	// Speed multiplier for rotate animation
	
	animSpeedIn = DEFAULT_TSCALE_SPEED_1,	//
	animAccelIn = DEFAULT_TSCALE_SPEED_1,	//
	xOriginIn	= DEFAULT_TSCALE_X_1,		//	(In animation variables)
	yOriginIn	= DEFAULT_TSCALE_Y_1,		//
	fadeIn		= DEFAULT_TSCALE_FADE_1,	//
	rotateSpdIn = DEFAULT_TSCALE_ROTSPD_1	//
)
{
	with (obj_stController)
	{
			// Anim time
			_tScaleSpeed = [DEFAULT_TSCALE_SPEED_0, DEFAULT_TSCALE_SPEED_1]
			_tScaleAccel = [DEFAULT_TSCALE_ACCEL_0, DEFAULT_TSCALE_ACCEL_1]
	
			// Screen center
			_tScaleLocX  = [DEFAULT_TSCALE_X_0, DEFAULT_TSCALE_X_1]
			_tScaleLocY  = [DEFAULT_TSCALE_Y_0, DEFAULT_TSCALE_Y_1]
	
			// Fade
			_tScaleFade  = [DEFAULT_TSCALE_FADE_0, DEFAULT_TSCALE_FADE_1]
	}
}