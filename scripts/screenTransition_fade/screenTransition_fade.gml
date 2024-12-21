// Two way fade out with color

function screenTransition_fade(
	changeRoomTo,
	layerToUse = undefined,
	fadeSpeedOut = SCREEN_TRANSITION_DEFAULT_FADE_SPEED, // 1st part 
	fadeSpeedIn = SCREEN_TRANSITION_DEFAULT_FADE_SPEED, // 2nd part
	delayOut = undefined,
	delayIn = undefined,
	color = undefined
)
{
	_screenTransition_twoWay(
		changeRoomTo,
		layerToUse,
		,
		ST_FADE,
		color,
		,
		false,
		delayIn,
		ST_FADE,
		color,
		
	)
	
	obj_screenTransitionTwoWay._fadeSpeedOut = fadeSpeedOut
	obj_screenTransitionTwoWay._fadeSpeedIn = fadeSpeedIn
}