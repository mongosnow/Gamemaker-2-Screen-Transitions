/// @description Change room

// Change room after out animation finishes if _roomGoTo is set to anything
if _state = IS.IN && _roomGoTo != undefined{
	room_goto(_roomGoTo)
	_roomGoTo = undefined
}