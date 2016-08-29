**Now you can use the knives from Counter-Strike: Global Offensive as weapons in Garry's Mod!**

## Features:
- *12 different knives;*
- *New sounds;*
- *Viewmodel arms (c_arms) compatible;*
- *Press Reload button ('R' button) to inspect knife;*
- *Backstabs do more damage!*

## How to install:

#### From workshop
This is the easiest way to install it and it's recommended for clients.

1. Go to [workshop page](https://steamcommunity.com/sharedfiles/filedetails/?id=506283460)
2. Click green Subscribe button or add it into your server collection.

This will be enabled next time you launch game or server.

#### Manually
This is recommended for servers' owners and those who want to test it before next release.

- Download and unpack the [latest release](https://github.com/xDShot/csgo_knives_sweps/releases/latest) into `GarrysMod/garrysmod/addons` folder.

or

- Clone this repo `git clone https://github.com/xDShot/csgo_knives_sweps/`

## Server ConVars:
Type these in console or in server config:

| Variable name | Default value | Description |
| --- | --- | --- |
| **Bool variables** |||
| csgo_knives_backstabs | 1 | Allow backstabs |
| csgo_knives_force_ttt | 0 | Forces knives to enable TTT mode. For debug purposes. Normally you shouldn't enable it unless you haven't any trouble getting it work in ttt |
| csgo_knives_inspecting | 1 | Allow inspecting |
| csgo_knives_oldsounds | 0 | Play old sounds when swinging knife or hitting wall |
| csgo_knives_primary | 1 | Allow primary attacks |
| csgo_knives_secondary | 1 | Allow secondary attacks |
| **Numerical variables** |||
| csgo_knives_dmg_prim_back | 90 | How much damage deal when hit with primary attack from behind |
| csgo_knives_dmg_prim_front1 | 40 | How much damage deal when hit with primary attack in front or from side (value randomly being picked between *\_front1* and *\_front2*) |
| csgo_knives_dmg_prim_front2 | 25 | How much damage deal when hit with primary attack in front or from side (value randomly being picked between *\_front1* and *\_front2*) |
| csgo_knives_dmg_sec_back | 180 | How much damage deal when hit with secondary attack from behind |
| csgo_knives_dmg_sec_front | 65 | How much damage deal when hit with secondary attack in front or from side |

## Contributing:

#### Pull Requests
Pull Requests are welcome. Although there are no strong restrictions in coding style, please make it so it won't be really hard to understand and it won't take any other dependencies. If you make changes into knives, it's better to add them into template and use script to quickly generate code.

1. Sign up to your Github account
2. Fork this repo
3. Commit your changes
4. Create pull requests

#### Issues
Report bugs or suggest new features. Make sure there are no already issue you want to create. When you create it, make it descriptive. Non-descriptive issues like 'it doesn't work plz fix' will be probably ignored and closed.

1. Sign up to your Github account
2. Move into issues tab
3. Create new issue

## License:
Lua and tools code are licensed under the MIT license.

Models, sounds and textures are belong to Valve Corporation and other respective creators. The license is currently unknown.

#### If you like this addon, please don't forget to vote up on workshop page and star this repo!
Enjoy! :)
