# Relight Mod

Offical Releases

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/changemymindpls/TTDS-Relighting)](https://github.com/changemymindpls/TTDS-Relighting/releases)

### [NEXUS MODS - DOWNLOAD RELIGHT V0.2](https://www.nexusmods.com/thewalkingdeadthetelltaledefinitiveseries/mods/1)
### [GITHUB - DOWNLOAD RELIGHT V0.2](https://github.com/changemymindpls/TTDS-Relighting/releases)

***If you want to try out the in development version of relight V0.2 then [click here](#building-the-mod-developers). Beware that since it's in development you will be required to build the mod yourself.***

## Table Of Contents
- **[About](#about)**
- **[Screenshots (205 Power Station)](#screenshots-205-power-station)**
- **[Screenshots (102 Meat Locker)](#screenshots-102-meat-locker)**
- **[Screenshots (TLSE | Telltale Lua Script Extensions | Editor Mode)](#screenshots-tlse--telltale-lua-script-extensions--editor-mode)**
- **[Installation](#installation)**
- **[Mod Compatibility](#mod-compatibility)**
- **[Mod Incompatibility](#mod-incompatibility)**
- **[Building The Mod (Developers)](#building-the-mod-developers)**
- **[Making Your Own Level Relight (Developers)](#making-your-own-level-relight-developers)**
- **[Reporting Issues/Bugs/Problems](#reporting-issues)**
- **[Tools Used For Relight Mod](#tools-used-for-relight-mod)**

## About

This is the Relight Mod for the Walking Dead Telltale Definitive Edition. This is an ambitious mod that sets out to "Relight" and improve graphic fidelity and lighting of the many scenes that are in the game using native engine features and new effects. Many of these level relights are designed to be very configurable from the get-go so you as the user still have full control over what you want! Relight also exposes certain game settings that can be modified at will.

In addition also this mod ships with development/tools features like freecamera, and a level editor! If you are a developer or aspiring mod creator you can actually [create your own Level Relight](#making-your-own-level-relight-developers)!

*NOTE: This is still an early version and some scenes are subject to change, and more are to be added as well...*

**This only works for 'The Walking Dead Telltale Definitive Edition PC'**

## Screenshots *(205 Power Station)*
*NOTE: These are screenshots from Relight V0.2 (These are taken with CinematicMode Enabled)*

![205-1](github-content/205-1.png)
![205-2](github-content/205-2.jpg)
![205-3](github-content/205-3.png)
![205-4](github-content/205-4.jpg)
![205-5](github-content/205-5.png)

## Screenshots *(102 Meat Locker)*
*NOTE: These are screenshots from Relight V0.2 (These are taken with CinematicMode Enabled)*

![102-1](github-content/102-1.png)
![102-2](github-content/102-2.png)
![102-3](github-content/102-3.png)
![102-4](github-content/102-4.png)

## Screenshots *(TLSE | Telltale Lua Script Extensions | Editor Mode)*
*NOTE: These are screenshots from Relight V0.2 (With EditorMode Enabled)*

![editor-1](github-content/editor-1.jpg)
![editor-2](github-content/editor-2.jpg)
![editor-3](github-content/editor-3.png)
![editor-4](github-content/editor-4.png)
![editor-5](github-content/editor-5.jpg)

## Installation

### **How to install [Relight v0.1](https://www.nexusmods.com/thewalkingdeadthetelltaledefinitiveseries/mods/1)**

1. Download the .zip file
2. Extract all of the contents of the .zip file into your game's **Archives directory** *(i.e. drag all of the .ttarch2, .lua, .json, and all of those files into the Archives folder of the game).
3. Boot up the game, and play any of the levels that v0.1 modifies and enjoy!

NOTE: V0.1 unfortunately creates some bugs/issues with the game where in a couple of scenes you are unable to progress, so beware.

### **How to install Relight v0.2**

1. Download the zip
2. Extract the contents of the "MOVE_CONTENTS_TO_ARCHIVE_FOLDER" folder to the game Archives directory.
3. Extract the contents of the "MOVE_CONTENTS_TO_GAME_FOLDER" folder *(The RelightLevels folder specifically)* to the main game directory.
4. Boot the game and have fun!

## Mod Compatibility

**This only works for 'The Walking Dead Telltale Definitive Edition PC'**

- ***COMPATIBLE*** with [Load Any Level](https://www.nexusmods.com/thewalkingdeadthetelltaledefinitiveseries/mods/7)
- ***COMPATIBLE*** with any Texture/Model Swap/Sound mods *(provided if none of them modify any of the game level scripts)*

## Mod Incompatibility

- ***NOT COMPATIBLE*** with [Menu Rain](https://github.com/changemymindpls/TTDS-MenuRain)
- ***NOT COMPATIBLE*** with [No Outlines](https://www.nexusmods.com/thewalkingdeadthetelltaledefinitiveseries/mods/5)
- ***NOT COMPATIBLE*** with [Ambience](https://www.nexusmods.com/thewalkingdeadthetelltaledefinitiveseries/mods/6?tab=description)

## Building The Mod (Developers)

If you are intrested in trying out the mod even if there isn't an offical release *(i.e. No offical precompiled/prepackaged zip file that you can just extract into the game normally)*, then it's not to difficult to build it yourself.

1. Download and Install the [Telltale Script Editor](https://github.com/Telltale-Modding-Group/Telltale-Script-Editor-Tweaks) from it's [Releases](https://github.com/Telltale-Modding-Group/Telltale-Script-Editor-Tweaks/releases) page.
2. Download/Clone this repository *(The RelightMod Repository)* to your computer.

![github-repo-download](github-content/help/github-repo-download.png)

3. Open **RelightMod.tseproj** from the downloaded/cloned Relight Repository using [Telltale Script Editor](https://github.com/Telltale-Modding-Group/Telltale-Script-Editor-Tweaks).

![script-editor-open-project](github-content/help/script-editor-open-project.png)

![script-editor-open-project-file](github-content/help/script-editor-open-project-file.png)

4. In the script editor, there are 3 buttons on the top toolbar. **Click the grey gear icon to configure project** and apply the following settings.

![script-editor-buttons-2](github-content/help/script-editor-buttons-2.png)

![tlse-editor-project-settings](github-content/help/tlse-editor-project-settings.png)

**NOTE:** Your game executable here won't be in the same location as the screenshot.

5. Once you configured the project settings, close it then **click the green hammer icon to build the project** *(This may take some time)*.

![script-editor-buttons](github-content/help/script-editor-buttons.png)

6. Once the project is finished building, a **Builds** folder will be created in the **File Tree Window** of the script editor. 
If it isn't there then either refresh by right clicking the folder in the application, and click **Refresh**. Or you can right click the folder and click **Open In Explorer** to open the folder in Windows File Explorer. Inside the builds folder there should be a .zip file of the build you just created. 

![script-editor-build-finished](github-content/help/script-editor-build-finished.png)

![script-editor-build-finish-zip](github-content/help/script-editor-build-finish-zip.png)

7. To Install the mod, simply extract the contents of that .zip file into your game's **Archives directory**.
8. ***(TESTING PART 1)*** To make sure you installed the mod correctly, boot into the game and play any scene/level from Season One/Two/Three/Four. Once you do then quickly exit the game and go back to your game directory folder. There should be a new folder created now called **RelightMod** which is where the main configuration files for relight are created and stored.

![game-directory-relight-mod-folder](github-content/help/game-directory-relight-mod-folder.png)

9. After the core of relight is installed, then we need to include the **RelightLevels** folder into the game directory. So in the cloned/downloaded RelightMod folder that you got from github, there is a **RelightLevels** which contains .lua and .ini files for each level. Simply copy this folder *(Copy the entire folder NOT it's contents)* and drop it into the game directory *(NOT into the Archives folder, just the game directory with the .exe)*.

![relight-level-folder-in-repo.png](github-content/help/relight-level-folder-in-repo.png)

*Copy the RelightLevels folder from the downloaded RelightMod repository, and pase it into the game directory here...*

![relight-level-folder-game-directory-select](github-content/help/relight-level-folder-game-directory-select.png)

10. When you boot/load into an actual scene in the game *(i.e. any level from Season One/Two/Three/Four)* Relight will automatically create a **RelightMod** folder where the main configuration files for relight are stored.
11. ***(TESTING PART 2)*** Now if you installed the **RelightLevels** folder correctly, if you boot into the game and play the specific levels that are modified via the .lua scripts in that folder then you should be able to see level with the modified graphics.

## Making Your Own Level Relight (Developers)

**If you are intresting in making you own level relight, the good news is that you don't need to have any lua programming in order to do it!** You don't need to also have the script editor at all. *(There is a small caveat to this but we will get to that later)*

As a pre-requiste if you are intrested in doing this, I HIGHLY recomend that you install [Load Any Level](https://www.nexusmods.com/thewalkingdeadthetelltaledefinitiveseries/mods/7) as this will DRASTICALLY speed up your workflow. This mod has functionality that allows you to configure the game to skip the boot/menu screens and load directly into a level.

***NOTE: For this we are going to assume that you already have relight installed and setup correctly...***

1. Go into the **RelightMod** folder and open the **RelightConfiguration_Development.ini** file.

![game-directory-relight-mod-folder](github-content/help/game-directory-relight-mod-folder.png)

![development-ini-select](github-content/help/development-ini-select.png)

2. Under the **DevelopmentTools** section in that .ini file there is a variable called **EditorMode**.

```
[DevelopmentTools]
EditorMode=false
```

Change the value from **false** to **true**.

```
[DevelopmentTools]
EditorMode=true
```

3. **Save the .ini file** and boot into the level that you want to mess with using the editor *(NOTE: The editor mode is active only whenever you boot into a level from Season One/Two/Three/Four)*.
4. To save any changes you make to a level in editor mode, you have to click a button on the very top left labeled **"Export Scene Changes To Lua"**. This will save your scene changes into a .lua file.

![tlse-editor-export](github-content/help/tlse-editor-export.png)

5. Once you exported your scene changes to a lua file, close out of the game and navigate to your game directory. In your game directory there should now be a new folder called **TLSEDevelopment**. Inside this folder your exported .lua script will be there.

![tlse-development-folder-select](github-content/help/tlse-development-folder-select.png)

![tlse-editor-relight-lua-export-select](github-content/help/tlse-editor-relight-lua-export-select.png)

6. To use your Level Relight preset, simply move the .lua file from **TLSEDevelopment** to the **RelightLevels** folder.

![relight-level-folder-game-directory-select](github-content/help/relight-level-folder-game-directory-select.png)

7. Open the game and boot into that level you just modified and you should be able to play with the changes you made!

**NOTE:** By default relight assumes that name of the file matches what the editor exports originally. If you change the name of the file then relight will not see it. In order to fix this you need to open the **RelightMod** folder in your game directory, open the coresponding .ini file that matches the season that you modified a level from. 

For example if you modified a scene/level from Season 4 then you need to open the **RelightConfiguration_Season4.ini** file. In the file find the name of the level that you modified and change the **RelightSceneLuaFile** to match the new path/name of your .lua file.

![s4-ini-select](github-content/help/s4-ini-select.png)

**EXAMPLE**: Original path

```
[Level_401_TrainStation]
RelightSceneLuaFile=RelightLevels/RELIGHT_401_adv_trainStation.lua
```

Updated path to match the renamed file

```
[Level_401_TrainStation]
RelightSceneLuaFile=RelightLevels/RELIGHT_401_myCoolNewRelight.lua
```

### TLSE Editor Notes/Limitations

It's worth noting that while this editor does share resemblence to some 3D software packages, it is only really designed for a specific purpose. Do not expect alot of the same features that you might be used too. The reasons why are either due to the fact that it would take alot of work to implement a specific feature *(often this is the case)*, or it's a feature that isn't really necessary to help me with relight, or it's not possible at the moment due to API limitations.

Granted that I would agree that some of the features would infact make this more user friendly and better to use but there are alot of scenes in the game that need to be done... so compromises have to be made. You can still do quite a bit with the editor, but please... manage your expectations... With each new relight release there is a very good chance that there will be features/changes/improvements to the editor over time... but for the time being please bear with me...

- You can not undo anything at the moment.
- Changes you made to a scene before is not additive through the editor. *(i.e. you can't go back to the same .lua file you made changes to and add more changes ontop right inside of the editor)*
- Some tools might not be fully implemented
- Some properties might not appear to have any effect on the scene *(despite being implemented in the engine, some of these effects are unfortunately stripped out from the final game)*

**NOTE:** About the *"not being able to have additive changes to a scene"*, you can still actually retain your levels changes by taking the most recent .lua file export, copying some of the lua code into your previous .lua file export and you can retain the additive changes that way. It does require modifying the lua script and adding the new stuff in *(and if you are an experienced lua programmer, then this is no problem)* but for those that are not a lua programmer unfortunately that is a limitation.

### Exported Relight Level Lua Script Notes

The neat part about these lua scripts that get exported by the editor, is the fact that they are just raw uncompiled lua source code. You can write your own logic into these lua scripts to do whatever you want. In my level relights I do this to implement logic like volumetric lighting, depth of field autofocusing, and other effects. Relight core will load in these files and call the native lua commands from the engine to load and compile these lua files for use in the game.

The logic or code you write in the lua scripts are all up to you! You can go as far as you would want because this functionality is exposed to the user thanks to relight. Relight comes with an in-development version of an API extender for the games called ***Telltale Lua Script Extensions (TLSE)***. This contains alot of code *(mostly collected over years of R&D and various modding projects)* that extends the existing Lua API provided by the Telltale Tool engine. The source code for ***TLSE*** is all here in the relight repo, but if your intrested in the native [Telltale lua functions you can check them out here](https://github.com/frostbone25/TelltaleLuaScriptingDocumentation).

In addition also with the lua scripts that are generated, you can actually upload them and share them with others. So for example if you are not a fan of a specific level relight that is shipped natively, you can create your own and upload it publically. So all users need to do is just download that lua file you created, place it in their RelightLevels folder and it will just work!

## Reporting Issues

If there are issues or suggestions with the mod please report them to the [Issues](https://github.com/changemymindpls/TTDS-Relighting/issues) tab of this repository. If you need more help you can always visit the [discord](https://github.com/Telltale-Modding-Group) server.

Also if you are going to report an issue/problem you are having... PLEASE BE AS SPECIFIC AND AS DETAILED AS YOU CAN POSSIBLY BE. The more information you provide the easier it will be to help.

## Tools Used For Relight Mod

### [Telltale Script Editor](https://github.com/Telltale-Modding-Group/Telltale-Script-Editor-Tweaks)

This is the main bread and butter of the mod. This is a lua script editor designed to work with Telltale Games and handles the creation of custom .ttarch2 archives, the compilation of the lua scripts, and the packaging of the script mod in a user friendly form.

### [Load Any Level](https://www.nexusmods.com/thewalkingdeadthetelltaledefinitiveseries/mods/7)

This is an immensley helpful mod that RAPIDLY speeds up development time, allowing you to quickly boot into levels without having to wait or dig through menus *(or spend hours playing through the game)* just to get to a specific scene. Highly recomend this mod!

### [DDS D3DTX Converter](https://github.com/iMrShadow/DDS-D3DTX-Converter)

My original DDS / D3DTX converter, upgraded by iMrShadow to support more games and more complex texture layouts. Very helpful and useful for creating custom texture assets that we can use in the game. Either to serve as visual improvements to the game, or for more utilitarian purposes like creating custom textures that can be utilized by the TLSE editor.
