function _screenTransitionCreateLayerAndSetDepth(layerToUse = SCREEN_TRANSITION_DEFAULT_LAYER)
{
	var depthToUse = _lowestLayerDepthReturn() //will return the depth of the lowest existing layer -1
		
	// if the layer does not exist, make it on top of all other layers
	if !layer_exists(layerToUse) 
		layer_create(depthToUse, layerToUse)
	// else set layer to be below the other layers if it already exists
	else
		layer_depth(layerToUse, depthToUse)
}