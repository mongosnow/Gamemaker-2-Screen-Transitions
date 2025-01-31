function screenTransition_set_ST_CHECKER // Use this AFTER screenTransition to set specific variables
(
	checkerSize			  = DEFAULT_CHECKER_SIZE,			// Max size of squares, should be divisible by both width and height of transition area or else it will be rounded to nearest
	transformSpeed		  = DEFAULT_CHECKER_SPEED_0,		// Speed of checker scale change per frame | higher = faster | anything above 1 does nothing | 1 is instant
	transformDelay		  = DEFAULT_CHECKER_DELAY_0,		// Frames between checker groups animating
	fadeSquare			  = DEFAULT_CHECKER_FADE_SQUARE_0,	// Will the square change opacity during the animation?
	darkenBackground	  = DEFAULT_CHECKER_FADE_BG_0,		// Will the background fade to a color during the animation?
	backgroundMaxAlpha	  = DEFAULT_CHECKER_MAX_BG_ALPHA_0, // The max opacity the background will become
	backgroundColor		  = DEFAULT_CHECKER_BG_COLOR,		// Color of background ^
	
	useDifferentIn = false,	// false = in will be same as above, true = will use below
	
	transformSpeedIn	  = DEFAULT_CHECKER_SPEED_1,		// (In)
	transformDelayIn	  = DEFAULT_CHECKER_DELAY_1,		//
	fadeSquareIn		  = DEFAULT_CHECKER_FADE_SQUARE_1,	//
	darkenBackgroundIn	  = DEFAULT_CHECKER_FADE_BG_1,		//
	backgroundMaxAlphaIn  = DEFAULT_CHECKER_MAX_BG_ALPHA_1	//
)
{
	if !useDifferentIn // Copy out values to in
	{
		transformSpeedIn	  = transformSpeed
		transformDelayIn	  = transformDelay
		fadeSquareIn		  = fadeSquare
		darkenBackgroundIn	  = darkenBackground
		backgroundMaxAlphaIn  = backgroundMaxAlpha
	}
	
	with (obj_stController)
	{
		// Max size of checkers
		_checkerMaxSize = checkerSize
	
		// Checker timing variables
		_checkerTransformSpeed = [transformSpeed, transformSpeedIn]
		_checkerTransformDelay = [transformDelay, transformDelayIn]
	
		// Fade squares
		_checkerFadeSquare = [fadeSquare, fadeSquareIn]
		
		// Fade background
		_checkerDarkenBackground = [darkenBackground, darkenBackgroundIn]
		_checkerDarkenBackgroundMaxAlpha = [backgroundMaxAlpha, backgroundMaxAlphaIn]
		_checkerDarkenColor = backgroundColor
	}
}