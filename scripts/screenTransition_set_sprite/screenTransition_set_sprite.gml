function screenTransition_set_sprite // Use this AFTER screenTransition to set specific variables
(
	spriteToUse = DEFAULT_SPRITE
)
{
	with (obj_stController)
	{
		_sprite = spriteToUse
		sprite_index = spriteToUse
	}
}