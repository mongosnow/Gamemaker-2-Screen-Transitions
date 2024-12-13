// Do fade animation
function _ST_fade()
{
	var done = false
	
	//fade until amount reached, then reset
	if _inOrOut = OUT_ST
	{
		if _fadeAlpha < 1 
			_fadeAlpha += _fadeSpeed
		else{
			if _screenTransitionDelayTimerReturn() = false // wait until delay timer ends to proceed
				done = true
		}
	}
	else if _inOrOut = IN_ST
	{
		if _isSurface = false
			_rectangleBG = false
		
		if _fadeAlpha > 0{
			if _screenTransitionDelayTimerReturn() = false // wait until delay timer ends to start fading
				_fadeAlpha -= _fadeSpeed
		}
		else
			done = true
	}
	
	if done = true
		_screenTransitionExit()
	
	if _isSurface = false
		_screenTransitionDrawRectangle()
}