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
#macro DEFAULT_X	  camera_get_view_x(view_camera[0])
#macro DEFAULT_Y	  camera_get_view_y(view_camera[0])
#macro DEFAULT_WIDTH  camera_get_view_width(view_camera[0])
#macro DEFAULT_HEIGHT camera_get_view_height(view_camera[0])
					   
////////////////////////////////////////////////////////////////////////////
//							ANIMATION DEFAULTS							  //
////////////////////////////////////////////////////////////////////////////

// General
#macro DEFAULT_COLOR    c_black //default color for transitions which use a solid color
#macro DEFAULT_DELAY_0  0		//default delay before room changes
#macro DEFAULT_DELAY_1  0		//default delay before in animation starts

// Fade
#macro DEFAULT_FADESPEED_0 .02 // speed of fade animation out
#macro DEFAULT_FADESPEED_1 .02 // speed of fade animation in
#macro DEFAULT_FADEACCEL_0 0   // How much animation speed will increase by over time - Out
#macro DEFAULT_FADEACCEL_1 0   // How much animation speed will increase by over time - In

////////////////////////////////////////////////////////////////////////////
//								ADVANCED								  //
////////////////////////////////////////////////////////////////////////////

#macro DEFAULT_CHECK_OBJECT_DEPTH false