// Will instantly cut away to next room then fade out screenshot
// Change defualts if needed

function screenTransition_fade_screenshot(
	changeRoomTo,
	layerToUse = undefined,
	fadeSpeed = SCREEN_TRANSITION_DEFAULT_FADE_SPEED, // 2nd part
	delayOut = undefined,
	delayIn = undefined
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
		ST_FADE,
		
	)
	
	obj_screenTransitionTwoWay._fadeSpeedOut = fadeSpeed
}