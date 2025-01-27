/// @description Do animations

if _state > 0
{
	// change room after out animation finishes if room is set
	if _state = IS.IN && _roomGoTo != undefined
		_anim_roomChange()
	
	#region Do animations
	switch(animType[_state])
	{
		case ST_FADE:
		_stFade()
		break;
		
		default: //ST_NONE
		_stNone()
		break;
	}
	#endregion
	
	
}