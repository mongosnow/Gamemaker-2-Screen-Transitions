function screenTransition_set_delay // Use this AFTER screenTransition to set specific variables
(
	DelayOut = DEFAULT_DELAY_0, // How long it will wait to change rooms 
	delayIn  = DEFAULT_DELAY_1  // How long it will wait to start in animation
)
{
	with (obj_stController)
	{
		_delay[IS.OUT] = DelayOut
		_delay[IS.IN]  = delayIn
	}
}