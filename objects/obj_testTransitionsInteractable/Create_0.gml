/// @description Initialze options and variables

#region transitions
_transitionTypesMain = [
	"NONE",
	"FADE",
	"TSCA",
	"CHKH",
	"CHKV",
	"CHKD"
]

_transitionTypesMainColors = [
	c_red,
	c_orange,
	c_yellow,
	c_lime,
	c_green,
	c_teal
]

_transitionTable = 
[
	ST_NONE,

	ST_FADE,
	ST_FADE_SCREENSHOT_IN,
	ST_FADE_SPRITE,

	ST_TSCALE_X,
	ST_TSCALE_X_SREENSHOT_IN,
	ST_TSCALE_X_SPRITE,
	ST_TSCALE_Y,
	ST_TSCALE_Y_SCREENSHOT_IN,
	ST_TSCALE_Y_SPRITE,
	ST_TSCALE_BOTH,
	ST_TSCALE_BOTH_SCREENSHOT_IN,
	ST_TSCALE_BOTH_SPRITE,

	ST_CHECKER_LR_X,
	ST_CHECKER_LR_X_SCREENSHOT_IN,
	ST_CHECKER_LR_X_SPRITE,
	ST_CHECKER_LR_Y,
	ST_CHECKER_LR_Y_SCREENSHOT_IN,
	ST_CHECKER_LR_Y_SPRITE,
	ST_CHECKER_LR_BOTH,
	ST_CHECKER_LR_BOTH_SCREENSHOT_IN,
	ST_CHECKER_LR_BOTH_SPRITE,

	ST_CHECKER_RL_X,
	ST_CHECKER_RL_X_SCREENSHOT_IN,
	ST_CHECKER_RL_X_SPRITE,
	ST_CHECKER_RL_Y,
	ST_CHECKER_RL_Y_SCREENSHOT_IN,
	ST_CHECKER_RL_Y_SPRITE,
	ST_CHECKER_RL_BOTH,
	ST_CHECKER_RL_BOTH_SCREENSHOT_IN,
	ST_CHECKER_RL_BOTH_SPRITE,

	ST_CHECKER_UD_X,
	ST_CHECKER_UD_X_SCREENSHOT_IN,
	ST_CHECKER_UD_X_SPRITE,
	ST_CHECKER_UD_Y,
	ST_CHECKER_UD_Y_SCREENSHOT_IN,
	ST_CHECKER_UD_Y_SPRITE,
	ST_CHECKER_UD_BOTH,
	ST_CHECKER_UD_BOTH_SCREENSHOT_IN,
	ST_CHECKER_UD_BOTH_SPRITE,

	ST_CHECKER_DU_X,
	ST_CHECKER_DU_X_SCREENSHOT_IN,
	ST_CHECKER_DU_X_SPRITE,
	ST_CHECKER_DU_Y,
	ST_CHECKER_DU_Y_SCREENSHOT_IN,
	ST_CHECKER_DU_Y_SPRITE,
	ST_CHECKER_DU_BOTH,
	ST_CHECKER_DU_BOTH_SCREENSHOT_IN,
	ST_CHECKER_DU_BOTH_SPRITE,

	ST_CHECKER_DIAG_UL_TO_DR_X,
	ST_CHECKER_DIAG_UL_TO_DR_X_SCREENSHOT_IN,
	ST_CHECKER_DIAG_UL_TO_DR_X_SPRITE,
	ST_CHECKER_DIAG_UL_TO_DR_Y,
	ST_CHECKER_DIAG_UL_TO_DR_Y_SCREENSHOT_IN,
	ST_CHECKER_DIAG_UL_TO_DR_Y_SPRITE,
	ST_CHECKER_DIAG_UL_TO_DR_BOTH,
	ST_CHECKER_DIAG_UL_TO_DR_BOTH_SCREENSHOT_IN,
	ST_CHECKER_DIAG_UL_TO_DR_BOTH_SPRITE,

	ST_CHECKER_DIAG_UR_TO_DL_X,
	ST_CHECKER_DIAG_UR_TO_DL_X_SCREENSHOT_IN,
	ST_CHECKER_DIAG_UR_TO_DL_X_SPRITE,
	ST_CHECKER_DIAG_UR_TO_DL_Y,
	ST_CHECKER_DIAG_UR_TO_DL_Y_SCREENSHOT_IN,
	ST_CHECKER_DIAG_UR_TO_DL_Y_SPRITE,
	ST_CHECKER_DIAG_UR_TO_DL_BOTH,
	ST_CHECKER_DIAG_UR_TO_DL_BOTH_SCREENSHOT_IN,
	ST_CHECKER_DIAG_UR_TO_DL_BOTH_SPRITE,

	ST_CHECKER_DIAG_DL_TO_UR_X,
	ST_CHECKER_DIAG_DL_TO_UR_X_SCREENSHOT_IN,
	ST_CHECKER_DIAG_DL_TO_UR_X_SPRITE,
	ST_CHECKER_DIAG_DL_TO_UR_Y,
	ST_CHECKER_DIAG_DL_TO_UR_Y_SCREENSHOT_IN,
	ST_CHECKER_DIAG_DL_TO_UR_Y_SPRITE,
	ST_CHECKER_DIAG_DL_TO_UR_BOTH,
	ST_CHECKER_DIAG_DL_TO_UR_BOTH_SCREENSHOT_IN,
	ST_CHECKER_DIAG_DL_TO_UR_BOTH_SPRITE,

	ST_CHECKER_DIAG_DR_TO_UL_X,
	ST_CHECKER_DIAG_DR_TO_UL_X_SCREENSHOT_IN,
	ST_CHECKER_DIAG_DR_TO_UL_X_SPRITE,
	ST_CHECKER_DIAG_DR_TO_UL_Y,
	ST_CHECKER_DIAG_DR_TO_UL_Y_SCREENSHOT_IN,
	ST_CHECKER_DIAG_DR_TO_UL_Y_SPRITE,
	ST_CHECKER_DIAG_DR_TO_UL_BOTH,
	ST_CHECKER_DIAG_DR_TO_UL_BOTH_SCREENSHOT_IN,
	ST_CHECKER_DIAG_DR_TO_UL_BOTH_SPRITE
]
#endregion

