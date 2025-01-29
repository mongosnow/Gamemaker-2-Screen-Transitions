//put at the end of an animation, in or out

function _anim_stateNext()
{
	if _state < IS.IN //next state
	{
		if _screenshotTaken = true //take screenshot before room change
		{
			_state2 = 0
			_state ++
		}
	}
	else //reset self, both animations are over
		_stResetAllVariables()
}