/// @description Do animations

if _state > 0
{
	var st = _state

	switch(animType[st])
	{
		case ST_CHECKER:
		//function for checker anim(st)
		break;
		
		//etc.
	}
	
	if _state > IS.IN
	{
		//reset all vars function(true)
		_state = IS.NONE
	}
}