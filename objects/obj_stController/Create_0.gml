/// @description Initialize constants, functions, and variables

enum IS
{
	OUT = 0,
	IN = 1,
	NONE = 2
}

function _stResetAllVariables()
{
	// state
	_state = IS.NONE
	_state2 = 0
	
	animType[IS.OUT] = ST_NONE
	animType[IS.IN] = ST_NONE
	animType[IS.NONE] = ST_NONE
	
	_roomGoTo = undefined
	
	// general variables 
	_color = c_black
	
	// put variables for specific animations here
	
	_stResetFadeVariables()
}

_stResetAllVariables() //initialize variables