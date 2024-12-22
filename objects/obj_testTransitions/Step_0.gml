/// @description Insert description here
// You can write your code in this editor
if keyboard_check_pressed(vk_numpad0)
{
	var rm = rm_leaves
	
	if room = rm
		rm = rm_squares
		
	screenTransition_checkers_color(rm,,,ST_CHECKER_DIAGONAL_UP_LEFT_TO_DOWN_RIGHT,,ST_CHECKER_DIAGONAL_DOWN_RIGHT_TO_UP_LEFT,,c_yellow)
}	