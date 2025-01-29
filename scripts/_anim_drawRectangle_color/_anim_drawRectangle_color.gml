function _anim_drawRectangle_color(alpha = 1, x1 = 0, y1 = 0, x2 = DEFAULT_WIDTH, y2 = DEFAULT_HEIGHT)
{
	draw_set_color(_color)
	draw_set_alpha(alpha)
	draw_rectangle(x1, y1 , x2, y2, false)
	draw_set_alpha(1)
}