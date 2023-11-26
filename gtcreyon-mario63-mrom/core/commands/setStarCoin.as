//setstarcoin,starcoin,sc|NUMBER,wBOOL|Sets the state of the given starcoin ID.
var bool = wToggle(wBool(args[2]), _root.StarCoin[args[1]])
_root.StarCoin[args[1]] = bool
respond("Star coin " + args[1] + " set to " + bool + ".")
_root.CalculateStarCoins()