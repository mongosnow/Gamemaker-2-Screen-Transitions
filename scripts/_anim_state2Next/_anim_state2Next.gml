//put at the end of an animation, in or out

function _anim_state2Next()
{
	if _state = IS.IN // If it's in, check if the delay is up before proceeding
	{
		if _delay[IS.IN] <= 0
			_state2 ++
		else
			_delay[IS.IN] --
	}
	else // Next state
		_state2 ++
}