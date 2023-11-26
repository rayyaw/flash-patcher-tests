//fakebowser,fb|wTOGGLE|Enables or disables the Fake Bowser fight.
_root.lvl8keyE = wToggle(args[1], _root.lvl8keyE)

switch(wBool(args[1]))
{
	case true: //on
		_root.lvl8keyE = false
		respond("Fake Bowser: ON")
		break;
	case false: //off
		_root.lvl8keyE = true
		respond("Fake Bowser: OFF")
		break;
	case undefined: //toggle
		if (_root.lvl8keyE)
		{
			_root.lvl8keyE = false
			respond("Fake Bowser: ON [toggle]")
		}
		else
		{
			_root.lvl8keyE = true
			respond("Fake Bowser: OFF [toggle]")
		}
		break;
}