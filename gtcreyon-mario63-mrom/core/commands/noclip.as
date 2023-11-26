//noclip,nc|wTOGGLE|Enables or disables NoClip.
switch(wBool(args[1]))
{
	case true: //on
		tempCourseScale = _root.coursescale2;
		_root.coursescale2 = NaN;
		respond("NoClip: ON")
		break;
	case false: //off
		if (tempCourseScale !== undefined)
		{
			_root.coursescale2 = tempCourseScale;
		}
		else if (isNaN(_root.coursescale2))
		{
			_root.coursescale2 = 1
		}
		respond("NoClip: OFF")
		break;
	case undefined: //toggle
		if (isNaN(_root.coursescale2))
		{
			if (tempCourseScale !== undefined)
			{
				_root.coursescale2 = tempCourseScale;
			}
			else
			{
				_root.coursescale2 = 1
			}
			respond("NoClip: OFF [toggle]")
		}
		else
		{
			tempCourseScale = _root.coursescale2;
			_root.coursescale2 = NaN;
			respond("NoClip: ON [toggle]")
		}
		break;
}