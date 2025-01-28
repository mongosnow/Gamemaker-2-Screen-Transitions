function screenTransition(roomGoTo = undefined, outAnim = ST_NONE, inAnim = ST_NONE, layerToUse = SCREEN_TRANSITION_DEFAULT_LAYER, loopThroughObjects = false)
{
	// If the layer is not specified, make or move the transition layer to be lowest depth (visible over everything)
	if layerToUse = SCREEN_TRANSITION_DEFAULT_LAYER
		_screenTransitionCreateLayerAndSetDepth(layerToUse, loopThroughObjects)
	
	// Spawn the controller if it does not exist then set its layer to layerToUse
	_screenTransitionCreateAndSetControllerObject(layerToUse) 
	
	// Initialize animation variables and trigger animation
	with obj_stController
	{
		_stResetAllVariables()
		animType = [ST_NONE, outAnim, inAnim]
		_roomGoTo = roomGoTo
		
		if outAnim = ST_NONE
			_state = 2 //set to in, will immediately change rooms
		else
			_state = 1 //set to out
	}
}