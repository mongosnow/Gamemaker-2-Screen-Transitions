// Return the value of the lowest depth with offset added

function _lowestObjectDepthReturn(offsetOfReturn = -1)
{
	var objectsDepthMax = 0
	var objectsDepthGet = 0
	
	//will set the layer made to slightly lower than next lowest depth
	with(all)
	{
		objectsDepthGet = depth
				
		if objectsDepthMax > objectsDepthGet
			objectsDepthMax = objectsDepthGet + offsetOfReturn
	}
			
	if objectsDepthMax < -16000
		objectsDepthMax = -16000 //prevent layer from being unusable by being out of depth range

	return objectsDepthMax
}