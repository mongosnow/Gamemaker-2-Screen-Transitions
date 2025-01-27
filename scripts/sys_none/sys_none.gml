function _stNone()
{
	switch(_state)
	{
		#region OUT
		case IS.OUT:
		
		switch(_state2)
		{
			default:
			_anim_stateNext()
			break;
		}
		
		break;
		#endregion
		
		#region IN
		case IS.IN:
		
		switch(_state2)
		{
			default:
			_anim_stateNext()
			break;
		}
		
		break;
		#endregion
	}
}