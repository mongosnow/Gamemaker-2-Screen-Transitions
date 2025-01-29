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
		else
			_screenshotDo = true // (Will delay room transition by one frame)
	}
	else //reset self, both animations are over
		_stResetAllVariables()
}