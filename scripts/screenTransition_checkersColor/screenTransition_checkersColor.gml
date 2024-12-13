// Will instantly cut away to next room then tear down screenshot with a checker pattern
// Change defualts if needed

function screenTransition_checkersColor(
	changeRoomTo, 
	delayOut = undefined,
	ST_checker_type_out = ST_CHECKER_DIAGONAL_UP_LEFT_TO_DOWN_RIGHT, // MUST BE A CHECKER TYPE
	checker_transform_scale_out = CHECKER_TRANSFORM_BOTH,
	delayIn = undefined,
	ST_checker_type_in = ST_CHECKER_DIAGONAL_DOWN_RIGHT_TO_UP_LEFT, // MUST BE A CHECKER TYPE
	checker_transform_scale_in = CHECKER_TRANSFORM_BOTH,
	color = SCREEN_TRANSITION_DEFAULT_COLOR,
	layerToUse = undefined
)
{
	screenTransition(
		changeRoomTo,
		layerToUse,
		delayOut,
		ST_checker_type_out,
		color,
		,
		checker_transform_scale_out,
		false,
		delayIn,
		ST_checker_type_in,
		color,
		,
		checker_transform_scale_in
	)
}