// Two way fade out with color

function screenTransition_colorFade(
	changeRoomTo,
	layerToUse = undefined,
	fadeSpeed = undefined,
	delayIn = undefined,
	delayOut = undefined,
	color = undefined,
)
{
	screenTransition(
		changeRoomTo,
		layerToUse,
		,
		ST_FADE,
		color,
		fadeSpeed,
		,
		,
		delayIn,
		ST_FADE,
		color,
		,
		
	)
}