/// @description If drawEvent = 1, draw animation

if _drawEvent = DRAW.GUI
	drawEvent()

//debug
draw_set_color(c_white)
draw_text(208, 208, "OUT: "+string(animType[IS.OUT])+"\nIN: "+string(animType[IS.IN])+"\nSTATE = "+string(_state))