/// @description Take screenshot

if _screenshotDo = true && _screenshotTaken = false
{
	_surfaceTakeScreenshot()
	_screenshotTaken = true
	_screenshotDo = false
}