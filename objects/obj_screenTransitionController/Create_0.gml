/// @description Initialize variables
// Put this object on top layer

// transition variables
_type = undefined
_roomChange = undefined
_transitionDo = false
_inOrOut = IN_ST
_state = 0
_delay = 0

//surface
_isSurface = false
_takeScreenshot = false
_whichSurface = 0
_surfaceInitialize()

//specific animation variables
_color = SCREEN_TRANSITION_DEFAULT_COLOR

//checkers
_transitionTimer = 0
_checkerSize = SCREEN_TRANSITION_DEFAULT_CHECKER_SIZE
_checkerCountW = SCREEN_TRANSITION_DEFAULT_WIDTH / _checkerSize
_checkerCountH = SCREEN_TRANSITION_DEFAULT_HEIGHT / _checkerSize
_rectangleBG = false
_checkerTransformScale = SCREEN_TRANSITION_DEFAULT_CHECKER_TRANSFORM //for vertical or horizontal

//fade
_fadeSpeed = SCREEN_TRANSITION_DEFAULT_FADE_SPEED
_fadeAlpha = 0

//debug
_testScreenshot = false
_randomNumberX = 0
_randomNumberY = 0