// Scripts for managing and doing checker animation

// spawn squares
function _screenTransitionSquareMake(
	type, //vertical, horizontal, diagonal
	grow, //is it growing or shrinking
	transitionSpeed = SCREEN_TRANSITION_DEFAULT_CHECKER_DELAY, //time between square rows animating
	reverse = false //will it go the opposite direction, as in instead of up to down going down to up?
)
{
	var surface = undefined
	
	if _isSurface
		surface = _surface
	
	var wPart = 0
	if SCREEN_TRANSITION_DEFAULT_WIDTH / _checkerSize % _checkerCountW != 0
		wPart = true
		
	var hPart = false
	if SCREEN_TRANSITION_DEFAULT_HEIGHT / _checkerSize % _checkerCountH != 0
		hPart = true
		
	for (var w = 0; w < _checkerCountW; w ++) //square draw
	{
		for (var h = 0; h < _checkerCountH; h ++)
		{
			var _square = instance_create_layer(_checkerSize * w, _checkerSize * h, layer, obj_ST_checker)
			
			switch(type) //set delay speed based on which line
			{
				default: //horiztonal
				_transitionTimer = (_checkerCountW) * transitionSpeed  // the ammount of time for the squares to fill the screen
				
				if !reverse
					_square._delay = (w * transitionSpeed)
				else
					_square._delay = _transitionTimer - (w * transitionSpeed)
				break;
				
				case 1: //vertical
				_transitionTimer = (_checkerCountH) * transitionSpeed
				
				if !reverse
					_square._delay = (h * transitionSpeed)
				else
					_square._delay = _transitionTimer - (h * transitionSpeed)
				break;
				
				case 2: //diagonal
				_transitionTimer = (_checkerCountW+_checkerCountH) * transitionSpeed
				
				if !reverse
					_square._delay = ((h + w) * transitionSpeed)
				else
					_square._delay = _transitionTimer - ((h + w) * transitionSpeed)
				break;
			}
				
			_square.image_blend = _color
			_square._size = _checkerSize
			_square._type = type
			_square._grow = grow
			_square._scaleChangeType = _checkerTransformScale
			
			if _inOrOut = IN_ST
				_square._drawSurface = _isSurface
			
			if grow
				_square._scale = 0
			else
				_square._scale = 1
		}
	}
}

// delete squares, clean up
function _screenTransitionSquareCleanup()
{
	if instance_exists(obj_ST_checker)
		instance_destroy(obj_ST_checker)
}

// do animation
function _ST_checker(type, reverse = false, transitionSpeed = SCREEN_TRANSITION_DEFAULT_CHECKER_DELAY)
{
	var grow = !_inOrOut
	
	switch (_state)
	{
		case 0: //make the squares
		var delay = false //for screen tranition [IN_ST] wait
		
		if _inOrOut = IN_ST //prevent single frame of unhide by blocking it off with a rectangle
		{
			delay = _screenTransitionDelayTimerReturn()
			
			if !_isSurface
				_screenTransitionDrawRectangle()
			else
				_rectangleBG = true
		}
		
		if delay = false
		{
			_rectangleBG = false
			_screenTransitionSquareMake(type, grow, transitionSpeed, reverse)
			_state ++
		}
		break;
			
		case 1: //wait for squares to be finished
		_transitionTimer --
			
		if _transitionTimer <= 0 - ceil(1/SCREEN_TRANSITION_DEFAULT_CHECKER_CHANGE)
			_state ++
		break;
			
		default: //end transition
		var delay = false
		
		if _inOrOut = OUT_ST
			delay = _screenTransitionDelayTimerReturn()
		
		if delay = false
			_screenTransitionExit() // if it's in, clear surfaces
		break;
	}
}

