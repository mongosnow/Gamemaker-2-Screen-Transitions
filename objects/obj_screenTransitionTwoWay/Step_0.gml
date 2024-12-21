/// @description Animation control

if _doneAnim = false //if have not swapped rooms yet, do animation
{
	_screenTransition_oneWay(
		OUT_ST, 
		_changeRoomTo, 
		_delayOut, 
		_ST_typeOut, 
		_layerToUse, 
		_isScreenshotOut,
		_colorOut, 
		_checkerTransformScaleOut
	)
	
	//FADE
	global.screenTransitionObject._fadeSpeed = _fadeSpeedOut //for fade type, speed of anim
	
	_doneAnim = true
}
if _doNext //after swapping rooms, do in anim and kill self
{
	_screenTransition_oneWay(
		IN_ST, 
		undefined, 
		_delayIn, 
		_ST_typeIn, 
		_layerToUse, 
		_isScreenshotIn,
		_colorIn, 
		_checkerTransformScaleIn
	)
	
	//FADE
	global.screenTransitionObject._fadeSpeed = _fadeSpeedIn //for fade type, speed of anim
	
	instance_destroy(self)
}