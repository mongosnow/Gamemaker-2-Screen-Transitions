/// @description Insert description here
// You can write your code in this editor

keyUp = keyboard_check_pressed(vk_up)
keyDown = keyboard_check_pressed(vk_down)

_vChoice += keyDown - keyUp

if _vChoice > array_length(_optionList) - 1
	_vChoice = 0
else if _vChoice < 0
	_vChoice = array_length(_optionList) - 1

keyRight = keyboard_check_pressed(vk_right)
keyLeft = keyboard_check_pressed(vk_left)
keyShift = keyboard_check(vk_shift)
keyCtrl = keyboard_check(vk_control)

if _vChoice < 2
{
	if keyShift = false //move by 1
	{
		_hChoice[_vChoice] += keyRight - keyLeft

		if _hChoice[_vChoice] > array_length(_transitionTable) - 1
			_hChoice[_vChoice] = 0
		else if _hChoice[_vChoice] < 0
			_hChoice[_vChoice] = array_length(_transitionTable) - 1
	}
	else // move by group
	{
		if keyRight
			_skipToNextGroup(1)
		else if keyLeft
			_skipToNextGroup(0)
	}
	
	if keyCtrl
	{
		if _vChoice = 0
			_hChoice[1] = _hChoice[0]
		else
			_hChoice[0] = _hChoice[1]
	}
}

if _vChoice = 2 || _vChoice = 3
{
	if keyShift
		_hChoice[_vChoice] = 0
		
	if keyCtrl
		_hChoice[_vChoice] = 30
		
	_hChoice[_vChoice] += keyRight - keyLeft
	
	if _hChoice[_vChoice] < 0
		_hChoice[_vChoice] = 0
}

keyDo = keyboard_check_pressed(vk_space)

if keyDo
{
	var rm = rm_leaves
	
	if room = rm
		rm = rm_squares
	
	screenTransition(rm, _transitionTable[_hChoice[0]], _transitionTable[_hChoice[1]])
	screenTransition_set_delay(_hChoice[2], _hChoice[3])
}