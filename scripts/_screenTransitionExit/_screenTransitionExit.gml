// Resets variables
// only use in screen transition object
// state stuff

function _screenTransitionExit()
{
	// if IN, remove surface from memory
	if _inOrOut = IN_ST{
		surfaceCleanUp()
		_rectangleBG = false
		instance_destroy(self) // destroy self on exit
	}
	else // take screenshot on out transition for use in IN
	{
		_surfaceTakeScreenshot()
		_rectangleBG = true
	}

	if _roomChange != undefined
		room_goto(_roomChange)
	
	//reset self
	_roomChange = undefined
	_transitionDo = false
	_layerToDo = layer
	_transitionTimer = 0
	_checkersDrawFade = false
	_state = 0
	
	if instance_exists(obj_screenTransitionTwoWay)
		obj_screenTransitionTwoWay._doNext = true
}