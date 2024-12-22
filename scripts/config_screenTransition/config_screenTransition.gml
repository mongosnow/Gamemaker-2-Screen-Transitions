//default values (edit these)
//you don't need to call this script, they're loaded automatically


// Default layer to play animations on
// Will be moved to a depth lower than all other layers each time it is used
#macro SCREEN_TRANSITION_DEFAULT_LAYER	"screenTransition"


// General //

#macro SCREEN_TRANSITION_DEFAULT_WIDTH	camera_get_view_width(view_camera[0])	//default width of transitions
#macro SCREEN_TRANSITION_DEFAULT_HEIGHT	camera_get_view_height(view_camera[0])	//default height of transitions

#macro SCREEN_TRANSITION_DEFAULT_COLOR c_black	//default color for draw color of solid squares and fade color
#macro SCREEN_TRANSITION_DEFAULT_DELAY 0		//default delay to transition in and out (will it pause before room change on out and animation on in)

// Fade Transtion //

#macro SCREEN_TRANSITION_DEFAULT_FADE_SPEED	.02	//default speed of fade animation


// Checker Transition //

#macro SCREEN_TRANSITION_DEFAULT_CHECKER_DELAY	3	//the frames between each row of checkers spawning
#macro SCREEN_TRANSITION_DEFAULT_CHECKER_SIZE	120	// size of squares
#macro SCREEN_TRANSITION_DEFAULT_CHECKER_CHANGE	.25 //(MUST BE DIVISIBLE BY 1) the scale at which the squares are transformed by


// Advanced //

#macro SCREEN_TRANSITION_ALLOW_ROOMCHANGE_ON_IN_INPUT false //does the transition function let you change rooms when calling an "IN" transition (likely leave false)