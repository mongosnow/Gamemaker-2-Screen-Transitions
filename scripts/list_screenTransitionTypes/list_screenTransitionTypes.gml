// Screen transition types (only edit if you add more) //

// Instant transition //
#macro ST_NONE "NONE"

// Fade //
#macro ST_FADE "FADE_0"
#macro ST_FADE_SCREENSHOT_IN "FADE_1" // Works for in only

// Checkers //
#macro ST_CHECKER_LEFT_TO_RIGHT "CHECK_LR_0"
#macro ST_CHECKER_RIGHT_TO_LEFT "CHECK_RL_0"
#macro ST_CHECKER_UP_TO_DOWN	"CHECK_UD_0"
#macro ST_CHECKER_DOWN_TO_UP	"CHECK_DU_0"
#macro ST_CHECKER_DIAGONAL_UP_LEFT_TO_DOWN_RIGHT "CHECK_ULDR_0"
#macro ST_CHECKER_DIAGONAL_DOWN_RIGHT_TO_UP_LEFT "CHECK_DRUL_0"

// Variables for Checkers //
#macro CHECKER_TRANSFORM_XSCALE 0 //will change x scale from center
#macro CHECKER_TRANSFORM_YSCALE 1 //will change y scale from center
#macro CHECKER_TRANSFORM_BOTH 2 //will change x and y scale from center

// (TO DO) Screen Transform //
//#macro ST_SCREEN_TRANSFORM 30
// Variables for screen transform //
//#macro SCREEN_TRANSFORM_XSCALE
//#macro SCREEN_TRANSFORM_YSCALE
//#macro SCREEN_TRANSFORM_BOTH
//add option to change x, y center point to transform from -> left, right, top, down, diagonal, center
//#macro SCREEN_TRANSITION_DEFAULT_SCREEN_TRANSFORM_SCALE SCREEN_TRANSFORM_BOTH

// (TO DO) Screen Move //
//#macro ST_SCREEN_MOVE 40
// Variables, >>move to config script<<
//#macro SCREEN_TRANSITION_DEFAULT_SCREEN_MOVE_DIRECTION
//#macro SCREEN_TRANSITION_DEFAULT_SCREEN_MOVE_SPEED


