enum CHK_PATTERN
{
	LEFT_RIGHT = 0,
	RIGHT_LEFT = 1
}

enum CHK_TRANS
{
	X = 0,
	Y = 1,
	BOTH = 2
}

function _stResetCheckersVariables() //for variable reset function
{
	_checkerPattern = -1
	
	// Max size of checkers
	_checkerMaxSize = DEFAULT_CHECKER_SIZE
	
	// Checker transform
	_checkerScaleTransform = CHK_TRANS.X // 0 = X, 1 = Y, 2 = Both | Which scale to change
	
	// Checker timing variables
	_checkerTransformSpeed = [DEFAULT_CHECKER_SPEED, DEFAULT_CHECKER_SPEED] // Checker scale change
	_checkerTransformDelay = [DEFAULT_CHECKER_DELAY, DEFAULT_CHECKER_DELAY] // Delay between groups animating
	_checkerEndTimer = 0
	
	// Checker array variables
	_checkerArraySet = false // To prevent array creation from looping upon delay during In animation
	_stCheckers_state2_setArrays(true)
	
	// Extra animation variables
	_checkerFadeSquare = [false, false]
	_checkerDarkenBackground = [false, false] // WILL SYNC WITH END TIMER
	_checkerDarkenColor = c_black
	_checkerRotateSpd = [0, 0] // idk how to implement
}

function _stCheckers_state2_setArrays(init = false)
{
	if _checkerArraySet = false
	{
	#region Reset array default values
	
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
				sizeX = 1
				sizeY = 0
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
		_checkerAmountRow	 = ceil(DEFAULT_WIDTH / _checkerMaxSize)
		_checkerAmountColumn = ceil(DEFAULT_HEIGHT / _checkerMaxSize)
		_checkerAmountTotal	 = _checkerAmountRow + _checkerAmountColumn
		
		// Checker size management arrays
		for (var row = 0; row < _checkerAmountRow; row += 1)
		{
		    for (var column = 0; column < _checkerAmountColumn; column += 1)
			{
				// X scale
				_chk_sizeX[row][column] = sizeX

				// Y scale
				_chk_sizeY[row][column] = sizeY
			}
		}
		
		
	#endregion
	
	#region Set pattern specific delay
		
		_checkerEndTimer = -1
		
		var setAnimLength = function(iterations) // For setting delay
		{
			// Iterations = how many separate groups are there
			// (how many delays happen * delayTime) + time to finish one animation + time of all previous iteration delays
			
			if _checkerEndTimer = -1
			{
				var timeToFinishOneAnim = ceil(1 / _checkerTransformSpeed[_state])
				
				_checkerEndTimer = ((iterations) * _checkerTransformDelay[_state]) + timeToFinishOneAnim
			}
		}
	
		switch(_checkerPattern) // Add new patterns here
		{
			case CHK_PATTERN.LEFT_RIGHT:
			for (var row = 0; row < _checkerAmountRow; row += 1)
			{
			    for (var column = 0; column < _checkerAmountRow; column += 1)
				{
					_checkerTransformDelayTimer[row][column] = _checkerTransformDelay[_state] * row
					
					setAnimLength(_checkerAmountRow - 1)
				}
			}
			break;
			
			case CHK_PATTERN.RIGHT_LEFT:
			for (var row = 0; row < _checkerAmountRow; row += 1)
			{
			    for (var column = 0; column < _checkerAmountRow; column += 1)
				{
					_checkerTransformDelayTimer[row][column] = _checkerTransformDelay[_state] * (_checkerAmountRow - row)
					
					setAnimLength(_checkerAmountRow - 1)
				}
			}
			break;
		}

	#endregion
	}
	
	if !init
		_anim_state2Next()
}

