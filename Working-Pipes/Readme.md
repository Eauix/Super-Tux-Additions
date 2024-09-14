# Working Pipes for Super Tux 
![pipe decal](https://github.com/Eauix/Super-Tux-Additions/blob/main/Working-Pipes/images/decal/_custom/billboard-pipe.png)

This folder contains all the files needed for the enterable pipes to work in your game.

If you want to use the pipes in a level, you must `import("scripts/pipes_util.nut")` into your sector init script, then use the many functions you will find inside the .nut file such as `exit_pipe(object_name)`

# Tutorial

Here you will find different functions that must be written in the
"hit script" from the entrance scripted object and in script triggers
near the exit spawnpoints that you will place on the pipe you want to make functional.

- The scripted object must be solid and have physics disabled, 
it may or not be visible, and must be placed on the middle of the
top 2 tiles of the pipe.

- One scripted object represents the entrance of the pipe, it must have an unique name and the enter pipe function written in its hit script

- The second scripted object represents the exit of the pipe, it must only have an unique name.

- There should be a spawnpoint and a script trigger somewhere near the pipe, and the sript on this trigger will be the exit pipe function

- The pipe must be on a tilemap with Z > 50.

- There are different functions to use depending on the direction of the entrance and exit pipes.
  
- The script trigger MUST NOT be in front of the pipe, you can place the spawnpoint and the
trigger somewhere else and mention the scripted object of the pipe, so Tux will come out
of the pipe even if he doesn't directly spawn on the pipe.

To use this file, you have to import it in every sector of the level.
Like this: `import("levels/my_world/pipes_util.nut");`

## Functions:

### `exit_pipe(object_name);`

This will make Tux do an animation coming out of the pipe while the screen
fades in when he touches the scripted object, you want this to happen
immediately after he spawns in the destination spawnpoint. This will
only happen if he has entered a pipe before.

- Example if the exit scripted object is named `pipe1b` <br>
- `exit_pipe(pipe1b);`

<hr>

### `enter_pipe(object_name, "destination_sector", "destination_spawnpoint");`

This will make Tux do an animation going inside the pipe while the screen
fades out. This will only happen if you press [DOWN] while touching the
scripted object. Then he will teleport to the destination spawnpoint. You want
the destination waypoint to be right above a scripted object with exit_pipe,
otherwise the screen might stay black and not fade in again.
- Example if the entrance scripted object is named `pipe1a`, the destination sector is `main` and the destination spawnpoint is `exit1` <br>
- `enter_pipe(pipe1a, "main", "exit1");`

<hr>

### `twoway_pipe(object_name, "destination_sector", "destination_spawnpoint");`

This is basically the 2 previous functions combined into one. In this case, no script trigger is necessary, but there must be 2 spawnpoints, one above each scripted object.
This function only works for entering down and exiting up pipes, and is 100% optional.

<hr>

### `exit_pipe_l(object_name);` <br> `exit_pipe_r(object_name);` <br> `exit_pipe_d(object_name);`

These will make Tux do animations coming out of the pipe in different directions,
those being Left, Right and Down, respectively. Check out the tutorial level for a better understanding on how to place the spawnpoints and script triggers.

<hr>

### `enter_pipe_l(object_name, "destination_sector", "destination_spawnpoint");` <br> `enter_pipe_r(object_name, "destination_sector", "destination_spawnpoint");` <br> `enter_pipe_u(object_name, "destination_sector", "destination_spawnpoint");`

These will make Tux do animations going inside the pipe depending on which key
must be held while touching the scripted object, those being [Left], [Right]
and [Up], respectively.

<hr>

### `prevent();`

This function should be wrwitten right after the import function, it will prevent
you from becoming softlocked in a black screen if there is no proper exit to the
pipe you entered.

<hr>

If you want a pipe to be a 2-way warp, you can write the enter function in the exit scripted object's hit script, which was empty until then.
A second spawnpoint with script triggers should be placed near the first pipe, targetting its scripted object for the animation. Basically you do the same thing, but make the exit also be an entrance.
