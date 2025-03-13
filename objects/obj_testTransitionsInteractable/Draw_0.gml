/// @description Draw menu

var drawX = camera_get_view_x(view_camera[0]) + 5
var drawY = camera_get_view_y(view_camera[0]) + 5
var space = 25

draw_set_color(c_grey)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

if !instance_exists(obj_stController)
{
	draw_set_color(c_white)
	draw_text(drawX, drawY, "[Press SPACE to test animation]")
	
	draw_set_color(c_grey)
	
	draw_set_halign(fa_left)
	draw_text_ext(camera_get_view_width(view_camera[0]) - 5 - 400, drawY, 
	"* Any transition can be paired with any other transition!"+
	"\n\n"+"* Although, _SCREENSHOT_IN transitions must be paired with themselves to work properly"+
	"\n\n"+"* and _SPRITE transitions must be paired with other _SPRITE transitions"
	, 
	20, 400)
	
	if _vChoice < 2
	{
		if keyCtrl
			draw_set_color(c_yellow)
		draw_text(drawX, camera_get_view_height(view_camera[0]) - 20 - 25, "Press CTRL to copy selected transition to unselected")
		
		draw_set_color(c_grey)
		
		draw_set_halign(fa_left)
		if keyShift
			draw_set_color(c_yellow)
		draw_text(drawX, camera_get_view_height(view_camera[0]) - 20, "Hold SHIFT and press RIGHT or LEFT to skip to next group")
	}
	
	if _vChoice >= 2
	{
		if keyCtrl
			draw_set_color(c_yellow)
		draw_text(drawX, camera_get_view_height(view_camera[0]) - 20 - 25, "Press CTRL to set delay to 30")
		
		draw_set_color(c_grey)
		
		if keyShift
			draw_set_color(c_yellow)
		draw_set_halign(fa_left)
		draw_text(drawX, camera_get_view_height(view_camera[0]) - 20, "Press SHIFT to set delay to 0")
	}
}

draw_set_halign(fa_left)

var indent = 0

for (var i = 0; i < array_length(_optionList); i += 1)
{
	if i = _vChoice
		indent = 10
	else
		indent = 0
	
	draw_set_halign(fa_left)
	
	var part0 = _optionList[i]
	var part1 = "< "
	if i < 2 //transitions choices options
		var part2 = _transitionTable[_hChoice[i]]
	else //delay set
		var part2 = _hChoice[i]
	var part3 = " >"
		
	if i != _vChoice
	{
		part1 = ""
		part3 = ""
	}
		
	var drawXX = drawX + indent//round(drawX - (string_width(part0 + part1 + part2 + part3) / 2)) + indent
		
	// In/Out
	_setColorWithChoice(i)
	draw_text(drawXX, drawY + (space * i) + space, part0)
	drawXX += string_width(part0)
		
	// <
	_setColorWithChoice(i)
	if keyShift 
		_setColorWithChoice(i, c_yellow)
	if keyLeft
		drawXX += 5
	draw_text(drawXX, drawY + (space * i) + space, part1)
	if keyLeft
		drawXX -= 5
	drawXX += string_width(part1)
		
	// Name of transition
	if i < 2
		draw_set_color(_returnTransitionColor(_hChoice[i]))
	else
		_setColorWithChoice(i, c_white)
	draw_text(drawXX, drawY + (space * i) + space, part2)
	drawXX += string_width(part2)
		
	// >
	_setColorWithChoice(i)
	if keyShift 
		_setColorWithChoice(i, c_yellow)
	if keyRight
		drawXX += 5
	draw_text(drawXX, drawY + (space * i) + space, part3)
	if keyRight
		drawXX -= 5
	drawXX += string_width(part3)
}