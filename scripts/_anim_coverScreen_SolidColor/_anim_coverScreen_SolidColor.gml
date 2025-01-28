function _anim_coverScreen_SolidColor(destroy = false)
{
	if destroy
	{
		if instance_exists(obj_stCoverScreen)
			instance_destroy(obj_stCoverScreen)
	}
	else
	{
		var cover = instance_create_layer(0, 0, layer, obj_stCoverScreen)
		cover.image_blend = _color
		cover._drawEvent = _drawEvent
	}
}