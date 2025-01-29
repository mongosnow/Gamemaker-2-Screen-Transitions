//sprite_create_from_surface() <<USE THIS

function _surfaceInitialize(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT) // put in create event
{
	// Screenshot variables
	_surface = -1 // Surface
	spr_stSurface = -1 // Sprite
	
	// Size
	_surfaceWidth = width
	_surfaceHeight = height
}

function _surfaceClear() // Put in clean up and create event
{
	if !variable_instance_exists(id, "_surface") // Initialize
		_surfaceInitialize()
	
	if surface_exists(_surface)
		surface_free(_surface)
		
	if sprite_exists(spr_stSurface)
		sprite_delete(spr_stSurface)
	
	_surfaceInitialize() // Reset variables
}

function _surfaceTakeScreenshot() // put in post-draw event, run once
{
	var x1 = camera_get_view_x(view_camera[0])
	var y1 = camera_get_view_y(view_camera[0])
	var x2 = _surfaceWidth
	var y2 = _surfaceHeight
	
	// Take screenshot, make sprite from screenshot, clear screenshot
	_surface = surface_create(x2, y2)
	surface_set_target(_surface)
	
	draw_surface(application_surface, x1, y1)
	spr_stSurface = sprite_create_from_surface(_surface, x1, y1, x2, y2, false, false, 0, 0) // Origin is top left

	surface_reset_target()
	surface_free(_surface)
}