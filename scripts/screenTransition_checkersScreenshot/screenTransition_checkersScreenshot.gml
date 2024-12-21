// Will instantly cut away to next room, then tear down screenshot of previous room with a checker pattern

function screenTransition_checkersScreenshot(
	changeRoomTo, 
	delayIn = 0,
	ST_checker_type_in = ST_CHECKER_DIAGONAL_DOWN_RIGHT_TO_UP_LEFT, // MUST BE A CHECKER TYPE
	checker_transform_scale_in = CHECKER_TRANSFORM_BOTH,
	layerToUse = undefined
)
{
	_screenTransition_twoWay(
		changeRoomTo,
		layerToUse,
		,
		ST_NONE,
		,
		,
		,
		true,
		delayIn,
		ST_checker_type_in,
		,
		,
		checker_transform_scale_in
	)
}