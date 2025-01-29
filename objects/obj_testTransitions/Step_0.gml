/// @description Insert description here
// You can write your code in this editor
if keyboard_check_pressed(vk_numpad0)
{
	var rm = rm_leaves
	
	if room = rm
		rm = rm_squares
		
	 screenTransition(rm, ST_FADE_SCREENSHOT_IN, ST_FADE_SCREENSHOT_IN)
}	