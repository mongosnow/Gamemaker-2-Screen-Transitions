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
	_delay[IS.OUT] = DEFAULT_DELAY_0
	_delay[IS.IN]  = DEFAULT_DELAY_1
	
	// put variables for specific animations here
	_stResetFadeVariables()
	_stResetTransformVariables()
}

_stResetAllVariables() //initialize variables

_drawEvent = DEFAULT_DRAWEVENT

function drawEvent() // This is the main drawing function, place all animations here
{
	if _state < 2 // If _state is out of in
	{
		// Do animations
		switch(animType[_state])
		{
			#region Fade
			case ST_FADE:
			_stFade(false) 
			break;
			
			case ST_FADE_SCREENSHOT_IN:
			_stFade(true)
			break;
			#endregion
			
			#region Scale
			case ST_TRANSFORM:
			
			break;
			#endregion
		
			default: //ST_NONE or undefined, etc.
			_stNone()
			break;
		}
	}
}