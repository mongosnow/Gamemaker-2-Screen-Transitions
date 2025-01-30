// Screen transition types (only edit if you add more) //

// Instant transition / no transition animation //
#macro ST_NONE "NONE"

// Fade //
#macro ST_FADE "FADE_0"
#macro ST_FADE_SCREENSHOT_IN "FADE_1"
#macro ST_FADE_SPRITE "FADE_2"

// Scale //
#macro ST_TSCALE_X "TSCA_X_0"
#macro ST_TSCALE_X_SREENSHOT_IN "TSCA_X_1"
#macro ST_TSCALE_X_SPRITE "TSCA_X_2"
#macro ST_TSCALE_Y "TSCA_Y_0"
#macro ST_TSCALE_Y_SCREENSHOT_IN "TSCA_Y_1"
#macro ST_TSCALE_Y_SPRITE "TSCA_Y_2"
#macro ST_TSCALE_BOTH "TSCA_B_0"
#macro ST_TSCALE_BOTH_SCREENSHOT_IN "TSCA_B_1"
#macro ST_TSCALE_BOTH_SPRITE "TSCA_B_2"

/*
// Checkers //
#macro ST_CHECKER_LEFT_TO_RIGHT "CHEC_LR_0"
#macro ST_CHECKER_RIGHT_TO_LEFT "CHEC_RL_0"
#macro ST_CHECKER_UP_TO_DOWN	"CHEC_UD_0"
#macro ST_CHECKER_DOWN_TO_UP	"CHEC_DU_0"
#macro ST_CHECKER_DIAGONAL_UP_LEFT_TO_DOWN_RIGHT "CHEC_ULDR_0"
#macro ST_CHECKER_DIAGONAL_DOWN_RIGHT_TO_UP_LEFT "CHEC_DRUL_0"

//REMOVE THIS 
// Variables for Checkers //
#macro CHECKER_TRANSFORM_XSCALE 0 //will change x scale from center
#macro CHECKER_TRANSFORM_YSCALE 1 //will change y scale from center
#macro CHECKER_TRANSFORM_BOTH 2 //will change x and y scale from center

// (TO DO) //
Screen move -- Will move from direction in to center. 
	will move image toward a direction in to center of screen, 
		find loc with circle line cast with spawn at loc outside of bounds.
speed 20 (do like transform with % of screen)
accel 0
fade t/f
rotate 0



