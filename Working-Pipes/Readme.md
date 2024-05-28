# WARNING!
## For some unknow reason, using a door in a level completely breaks the pipe functions until the level is reset. This might happen because of how the doors were updated and now they probably handle the sector spawning differently.

# Working Pipes for Super Tux 
![pipe decal](https://github.com/Eauix/Super-Tux-Additions/blob/main/Working-Pipes/images/decal/_custom/billboard-pipe.png)

This folder contains all the files needed for the enterable pipes to work in your game.

If you want to use the pipes in a level, you must import the "pipes_util.nut" into your sector init script, then use the many functions you will find inside the .nut file such as "exit_pipe(string scripted_object)"

The .nut file has comment sections explaining what each function does and when to use them.

You can download [here](https://cdn.discordapp.com/attachments/1144712722001436812/1144713262064222238/ReworkedWorkingPipes2.stl) a tutorial level on how to use the pipe functions with scripted objects, triggers and spawnpoints
