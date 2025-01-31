function _stReset_stTransformScaleVariables() //for variable reset function
{
	_tScaleSizeX = 0
	_tScaleSizeY = 0
	
	// Anim time
	_tScaleSpeed = [DEFAULT_TSCALE_SPEED_0, DEFAULT_TSCALE_SPEED_1]
	_tScaleAccel = [DEFAULT_TSCALE_ACCEL_0, DEFAULT_TSCALE_ACCEL_1]
	
	// Screen center
	_tScaleLocX = [DEFAULT_TSCALE_X_0, DEFAULT_TSCALE_X_1]
	_tScaleLocY = [DEFAULT_TSCALE_Y_0, DEFAULT_TSCALE_Y_1]
	
	// Fade
	_tScaleFade = [DEFAULT_TSCALE_FADE_0, DEFAULT_TSCALE_FADE_1]
	
	// Rotate
	_tScaleRotateSpd = [DEFAULT_TSCALE_ROTSPD_0, DEFAULT_TSCALE_ROTSPD_1]
}

function _tScaleSpeedIncrease(state) // Manage speed
{
	_tScaleSpeed[state] += _tScaleAccel[state]
}

//////////////  
// 0 = X	//
// 1 = Y	//  <---- whichScale
// 2 = BOTH //
//////////////

function _stTransformScale(whichScale, useScreenshot = false, useSprite = false)
{
	#region Manage animation
	
	switch(_state)
	{
		#region OUT
		case IS.OUT:
		
		if useScreenshot // Do not play animation if surface and is out
			_anim_stateNext()
		else
		{
			switch(_state2) // Increment animation
			{
				case 0:
				//Set base value(s)
				switch(whichScale)
				{
					case 0: // X
					_tScaleSizeX = 0
					_tScaleSizeY = 1
					break;
					
					case 1: // Y
					_tScaleSizeX = 1
					_tScaleSizeY = 0
					break;
					
					default:
					case 2: // Both
					_tScaleSizeX = 0
					_tScaleSizeY = 0
					break;
				}
				
				_anim_state2Next()
				break;
				
				case 1:
				var unit = _tScaleSpeed[IS.OUT]
				
				if _tScaleSizeX + unit < 1 // Increase x scale
					_tScaleSizeX += unit
				else
					_tScaleSizeX = 1
				
				if _tScaleSizeY + unit < 1 // Increase y scale
					_tScaleSizeY += unit
				else
					_tScaleSizeY = 1
					
				_tScaleSpeedIncrease(IS.OUT)
					
				if _tScaleSizeX >= 1 && _tScaleSizeY >= 1 // When both max size, proceed
					_anim_state2Next()
				break;
				
				case 2:
				_anim_stateNext()
				break;
			}
		}
		
		break;
		#endregion
		
		#region IN
		case IS.IN:
		
		switch(_state2) // Increment animation
		{
			case 0:
			//Set base value(s)
			_tScaleSizeX = 1
			_tScaleSizeY = 1
			
			_anim_state2Next()
			break;
				
			case 1:
			var unit = _tScaleSpeed[IS.IN]
			
			if whichScale = 0 || whichScale = 2 // X and Both
			{
				if _tScaleSizeX - unit > 0 // Decrease x scale
					_tScaleSizeX -= unit
				else
					_tScaleSizeX = 0
			}
			
			if whichScale = 1 || whichScale = 2 // X and Both
			{
				if _tScaleSizeY - unit > 0 // Decrease y scale
					_tScaleSizeY -= unit
				else
					_tScaleSizeY = 0
			}
			
			_tScaleSpeedIncrease(IS.IN)
			
			// Check if animation finished then proceed
			
			var done = false
			
			if whichScale = 0 && _tScaleSizeX <= 0
				done = true
			else if whichScale = 1 && _tScaleSizeY <= 0
				done = true
			else if whichScale = 2 && _tScaleSizeX <= 0 && _tScaleSizeY <= 0
				done = true
			
			if done = true
				_anim_stateNext()
			break;
		}
		
		break;
		#endregion
	}
	#endregion
	
	#region Draw
	if _state < 2
	{
		var centerX	= _tScaleLocX[_state]
		var centerY	= _tScaleLocY[_state]
		
		var alpha = 1 * ((_tScaleSizeX + _tScaleSizeY) / 2)
		
		if !_tScaleFade[_state]
			alpha = 1
		
		// Find rotation
		switch(whichScale)
		{
			case 0: // X
			var rotateCheckScale = _tScaleSizeX
			break;
			
			case 1: // Y
			var rotateCheckScale = _tScaleSizeY
			break;
			
			default: // Both
			var rotateCheckScale = ((_tScaleSizeX + _tScaleSizeY) / 2)
			break;
		}
		
		var rotate = 360 * _tScaleRotateSpd[_state] * rotateCheckScale
		
		if _tScaleSizeX > 0 && _tScaleSizeY > 0
		{
			if useScreenshot // Draw surface sprite
			{
				if sprite_exists(spr_stSurface)
				{
					sprite_set_offset(spr_stSurface, centerX, centerY) // Set the offset to the specified center
					draw_sprite_ext(spr_stSurface, 0, centerX, centerY, _tScaleSizeX, _tScaleSizeY, rotate, c_white, alpha) // Draw sprite
					sprite_set_offset(spr_stSurface, 0, 0) // Reset offset
				}
			}
			else if useSprite && sprite_exists(_sprite) // Draw set sprite
			{
				sprite_set_offset(_sprite, centerX, centerY)
				draw_sprite_ext(_sprite, image_index, centerX, centerY, _tScaleSizeX, _tScaleSizeY, rotate, c_white, alpha)
				sprite_set_offset(_sprite, 0, 0)
			}
			else // Draw rectangle
			{
				var areaLeft = _tScaleLocX[_state] // Area of space to left of x origin
				var areaRight = DEFAULT_WIDTH - _tScaleLocX[_state] // Area of space right of x origin
			
				var areaTop = _tScaleLocY[_state] // Area of the space above y origin
				var areaBottom = DEFAULT_HEIGHT - _tScaleLocY[_state] // Area of the space below y origin
		
				var x1 = centerX - (areaLeft  * _tScaleSizeX)		// left width
				var x2 = centerX + (areaRight * _tScaleSizeX)		// right width
				var y1 = centerY - (areaTop   * _tScaleSizeY)		// top height
				var y2 = centerY + (areaTop   * _tScaleSizeY)		// bottom height
			
				_anim_drawRectangle(alpha, x1, y1, x2, y2)
			}
		}
	}
	#endregion
}