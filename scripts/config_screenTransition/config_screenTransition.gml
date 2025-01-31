// Default values (edit these)
// You don't need to call this script, they're loaded automatically

////////////////////////////////////////////////////////////////////////////
//								GENERAL									  //
////////////////////////////////////////////////////////////////////////////

// Name of layer to play animations on			   // IMPORTANT: Will be moved to a depth lower than all other layers each time a transition plays. 
#macro SCREEN_TRANSITION_LAYER	"screenTransition" // Don't set this name to any pre-existing layer

// Which draw event do animations run in by default
#macro DEFAULT_DRAWEVENT 1 //1 = Draw GUI, 0 = Draw
					   
////////////////////////////////////////////////////////////////////////////
//							ANIMATION DEFAULTS							  //
////////////////////////////////////////////////////////////////////////////

// General //

#macro DEFAULT_COLOR    c_aqua			//default color for transitions which use a solid color
#macro DEFAULT_SPRITE	spr_sprite		//default sprite for transitions which use a sprite
#macro DEFAULT_DELAY_0  0				//default delay before room changes and after out animation ends
#macro DEFAULT_DELAY_1  0				//default delay before in animation starts after room changes

// Fade //

#macro DEFAULT_FADE_SPEED_0 .02			// speed of fade animation out
#macro DEFAULT_FADE_SPEED_1 .02			// In
#macro DEFAULT_FADE_ACCEL_0 0			// How much animation speed will increase by over time - Out
#macro DEFAULT_FADE_ACCEL_1 0			// In

// Transform scale //

#macro DEFAULT_TSCALE_SPEED_0 .1			// Start speed of animation out | higher = faster | >=1 does nothing
#macro DEFAULT_TSCALE_ACCEL_0 -.001			// Amount animation speed changes by each frame out | negative speeds it up, positive slows it down
#macro DEFAULT_TSCALE_SPEED_1 .1			// In	
#macro DEFAULT_TSCALE_ACCEL_1 -.001			// In

#macro DEFAULT_TSCALE_X_0 (DEFAULT_WIDTH / 2)	// Middle of animation, X, Out
#macro DEFAULT_TSCALE_Y_0 (DEFAULT_HEIGHT / 2)	// Middle of animation, Y, Out
#macro DEFAULT_TSCALE_X_1 (DEFAULT_WIDTH / 2)	// In
#macro DEFAULT_TSCALE_Y_1 (DEFAULT_HEIGHT / 2)	 // In

#macro DEFAULT_TSCALE_FADE_0 true	// Will it change transparency?
#macro DEFAULT_TSCALE_FADE_1 true	// In

#macro DEFAULT_TSCALE_ROTSPD_0 0	// Speed multiplier for rotate animation - Should be whole number - Out
#macro DEFAULT_TSCALE_ROTSPD_1 0	// In

// Checkers //

#macro DEFAULT_CHECKER_SIZE 64			// Max size of squares, should be divisible by both width and height of transition area or else it will be rounded to nearest
#macro DEFAULT_CHECKER_SPEED .01 		// Speed of checker scale change per frame | higher = faster | anything above 1 does nothing | 1 is instant
#macro DEFAULT_CHECKER_DELAY 3			// Frames between checker groups animating

////////////////////////////////////////////////////////////////////////////
//								ADVANCED								  //
////////////////////////////////////////////////////////////////////////////

// Will it check object depth by default?
#macro DEFAULT_CHECK_OBJECT_DEPTH false // Default = false | Uses more memory to initialize animation if true

// Screen size //

// Top left corner coordinates -- Editing may cause issues
#macro DEFAULT_X camera_get_view_x(view_camera[0])
#macro DEFAULT_Y camera_get_view_y(view_camera[0])

// Default area for screen transitions to take up
#macro DEFAULT_WIDTH  camera_get_view_width(view_camera[0])
#macro DEFAULT_HEIGHT camera_get_view_height(view_camera[0])