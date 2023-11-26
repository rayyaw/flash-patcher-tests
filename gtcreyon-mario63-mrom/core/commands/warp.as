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