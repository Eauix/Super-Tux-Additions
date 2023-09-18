# Snow Covering Tileset v8.0

## Changelog:

* Added water gradient tiles along an invisible water tile.

* Renamed the waterfall tilegroup to "Better Water".

* Fixed the slope issues where some of them had the wrong collisions.

* Added the missing slanted wall tiles. (the thinner sides of the slopes and the transitions to ground and ceiling)

* Added slope-wall transitions for all the slopes.

* Added more snow top variants.

* Added top and bottom snow variants to the autotiles.

* Added snow walljump merging tiles.

* Added an invisible walljump tile.

* Added auxiliary tiles that serve the purpose of helping you find the high and shaded snow tile variants using autotiles.

* Moved the files to the "Appdata/Roaming/SuperTux" folder for it not to interfere with the game data files.

* Renamed the main tilegroup to "Packed Snow".

* Added a Bonus Block with the healing item for the health bar script pack.
  - Be aware that this will only work properly if you have the Health Bar installed as well.

* Made a great rearrangement of all the main tilegroups, including "Sonw", "Snow Background", "Forest", "Forest Background", "Corrupted Forest" and "Corrupted Background". Made tiles often required easier to find.

* Added autotiles to the "ground hole" tiles along auxiliary tiles to fill the empty spaces, which are only visible in the editor.

* Added the the Weak Tiles and Unstable Tiles as... well, **tiles!**

* Added the Silver Bonus Blocks, a Quality of Life feature. <br> ![silver block](https://github.com/Eauix/Super-Tux-Additions/blob/main/Snow-Covering-Tileset/images/tiles/_custom/extra_bonus_by_eauix/silverblock/silver-0.png) ![5 coins block](https://github.com/Eauix/Super-Tux-Additions/blob/main/Snow-Covering-Tileset/images/tiles/_custom/extra_bonus_by_eauix/bonus-5coins.png) ![5 fire block](https://github.com/Eauix/Super-Tux-Additions/blob/main/Snow-Covering-Tileset/images/tiles/_custom/extra_bonus_by_eauix/bonus-5fire.png) ![5 ice block](https://github.com/Eauix/Super-Tux-Additions/blob/main/Snow-Covering-Tileset/images/tiles/_custom/extra_bonus_by_eauix/bonus-5ice.png) ![5 air block](https://github.com/Eauix/Super-Tux-Additions/blob/main/Snow-Covering-Tileset/images/tiles/_custom/extra_bonus_by_eauix/bonus-5air.png) ![5 earth block](https://github.com/Eauix/Super-Tux-Additions/blob/main/Snow-Covering-Tileset/images/tiles/_custom/extra_bonus_by_eauix/bonus-5earth.png) ![stable 1up block](https://github.com/Eauix/Super-Tux-Additions/blob/main/Snow-Covering-Tileset/images/tiles/_custom/extra_bonus_by_eauix/bonus-stable_1up.png) ![stable star block](https://github.com/Eauix/Super-Tux-Additions/blob/main/Snow-Covering-Tileset/images/tiles/_custom/extra_bonus_by_eauix/bonus-stable_star.png)
  - For them to work properly, you must import the "bonus_util.nut" into the sector init script. This will automatically import the "health_util.nut" file as well, since one of the bonus blocks has the healing item.

## Known issues I might not be able to fix:

* 2 of the high snow tile variants aren't accessible via the auxiliary tiles, but you probably won't need them at all.

* Sometimes the game might crash if you do a Ctrl+Z after building with the custom autotiles. Be aware of this.

* When you open the editor, there's a small lag spike as the console shows thousands of warning messages regarding autotile masks that correspond to multiple tiles, but to counter any problems it could cause, I adjusted the priority of each autotile based on how strict its condition is.

* Some sound effects coming from custom powerups are really loud. This is an issue with the "play_sound()" function, which can't adjust the sound volume or pitch, nor modulate it based on the game audio settings.

## Credits:

* Alzter

  - for creating the images used in the Waterfall tiles.


