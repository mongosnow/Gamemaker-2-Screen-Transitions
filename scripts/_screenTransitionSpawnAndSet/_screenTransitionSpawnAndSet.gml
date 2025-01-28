// Create object on the layer if it does not exist, or set it to the layer if it does

function _screenTransitionCreateAndSetControllerObject(layerToUse)
{
	var layerID = layer_get_id(layerToUse)
	
	// if the controller does not exist, make it 
	if !instance_exists(obj_stController)
		global.screenTransitionObject = instance_create_layer(0, 0, layerID, obj_stController)
	// if the controller does exist, move it to the appropriate layer
	else 
		layer_add_instance(layerID, global.screenTransitionObject)
}