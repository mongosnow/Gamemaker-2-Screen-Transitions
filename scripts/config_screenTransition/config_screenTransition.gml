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

// General
#macro DEFAULT_COLOR c_black	//default color for transitions which use a solid color

// Fade
#macro DEFAULT_FADESPEED .02 //default speed of fade animation

////////////////////////////////////////////////////////////////////////////
//								ADVANCED								  //
////////////////////////////////////////////////////////////////////////////

#macro DEFAULT_CHECK_OBJECT_DEPTH false