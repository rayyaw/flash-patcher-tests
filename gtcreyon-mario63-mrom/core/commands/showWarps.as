//showwarps,sw|wTOGGLE|Shows or hides warps (displayed as a black rectangle).
var state = wBool(args[1])
var bool = wToggle(state, _root.Course.BackGFX.warp1._visible)
for (i = 1; i < 8; i++) {
	_root.Course.BackGFX["warp" + i]._visible = bool
}
switch(state)
{
	case true: //on
		respond("Show Warps: ON")
		break;
	case false: //off
		respond("Show Warps: OFF")
		break;
	case undefined: //toggle
		if (bool)
		{
			respond("Show Warps: ON [toggle]")
		}
		else
		{
			respond("Show Warps: OFF [toggle]")
		}
		break;
}