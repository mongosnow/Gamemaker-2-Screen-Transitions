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
		{
			if _delay[IS.OUT] <= 0
				_screenshotDo = true // (Will delay room transition by one frame)
			else
				_delay[IS.OUT] --
		}
	}
	else //reset self, both animations are over
	{
		_stResetAllVariables()
		instance_deactivate_object(global.screenTransitionObject)
	}
}