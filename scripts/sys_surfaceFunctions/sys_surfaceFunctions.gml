//sprite_create_from_surface() <<USE THIS

function _surfaceInitialize() // put in create event
{
	// screenshot variables
	_surface = -1
	_surfaceBuffer = -1

	_surfaceWidth = SCREEN_TRANSITION_DEFAULT_WIDTH
	_surfaceHeight = SCREEN_TRANSITION_DEFAULT_HEIGHT
	
	_surfaceExists = false
}

function _surfaceTakeScreenshot() // put in post-draw event, run once
{
	//initialize if have not
	if !variable_instance_exists(id, "_surfaceExists")
		_surfaceInitialize()
	
	// take screenshot
	_surface = surface_create(_surfaceWidth, _surfaceHeight)
	surface_set_target(_surface)
	draw_surface(application_surface,0,0)
	surface_reset_target()
		
	// backup to buffer
	if buffer_exists(_surfaceBuffer) 
		buffer_delete(_surfaceBuffer)
		
	_surfaceBuffer = buffer_create(_surfaceWidth * _surfaceHeight * 4, buffer_fixed, 1)
	buffer_get_surface(_surfaceBuffer, _surface, 0)
	
	_surfaceExists = true
}

function surfaceCleanUp() // put in clean up event
{
	if surface_exists(_surface)
		surface_free(_surface)

	if buffer_exists(_surfaceBuffer)
		buffer_delete(_surfaceBuffer)
	
	_surfaceInitialize() //reset variables
}