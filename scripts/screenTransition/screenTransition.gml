function screenTransition(outAnim, inAnim)
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
function screenTransitionOneWay(inAnim)
{
	screenTransition(0, inAnim)
	obj_stController._state = 1 //set to wait state
}
