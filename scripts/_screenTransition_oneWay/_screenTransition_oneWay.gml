// Does the screen transition one way
// For use in obj_screenTransitionTwoWay

// in and out input macros
#macro OUT_ST 0
#macro IN_ST 1

function _screenTransition_oneWay(
	inOrOut,
	changeRoomTo = undefined,
	delay = SCREEN_TRANSITION_DEFAULT_DELAY,
	ST_type = undefined,
	layerToUse = SCREEN_TRANSITION_DEFAULT_LAYER,
	isScreenshot = false,
	color = SCREEN_TRANSITION_DEFAULT_COLOR,
	checkerTransformScale = SCREEN_TRANSITION_DEFAULT_CHECKER_TRANSFORM
)
{
	// garbage collection if checker objects are on screen
	_screenTransitionSquareCleanup()
	
	// correct value for changeRoomTo if the room is not set to prevent crashing
	if changeRoomTo = false
		changeRoomTo = undefined
		
	if SCREEN_TRANSITION_ALLOW_ROOMCHANGE_ON_IN_INPUT = false && inOrOut = IN_ST //do not change rooms if it's an in transition
		changeRoomTo = undefined
	
	// automatically set default transition types if not defined
	if ST_type = undefined
	{
		if inOrOut = IN_ST
			ST_type = ST_IN_DEFAULT
		else
			ST_type = ST_OUT_DEFAULT
	}
		
	// if the layer is not specified specifically, make or move the transition layer to the very front
	if layerToUse = SCREEN_TRANSITION_DEFAULT_LAYER 
		_screenTransitionCreateLayerAndSetDepth()
		
	// set the layer and depth, and spawn the controller if it does not exist
	_screenTransitionCreateAndSetControllerObject(layerToUse)
	
	// initialize transition in controller, set all variables
	with(global.screenTransitionObject)
	{
		_type		= ST_type		//the style
		_color		= color			//for drawing shapes and fade screen
		_delay		= delay			//ammount to delay by
		_isSurface	= isScreenshot	//should it take a screenshot
		_roomChange = changeRoomTo	//if out
		_inOrOut	= inOrOut		//transition in or out
		_fadeAlpha	= inOrOut		//set alpha
		_state = 0					//reset action in case
		
		_checkerTransformScale = checkerTransformScale // set how the checker pattern will be scaled
		
		_transitionDo = true //activate
	}
}