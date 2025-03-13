function _anim_drawRectangle(alpha = 1, x1 = DEFAULT_X, y1 = DEFAULT_Y, x2 = DEFAULT_WIDTH, y2 = DEFAULT_HEIGHT, color = undefined)
{
	if color = undefined
		color = _color
		
	draw_set_color(color)
	draw_set_alpha(alpha)
	draw_rectangle(x1, y1 , x2, y2, false)
	draw_set_alpha(1)
}