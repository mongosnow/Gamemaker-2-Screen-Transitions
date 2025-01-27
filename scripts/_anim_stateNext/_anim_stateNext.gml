//put at the end of an animation, in or out

function _anim_stateNext()
{
	if _state < IS.IN //next state
	{
		//take screenshot here<<<<
		//_surfaceTakeScreenshot()
		_state2 = 0
		_state ++
	}
	else //reset self, both animations are over
		_stResetAllVariables()
}