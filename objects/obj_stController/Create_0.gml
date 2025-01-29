/// @description Initialize constants, functions, and variables

enum IS
{
	OUT = 0,
	IN = 1,
	NONE = 2
}

function _stResetAllVariables()
{
	// state
	_state = IS.NONE
	_state2 = 0
	_screenshotDo = false
	_screenshotTaken = false
	
	animType[IS.OUT] = ST_NONE
	animType[IS.IN] = ST_NONE
	animType[IS.NONE] = ST_NONE
	
	_roomGoTo = undefined
	
	// general variables
	_surfaceClear()
	_drawEvent = DEFAULT_DRAWEVENT
	_color = c_black
	
	// put variables for specific animations here
	_stResetFadeVariables()
}

_stResetAllVariables() //initialize variables

enum DRAW
{
	NORMAL = 0,
	GUI = 1,
}

_drawEvent = DEFAULT_DRAWEVENT

function drawEvent() // This is the main drawing function, place all animations here
{
	if _state < 2 // If _state is out of in
	{
		// Do animations
		switch(animType[_state])
		{
			case ST_FADE:
			_stFade() 
			break;
		
			default: //ST_NONE or undefined, etc.
			_stNone() 
			break;
		}
	}
}