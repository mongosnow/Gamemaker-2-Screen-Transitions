// Functions that draw the surface
// MUST BE IN POST-DRAW EVENT TO SHOW, run every frame

// the default function
function _surfaceDraw(
	drawPart = false, 
	left = 0, 
	top = 0, 
	width = SCREEN_TRANSITION_DEFAULT_WIDTH, 
	height = SCREEN_TRANSITION_DEFAULT_HEIGHT, 
	_x = 0, 
	_y = 0, 
	_xScale = 1, 
	_yScale = 1,
	alpha = 1
)
{
	var ctrl = obj_screenTransitionController
	
	// draw screenshot
	surface_set_target(application_surface)
	
	if ctrl._surfaceExists // double check to really prevent crash
	{
		if surface_exists(ctrl._surface) // draw the screenshot
		{
			if !drawPart
				draw_surface_ext(ctrl._surface,0,0,1,1,0,c_white,1)
			else
				draw_surface_part_ext(ctrl._surface, left, top, width, height, _x, _y, _xScale, _yScale, c_white, alpha)
		}
		else // create from buffer if lost surface
		{
			with ctrl
			{
				ctrl._surface = surface_create(ctrl._surfaceWidth, ctrl._surfaceHeight)
				buffer_set_surface(ctrl._surfaceBuffer, ctrl._surface, 0)
			}
		}
	}
	
	surface_reset_target()
}

// checkers
function _surfaceDrawSquare(left, top, width, height, _x, _y, _xScale, _yScale)
{
	_surfaceDraw(true, left, top, width, height, _x, _y, _xScale, _yScale)
}