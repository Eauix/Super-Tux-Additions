# Snow Covering Tileset v8.2a
## Changelog:

* Added 4 new corner tiles for the `packed_snow_high` autotileset.
* The `packed_snow_high` autotileset now adapts better to all its suroundings, broken tiles will no longer appear when drawing with it.

  ![image](https://github.com/user-attachments/assets/31b9c7fd-438e-47de-861f-123c94c18a77)

<hr>

# Previous Updates:
## Snow Covering Tileset v8.2
## Changelog:

* All the packed snow tilesets now share the same default tile ID, as the game supports multiple autotilesets per tile now

* Deprecated the auxiliary tiles used for packed snow autotileset variants and other tilesets' hole variants

  ![pure_snow_v08_aux](https://github.com/user-attachments/assets/cf4eb356-6744-4c27-a607-5a7c959b3683)
  ![pure_snow_v08_red_e](https://github.com/user-attachments/assets/dfbc5893-0065-42b8-8f97-c2c3f4ed4531)

* Deprecated the weak / unstable tiles, as they are vanilla now

  ![strawbox-0](https://github.com/user-attachments/assets/bc2e6da8-d233-4b2d-b5ca-a86126597255)
  ![meltbox-0](https://github.com/user-attachments/assets/d410f8ff-711e-4cc5-8238-6dc0a8f93138)
  ![snow-0](https://github.com/user-attachments/assets/7bf28cc3-7a88-467e-ab05-080a37fcd5de)
  ![brick-0](https://github.com/user-attachments/assets/162ff281-96b6-4323-80c9-6114257f90de)
  ![skull](https://github.com/user-attachments/assets/a2799340-0e3b-40f3-9a56-e4f08152b730)

* Silver bonus blocks now only give 1 powerup, as powerup stacking will be removed with item pockets
* New "plus an egg" sprites for silver blocks, as they give you the powerup even if you're small, but no longer give you 5 stacks of it

  ![bonus-5fire](https://github.com/user-attachments/assets/6efba090-3e70-471d-a495-075095e44d9e)
  ![bonus-5ice](https://github.com/user-attachments/assets/1c0d5fb3-bace-4b22-bb29-659ff45a1186)
  ![bonus-5air](https://github.com/user-attachments/assets/db7daef5-d288-4fcf-8631-61b61ad5bbdd)
  ![bonus-5earth](https://github.com/user-attachments/assets/45c4e0d9-494a-4999-9de3-a50d8f79752e)

* Bonus_util.nut now pre-loads the 5-coins sprite on entering a level (i think it does, still needs testing)

* Removed unnecessary attribute and data sections

* Made the 5 coins sprite rotate at the same speed as the normal coin

* Fixed the warning spam regarding autotile masks in all packed snow tilesets

  ![image](https://github.com/user-attachments/assets/c3104a18-932d-4af7-aa23-a9525bfed291)

## Known issues:
* Hitting a 5-coins silver block with buttjump will give you 9 coins instead, this is because of https://github.com/SuperTux/supertux/issues/3079

<hr>

## Snow Covering Tileset v8.1.1
## Changelog:

* Increased the Waterfall FPS from 10 to 15

* Added a simple invisible tile that emits light <br> ![ambient_light](https://github.com/user-attachments/assets/4b1b4b36-0244-4a8e-ab77-f26298346588)

<hr>

## Snow Covering Tileset v8.1
## Changelog:

* Fixed the broken tiles that had their IDs changed during deprecation.

* Optimized the strf file by making so it imports the default game tiles along the custom ones, instead of defining the default ones inside itself (the tiles should no longer get broken as the game updates).

* Removed the default tile rearrangement because they are no longer defined within this strf file.

* Moved the autotiles file into the tileset graphics folder, as it doesn't need to be accessed via the editor.

* Added a version of the strf that doesn't import the default game tiles (called "noi", for "no import"), so it can be imported along other custom tilesets.

* Added a tilegroup for custom bonus tiles and one for auxiliary tiles, as they can no longer be inserted into the default game tilegroups.

<hr>

## Snow Covering Tileset v8.0
## Changelog:

* Added water gradient tiles along an invisible water tile. <br> ![water gradient](https://github.com/Eauix/Super-Tux-Additions/blob/main/Snow-Covering-Tileset/images/tiles/_custom/better_waterfall_by_alzter_and_eauix/wgr_e.png)

* Renamed the waterfall tilegroup to "Better Water".

* Fixed the slope issues where some of them had the wrong collisions.

* Added the missing slanted wall tiles. (the thinner sides of the slopes and the transitions to ground and ceiling)

* Added slope-wall transitions for all the slopes.

* Added more snow top variants.

* Added top and bottom snow variants to the autotiles.

* Added snow walljump merging tiles.

* Added an invisible walljump tile. <br> ![walljump tile](https://github.com/Eauix/Super-Tux-Additions/blob/main/Snow-Covering-Tileset/images/tiles/_custom/snowcovering_by_eauix/auxiliary/pure_snow_v08_iwj.png)

* Added autotiles to the "ground hole" tiles along auxiliary tiles to fill the empty spaces, which are only visible in the editor.

* Added auxiliary tiles that serve the purpose of helping you find the high and shaded snow tile variants using autotiles. <br> ![auxiliary tiles](https://github.com/Eauix/Super-Tux-Additions/blob/main/Snow-Covering-Tileset/images/tiles/_custom/snowcovering_by_eauix/auxiliary/deprecated/pure_snow_v08_aux.png)

* Moved the files to the "Appdata/Roaming/SuperTux" folder for it not to interfere with the game data files.

* Renamed the main tilegroup to "Packed Snow".

* Added a Bonus Block with the healing item for the health bar script pack. <br> ![heal bonus block](https://github.com/Eauix/Super-Tux-Additions/blob/main/Snow-Covering-Tileset/images/tiles/_custom/extra_bonus_by_eauix/bonus-heal.png) <br> <sup>- For it to work properly, you must import the "bonus_util.nut" into your sector init script. Importing the "health_util.nut" is not necessary, but the item won't do much.</sup>

* Made a great rearrangement of all the main tilegroups, including "Snow", "Snow Background", "Forest", "Forest Background", "Corrupted Forest" and "Corrupted Background". Made tiles often required easier to find.

* Added the the Weak Tiles and Unstable Tiles as... well, **tiles!**

* Added the Silver Bonus Blocks, a Quality of Life feature. <br> ![platinum coin](https://github.com/Eauix/Super-Tux-Additions/blob/main/Snow-Covering-Tileset/images/tiles/_custom/extra_bonus_by_eauix/platinumcoin/platinum_coin_000000.png) ![silver block](https://github.com/Eauix/Super-Tux-Additions/blob/main/Snow-Covering-Tileset/images/tiles/_custom/extra_bonus_by_eauix/silverblock/silver-0.png) ![5 coins block](https://github.com/Eauix/Super-Tux-Additions/blob/main/Snow-Covering-Tileset/images/tiles/_custom/extra_bonus_by_eauix/bonus-5coins.png) ![bonus-5fire-old](https://github.com/user-attachments/assets/a3e1233e-08d3-405d-bcd0-e91c526c7bc9) ![bonus-5ice-old](https://github.com/user-attachments/assets/b28fe5b1-75b8-4aca-aa28-c3c7fbc53234) ![bonus-5air-old](https://github.com/user-attachments/assets/21c77960-15c4-4c4b-862b-0d8e0300b459) ![bonus-5earth-old](https://github.com/user-attachments/assets/40a6f265-3494-417b-8d8c-91bb97dde136) ![stable 1up block](https://github.com/Eauix/Super-Tux-Additions/blob/main/Snow-Covering-Tileset/images/tiles/_custom/extra_bonus_by_eauix/bonus-stable_1up.png) ![stable star block](https://github.com/Eauix/Super-Tux-Additions/blob/main/Snow-Covering-Tileset/images/tiles/_custom/extra_bonus_by_eauix/bonus-stable_star.png)
<br> <sup>- For them to work properly, you must import the "bonus_util.nut" into the sector init script.</sup>

## Known issues:

* 2 of the high snow tile variants aren't accessible via the auxiliary tiles, but you probably won't need them at all.

* Sometimes the game might crash if you do a Ctrl+Z after building with the custom autotiles. Be aware of this.

* When you open the editor, there's a small lag spike as the console shows thousands of warning messages regarding autotile masks that correspond to multiple tiles, but to counter any problems it could cause, I adjusted the priority of each autotile based on how strict its condition is.

* Some sound effects coming from custom powerups are really loud. This is an issue with the "play_sound()" function, which can't adjust the sound volume or pitch, nor modulate it based on the game audio settings.

* When you hit the 5-coins silver block for the first time after opening the game, the game will freeze for a few miliseconds, as it will take some time to load the effect sprite.

## Credits:

* Alzter

  - for creating the images used in the Waterfall tiles. <br> ![waterfall tiles](https://github.com/Eauix/Super-Tux-Additions/blob/main/Snow-Covering-Tileset/images/tiles/_custom/better_waterfall_by_alzter_and_eauix/awf1.png)


