/// @description Take screenshot + room change

if _screenshotDo = true && _screenshotTaken = false
{
	_surfaceTakeScreenshot()
	_screenshotTaken = true
	_screenshotDo = false
	
	// Change room after out animation finishes if _roomGoTo is set to anything
	if _roomGoTo != undefined
	{
		room_goto(_roomGoTo)
		_roomGoTo = undefined
	}
}