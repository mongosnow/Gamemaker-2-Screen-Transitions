/// @description Initialize constants, functions, and variables

enum IS
{
	OUT = 0,
	IN = 1,
	NONE = 2
}

function _stResetAllVariables()
{
	// State //
	_state = IS.NONE
	_state2 = 0
	_screenshotDo = false
	_screenshotTaken = false
	
	animType[IS.OUT] = ST_NONE
	animType[IS.IN] = ST_NONE
	animType[IS.NONE] = ST_NONE
	
	_roomGoTo = undefined
	
	// General variables //
	
	_surfaceClear()
	
	_drawEvent = DEFAULT_DRAWEVENT
	_color = DEFAULT_COLOR
	_delay[IS.OUT] = DEFAULT_DELAY_0
	_delay[IS.IN]  = DEFAULT_DELAY_1
	
	if sprite_exists(DEFAULT_SPRITE)
	{
		_sprite = DEFAULT_SPRITE
		sprite_index = DEFAULT_SPRITE
	}
	else
		_sprite = -1
	
	// (Put variables for specific animations here) //
	
	_stResetFadeVariables()
	_stReset_stTransformScaleVariables()
	_stResetCheckersVariables()
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
			
			case ST_FADE_SPRITE:
			_stFade(false, true)
			break;
			#endregion
			
			#region Scale
			case ST_TSCALE_X:
			_stTransformScale(0)
			break;
			
			case ST_TSCALE_X_SREENSHOT_IN:
			_stTransformScale(0, true)
			break;
			
			case ST_TSCALE_X_SPRITE:
			_stTransformScale(0, false, true)
			break;
			
			case ST_TSCALE_Y:
			_stTransformScale(1)
			break;
			
			case ST_TSCALE_Y_SCREENSHOT_IN:
			_stTransformScale(1, true)
			break;
			
			case ST_TSCALE_Y_SPRITE:
			_stTransformScale(1, false, true)
			break;
			
			case ST_TSCALE_BOTH:
			_stTransformScale(2)
			break;
			
			case ST_TSCALE_BOTH_SCREENSHOT_IN:
			_stTransformScale(2, true)
			break;
			
			case ST_TSCALE_BOTH_SPRITE:
			_stTransformScale(2, false, true)
			break;
			#endregion
			
			#region Checkers
			case ST_CHECKER_LR_X:
			_stCheckers(CHK_PATTERN.LEFT_RIGHT, CHK_TRANS.X)
			break;
			
			case ST_CHECKER_LR_X_SCREENSHOT_IN:
			_stCheckers(CHK_PATTERN.LEFT_RIGHT, CHK_TRANS.X, true)
			break;
			
			case ST_CHECKER_LR_X_SPRITE:
			_stCheckers(CHK_PATTERN.LEFT_RIGHT, CHK_TRANS.X, false, true)
			break;
			
			case ST_CHECKER_LR_Y:
			_stCheckers(CHK_PATTERN.LEFT_RIGHT, CHK_TRANS.Y)
			break;
			
			case ST_CHECKER_LR_Y_SCREENSHOT_IN:
			_stCheckers(CHK_PATTERN.LEFT_RIGHT, CHK_TRANS.Y, true)
			break;
			
			case ST_CHECKER_LR_Y_SPRITE:
			_stCheckers(CHK_PATTERN.LEFT_RIGHT, CHK_TRANS.Y, false, true)
			break;
			
			case ST_CHECKER_LR_BOTH:
			_stCheckers(CHK_PATTERN.LEFT_RIGHT, CHK_TRANS.BOTH)
			break;
			
			case ST_CHECKER_LR_BOTH_SCREENSHOT_IN:
			_stCheckers(CHK_PATTERN.LEFT_RIGHT, CHK_TRANS.BOTH, true)
			break;
			
			case ST_CHECKER_LR_BOTH_SPRITE:
			_stCheckers(CHK_PATTERN.LEFT_RIGHT, CHK_TRANS.BOTH, false, true)
			break;
			
			case ST_CHECKER_RL_X:
			_stCheckers(CHK_PATTERN.RIGHT_LEFT, CHK_TRANS.X)
			break;
			#endregion
		
			default: //ST_NONE or undefined, etc.
			_stNone()
			break;
		}
	}
}