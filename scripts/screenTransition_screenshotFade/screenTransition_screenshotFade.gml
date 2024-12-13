// Will instantly cut away to next room then fade out screenshot
// Change defualts if needed

function screenTransition_screenshotFade(
	changeRoomTo,
	layerToUse = undefined,
	fadeSpeed = undefined,
	delayIn = undefined,
	delayOut = undefined
)
{
	screenTransition(
		changeRoomTo,
		layerToUse,
		,
		ST_NONE,
		,
		fadeSpeed,
		,
		true,
		delayIn,
		ST_FADE,
		,
		,
		
	)
}