function _stCheckers_state2_sizeChange()
{
	if _checkerEndTimer > 0 // Check if over
	{
		#region Increment size and delay timer arrays
	
		for (var row = 0; row < _checkerAmountRow; row ++)
		{
			for (var column = 0; column < _checkerAmountColumn; column ++)
			{
				if _checkerTransformDelayTimer[row][column] <= 0 // Check if timer has ended
				{
					if _state = IS.OUT // Increment size up to 1
					{
						// X scale
						if _chk_sizeX[row][column] + _checkerTransformSpeed[_state] <= 1
							_chk_sizeX[row][column] += _checkerTransformSpeed[_state]
						else
							_chk_sizeX[row][column] = 1
					
						// Y scale
						if _chk_sizeY[row][column] + _checkerTransformSpeed[_state] <= 1
							_chk_sizeY[row][column] += _checkerTransformSpeed[_state]
						else
							_chk_sizeY[row][column] = 1
					}
					else if _state = IS.IN // Increment size down to 0
					{
						// X scale
						if _checkerScaleTransform = CHK_TRANS.X || _checkerScaleTransform = CHK_TRANS.BOTH
						{
							if _chk_sizeX[row][column] - _checkerTransformSpeed[_state] >= 0
								_chk_sizeX[row][column] -= _checkerTransformSpeed[_state]
							else
								_chk_sizeX[row][column] = 0
						}
					
						// Y scale
						if _checkerScaleTransform = CHK_TRANS.Y || _checkerScaleTransform = CHK_TRANS.BOTH
						{
							if _chk_sizeY[row][column] - _checkerTransformSpeed[_state] >= 0
								_chk_sizeY[row][column] -= _checkerTransformSpeed[_state]
							else
								_chk_sizeY[row][column] = 0
						}
					}
				}
				else // If not ended, increment delay timer
					_checkerTransformDelayTimer[row][column] --
			}
		}
	
		#endregion
	
		_checkerEndTimer --
	}
	else
	{
		_checkerPattern = -1
		_anim_stateNext()
	}
}

function _stCheckers_animationPlay() // All states combined
{
	switch(_state2)
	{
		case 0: // Initialize variables and array
		_stCheckers_state2_setArrays()
		break;
				
		case 1: // Grow
		_stCheckers_state2_sizeChange()
		break;
	}
}

function _stCheckers(chk_pattern, chk_transform, useScreenshot = false, useSprite = false)
{
	_checkerPattern = chk_pattern
	_checkerScaleTransform = chk_transform
	
	#region Manage animation
	switch(_state)
	{
		case IS.OUT:
		if useScreenshot // Do not play animation if surface and is out
			_anim_stateNext()
		else
			_stCheckers_animationPlay()
		break;
		
		case IS.IN:
		_stCheckers_animationPlay()
		break;
	}
	#endregion
	
	#region Draw
	
	// Find center point
	var centerPoint = _checkerMaxSize / 2
	
	var sizeX = 0
	var sizeY = 0
	
	var _x = 0
	var _y = 0
	
	var x1 = 0
	var x2 = 0
	var y1 = 0
	var y2 = 0
	
	for (var row = 0; row < _checkerAmountRow; row ++)
	{
		for (var column = 0; column < _checkerAmountColumn; column ++)
		{
			sizeX = _checkerMaxSize * _chk_sizeX[row][column]
			sizeY = _checkerMaxSize * _chk_sizeY[row][column]
			
			_x = row * _checkerMaxSize
			_y = column * _checkerMaxSize
			
			if sizeX > 0 && sizeY > 1
			{
				if useScreenshot = true
				{
					if sprite_exists(spr_stSurface)
					{
						var _xx = _x + ((_checkerMaxSize - sizeX) ) / 2 // Move so that square stays in center of grid location
						var _yy = _y + ((_checkerMaxSize - sizeY) ) / 2

						draw_sprite_part(spr_stSurface, 0, _x, _y, sizeX, sizeY, _xx, _yy)
					}
				}
				else if useSprite = true && sprite_exists(_sprite)
				{
					var _xx = _x + ((_checkerMaxSize - sizeX) ) / 2 // Move so that square stays in center of grid location
					var _yy = _y + ((_checkerMaxSize - sizeY) ) / 2

					draw_sprite_part(sprite_index, image_index, _x, _y, sizeX, sizeY, _xx, _yy)
				}
				else
				{
					x1 = _x - (sizeX / 2) + centerPoint
					x2 = _x + (sizeX / 2) + centerPoint
					y1 = _y - (sizeY / 2) + centerPoint
					y2 = _y + (sizeY / 2) + centerPoint
					
					_anim_drawRectangle(1, x1, y1, x2, y2)
				}
			}		
		}
	}
	#endregion
}