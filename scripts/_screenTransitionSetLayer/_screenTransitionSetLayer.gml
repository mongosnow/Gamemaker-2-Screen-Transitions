function _screenTransitionCreateLayerAndSetDepth(layerToUse, loopThroughObjects = false)
{
	var depthToUse = _lowestLayerDepthReturn(-1, layerToUse) //will return the depth of the lowest existing layer -1
	
	if loopThroughObjects
	{
		var lowestObjectDepth = _lowestObjectDepthReturn()
		
		//if there is an object at a lower depth than the lowest layer, use that depth minus the offset instead
		if lowestObjectDepth > depthToUse
			depthToUse = lowestObjectDepth
	}
	
	// if the layer does not exist, make it on top of all other layers
	if !layer_exists(layerToUse)
		layer_create(depthToUse, layerToUse)
	// else set layer to be below the other layers if it already exists
	else
		layer_depth(layerToUse, depthToUse)
}