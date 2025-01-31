// Create object on the layer if it does not exist, or set it to the layer if it does

function _screenTransitionCreateAndSetControllerObject(layerToUse)
{
	// Initialize global variable if first run
	if !variable_global_exists("screenTransitionObject") 
		global.screenTransitionObject = -1
	
	// Activate controller
	instance_activate_object(global.screenTransitionObject)
	
	// Get layer ID
	var layerID = layer_get_id(layerToUse)
	
	// If the controller does not exist for some reason, create it
	if !instance_exists(obj_stController)
		global.screenTransitionObject = instance_create_layer(0, 0, layerID, obj_stController)
	
	// Move it to the appropriate layer	
	layer_add_instance(layerID, global.screenTransitionObject)
}