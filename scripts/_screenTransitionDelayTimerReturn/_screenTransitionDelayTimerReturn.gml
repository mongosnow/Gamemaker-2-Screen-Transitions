// Count down delay
function _screenTransitionDelayTimerReturn()
{
	var delay = true
			
	_delay --
			
	if _delay <= 0
		delay = false
		
	return delay
}