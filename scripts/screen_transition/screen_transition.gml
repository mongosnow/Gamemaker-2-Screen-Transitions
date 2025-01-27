function screenTransition(roomGoTo = undefined, outAnim, inAnim)
{
	//spawn
	//with obj screen transition
	with obj_stController
	{
		_stResetAllVariables()
		animType = [outAnim, inAnim]
	}
}

//secondary
function screenTransitionOneWay(roomGoTo = undefined, inAnim)
{
	screenTransition(0, inAnim)
	obj_stController._state = 1 //set to wait state
}