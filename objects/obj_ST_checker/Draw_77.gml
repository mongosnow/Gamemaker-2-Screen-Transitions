/// @description Draw surface
if _drawSurface
{
	if _scale != 0
	{
		var _moveBy = -((_size * _scale) / 2) + (_size / 2) //to anchor the squares growth in the center rather than the side
		
		switch(_scaleChangeType) //
		{
			default:
			_surfaceDrawSquare(x, y, _size, _size, x + _moveBy, y, _scale, 1)
			break;
			
			case CHECKER_TRANSFORM_YSCALE:
			_surfaceDrawSquare(x, y, _size, _size, x, y + _moveBy, 1, _scale)
			break;
			
			case CHECKER_TRANSFORM_BOTH:
			_surfaceDrawSquare(x, y, _size, _size, x + _moveBy, y + _moveBy, _scale, _scale)
			break;
		}
	}
}