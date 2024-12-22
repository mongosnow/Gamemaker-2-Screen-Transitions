// Will instantly cut away to next room then tear down screenshot with a checker pattern
// Change defualts if needed

function screenTransition_checkers_color(
	changeRoomTo, 
	
	delayOut = undefined,
	delayIn = undefined,
	
	ST_checker_type_out = ST_CHECKER_DIAGONAL_UP_LEFT_TO_DOWN_RIGHT, // MUST BE A CHECKER TYPE
	checker_transform_scale_out = CHECKER_TRANSFORM_BOTH,
	
	ST_checker_type_in = ST_CHECKER_DIAGONAL_DOWN_RIGHT_TO_UP_LEFT, // MUST BE A CHECKER TYPE
	checker_transform_scale_in = CHECKER_TRANSFORM_BOTH,
	
	color = SCREEN_TRANSITION_DEFAULT_COLOR,
	layerToUse = undefined
)
{
	_screenTransition_twoWay(
		changeRoomTo,
		layerToUse,
		delayOut,
		ST_checker_type_out,
		color,
		false,
		delayIn,
		ST_checker_type_in,
		color
	)
	
	obj_screenTransitionTwoWay._checkerTransformScaleOut = checker_transform_scale_out
	obj_screenTransitionTwoWay._checkerTransformScaleIn = checker_transform_scale_in
}