enum CHK_PATTERN
{
	LEFT_RIGHT = 0,
	RIGHT_LEFT = 1
}

enum CHK_TRANS
{
	X = 0,
	Y = 1,
	BOTH = 1
}

function _stResetCheckersVariables() //for variable reset function
{
	// Max size of checkers
	_checkerMaxSize = DEFAULT_CHECKER_SIZE
	
	// Checker transform
	_checkerPattern = [CHK_PATTERN.LEFT_RIGHT, CHK_PATTERN.LEFT_RIGHT] // 0 = Horizontal, 1 = Vertical, 2 = Diagonal
	_checkerScaleTransform = [CHK_TRANS.X, CHK_TRANS.X] // 0 = X, 1 = Y, 2 = Both | Which scale to change
	
	// Checker timing variables
	_checkerTransformSpeed = [DEFAULT_CHECKER_SPEED, DEFAULT_CHECKER_SPEED] // Checker scale change
	_checkerTransformDelay = [DEFAULT_CHECKER_DELAY, DEFAULT_CHECKER_DELAY] // Delay between groups animating
	
	// Checker array variables
	_checkerArraySet = false // To prevent array creation from looping upon delay during In animation
}

function _stCheckers_state_setArrays()
{
	if _checkerArraySet = false
	{
	#region Reset array default values
		_checkerTransformDelayTimer = 0
		
		// Default
		var sizeX = 0
		var sizeY = 0
	
		switch(_state)
		{
			case IS.OUT:
			switch(_checkerScaleTransform)
			{
				case CHK_TRANS.X: // X
				sizeX = 0
				sizeY = 1
				break;
				
				case CHK_TRANS.Y: // Y
				sizeX = 0
				sizeY = 1
				break;
			}
			break;
		
			case IS.IN:
			sizeX = 1
			sizeY = 1
			_checkerArraySet = true // Prevents looping after In animation
			break;
		}
	
		// Ammount of checkers in each row and column
		_checkerAmountRow	 = ceil(_checkerMaxSize / DEFAULT_WIDTH)
		_checkerAmountColumn = ceil(_checkerMaxSize / DEFAULT_HEIGHT)
		_checkerAmountTotal	 = _checkerAmountRow + _checkerAmountColumn
		
		// Checkers current reset
		_checkerRowCurrent = -1
		_checkerColumnCurrent = -1
		
		var isLast = function(arg0, arg1) // Return true if final entry in array
		{
			if arg0 + arg1 = _checkerAmountTotal - 2
				return true
			else
				return false
		}
		
		// Checker size management arrays
		for (var row = 0; row < _checkerAmountRow; row += 1)
		{
		    for (var column = 0; column < _checkerAmountColumn; column += 1)
			{
				// X scale
				_chk_sizeX[row][column] = sizeX
				if isLast(row, column){
					array_resize(_chk_sizeX, _checkerAmountRow)
					array_resize(_chk_sizeX[row], _checkerAmountColumn)
				}
				
				// Y scale
				_chk_sizeY[row][column] = sizeY 
				if isLast(row, column){
					array_resize(_chk_sizeY, _checkerAmountRow)
					array_resize(_chk_sizeY[row], _checkerAmountColumn)
				}
			}
		}
	#endregion
	
	#region Set pattern array values
		switch(_checkerPattern[_state])
		{
			case CHK_PATTERN.LEFT_RIGHT:
			for (var row = 0; row < _checkerAmountRow; row ++) //square draw
			{
				for (var column = 0; column < _checkerAmountColumn; column ++)
					_checkerTransformDelayTimer[row][column] = _checkerTransformDelay * column
			}
			break;
		}
	#endregion
	}
}

function _stCheckers_state_sizeChange()
{
	
}

function _stCheckers(arrayType, useScreenshot = false, useSprite = false)
{
	switch(_state)
	{
		#region OUT
		case IS.OUT:
		
		if useScreenshot // Do not play animation if surface and is out
			_anim_stateNext()
		else
		{
			switch(_state2)
			{
				case 0: // Initialize variables and array
				_stCheckers_state_setArrays()
				_anim_state2Next()
				break;
				
				case 1: // Grow
				
				break;
				
				default:
				_anim_stateNext()
				break;
			}
		}
		
		break;
		#endregion
		
		#region IN
		case IS.IN:
		
		switch(_state2)
		{
			case 0:
			_stCheckers_resetArray(_state)
			_anim_state2Next()
			break;
			
			default:
			_anim_stateNext()
			break;
		}
		
		break;
		#endregion
	}
	
	#region Draw
	//for row
	//for column
	//draw 
	/*
	var x1 = x
	var y1 = y
	var x2 = x + _size
	var y2 = y + _size
	var center = (_size * _scale) / 2
	var offset = _size / 2
	
	switch(_checkerScaleTransform[_state])
	{
		case 0: // X
		x1 = x + center + 1 + offset - 1
		x2 = x - center + offset - 1
		break;
		
		case 1: // Y
		y1 = y + center + 1 + offset - 1
		y2 = y - center + offset - 1
		break;
		
		default: // Both
		x1 = x + center + 1 + offset - 1
		x2 = x - center + offset - 1
		y1 = y + center + 1 + offset - 1
		y2 = y - center + offset - 1
		break;
	}
	
	_anim_drawRectangle(1, x1, y1, x2, y2)
	*/
	#endregion
}