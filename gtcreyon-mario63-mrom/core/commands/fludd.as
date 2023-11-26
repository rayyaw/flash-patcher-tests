//fludd,nozzle|OPTION[all/hover/rocket/turbo],wTOGGLE|Sets the availability state of FLUDD nozzles.
var state = wBool(args[2]);
switch(state)
{
	case false:
		var msg = "set to false";
		break;
	case true:
		msg = "set to true";
		break;
	case undefined:
		msg = "toggled";
		break;
}

var a = args[1].toLowerCase()
if(a == "all")
{
	_root.SaveFluddH = wToggle(state, _root.SaveFluddH);
	_root.SaveFluddR = wToggle(state, _root.SaveFluddR);
	_root.SaveFluddT = wToggle(state, _root.SaveFluddT);
	respond("All FLUDD nozzles have been " + msg + ".");
}
else if(a == "h" || a == "hover")
{
	_root.SaveFluddH = wToggle(state, _root.SaveFluddH);
	respond("Hover FLUDD has been " + msg + ".");
}
else if(a == "r" || a == "rocket")
{
	_root.SaveFluddR = wToggle(state, _root.SaveFluddR);
	respond("Rocket FLUDD has been " + msg + ".");
}
else if(a == "t" || a == "turbo")
{
	_root.SaveFluddT = wToggle(state, _root.SaveFluddT);
	respond("Turbo FLUDD has been " + msg + ".");
}
else
{
	respond("Unknown nozzle.");
}