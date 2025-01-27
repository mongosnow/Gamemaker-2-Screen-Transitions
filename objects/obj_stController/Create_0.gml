/// @description Initialize

#region initialize constants and functions

enum IS
{
	NONE = 0,
	OUT = 1,
	IN = 2
}

function _stResetAllVariables()
{
	_state = IS.NONE
	_state2 = 0
	
	animType[IS.OUT] = ST_NONE
	animType[IS.IN] = ST_NONE
}

function _stStateChange()
{
	_state2 = 0
}

#endregion

_stResetAllVariables()

//put in own file
function _stAnim_fade()
{
	switch(_state)
	{
		case IS.OUT:
			switch(_state2)
			{
				case 0:
				//do stuff
				break;
				
				//etc.
			}
		break;
	}
}