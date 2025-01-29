function _stResetTransformVariables() //for variable reset function
{
	
}

function _stTransform(useScreenshot = false)
{
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
				_anim_stateNext()
				break;
			}
			
			// Draw scaled image
		}
		
		break;
		#endregion
		
		#region IN
		case IS.IN:
		
		switch(_state2) // Increment animation
		{
			case 0:
			_anim_stateNext()
			break;
		}
			
		// Draw scaled image
		
		if useScreenshot // Draw surface sprite
		{
			if sprite_exists(spr_stSurface)
				{}//draw_sprite_ext(spr_stSurface, 0, DEFAULT_X, DEFAULT_Y, 1, 1, 0 , c_white, _fadeAlpha)
		}
		else
			{}
		
		break;
		#endregion
	}
}