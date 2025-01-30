function _stReset_stTransformScaleVariables() //for variable reset function
{
	_sizeX = 0
	_sizeY = 0
	
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

function _tScaleSpeedReturn(state) // Manage speed
{
	var unit = 1/_tScaleSpeed[state]
		
	_tScaleSpeed[state] += _tScaleAccel[state]
		
	return unit
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
					_sizeX = 0
					_sizeY = 1
					break;
					
					case 1: // Y
					_sizeX = 1
					_sizeY = 0
					break;
					
					default:
					case 2: // Both
					_sizeX = 0
					_sizeY = 0
					break;
				}
				
				_anim_state2Next()
				break;
				
				case 1:
				var unit = _tScaleSpeedReturn(IS.OUT)
				
				if _sizeX + unit < 1 // Increase x scale
					_sizeX += unit
				else
					_sizeX = 1
				
				if _sizeY + unit < 1 // Increase y scale
					_sizeY += unit
				else
					_sizeY = 1
					
				if _sizeX >= 1 && _sizeY >= 1 // When both max size, proceed
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
			_sizeX = 1
			_sizeY = 1
			
			_anim_state2Next()
			break;
				
			case 1:
			var unit = _tScaleSpeedReturn(IS.IN)
			
			if whichScale = 0 || whichScale = 2 // X and Both
			{
				if _sizeX - unit > 0 // Decrease x scale
					_sizeX -= unit
				else
					_sizeX = 0
			}
			
			if whichScale = 1 || whichScale = 2 // X and Both
			{
				if _sizeY - unit > 0 // Decrease y scale
					_sizeY -= unit
				else
					_sizeY = 0
			}
			
			// Check if animation finished then proceed
			
			var done = false
			
			if whichScale = 0 && _sizeX <= 0
				done = true
			else if whichScale = 1 && _sizeY <= 0
				done = true
			else if whichScale = 2 && _sizeX <= 0 && _sizeY <= 0
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
		
		var alpha = 1 * ((_sizeX + _sizeY) / 2)
		
		if !_tScaleFade[_state]
			alpha = 1
		
		// Find rotation
		switch(whichScale)
		{
			case 0: // X
			var rotateCheckScale = _sizeX
			break;
			
			case 1: // Y
			var rotateCheckScale = _sizeY
			break;
			
			default: // Both
			var rotateCheckScale = ((_sizeX + _sizeY) / 2)
			break;
		}
		
		var rotate = 360 * _tScaleRotateSpd[_state] * rotateCheckScale
		
		if useScreenshot // Draw surface sprite
		{
			if sprite_exists(spr_stSurface)
			{
				sprite_set_offset(spr_stSurface, centerX, centerY) // Set the offset to the specified center
				draw_sprite_ext(spr_stSurface, 0, centerX, centerY, _sizeX, _sizeY, rotate, c_white, alpha) // Draw sprite
				sprite_set_offset(spr_stSurface, 0, 0) // Reset offset
			}
		}
		else if useSprite && sprite_exists(DEFAULT_SPRITE) // Draw set sprite
		{
			sprite_set_offset(DEFAULT_SPRITE, centerX, centerY)
			draw_sprite_ext(DEFAULT_SPRITE, image_index, centerX, centerY, _sizeX, _sizeY, rotate, c_white, alpha)
			sprite_set_offset(DEFAULT_SPRITE, 0, 0)
		}
		else // Draw rectangle
		{
			var areaLeft = _tScaleLocX[_state] // Area of space to left of x origin
			var areaRight = DEFAULT_WIDTH - _tScaleLocX[_state] // Area of space right of x origin
			
			var areaTop = _tScaleLocY[_state] // Area of the space above y origin
			var areaBottom = DEFAULT_HEIGHT - _tScaleLocY[_state] // Area of the space below y origin
		
			var x1 = centerX - (areaLeft  * _sizeX)		// left width
			var x2 = centerX + (areaRight * _sizeX)		// right width
			var y1 = centerY - (areaTop   * _sizeY)		// top height
			var y2 = centerY + (areaTop   * _sizeY)		// bottom height
			
			_anim_drawRectangle(alpha, x1, y1, x2, y2)
		}
	}
	#endregion
}