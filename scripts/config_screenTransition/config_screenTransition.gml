// Default values (edit these)
// You don't need to call this script, they're loaded automatically

////////////////////////////////////////////////////////////////////////////
//								GENERAL									  //
////////////////////////////////////////////////////////////////////////////

// Name of layer to play animations on			   // IMPORTANT: Will be moved to a depth lower than all other layers each time a transition plays. 
#macro SCREEN_TRANSITION_LAYER	"screenTransition" // Don't set this name to any pre-existing layer

// Which draw event do animations run in by default
#macro DEFAULT_DRAWEVENT 1 //1 = Draw GUI, 0 = Draw

// Default area for screen transitions to take up
#macro DEFAULT_WIDTH  camera_get_view_width(view_camera[0])
#macro DEFAULT_HEIGHT camera_get_view_height(view_camera[0])
					   
////////////////////////////////////////////////////////////////////////////
//							ANIMATION DEFAULTS							  //
////////////////////////////////////////////////////////////////////////////

// General
#macro DEFAULT_COLOR    c_black	   //default color for transitions which use a solid color
#macro DEFAULT_SPRITE	spr_sprite //default sprite for transitions which use a sprite
#macro DEFAULT_DELAY_0  30		   //default delay before room changes
#macro DEFAULT_DELAY_1  30		   //default delay before in animation starts after room changes

// Fade
#macro DEFAULT_FADESPEED_0 .02		// speed of fade animation out
#macro DEFAULT_FADESPEED_1 .02		// speed of fade animation in
#macro DEFAULT_FADEACCEL_0 0		// How much animation speed will increase by over time - Out
#macro DEFAULT_FADEACCEL_1 0		// How much animation speed will increase by over time - In

// Transform scale
#macro DEFAULT_TSCALE_SPEED_0 12	// Amount of frames the animation lasts - Out
#macro DEFAULT_TSCALE_SPEED_1 12	// Amount of frames the animation lasts - In

//Default alpha change

//REMOVE??
#macro DEFAULT_TRANSFORM_ACCEL_X_0 0
#macro DEFAULT_TRANSFORM_ACCEL_X_1 0
#macro DEFAULT_TRANSFORM_ACCEL_Y_0 0
#macro DEFAULT_TRANSFORM_ACCEL_Y_1 0

////////////////////////////////////////////////////////////////////////////
//								ADVANCED								  //
////////////////////////////////////////////////////////////////////////////

// Will it check object depth by default?
#macro DEFAULT_CHECK_OBJECT_DEPTH false // Default = false | Uses more memory to initialize animation if true

// Top left corner coordinates -- Editing may cause issues
#macro DEFAULT_X camera_get_view_x(view_camera[0])
#macro DEFAULT_Y camera_get_view_y(view_camera[0])