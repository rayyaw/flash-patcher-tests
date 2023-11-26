// Wordy toggle: Extends wordy bools to allow boolean values to be toggled.

wToggle = function(val, bool)
{
	switch(wBool(val))
	{
		case 0:
			return false
		case 1:
			return true
		case undefined:
			return !bool
	}
}