/// @description Perform transitions

if _transitionDo
{
	switch(_type)
	{
		#region CHECKERS
		case ST_CHECKER_LEFT_TO_RIGHT:
		_ST_checker(0)
		break;
		
		case ST_CHECKER_RIGHT_TO_LEFT:
		_ST_checker(0, true)
		break;
		
		case ST_CHECKER_UP_TO_DOWN:
		_ST_checker(1)
		break;
		
		case ST_CHECKER_DOWN_TO_UP:
		_ST_checker(1, true)
		break;
		
		case ST_CHECKER_DIAGONAL_UP_LEFT_TO_DOWN_RIGHT:
		_ST_checker(2)
		break;
		
		case ST_CHECKER_DIAGONAL_DOWN_RIGHT_TO_UP_LEFT:
		_ST_checker(2, true)
		break;
		#endregion
		
		#region FADE
		case ST_FADE:
		_ST_fade()
		break;
		#endregion
		
		default:
		_screenTransitionExit()
		break;
	}
}