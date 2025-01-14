// Will instantly cut away to next room, then tear down screenshot of previous room with a checker pattern

function screenTransition_checkers_screenshot(
	changeRoomTo, 
	
	delayIn = undefined,
	
	ST_checker_type = ST_CHECKER_DIAGONAL_DOWN_RIGHT_TO_UP_LEFT, // MUST BE A CHECKER TYPE
	checker_transform_scale = CHECKER_TRANSFORM_BOTH,
	
	fadeFX = SCREEN_TRANSITION_DEFAULT_CHECKER_FADEFX, //will the background fade to a color behind the checkers
	fadeColor = SCREEN_TRANSITION_DEFAULT_CHECKER_FADECOLOR, //what color is the fade
	
	layerToUse = undefined
)
{
	_screenTransition_twoWay(
		changeRoomTo,
		layerToUse,
		,
		ST_NONE,
		,
		true,
		delayIn,
		ST_checker_type,
		
	)
	
	obj_screenTransitionTwoWay._checkerTransformScaleOut = checker_transform_scale
	obj_screenTransitionTwoWay._checkerTransformScaleIn = checker_transform_scale
	obj_screenTransitionTwoWay._checkerFadeFX = fadeFX
	obj_screenTransitionTwoWay._checkerFadeColor = fadeColor
}