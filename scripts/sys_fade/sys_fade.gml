function _stResetFadeVariables() //for variable reset function
{
	_fadeSpeed = [DEFAULT_FADESPEED, DEFAULT_FADESPEED]
	_fadeAlpha = 0
}

//maybe move this \/\/\/\/\/
function screenTransition_setFadeVariables(fadeSpeedIn = DEFAULT_FADESPEED, fadeSpeedOut = DEFAULT_FADESPEED)
{
	_fadeSpeed = [fadeSpeedIn, fadeSpeedOut]
}

function _stFade()
{
	switch(_state)
	{
		#region OUT
		case IS.OUT:
		
		switch(_state2)
		{
			case 0:
			//draw fade rectangle
			_fadeAlpha = 0
			_anim_coverScreen_SolidColor()
			_state2 ++
			break;
			
			case 1:
			//check if fade out not completed
			//fade out
			if _fadeAlpha < 1
				_fadeAlpha += _fadeSpeed[IS.OUT]
			else
				_state2 ++
			break;
			
			case 2:
			//draw black rectangle
			_anim_stateNext()
			break;
		}
		
		break;
		#endregion
		
		#region IN
		case IS.IN:
		
		switch(_state2)
		{
			case 0:
			//draw fade rectangle
			//undraw black rectangle 
			_fadeAlpha = 1
			_state2 ++
			break;
			
			case 1:
			//check if fade in not completed
			//fade in
			//else
			_state2 ++
			break;
			
			case 2:
			//destroy fade out
			_anim_stateNext()
			break;
		}
		
		break;
		#endregion
	}
}