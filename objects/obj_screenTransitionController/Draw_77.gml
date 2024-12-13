/// @description Screenshot transitions

// draw surface over top instead of box on surface transition
if _rectangleBG
{
	if _type != ST_FADE
		_surfaceDraw() //possibly draw opposite
	else
		_surfaceDraw(true,,,,,,,,,_fadeAlpha)
}