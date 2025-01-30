function screenTransition_set_sprite(spriteToUse = DEFAULT_SPRITE)
{
	with (obj_stController)
	{
		_sprite = spriteToUse
		sprite_index = spriteToUse
	}
}