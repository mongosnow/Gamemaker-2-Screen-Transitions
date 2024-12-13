// Two way fade out with color

function screenTransition_colorFade(
	changeRoomTo,
	layerToUse = undefined,
	fadeSpeed = undefined,
	delayIn = undefined,
	delayOut = undefined,
	colorIn = undefined,
	colorOut = undefined
)
{
	screenTransition(
		changeRoomTo,
		layerToUse,
		,
		ST_FADE,
		colorOut,
		fadeSpeed,
		,
		,
		delayIn,
		ST_FADE,
		colorIn,
		,
		
	)
}