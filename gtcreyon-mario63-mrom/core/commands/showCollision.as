//showcollision,shc|wTOGGLE|Makes collision visible as bright boxes.
var state = wBool(args[1])
switch (state)
{
	case true:
		_root.collision.plats = true;
		_root.collision.hurt = true;
		respond("Show Collision: ON");
		break;
	case false:
		_root.collision.plats = false;
		_root.collision.hurt = false;
		respond("Show Collision: OFF");
		break;
	case undefined:
		_root.collision.plats = !_root.collision.plats;
		_root.collision.hurt = !_root.collision.plats;
		if(_root.collision.plats)
		{
			respond("Show Collision: ON [toggle]");
		} else {
			respond("Show Collision: OFF [toggle]");
		}
		break;
}