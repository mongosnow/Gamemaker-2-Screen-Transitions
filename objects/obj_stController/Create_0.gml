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
				#region LR
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
				#endregion
			
				#region RL
				case ST_CHECKER_RL_X:
				_stCheckers(CHK_PATTERN.RIGHT_LEFT, CHK_TRANS.X)
				break;
			
				case ST_CHECKER_RL_X_SCREENSHOT_IN:
				_stCheckers(CHK_PATTERN.RIGHT_LEFT, CHK_TRANS.X, true)
				break;
			
				case ST_CHECKER_RL_X_SPRITE:
				_stCheckers(CHK_PATTERN.RIGHT_LEFT, CHK_TRANS.X, false, true)
				break;
			
				case ST_CHECKER_RL_Y:
				_stCheckers(CHK_PATTERN.RIGHT_LEFT, CHK_TRANS.Y)
				break;
			
				case ST_CHECKER_RL_Y_SCREENSHOT_IN:
				_stCheckers(CHK_PATTERN.RIGHT_LEFT, CHK_TRANS.Y, true)
				break;
			
				case ST_CHECKER_RL_Y_SPRITE:
				_stCheckers(CHK_PATTERN.RIGHT_LEFT, CHK_TRANS.Y, false, true)
				break;
			
				case ST_CHECKER_RL_BOTH:
				_stCheckers(CHK_PATTERN.RIGHT_LEFT, CHK_TRANS.BOTH)
				break;
			
				case ST_CHECKER_RL_BOTH_SCREENSHOT_IN:
				_stCheckers(CHK_PATTERN.RIGHT_LEFT, CHK_TRANS.BOTH, true)
				break;
			
				case ST_CHECKER_RL_BOTH_SPRITE:
				_stCheckers(CHK_PATTERN.RIGHT_LEFT, CHK_TRANS.BOTH, false, true)
				break;
				#endregion
				
				#region UD
				case ST_CHECKER_UD_X:
            	_stCheckers(CHK_PATTERN.UP_DOWN, CHK_TRANS.X)
            	break;
       	 
            	case ST_CHECKER_UD_X_SCREENSHOT_IN:
            	_stCheckers(CHK_PATTERN.UP_DOWN, CHK_TRANS.X, true)
            	break;
       	 
            	case ST_CHECKER_UD_X_SPRITE:
            	_stCheckers(CHK_PATTERN.UP_DOWN, CHK_TRANS.X, false, true)
            	break;
       	 
            	case ST_CHECKER_UD_Y:
            	_stCheckers(CHK_PATTERN.UP_DOWN, CHK_TRANS.Y)
            	break;
       	 
            	case ST_CHECKER_UD_Y_SCREENSHOT_IN:
            	_stCheckers(CHK_PATTERN.UP_DOWN, CHK_TRANS.Y, true)
            	break;
       	 
            	case ST_CHECKER_UD_Y_SPRITE:
            	_stCheckers(CHK_PATTERN.UP_DOWN, CHK_TRANS.Y, false, true)
            	break;
       	 
            	case ST_CHECKER_UD_BOTH:
            	_stCheckers(CHK_PATTERN.UP_DOWN, CHK_TRANS.BOTH)
            	break;
       	 
            	case ST_CHECKER_UD_BOTH_SCREENSHOT_IN:
            	_stCheckers(CHK_PATTERN.UP_DOWN, CHK_TRANS.BOTH, true)
            	break;
       	 
            	case ST_CHECKER_UD_BOTH_SPRITE:
            	_stCheckers(CHK_PATTERN.UP_DOWN, CHK_TRANS.BOTH, false, true)
            	break;
				#endregion
				
				#region DU
				case ST_CHECKER_DU_X:
            	_stCheckers(CHK_PATTERN.DOWN_UP, CHK_TRANS.X)
            	break;
       	 
            	case ST_CHECKER_DU_X_SCREENSHOT_IN:
            	_stCheckers(CHK_PATTERN.DOWN_UP, CHK_TRANS.X, true)
            	break;
       	 
            	case ST_CHECKER_DU_X_SPRITE:
            	_stCheckers(CHK_PATTERN.DOWN_UP, CHK_TRANS.X, false, true)
            	break;
       	 
            	case ST_CHECKER_DU_Y:
            	_stCheckers(CHK_PATTERN.DOWN_UP, CHK_TRANS.Y)
            	break;
       	 
            	case ST_CHECKER_DU_Y_SCREENSHOT_IN:
            	_stCheckers(CHK_PATTERN.DOWN_UP, CHK_TRANS.Y, true)
            	break;
       	 
            	case ST_CHECKER_DU_Y_SPRITE:
            	_stCheckers(CHK_PATTERN.DOWN_UP, CHK_TRANS.Y, false, true)
            	break;
       	 
            	case ST_CHECKER_DU_BOTH:
            	_stCheckers(CHK_PATTERN.DOWN_UP, CHK_TRANS.BOTH)
            	break;
       	 
            	case ST_CHECKER_DU_BOTH_SCREENSHOT_IN:
            	_stCheckers(CHK_PATTERN.DOWN_UP, CHK_TRANS.BOTH, true)
            	break;
       	 
            	case ST_CHECKER_DU_BOTH_SPRITE:
            	_stCheckers(CHK_PATTERN.DOWN_UP, CHK_TRANS.BOTH, false, true)
            	break;
				#endregion
				
				#region DIAG_UL_TO_DR
				case ST_CHECKER_DIAG_UL_TO_DR_X:
            	_stCheckers(CHK_PATTERN.DIAG_UPLEFT_DOWNRIGHT, CHK_TRANS.X)
            	break;
       	 
            	case ST_CHECKER_DIAG_UL_TO_DR_X_SCREENSHOT_IN:
            	_stCheckers(CHK_PATTERN.DIAG_UPLEFT_DOWNRIGHT, CHK_TRANS.X, true)
            	break;
       	 
            	case ST_CHECKER_DIAG_UL_TO_DR_X_SPRITE:
            	_stCheckers(CHK_PATTERN.DIAG_UPLEFT_DOWNRIGHT, CHK_TRANS.X, false, true)
            	break;
       	 
            	case ST_CHECKER_DIAG_UL_TO_DR_Y:
            	_stCheckers(CHK_PATTERN.DIAG_UPLEFT_DOWNRIGHT, CHK_TRANS.Y)
            	break;
       	 
            	case ST_CHECKER_DIAG_UL_TO_DR_Y_SCREENSHOT_IN:
            	_stCheckers(CHK_PATTERN.DIAG_UPLEFT_DOWNRIGHT, CHK_TRANS.Y, true)
            	break;
       	 
            	case ST_CHECKER_DIAG_UL_TO_DR_Y_SPRITE:
            	_stCheckers(CHK_PATTERN.DIAG_UPLEFT_DOWNRIGHT, CHK_TRANS.Y, false, true)
            	break;
       	 
            	case ST_CHECKER_DIAG_UL_TO_DR_BOTH:
            	_stCheckers(CHK_PATTERN.DIAG_UPLEFT_DOWNRIGHT, CHK_TRANS.BOTH)
            	break;
       	 
            	case ST_CHECKER_DIAG_UL_TO_DR_BOTH_SCREENSHOT_IN:
            	_stCheckers(CHK_PATTERN.DIAG_UPLEFT_DOWNRIGHT, CHK_TRANS.BOTH, true)
            	break;
       	 
            	case ST_CHECKER_DIAG_UL_TO_DR_BOTH_SPRITE:
            	_stCheckers(CHK_PATTERN.DIAG_UPLEFT_DOWNRIGHT, CHK_TRANS.BOTH, false, true)
            	break;
				#endregion
				
				#region DIAG_UR_TO_DL
				case ST_CHECKER_DIAG_UR_TO_DL_X:
            	_stCheckers(CHK_PATTERN.DIAG_UPRIGHT_DOWNLEFT, CHK_TRANS.X)
            	break;
       	 
            	case ST_CHECKER_DIAG_UR_TO_DL_X_SCREENSHOT_IN:
            	_stCheckers(CHK_PATTERN.DIAG_UPRIGHT_DOWNLEFT, CHK_TRANS.X, true)
            	break;
       	 
            	case ST_CHECKER_DIAG_UR_TO_DL_X_SPRITE:
            	_stCheckers(CHK_PATTERN.DIAG_UPRIGHT_DOWNLEFT, CHK_TRANS.X, false, true)
            	break;
       	 
            	case ST_CHECKER_DIAG_UR_TO_DL_Y:
            	_stCheckers(CHK_PATTERN.DIAG_UPRIGHT_DOWNLEFT, CHK_TRANS.Y)
            	break;
       	 
            	case ST_CHECKER_DIAG_UR_TO_DL_Y_SCREENSHOT_IN:
            	_stCheckers(CHK_PATTERN.DIAG_UPRIGHT_DOWNLEFT, CHK_TRANS.Y, true)
            	break;
       	 
            	case ST_CHECKER_DIAG_UR_TO_DL_Y_SPRITE:
            	_stCheckers(CHK_PATTERN.DIAG_UPRIGHT_DOWNLEFT, CHK_TRANS.Y, false, true)
            	break;
       	 
            	case ST_CHECKER_DIAG_UR_TO_DL_BOTH:
            	_stCheckers(CHK_PATTERN.DIAG_UPRIGHT_DOWNLEFT, CHK_TRANS.BOTH)
            	break;
       	 
            	case ST_CHECKER_DIAG_UR_TO_DL_BOTH_SCREENSHOT_IN:
            	_stCheckers(CHK_PATTERN.DIAG_UPRIGHT_DOWNLEFT, CHK_TRANS.BOTH, true)
            	break;
       	 
            	case ST_CHECKER_DIAG_UR_TO_DL_BOTH_SPRITE:
            	_stCheckers(CHK_PATTERN.DIAG_UPRIGHT_DOWNLEFT, CHK_TRANS.BOTH, false, true)
            	break;
				#endregion
				
				#region DIAG_DL_TO_UR
				case ST_CHECKER_DIAG_DL_TO_UR_X:
            	_stCheckers(CHK_PATTERN.DIAG_DOWNLEFT_UPRIGHT, CHK_TRANS.X)
            	break;
       	 
            	case ST_CHECKER_DIAG_DL_TO_UR_X_SCREENSHOT_IN:
            	_stCheckers(CHK_PATTERN.DIAG_DOWNLEFT_UPRIGHT, CHK_TRANS.X, true)
            	break;
       	 
            	case ST_CHECKER_DIAG_DL_TO_UR_X_SPRITE:
            	_stCheckers(CHK_PATTERN.DIAG_DOWNLEFT_UPRIGHT, CHK_TRANS.X, false, true)
            	break;
       	 
            	case ST_CHECKER_DIAG_DL_TO_UR_Y:
            	_stCheckers(CHK_PATTERN.DIAG_DOWNLEFT_UPRIGHT, CHK_TRANS.Y)
            	break;
       	 
            	case ST_CHECKER_DIAG_DL_TO_UR_Y_SCREENSHOT_IN:
            	_stCheckers(CHK_PATTERN.DIAG_DOWNLEFT_UPRIGHT, CHK_TRANS.Y, true)
            	break;
       	 
            	case ST_CHECKER_DIAG_DL_TO_UR_Y_SPRITE:
            	_stCheckers(CHK_PATTERN.DIAG_DOWNLEFT_UPRIGHT, CHK_TRANS.Y, false, true)
            	break;
       	 
            	case ST_CHECKER_DIAG_DL_TO_UR_BOTH:
            	_stCheckers(CHK_PATTERN.DIAG_DOWNLEFT_UPRIGHT, CHK_TRANS.BOTH)
            	break;
       	 
            	case ST_CHECKER_DIAG_DL_TO_UR_BOTH_SCREENSHOT_IN:
            	_stCheckers(CHK_PATTERN.DIAG_DOWNLEFT_UPRIGHT, CHK_TRANS.BOTH, true)
            	break;
       	 
            	case ST_CHECKER_DIAG_DL_TO_UR_BOTH_SPRITE:
            	_stCheckers(CHK_PATTERN.DIAG_DOWNLEFT_UPRIGHT, CHK_TRANS.BOTH, false, true)
            	break;
				#endregion
				
				#region DIAG_DR_TO_UL
				case ST_CHECKER_DIAG_DR_TO_UL_X:
            	_stCheckers(CHK_PATTERN.DIAG_DOWNRIGHT_UPLEFT, CHK_TRANS.X)
            	break;
       	 
            	case ST_CHECKER_DIAG_DR_TO_UL_X_SCREENSHOT_IN:
            	_stCheckers(CHK_PATTERN.DIAG_DOWNRIGHT_UPLEFT, CHK_TRANS.X, true)
            	break;
       	 
            	case ST_CHECKER_DIAG_DR_TO_UL_X_SPRITE:
            	_stCheckers(CHK_PATTERN.DIAG_DOWNRIGHT_UPLEFT, CHK_TRANS.X, false, true)
            	break;
       	 
            	case ST_CHECKER_DIAG_DR_TO_UL_Y:
            	_stCheckers(CHK_PATTERN.DIAG_DOWNRIGHT_UPLEFT, CHK_TRANS.Y)
            	break;
       	 
            	case ST_CHECKER_DIAG_DR_TO_UL_Y_SCREENSHOT_IN:
            	_stCheckers(CHK_PATTERN.DIAG_DOWNRIGHT_UPLEFT, CHK_TRANS.Y, true)
            	break;
       	 
            	case ST_CHECKER_DIAG_DR_TO_UL_Y_SPRITE:
            	_stCheckers(CHK_PATTERN.DIAG_DOWNRIGHT_UPLEFT, CHK_TRANS.Y, false, true)
            	break;
       	 
            	case ST_CHECKER_DIAG_DR_TO_UL_BOTH:
            	_stCheckers(CHK_PATTERN.DIAG_DOWNRIGHT_UPLEFT, CHK_TRANS.BOTH)
            	break;
       	 
            	case ST_CHECKER_DIAG_DR_TO_UL_BOTH_SCREENSHOT_IN:
            	_stCheckers(CHK_PATTERN.DIAG_DOWNRIGHT_UPLEFT, CHK_TRANS.BOTH, true)
            	break;
       	 
            	case ST_CHECKER_DIAG_DR_TO_UL_BOTH_SPRITE:
            	_stCheckers(CHK_PATTERN.DIAG_DOWNRIGHT_UPLEFT, CHK_TRANS.BOTH, false, true)
            	break;
				#endregion
				
				#region SPIRAL
				//case ST_CHECKER_SPIRAL_X:
            	//_stCheckers(CHK_PATTERN.SPIRAL_0, CHK_TRANS.X)
				//break;
				#endregion
			#endregion
		
			default: //ST_NONE or undefined, etc.
			_stNone()
			break;
		}
	}
}