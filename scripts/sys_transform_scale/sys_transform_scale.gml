function _stReset_stTransformScaleVariables() //for variable reset function
{
	_sizeX = 0
	_sizeY = 0
	
	_tScaleTime = [DEFAULT_TSCALE_SPEED_0, DEFAULT_TSCALE_SPEED_1]
}

//////////////  <---- whichScale
// 0 = X	//
// 1 = Y	// 
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
				if _sizeX < 1 // Increase x scale
					_sizeX += 1/_tScaleTime[IS.OUT]
				else
					_sizeX = 1
				
				if _sizeY < 1 // Increase y scale
					_sizeY += 1/_tScaleTime[IS.OUT]
				else
					_sizeY = 1
					
				if _sizeX >= 1 && _sizeY >= 1 // When both max size, proceed
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
			if whichScale = 0 || whichScale = 2 // X and Both
			{
				if _sizeX > 0 // Increase x scale
					_sizeX -= 1/_tScaleTime[IS.IN]
				else
					_sizeX = 0
			}
			
			if whichScale = 1 || whichScale = 2 // X and Both
			{
				if _sizeY > 0 // Increase y scale
					_sizeY -= 1/_tScaleTime[IS.IN]
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
		
	var centerX	= DEFAULT_WIDTH  / 2
	var centerY	= DEFAULT_HEIGHT / 2
		
	if useScreenshot // Draw surface sprite
	{
		if sprite_exists(spr_stSurface)
		{
			sprite_set_offset(spr_stSurface, centerX, centerY)
			draw_sprite_ext(spr_stSurface, 0, centerX, centerY, _sizeX, _sizeY, 0, c_white, _fadeAlpha)
			sprite_set_offset(spr_stSurface, 0, 0)
		}
	}
	else if useSprite && sprite_exists(DEFAULT_SPRITE)
	{
		sprite_set_offset(DEFAULT_SPRITE, centerX, centerY)
		draw_sprite_ext(DEFAULT_SPRITE, 0, centerX, centerY, _sizeX, _sizeY, 0, c_white, _fadeAlpha)
		sprite_set_offset(DEFAULT_SPRITE, 0, 0)
	}
	else // Draw rectangle
	{
		var sizeXCut = (_sizeX * DEFAULT_WIDTH)  / 2
		var sizeYCut = (_sizeY * DEFAULT_HEIGHT) / 2
		
		var x1 = centerX - sizeXCut // left
		var x2 = centerX + sizeXCut	// right
		var y1 = centerY - sizeYCut	// top
		var y2 = centerY + sizeYCut	// bottom
		
		_anim_drawRectangle(1, x1, y1, x2, y2)
	}
		
	#endregion
}