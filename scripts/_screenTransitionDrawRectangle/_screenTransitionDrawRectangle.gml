// Draw a rectangle of the specified color in the specified area to cover up screen

function _screenTransitionDrawRectangle()
{
	var x1 = 0
	var x2 = SCREEN_TRANSITION_DEFAULT_WIDTH
	var y1 = 0
	var y2 = SCREEN_TRANSITION_DEFAULT_HEIGHT
	
	draw_set_color(_color)
	draw_set_alpha(_fadeAlpha)
	draw_rectangle(x1, y1 , x2, y2, false)
	draw_set_alpha(1)
}