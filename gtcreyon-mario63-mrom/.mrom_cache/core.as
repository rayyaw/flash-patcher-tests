if(_root.setup == true)
{
	removeMovieClip(this);
}
else
{
	_root.setup = true;
	_root.camlock = true;
	_root.typing = false;
	command = "";
	response = "";
	responseTime = 0;
	requestReset = 0;
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
// Sets the state of every star coin.
setAllStarCoins = function(bool) {
        i = 1;
        while (i <= 64) {
            _root.StarCoin[i] = bool;
            i++;
        }
        _root.CalculateStarCoins();
}

// Sets the state of a specific star coin.
setStarCoin = function(number, bool) {
	if (bool == undefined) {
		_root.StarCoin[number] = !_root.StarCoin[number];
	} else {
		_root.StarCoin[number] = bool;
	}
	_root.CalculateStarCoins();
}

// Sets the state of every star.
setAllStars = function(bool) {
	i = 1;
	while (i <= 64) {
		_root.Star[i] = bool;
		i++;
	}
	_root.CalculateStars();
}

// Sets the state of a specific star.
setStar = function(number, bool) {
	if (bool == undefined) {
		_root.Star[number] = !_root.Star[number];
	} else {
		_root.Star[number] = bool;
	}
	_root.CalculateStars();
}

// Sets the state of every fludd stored in levels.
setFluddArray = function(bool) {
	_root.FluddArray = ["",
		["", bool, bool, bool], // BoB
		["", bool, bool, bool], // SL
		["", bool, bool, bool], // HMC
		["", bool, bool, bool], // BM
		["", bool, bool, bool], // LLL
		["", bool, bool, bool], // TTM
		["", bool, bool, bool], // RR
		["", bool, bool, bool], // BT3
		["", bool, bool, bool], // SSL
		["", bool, bool, bool], // WDW
		["", bool, bool, bool]]; // TTC
}
respond = function(msg)
{
	response = msg
	responseTime = 150
}
keyPos = 0;
var keyListener = new Object();
keyListener.onKeyDown = function()
{
	var asc = Key.getAscii();
	var code = Key.getCode();
	if(_root.typing)
	{
		if(asc > 31 && asc < 127)
		{
			command = command.slice(0,keyPos) + chr(asc) + command.slice(keyPos,command.length);
			keyPos += 1;
		}
		else
		{
			switch(Key.getCode())
			{
				case Key.BACKSPACE:
					command = command.slice(0,keyPos - 1) + command.slice(keyPos,command.length);
					keyPos -= 1;
					break;
				case Key.DELETEKEY:
					command = command.slice(0,keyPos) + command.slice(keyPos + 1,command.length);
					break;
				case Key.ENTER:
					executeCommand(command);
					_root.typing = false;
					break;
				case Key.ESCAPE:
					_root.typing = false;
					command = "";
					break;
				case Key.LEFT:
					keyPos -= 1;
					break;
				case Key.RIGHT:
					keyPos += 1;
					break;
			}
			keyPos = Math.max(Math.min(keyPos,command.length),0);
		}
	}
	else if(code == 191) // slash
	{
		_root.typing = true;
	}
};
Key.addListener(keyListener);
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
executeCommand = function(raw)
{
	if (raw.charAt(0) == "/")
	{
		raw = raw.slice(1, raw.length);
	}
	args = raw.split(" ");
	switch(args[0].toLowerCase())
	{
		case "noclip":
case "nc":
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
break;
case "doorwarp":
case "warpdoor":
case "door":
//doorwarp,warpdoor,door|STRING|Warps to a given door based on its internal ID.
var door = args[1];
_root.DoorTrasition(args[1]);
_root.Course.Char.attackFrame = "none";
var resetAnim = function(){
	_root.Course.Char.attackFrame = "";
}
setTimeout(resetAnim, 1)
respond("Warped to door " + door + ".")
break;
case "coins":
case "coin":
//coins,coin|NUMBER|Sets the coin count.
var num = parseInt(args[1]);
_root.Coins = parseInt(args[1]);
respond("Coin count has been set to " + num + ".");
break;
case "ghostmode":
case "ghost":
//ghostmode,ghost|wBOOL|Enables Ghostmode - invincibility, infinite fludd, noclip, no gravity.
if(wBool(args[1]) || args[1] == undefined)
{
	executeCommand("hp inf")
	executeCommand("power inf")
	executeCommand("water inf")
	executeCommand("lives inf")
	executeCommand("nc 1")
	_root.gravity = 0
	respond("Ghostmode enabled.")
}
else
{
	executeCommand("hp 8")
	executeCommand("power 100")
	executeCommand("water 10000")
	executeCommand("lives 4")
	executeCommand("nc 0")
	_root.gravity = 1
	respond("Ghostmode disabled.")
}
break;
case "file":
case "f":
//file,f|OPTION[complete/essentials/empty]|Sets the contents of the current file to the specified profile.
if(args[1] == "complete" || args[1] == "100") {
	_root.bowserKey1 = true
	_root.bowserKey2 = true
	_root.bowserKey3 = true
	setAllStars(true)
	setAllStarCoins(true)
	setFluddArray(true)
	respond("File data set to Complete.")
} else if(args[1] == "essentials") {
	_root.bowserKey1 = true
	_root.bowserKey2 = true
	setAllStars(false)
	setAllStarCoins(false)
	setFluddArray(false)
	_root.bowserKey3 = true
	_root.Star[39] = true
	_root.Star[41] = true
	_root.Star[50] = true
	_root.Star[51] = true
	_root.Star[36] = true
	_root.CalculateStars()
	respond("File data set to Essentials.")
} else if(args[1] == "empty") {
	_root.bowserKey1 = false
	_root.bowserKey2 = false
	_root.bowserKey3 = false
	setAllStars(false)
	setAllStarCoins(false)
	setFluddArray(false)
	respond("File data set to Empty.")
}

break;
case "cap":
//cap|OPTION[invincible/vanish/metal/wing/none],wTOGGLE,*TIME|Sets the state of the caps the player currently has.
switch(args[1].toLowerCase())
{
	case "invincible":
		_root.StartNewMusicAndIntroNoVar("WingCap - Intro", "WingCap - Repeat");
		_root.Invincible = wToggle(wBool(args[2]), _root.Invincible)
		break;
	case "vanish":
	case "invisible":
		_root.StartNewMusicAndIntroNoVar("WingCap - Intro", "WingCap - Repeat");
		_root.Invisible = wToggle(wBool(args[2]), _root.Invisible)
		break;
	case "metal":
		_root.StartNewMusicAndIntroNoVar("MetalCap - Intro", "MetalCap - Repeat");
		_root.Metal = wToggle(wBool(args[2]), _root.Metal)
		break;
	case "wingcap":
	case "wing":
		_root.StartNewMusicAndIntroNoVar("WingCap - Intro", "WingCap - Repeat");
		_root.WingCap = wToggle(wBool(args[2]), _root.WingCap)
		break;
	case "none":
		_root.PowerTimer = -1
		break;
	case "default":
		respond("Unknown cap.")
}

if (args[3] == undefined)
{
	_root.PowerTimer = 10000
}
else
{
	_root.PowerTimer = parseFloat(args[3])
}
break;
case "char":
//char|OPTION[mario/luigi/toggle]|Switches to the given character.
switch (args[1].toLowerCase()) {
	case "mario":
	case "m":
		_root.CurrentPlayer = "Mario";
		break;
	case "luigi":
	case "l":
		_root.CurrentPlayer = "Luigi";
		break;
	default:
		if (_root.CurrentPlayer == "Mario") {
			_root.CurrentPlayer = "Luigi";
		} else {
			_root.CurrentPlayer = "Mario";
		}
		break;
	if (_root.CurrentPlayer == "Mario") {
		respond("Character switched to Mario.");
	} else {
		respond("Character switched to Luigi.");
	}
}
break;
case "ldp":
//ldp||Trigger a Level Designer layer.
_root.attachMovie("LDMenu","M",_root.getNextHighestDepth());
respond("LDP triggered.");
break;
case "restartroom":
case "restart":
//restartroom,restart||Restarts the room from the spawn point.
_root.changecourse(_root.playingcourse)
break;
case "gravity":
case "grav":
//gravity,grav|NUMBER|Sets gravity to the specified value.
var num = parseFloat(args[1])
_root.gravity = num;
respond("Gravity set to " + num + ".")
break;
case "setshine":
case "setstar":
case "shine":
case "star":
//setshine,setstar,shine,star|NUMBER,wBOOL|Sets the state of the given shine ID.
var bool = wToggle(wBool(args[2]), _root.Star[args[1]])
_root.Star[args[1]] = bool
respond("Shine " + args[1] + " set to " + bool + ".")
_root.CalculateStars()
break;
case "zoomlock":
case "zl":
//zoomlock,zl|wTOGGLE|Enables or disables the default zoom locking.
var state = wBool(args[1])
if (state == 1) {
	if (_root.Maxzoomin == Infinity)
	{
		_root.Maxzoomin = 200;
		_root.Maxzoomout = 50;
		respond("Zoom Lock: ON");
	}
	else
	{
		respond("Zoom lock is already enabled.");
	}
}
else if (state == 0) {
	if (_root.Maxzoomin == Infinity)
	{
		respond("Zoom lock is already disabled.");
	}
	else
	{
		_root.Maxzoomin = Infinity;
		_root.Maxzoomout = -Infinity;
		respond("Zoom Lock: OFF");
	}
}
else if (state == undefined)
{
	if(_root.Maxzoomin == Infinity)
	{
		_root.Maxzoomin = 200;
		_root.Maxzoomout = 50;
		respond("Zoom Lock: ON [toggle]");
	}
	else
	{
		_root.Maxzoomin = Infinity;
		_root.Maxzoomout = -Infinity;
		respond("Zoom Lock: OFF [toggle]");
	}
}
break;
case "water":
//water|OPTION[refill/empty/infinity/NUMBER]|Sets the water tank value. From 0 to 10000.
var infWater = function(){
	_root.WaterAmount = _root.TotalWater
}
clearInterval(waterInterval)
if (args[1] == "refill" || args[1] == "full" || args[1] == "fill") {
	_root.WaterAmount = _root.TotalWater
	respond("Water has been refilled.");
} else if (args[1] == "death" || args[1] == "kill" || args[1] == "empty") {
	_root.WaterAmount = 0;
	respond("Water emptied.");
} else if (args[1] == "infinite" || args[1] == "infinity" || args[1] == "inf") {
	waterInterval = setInterval(infWater, 1)
	respond("Water is now infinite.");
} else {
	_root.WaterAmount = args[1];
	respond("Water has been set to " + _root.WaterAmount + ".");
}

break;
case "setposition":
case "setpos":
//setposition,setpos|NUMBER,NUMBER|Moves the player to the given position.
var x = Number(args[1])
var y = Number(args[2])
var new_x = x + _root.Course.BackGFX._x
var new_y = y + _root.Course.BackGFX._y
_root.Course.Char._x = new_x
_root.Course.Char._y = new_y
respond("Moved player to (" + x + ", " + y + ").");
break;
case "setstarcoin":
case "starcoin":
case "sc":
//setstarcoin,starcoin,sc|NUMBER,wBOOL|Sets the state of the given starcoin ID.
var bool = wToggle(wBool(args[2]), _root.StarCoin[args[1]])
_root.StarCoin[args[1]] = bool
respond("Star coin " + args[1] + " set to " + bool + ".")
_root.CalculateStarCoins()
break;
case "showcollision":
case "shc":
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
break;
case "animation":
case "anim":
//animation,anim|NUMBER|Sets the current character animation.
var animation = args[1];
if (animation == undefined) {
	animation = "";
}
respond("Animation : " + animation);
if (animation == "" || animation == undefined)
{
	_root.Course.Char.attack = false;
	_root.Course.Char.attackFrame = "";
}
else
{
	_root.Course.Char.attack = true;
	_root.Course.Char.attackFrame = animation;
}
break;
case "bowserkey":
case "key":
case "bk":
//bowserkey,key,bk|NUMBER|Sets the state of a Bowser key.
var state = wBool(args[2])
switch(args[1])
{
	case "1":
		var res = wToggle(state, _root.BowserKey1)
		_root.BowserKey1 = res
		break;
	case "2":
		res = wToggle(state, _root.BowserKey2)
		_root.BowserKey2 = res
		break;
	case "3":
		res = wToggle(state, _root.BowserKey3)
		_root.BowserKey3 = res
		break;
}

if(res)
{
	var msg = "ON"
}
else
{
	msg = "OFF"
}

if(state == -1)
{
	msg += " [toggle]"
}
respond("Key " + args[1] + " " + msg + ".")
break;
case "godmode":
case "god":
//godmode,god|wBOOL|Enables Godmode - invincibility and infinite fludd.
if(wBool(args[1]) || args[1] == undefined)
{
	executeCommand("hp inf")
	executeCommand("power inf")
	executeCommand("water inf")
	executeCommand("lives inf")
	respond("Godmode enabled.")
}
else
{
	executeCommand("hp 8")
	executeCommand("power 100")
	executeCommand("water 10000")
	executeCommand("lives 4")
	respond("Godmode disabled.")
}
break;
case "fakebowser":
case "fb":
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
break;
case "resetroom":
case "reset":
case "rr":
//resetroom,reset,rr||Resets the room from the current position.
var x = _root.Course.Char._x - _root.Course.FrontGFX._x
var y = _root.Course.Char._y - _root.Course.FrontGFX._y
_root.changecourse(_root.playingcourse, x, y, x, y)
break;
case "air":
//air|OPTION[refill/empty/infinity/NUMBER]|Sets the remaining air. From 0 to 8.
var infAir = function(){
	_root.WaterHP = 8
}
clearInterval(airInterval)
if (args[1] == "refill" || args[1] == "full" || args[1] == "fill") {
	_root.WaterHP = 8
	respond("Air has been refilled.");
} else if (args[1] == "death" || args[1] == "kill" || args[1] == "empty") {
	_root.WaterHP = 0;
	respond("Air emptied.");
} else if (args[1] == "infinite" || args[1] == "infinity" || args[1] == "inf") {
	airInterval = setInterval(infAir, 1)
	respond("Air is now infinite.");
} else {
	_root.WaterHP = args[1];
	respond("Air has been set to " + _root.WaterHP + ".");
}

break;
case "power":
case "fluddpower":
//power,fluddpower|OPTION[refill/empty/infinity/NUMBER]|Sets the remaining fludd power. From 0 to 8.
var infPower = function(){
	_root.Power = _root.TotalPower
}
clearInterval(powerInterval)
if (args[1] == "refill" || args[1] == "full" || args[1] == "fill") {
	_root.Power = _root.TotalPower
	respond("Power has been refilled.");
} else if (args[1] == "death" || args[1] == "kill" || args[1] == "empty") {
	_root.Power = 0;
	respond("Power emptied.");
} else if (args[1] == "infinite" || args[1] == "infinity" || args[1] == "inf") {
	powerInterval = setInterval(infPower, 1)
	respond("Power is now infinite.");
} else {
	_root.Power = args[1];
	respond("Power has been set to " + _root.Power + ".");
}

break;
case "fludd":
case "nozzle":
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
break;
case "position":
case "pos":
case "getposition":
case "getpos":
//position,pos,getposition,getpos||Returns the current position of the player.
var x = _root.Course.Char._x - _root.Course.FrontGFX._x
var y = _root.Course.Char._y - _root.Course.FrontGFX._y
respond("(" + x + ", " + y + ")")
break;
case "resetcoins":
case "restartcoins":
//resetcoins,restartcoins||Resets the coins position on the next loading zone.
_root.Restartcoins()
respond("Coins will be reset on the next loading zone.")
break;
case "kill":
case "die":
//kill,die||Kills the player.
_root.CharHP = 0;
respond("Killed.");
break;
case "lives":
//lives|OPTION[NUMBER/infinity]|Sets the extra life counter.
if (args[1] == "infinite" || args[1] == "infinity" || args[1] == "inf") {
	_root.CharLives = NaN
	respond("Lives are now infinite.")
} else {
	_root.CharLives = Number(args[1])
	respond("Lives have been set to " + _root.CharLives + ".")
}
break;
case "exit":
case "exitlevel":
//exit,exitlevel||Exits the level.
_root.ReturnToCastle();
respond("Exited level.");
break;
case "nozzleunlock":
case "fluddunlock":
case "nu":
case "fu":
//nozzleunlock,fluddunlock,nu,fu|OPTION[bob/sl/hmc/bm/lll/ttm/rr/bt3/ssl/wdw/ttc/all],OPTION[h/r/t/all],wBOOL|Sets the saved nozzles in a specific world.
var world = args[1]
var nozzle = args[2]
var bool = wBool(args[3])
if (world === undefined || nozzle === undefined) {
	respond("Invalid syntax.")
} else {
	var worlds = ["bob", "sl", "hmc", "bm", "lll", "ttm", "rr", "bt3", "ssl", "wdw", "ttc"]
	var nozzles = ["h", "r", "t"]
	if(world == "all"){
		var worldID = 0
		var h = 11
	} else {
		worldID = worlds.indexOf(world)
		h = worldID + 1
	}
	if(nozzle == "all"){
		var nozzleID = 0
		var k = 3
	} else {
		var nozzleID = nozzles.indexOf(nozzle.toLowerCase())
		k = 1
	}
	while(worldID < h) {
		while(nozzleID < k) {
			_root.FluddArray[worldID + 1][nozzleID + 1] = wToggle(bool, _root.FluddArray[worldID + 1][nozzleID + 1])
			nozzleID += 1
		}
		nozzleID = 0
		worldID += 1
	}
	respond("Updated nozzles.")
}
break;
case "levelname":
case "ln":
//levelname,ln||Returns the identifier of the current level.
respond(_root.playingcourse)
break;
case "health":
case "hp":
//health,hp|OPTION[NUMBER/refill/empty/death/infinity]|Sets a certain amount of health to the player. From 0 to 8.
var infHealth = function(){
	_root.CharHP = 8
}
clearInterval(healthInterval)
if (args[1] == "refill" || args[1] == "full" || args[1] == "fill") {
	_root.CharHP = 8;
	respond("Health has been refilled.");
} else if (args[1] == "death" || args[1] == "kill" || args[1] == "empty") {
	_root.CharHP = 0;
	respond("Health emptied.");
} else if (args[1] == "infinite" || args[1] == "infinity" || args[1] == "inf") {
	healthInterval = setInterval(infHealth, 1)
	respond("Health is now infinite.");
} else {
	_root.CharHP = args[1];
	respond("Health has been set to " + _root.CharHP + ".");
}

break;
case "reds":
case "red":
case "redcoins":
case "redcoin":
//reds,red,redcoins,redcoin|NUMBER|Sets the red coin count.
var num = Number(args[1])
_root.RedCoins = num
respond("Red coin count set to " + num + ".");
break;
case "quit":
case "quitgame":
//quit,quitgame||Quits to the title screen.
_root.ReturnToTitle();
respond("Quit game.");
break;
case "setvelocity":
case "setspeed":
case "setvel":
case "vel":
case "speed":
case "sv":
//setvelocity,setspeed,setvel,vel,speed,sv|OPTION[x/NUMBER],OPTION[y/NUMBER]|Sets the player's velocity.
var x = args[1]
var y = args[2]
if(x == "x")
{
	x = _root.Course.Char.xspeed
} else {
	x = Number(x)
}
if(y == "y")
{
	y = _root.Course.Char.yspeed
} else {
	y = Number(y)
}
_root.Course.Char.xspeed = x
_root.Course.Char.yspeed = y
respond("Velocity set to (" + x + ", " + y + ").")
break;
case "camlock":
case "cl":
//camlock,cl|wTOGGLE|Enables or disables camera edge locking.
switch(wBool(args[1]))
{
	case 0:
		_root.camlock = false
		respond("Camera Lock: OFF")
		break;
	case 1:
		_root.camlock = true
		respond("Camera Lock: ON")
		break;
	case undefined:
		if(_root.camlock) {
			_root.camlock = false
			respond("Camera Lock: OFF [toggle]")
		} else {
			_root.camlock = true
			respond("Camera Lock: ON [toggle]")
		}
		break;
}
break;
case "silvers":
case "silver":
//silvers,silver|NUMBER|Sets the silver star count.
var num = Number(args[1])
_root.SilverStars = num
respond("Silver star count set to " + num + ".");
break;
case "gameover":
//gameover||Triggers a Game Over.
_root.CharLives = 0;
_root.CharHP = 0;
respond("Game over.");
break;
case "warp":
case "w":
//warp,w|STRING:room_code,*BOOL:reset_music,*STRING:transition_type|Warps the player to the specified room.
if(args[2] === undefined)
{
	var a = "StarIn"
	var b = undefined
}
else if(args[3] === undefined)
{
	a = "StarIn"
	b = args[2]
}
else
{
	a = args[2]
	b = args[3]
}
_root.changecourse(a, args[1], 0, 0, 0, 0, b)
_root.Course.Char.attackFrame = "none"
_root.warpframe = false
requestReset = 2
respond("Warped to " + args[1] + ".")
break;

		default:
			respond("Unknown command.")
	}
	command = "";
}

	onEnterFrame = function()
	{
		var tempCommand = command + " "; //add a space to allow it to be underlined for the cursor
		if(responseTime > 0)
		{
			responseTime -= 1;
		}
		else
		{
			response = "";
		}
		if(_root.typing)
		{
			_root.cmd = tempCommand.slice(0,keyPos) + "<u>" + tempCommand.charAt(keyPos) + "</u>" + tempCommand.slice(keyPos + 1,tempCommand.length) + "\n" + response;
		}
		else
		{
			_root.cmd = "\n" + response
		}

		if(requestReset == 1)
		{
			requestReset = 0
			_root.Course.Char.attackFrame = "";
		}
		if(requestReset == 2)
		{
			requestReset = 1
		}

		this.swapDepths(0);
		this.swapDepths(_root.getNextHighestDepth());
	};
}
