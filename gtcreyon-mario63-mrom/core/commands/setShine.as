//setshine,setstar,shine,star|NUMBER,wBOOL|Sets the state of the given shine ID.
var bool = wToggle(wBool(args[2]), _root.Star[args[1]])
_root.Star[args[1]] = bool
respond("Shine " + args[1] + " set to " + bool + ".")
_root.CalculateStars()