// Return the value of the lowest depth with offset added
// can specifiy a layer to exclude if necessary

function _lowestLayerDepthReturn(offsetOfReturn = -1, exclude = SCREEN_TRANSITION_DEFAULT_LAYER)
{
	var layers = layer_get_all() //make temp array of all layers
	var layersDepthMax = 0
	var layersDepthGet = 0
	var excludedLayerID = undefined
	
	if layer_exists(exclude) //get id of excluded layer
		excludedLayerID = layer_get_id(exclude)
			
	//will set the layer made to slightly lower than next lowest depth
	for (var i = 0; i < array_length(layers); i ++;)
	{
		if layers[i] != excludedLayerID // do not count the excluded layer in the calculation
		{
			layersDepthGet = layer_get_depth(layers[i])
				
			if layersDepthMax > layersDepthGet
				layersDepthMax = layersDepthGet + offsetOfReturn
		}
	}
			
	if layersDepthMax < -16000
		layersDepthMax = -16000 //prevent layer from being unusable by being out of depth range
	
	return layersDepthMax
}