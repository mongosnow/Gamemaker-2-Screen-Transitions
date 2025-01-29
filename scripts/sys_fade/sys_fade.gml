function _stResetFadeVariables() //for variable reset function
{
	_fadeSpeed = [DEFAULT_FADESPEED, DEFAULT_FADESPEED]
	_fadeAlpha = 0
}

function _stFade(useSurface = false)
{
	switch(_state)
	{
		#region OUT
		case IS.OUT:
		
		switch(_state2) // Increment animation
		{
			case 0: // Set alpha
			_fadeAlpha = 0
			_state2 ++
			break;
			
			case 1: // Increase alpha until it's 1
			if _fadeAlpha < 1
				_fadeAlpha += _fadeSpeed[IS.OUT]
			else
				_state2 ++
			break;
			
			case 2:
			_anim_stateNext()
			break;
		}
		
		_anim_drawRectangle_color(_fadeAlpha) // Draw transparent rectangle
		
		break;
		#endregion
		
		#region IN
		case IS.IN:
		
		switch(_state2) // Increment animation
		{
			case 0: // Set alpha
			_fadeAlpha = 1
			_state2 ++
			break;
			
			case 1: // Increase alpha until it's 0
			if _fadeAlpha > 0
				_fadeAlpha -= _fadeSpeed[IS.IN]
			else
				_state2 ++
			break;
			
			case 2:
			//destroy fade out
			_anim_stateNext()
			break;
		}
		
		_anim_drawRectangle_color(_fadeAlpha) // Draw transparent rectangle
		
		break;
		#endregion
	}
}