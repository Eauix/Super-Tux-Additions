# Health Bar for Super Tux
![bar](https://github.com/Eauix/Super-Tux-Additions/blob/main/Health-Bar/images/custom_hud/hb_example.png)

This folder contains all the files needed for the health bar to work in your game.

## If you want to use the bar in a level, you must do the following:

- Type `import("scripts/health_util.nut")` into your sector init script.

After this, several functions related to the health bar will be available to use with script triggers or other objects as you wish.

## Functions:

- `use_health(true)` - Activates the health bar, it will appear at the top right of your screen and Tux will be able to take more hits before he dies. Recommended to use in the sector init script.

- `use_health(false)` - Deactivates the health bar, making the player damage work as before.

- `heal(x)` - Recovers `x` health points to the player, you can't heal above 5 points as it is the full health. Recommended to use with a custom powerup, there's a sprite named `heart_item.sprite` for this powerup.

- `hurt(x)` - Damages the player, taking `x` health points from it. Recommended to use with scripted objects that should be considered hazardous. x=5 will instantly kill the player, and x=0 will only take his powerup.

- `reset_health()` - Makes the health full again. Recommended to use at the level beginning with an one-shot script trigger.

- `set_damage(x)` - Makes everything that hurts the player take `x` health points by default. Recommended to use with ambient areas that should deal more damage, for example lava or spikes. But probably it's tricky to use, since you have to set the damage to a value when the player enters the area and set back to the default value when the player exits the area.

- `hide()` and `unhide()` - Makes the health bar invisible or visible again. Recommended to use during cutscenes or when going from one sector to another, to prevent a duplicated bar visual glitch.

## Notice:

Be aware that the health value the player has is carried over to other levels, so if you finish a level with 2 health points, you will start your next level with 2 health points, it only resets when you die or when you use the function that resets it.

Be also aware that if your level has multiple sectors, you will have to import and use all the scripts in each sector.

The .nut file also has comment sections explaining what each function does and when to use them, along some internal functions that aren't intended to be used in editor, but you can use them anyways.
