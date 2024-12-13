/// @description shrink or grow

if _animate
{
	var targetScale = 1
	var changeAmount = SCREEN_TRANSITION_DEFAULT_CHECKER_CHANGE
	
	if !_grow
	{
		targetScale = 0
		changeAmount = -SCREEN_TRANSITION_DEFAULT_CHECKER_CHANGE
	}
	
	if _scale != targetScale
		_scale += changeAmount
	else if targetScale = 0 //clean up on shrink finish
		instance_destroy(self)
}
else
{
	_delay --
	
	if _delay <= 0
		_animate = true
}

//draw_surface <- the function needed