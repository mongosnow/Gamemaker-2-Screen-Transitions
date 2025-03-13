function screenTransition_set_ST_TSCALE // Use this AFTER screenTransition to set specific variables
(
	animSpeed = DEFAULT_TSCALE_SPEED_0,	// Speed of animation, lower = faster
	animAccel = DEFAULT_TSCALE_SPEED_0,	// Speed animation will change | negative makes it slower
	xOrigin	 = DEFAULT_TSCALE_X_0,		// Middle point of animation, x axis
	yOrigin	 = DEFAULT_TSCALE_Y_0,		// Middle point of animation, y axis
	fade		 = DEFAULT_TSCALE_FADE_0,	// Will the transparency change? (true/false)
	rotateSpd = DEFAULT_TSCALE_ROTSPD_0,	// Speed multiplier for rotate animation
	
	useDifferentIn = false,	// false = in will be same as above, true = will use below
	
	animSpeedIn = DEFAULT_TSCALE_SPEED_1,	//
	animAccelIn = DEFAULT_TSCALE_SPEED_1,	//
	xOriginIn	= DEFAULT_TSCALE_X_1,		//	(In animation variables)
	yOriginIn	= DEFAULT_TSCALE_Y_1,		//
	fadeIn		= DEFAULT_TSCALE_FADE_1,	//
	rotateSpdIn = DEFAULT_TSCALE_ROTSPD_1	//
)
{
	if !useDifferentIn // Copy  values to in
	{
		animSpeedIn = animSpeed
		animAccelIn = animAccel
		xOriginIn	= xOrigin	
		yOriginIn	= yOrigin	
		fadeIn		= fade	
		rotateSpdIn = rotateSpd	
	}
	
	with (obj_stController)
	{
			// Anim time
			_tScaleSpeed = [animSpeed, animSpeedIn]
			_tScaleAccel = [animAccel, animAccelIn]
	
			// Screen center
			_tScaleLocX  = [xOrigin, xOriginIn]
			_tScaleLocY  = [yOrigin, yOriginIn]
	
			// Fade
			_tScaleFade  = [fade, fadeIn]
			
			// Rotate
			_tScaleRotateSpd = [rotateSpd, rotateSpdIn]
	}
}