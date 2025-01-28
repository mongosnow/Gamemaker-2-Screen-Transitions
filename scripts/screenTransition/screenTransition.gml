function screenTransition(roomGoTo = undefined, outAnim = ST_NONE, inAnim = ST_NONE, layerToUse = SCREEN_TRANSITION_DEFAULT_LAYER, loopThroughObjects = false)
{
	// SPAWN AND SET DEPTH AND LAYER
	
	// If the layer is not specified specifically, make or move the transition layer to the very front
	if layerToUse = SCREEN_TRANSITION_DEFAULT_LAYER
		_screenTransitionCreateLayerAndSetDepth(layerToUse, loopThroughObjects)
	
	// Set the layer and depth, and spawn the controller if it does not exist
	_screenTransitionCreateAndSetControllerObject(layerToUse) 
	
	with obj_stController
	{
		_stResetAllVariables()
		animType = [ST_NONE, outAnim, inAnim]
		_roomGoTo = roomGoTo
		
		if outAnim = ST_NONE
			_state = 2 //set to in
		else
			_state = 1 //set to out
	}
}

/*
//secondary
function screenTransitionOneWay(roomGoTo = undefined, inAnim)
{
	//screenTransition(roomGoTo, ST_NONE, inAnim)
	//obj_stController._state = 1 //set to wait state
}