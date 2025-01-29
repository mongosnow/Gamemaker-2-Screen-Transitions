//put at the end of an animation, in or out

function _anim_state2Next()
{
	if _state = IS.IN //next state
	{
		if _delay[IS.IN] <= 0
			_state2 ++
		else
			_delay[IS.IN] --
	}
	else
		_state2 ++
}