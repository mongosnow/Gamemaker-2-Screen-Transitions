/// @description Destroy self if controller no longer exists or animation has ended

if !instance_exists(obj_stController) || obj_stController._state >= 2
	instance_destroy(self)