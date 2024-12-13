/// @description Draw squares
if _drawSurface = false
{
	#region do scale change
	var x1 = x
	var y1 = y
	var x2 = x + _size
	var y2 = y + _size
	var center = (_size * _scale) / 2
	var offset = _size / 2
		
	switch(_scaleChangeType) //
	{
		default: //horizontal
		x1 = x + center + 1 + offset - 1
		x2 = x - center + offset - 1
		break;
		
		case CHECKER_TRANSFORM_YSCALE: //vertical
		y1 = y + center + 1 + offset - 1
		y2 = y - center + offset - 1
		break;
		
		case CHECKER_TRANSFORM_BOTH:
		x1 = x + center + 1 + offset - 1
		x2 = x - center + offset - 1
		y1 = y + center + 1 + offset - 1
		y2 = y - center + offset - 1
		break;
	}
	#endregion

	if _scale != 0
	{
		draw_set_color(image_blend)
		draw_rectangle(x1, y1, x2, y2, false)
	}
}