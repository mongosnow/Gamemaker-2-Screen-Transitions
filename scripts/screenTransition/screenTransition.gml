// Spawn screen transition controller object at lowest depth and initialize animation variables

function screenTransition
(
	roomGoTo = undefined, //If left undefined, the room will not change, but the animation will still play
	outAnim = ST_NONE, 
	inAnim = ST_NONE, 
	layerToUse = SCREEN_TRANSITION_LAYER, //If layer is specified, the depth of that layer will remain unchanged. If not, it will create a layer at the lowest depth for the controller.
	loopThroughObjects = DEFAULT_CHECK_OBJECT_DEPTH, //Will the function check all object depths in addition to layer depth? (may take a lot of memory)
	whichDrawEvent = DEFAULT_DRAWEVENT //0 = Draw, 1 = Draw GUI
)
{
	// If the layer is not specified, make or move the transition layer to be lowest depth (visible over everything)
	if layerToUse = SCREEN_TRANSITION_LAYER
		_screenTransitionCreateLayerAndSetDepth(layerToUse, loopThroughObjects)
	
	// Spawn the controller if it does not exist then set its layer to layerToUse
	_screenTransitionCreateAndSetControllerObject(layerToUse) 
	
	// Initialize animation variables and trigger animation
	with obj_stController
	{
		_stResetAllVariables()
		_drawEvent = whichDrawEvent
		animType = [outAnim, inAnim]
		_roomGoTo = roomGoTo
		
		if outAnim = ST_NONE
			_state = IS.IN //set to in, will immediately change rooms
		else
			_state = IS.OUT //set to out
	}
}