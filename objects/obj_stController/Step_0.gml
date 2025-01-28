/// @description Do animations

if _state < 2
{
	// Change room after out animation finishes if _roomGoTo is set
	if _state = IS.IN && _roomGoTo != undefined
		_anim_roomChange()
	
	// Do animations
	switch(animType[_state])
	{
		case ST_FADE:
		_stFade()
		break;
		
		default: //ST_NONE
		_stNone()
		break;
	}
}