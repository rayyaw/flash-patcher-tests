// Wordy bool: Converts common terms into boolean values
wBool = function(arg)
{
	switch(arg.toLowerCase())
	{
		case "on":
		case "true":
		case "yes":
		case "enable":
		case "enabled":
		case "1":
			return true;
		case "off":
		case "false":
		case "no":
		case "disable":
		case "disabled":
		case "0":
			return false;
		default:
			return undefined;
	}
}