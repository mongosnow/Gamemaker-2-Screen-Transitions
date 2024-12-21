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
		_colorOut
	)
	
	#region specific variables
	//FADE
	global.screenTransitionObject._fadeSpeed = _fadeSpeedOut
	
	//CHECKERS
	global.screenTransitionObject._checkerTransformScale = _checkerTransformScaleOut
	#endregion
	
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
		_colorIn
	)
	
	#region specific variables
	//FADE
	global.screenTransitionObject._fadeSpeed = _fadeSpeedIn
	
	//CHECKERS
	global.screenTransitionObject._checkerTransformScale = _checkerTransformScaleIn
	#endregion
	
	instance_destroy(self)
}