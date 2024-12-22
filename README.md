# What is this?
### **A Gamemaker 2 asset pack that adds functions to do fancy screen transition animations**

It essentially replaces the room_goto() function and adds animations that hide the room change

The animations use surfaces/buffers for smooth and unique-looking room transitions. It still has the option to do all the animations with a color though (like the classic fade to black then fade back that many games have)

I made this system to drag and drop into my own projects, and I thought it would be nice to make it public ❤
# Animations

### Checkers
![checkers](https://i.giphy.com/media/v1.Y2lkPTc5MGI3NjExaDdzcWtubDUwaHlsc24yZHR6aGg4OThtampyYWwwM3hnc3A4eWxzNiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/56jEpCjNjRJda4Wwvy/giphy.gif)

Surface/buffer version: Immediately cuts to the next room and tears down a screenshot of the previous one

Color version: Colored checkers grow in a pattern and then shrink (in + out pattern types are set separately, so you can mix them however way feels good)

You can adjust the scale the checkers grow/shrink by (x scale, y scale, or both)

### Fade
![fade](https://i.giphy.com/media/v1.Y2lkPTc5MGI3NjExeDFxOXFnbXE2M2hwcjc2aTQ4aGU1bGM5N2VlaDZ2NmZmZ3g4dHhsdyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/50cEFPLpVgmyRxpDGV/giphy.gif)

Surface/buffer version: Immediately cuts to the next room and fades out a screenshot of the previous one

Color version: Is the classic fade in and out most games have, especially in black
# How to add to a project
1. Open file by either...
- Dragging and dropping the .yymps into your project, then clicking "Yes"
- Or going to: Tools ⇾ Import Local Package

2. Click "Add All" in center

3. Click "Import" at bottom left
# How to use
Call any of the functions in the "Functions" folder where you would usually put room_goto() and put in the desired variables (You only need to call it once)

**You can change the default behavior in "config_screenTransition"** and **view the list of pre-made transitions in "list_screenTransitionTypes" along with various constants for them** (such as which scale the "checkers" transitions transform by)

To make it easier to use, be sure to **set up a default transition to quickly paste around with the screenTransition_default() function**
# Things to be aware of
- When calling the main function, it creates a temporary persistent object that manages the animation, so **be careful about deactivating all instances or destroying all objects,** or else the animation might be canceled, or the room will not transition
- The transitions will always play at a depth lower than all other layers, unless a specific layer is specified (meaning they will appear above everything else on screen by default)
- ^... Except the "screenshot" transitions (the transitions that use screen buffers/surfaces) will play below the GUI layer ~~(I have no clue how to fix this, and it is driving me insane)~~
- ^^... The "color" ones will play above the GUI layer as intended, however

# Things you can do that may not be obvious
- If you leave the "changeRoomTo" argument blank on the screenTransition function, it will do the animation without changing rooms
# To do
- Make more animations (slide + scale transform)
- Fix the screenshot drawing below the GUI layer issue
- Add the option to specify drawing with GUI or normal draw event
- Add the option to do the animation in a particular section of the screen rather than over the entire screen
- Add the option to check for lowest _object_ depth
- Refactor the code to be a bit simpler and change the names of functions and constants to make a bit more sense
