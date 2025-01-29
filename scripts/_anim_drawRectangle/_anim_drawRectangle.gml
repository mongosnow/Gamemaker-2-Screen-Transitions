function _anim_drawRectangle(alpha = 1, x1 = undefined, y1 = undefined, x2 = undefined, y2 = undefined)
{
	draw_set_color(_color)
	draw_set_alpha(alpha)
	
	if y2 = undefined
		draw_rectangle(_stX, _stY , _stWidth, _stHeight, false)
	else
		draw_rectangle(x1, y1 , x2, y2, false)
	
	draw_set_alpha(1)
}