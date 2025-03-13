# What is this?
### **A Gamemaker 2 asset pack that adds functions to do fancy screen transition animations**

It essentially replaces the room_goto() function and adds animations that hide the room change. The animations use surfaces for smooth and unique-looking room transitions. It still has the option to do all the animations with a color though (like the classic fade to black then fade back that many games have), or use a sprite.

I made this system to drag and drop into my own projects, and I thought it would be nice to make it public 💚
# Animations

### Checkers
![checkers](https://i.giphy.com/media/v1.Y2lkPTc5MGI3NjExaDdzcWtubDUwaHlsc24yZHR6aGg4OThtampyYWwwM3hnc3A4eWxzNiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/56jEpCjNjRJda4Wwvy/giphy.gif)

#### Surface version: 
Immediately cuts to the next room and tears down a screenshot of the previous one.

#### Color version: 
Colored checkers grow in a pattern and then shrink (in and out pattern types are set separately, so you can mix them however you want).

#### Other features:
- You can adjust the scale the checkers grow and shrink by (x scale, y scale, or both).
- There is a fading effect that happens behind the checkers, which you can toggle on or off.
- You can change the color of the fade effect and the checkers themselves (default is black for both).
- There are 3 different main patterns: horizontal, vertical, and diagonal.

### Fade
![fade](https://i.giphy.com/media/v1.Y2lkPTc5MGI3NjExeDFxOXFnbXE2M2hwcjc2aTQ4aGU1bGM5N2VlaDZ2NmZmZ3g4dHhsdyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/50cEFPLpVgmyRxpDGV/giphy.gif)

#### Surface/buffer version: 
Cuts to the next room by fading out a screenshot of the previous one.

#### Color version: 
Is the classic fade in and out most games have, especially in black.

#### Other features
- You can change the fade in and fade out speeds separately.

### Animations not pictured
- Transform scale

# How to add to a project
1. Open file by either...
- Dragging and dropping the .yymps into your project, then clicking "Yes"
- Or going to: Tools ⇾ Import Local Package

2. Click "Add All" in center

3. Click "Import" at bottom left
# How to use
Call screenTransition (located in the "Functions" folder) where you would put room_goto(). To set specific variables such as delay between animations and other aspects of the animation such as if checkers fade or not, put any of the "screenTransition_set_" functions _after_ screenTransition.

**You can change the default behavior in "config_screenTransition"** and **view the list of transitions to choose from in "list_screenTransitionTypes"**.

# Things to be aware of
- When calling the main function, it creates a temporary persistent object that manages the animation, so **be careful about deactivating all instances or destroying all objects,** or else the animation will be canceled, and the room will not change.
- The transitions will always play at a depth lower than all other layers, unless a specific layer is specified (meaning they will appear above everything else on screen by default).
- Animations play in the GUI draw even by default, but you can make it run in the draw event with the "whichDrawEvent" parameter.
- Anything on the GUI layer _will disappear_ during _SCREENSHOT_IN transitions
- It will only check for the lowest layer depth unless the parameter "loopThroughObjects" is set to true, in which it will check for the lowest object depth in addition to layer.

# Things you can do that may not be obvious
- If you leave the "changeRoomTo" argument blank on the screenTransition function, it will do the animation without changing rooms.
  
# To do
- Make more animations (slide, spiral checker)
- Add the option to do the animation in a particular section of the screen rather than over the entire screen
- Fix a bug where "ST_NONE" does not transition the room
- Make the test menu have all the editable variables