_optionList = [
	"Out: ",
	"In: ",
	"Delay out: ",
	"Delay in: "
]

_vChoice = 0

_hChoice[0] = 0
_hChoice[1] = 0
_hChoice[2] = 0
_hChoice[3] = 60

_skipToNextGroup = function(whichDir)
{
	// check the first 4 characters in the string of the current vertical choice position	
	var transitionName = string_copy(_transitionTable[_hChoice[_vChoice]], 1, 4)
	
	var allTransitions = array_length(_transitionTable) - 1 // how many transitions in total
	
	var i = _hChoice[_vChoice]
	var newTransitionName = transitionName
	
	while(transitionName = newTransitionName)
	{
		if whichDir = 1 // increment up
			i ++
		else // increment down
			i --
			
		if i > allTransitions
			i = 0
		else if i < 0
			i = allTransitions
		
		_hChoice[_vChoice] = i //set new choice
		
		newTransitionName = string_copy(_transitionTable[i], 1, 4)
	}
	
	if whichDir = 0 // go left one more and then up one on left pressed to go to start of list
	{
		transitionName = newTransitionName
		
		while(transitionName = newTransitionName)
		{
			i --
			
			if i < 0
				i = allTransitions
		
			newTransitionName = string_copy(_transitionTable[i], 1, 4)
		}
		
		i ++
		
		if i > allTransitions
			i = 0
		else if i < 0
			i = allTransitions
			
		_hChoice[_vChoice] = i //set new choice
	}
}

_returnTransitionColor = function(input)
{
	var name = string_copy(_transitionTable[input], 1, 4) // check name
	
	for (var i = 0; i < array_length(_transitionTypesMain); i += 1) // loop through small array to find the name
	{
		if name = _transitionTypesMain[i]
		{
			if _transitionTypesMainColors[i] != undefined //if a color is defined, return that color
				return _transitionTypesMainColors[i]
			else //else return a default color to not crash
				return c_fuchsia
		}
	}
	
	return c_fuchsia
}

_setColorWithChoice = function(input, color = c_white)
{
	if input = _vChoice
		draw_set_color(color)
	else
		draw_set_color(c_grey)
}