// Creates a controller object that will chain two transition animations together, switch rooms, then destroy itself

// Only needs to be ran once where the exit transition should happen

// If the specified layer does not exist, one will be created at a depth 1 lower than all other layers

function screenTransition(
	changeRoomTo, // room to change to on out anim
	
	layerToUse = SCREEN_TRANSITION_DEFAULT_LAYER, // layer that will be used for animation
	
	// out //
	delayOut		=	undefined,	// delay before changing rooms
	ST_typeOut		=	undefined,	// style to use on out anim
	colorOut		=	undefined,	// color to use on out anim
	fadeSpeedOut	=	undefined,	// speed at which color fades for fade anim out
	checkerScaleOut =	undefined,	// how the checkers will animate on out anim if checkers
	
	// in //
	isScreenshotIn	=	false,		// use screenshot on in anim or not
	delayIn			=	undefined,	// delay on in anim
	ST_typeIn		=	undefined,	// style of in anim
	colorIn			=	undefined,	// color of in anim
	fadeSpeedIn		=	undefined,	// speed at which color fades for fade anim in
	checkerScaleIn	=	undefined	// how the checkers will animate on in anim
)
{
	// spawn animation controller with specific animation variables
	
	if !instance_exists(obj_screenTransitionTwoWay)
	{
		// prevent invalid layer from crashing by creating it
		if !layer_exists(layerToUse) 
			layer_create(0, layerToUse)
		
		// create controller
		var transition = instance_create_layer(0, 0, layerToUse, obj_screenTransitionTwoWay)
		
		//out animation variables
		transition._changeRoomTo	=	changeRoomTo
		transition._delayOut		=	delayOut
		transition._ST_typeOut		=	ST_typeOut
		transition._colorOut		=	colorOut
		transition._fadeSpeedOut	=	fadeSpeedOut
		transition._checkerTransformScaleOut = checkerScaleOut
		
		//in animation variables
		transition._isScreenshotIn	=	isScreenshotIn
		transition._delayIn			=	delayIn
		transition._ST_typeIn		=	ST_typeIn
		transition._colorIn			=	colorIn
		transition._fadeSpeedIn		=	fadeSpeedIn
		transition._checkerTransformScaleIn = checkerScaleIn
		
		transition._layerToUse = layerToUse
	}
}