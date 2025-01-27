/// @description Initialize constants, functions, and variables

enum IS
{
	NONE = 0,
	OUT = 1,
	IN = 2
}

function _stResetAllVariables()
{
	// state
	_state = IS.NONE
	_state2 = 0
	
	animType[IS.NONE] = ST_NONE
	animType[IS.OUT] = ST_NONE
	animType[IS.IN] = ST_NONE
	
	_roomGoTo = undefined
	
	// general variables 
	_color = c_black
	
	// put variables for specific animations here
	
	_stResetFadeVariables()
}

_stResetAllVariables() //initialize variables