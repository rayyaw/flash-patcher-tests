<details>
<summary>noclip</summary>

Enables or disables NoClip.

**Aliases:** nc

**Arguments:** wTOGGLE

</details>

<details>
<summary>doorwarp</summary>

Warps to a given door based on its internal ID.

**Aliases:** warpdoor, door

**Arguments:** STRING

</details>

<details>
<summary>coins</summary>

Sets the coin count.

**Aliases:** coin

**Arguments:** NUMBER

</details>

<details>
<summary>ghostmode</summary>

Enables Ghostmode - invincibility, infinite fludd, noclip, no gravity.

**Aliases:** ghost

**Arguments:** wBOOL

</details>

<details>
<summary>file</summary>

Sets the contents of the current file to the specified profile.

**Aliases:** f

**Arguments:** OPTION[complete/essentials/empty]

</details>

<details>
<summary>cap</summary>

Sets the state of the caps the player currently has.

**Arguments:** OPTION[invincible/vanish/metal/wing/none], wTOGGLE, *TIME

</details>

<details>
<summary>char</summary>

Switches to the given character.

**Arguments:** OPTION[mario/luigi/toggle]

</details>

<details>
<summary>ldp</summary>

Trigger a Level Designer layer.

**Arguments:** 

</details>

<details>
<summary>restartroom</summary>

Restarts the room from the spawn point.

**Aliases:** restart

**Arguments:** 

</details>

<details>
<summary>gravity</summary>

Sets gravity to the specified value.

**Aliases:** grav

**Arguments:** NUMBER

</details>

<details>
<summary>setshine</summary>

Sets the state of the given shine ID.

**Aliases:** setstar, shine, star

**Arguments:** NUMBER, wBOOL

</details>

<details>
<summary>zoomlock</summary>

Enables or disables the default zoom locking.

**Aliases:** zl

**Arguments:** wTOGGLE

</details>

<details>
<summary>water</summary>

Sets the water tank value. From 0 to 10000.

**Arguments:** OPTION[refill/empty/infinity/NUMBER]

</details>

<details>
<summary>setposition</summary>

Moves the player to the given position.

**Aliases:** setpos

**Arguments:** NUMBER, NUMBER

</details>

<details>
<summary>setstarcoin</summary>

Sets the state of the given starcoin ID.

**Aliases:** starcoin, sc

**Arguments:** NUMBER, wBOOL

</details>

<details>
<summary>showcollision</summary>

Makes collision visible as bright boxes.

**Aliases:** shc

**Arguments:** wTOGGLE

</details>

<details>
<summary>animation</summary>

Sets the current character animation.

**Aliases:** anim

**Arguments:** NUMBER

</details>

<details>
<summary>bowserkey</summary>

Sets the state of a Bowser key.

**Aliases:** key, bk

**Arguments:** NUMBER

</details>

<details>
<summary>godmode</summary>

Enables Godmode - invincibility and infinite fludd.

**Aliases:** god

**Arguments:** wBOOL

</details>

<details>
<summary>fakebowser</summary>

Enables or disables the Fake Bowser fight.

**Aliases:** fb

**Arguments:** wTOGGLE

</details>

<details>
<summary>resetroom</summary>

Resets the room from the current position.

**Aliases:** reset, rr

**Arguments:** 

</details>

<details>
<summary>air</summary>

Sets the remaining air. From 0 to 8.

**Arguments:** OPTION[refill/empty/infinity/NUMBER]

</details>

<details>
<summary>power</summary>

Sets the remaining fludd power. From 0 to 8.

**Aliases:** fluddpower

**Arguments:** OPTION[refill/empty/infinity/NUMBER]

</details>

<details>
<summary>fludd</summary>

Sets the availability state of FLUDD nozzles.

**Aliases:** nozzle

**Arguments:** OPTION[all/hover/rocket/turbo], wTOGGLE

</details>

<details>
<summary>position</summary>

Returns the current position of the player.

**Aliases:** pos, getposition, getpos

**Arguments:** 

</details>

<details>
<summary>resetcoins</summary>

Resets the coins position on the next loading zone.

**Aliases:** restartcoins

**Arguments:** 

</details>

<details>
<summary>kill</summary>

Kills the player.

**Aliases:** die

**Arguments:** 

</details>

<details>
<summary>lives</summary>

Sets the extra life counter.

**Arguments:** OPTION[NUMBER/infinity]

</details>

<details>
<summary>exit</summary>

Exits the level.

**Aliases:** exitlevel

**Arguments:** 

</details>

<details>
<summary>nozzleunlock</summary>

Sets the saved nozzles in a specific world.

**Aliases:** fluddunlock, nu, fu

**Arguments:** OPTION[bob/sl/hmc/bm/lll/ttm/rr/bt3/ssl/wdw/ttc/all], OPTION[h/r/t/all], wBOOL

</details>

<details>
<summary>levelname</summary>

Returns the identifier of the current level.

**Aliases:** ln

**Arguments:** 

</details>

<details>
<summary>health</summary>

Sets a certain amount of health to the player. From 0 to 8.

**Aliases:** hp

**Arguments:** OPTION[NUMBER/refill/empty/death/infinity]

</details>

<details>
<summary>reds</summary>

Sets the red coin count.

**Aliases:** red, redcoins, redcoin

**Arguments:** NUMBER

</details>

<details>
<summary>quit</summary>

Quits to the title screen.

**Aliases:** quitgame

**Arguments:** 

</details>

<details>
<summary>setvelocity</summary>

Sets the player's velocity.

**Aliases:** setspeed, setvel, vel, speed, sv

**Arguments:** OPTION[x/NUMBER], OPTION[y/NUMBER]

</details>

<details>
<summary>camlock</summary>

Enables or disables camera edge locking.

**Aliases:** cl

**Arguments:** wTOGGLE

</details>

<details>
<summary>silvers</summary>

Sets the silver star count.

**Aliases:** silver

**Arguments:** NUMBER

</details>

<details>
<summary>gameover</summary>

Triggers a Game Over.

**Arguments:** 

</details>

<details>
<summary>warp</summary>

Warps the player to the specified room.

**Aliases:** w

**Arguments:** STRING:room_code, *BOOL:reset_music, *STRING:transition_type

</details>

