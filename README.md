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

Clone this repo or download and unpack the latest release into *\_Steam Location\_/steamapps/common/GarrysMod/garrysmod/addons* folder. Yo will need to copy resources as well. Currently the only way to obtain them is to download addon from [workshop page](https://steamcommunity.com/sharedfiles/filedetails/?id=506283460) and extract it using gmad.

## Server ConVars:
Type these in console or in server config:
- **csgo_knives_oldsounds** - Default is 0 - Play old sounds when swinging knife or hitting wall
- **csgo_knives_backstabs** - Default is 1 - Allow backstabs
- **csgo_knives_primary** - Default is 1 - Allow primary attacks
- **csgo_knives_secondary** - Default is 1 - Allow secondary attacks
- **csgo_knives_inspecting** - Default is 1 - Allow inspecting

- **csgo_knives_dmg_sec_back** - Default is 180 - How much damage deal when hit with secondary attack from behind
- **csgo_knives_dmg_sec_front** - Default is 65 - How much damage deal when hit with secondary attack in front or from side
- **csgo_knives_dmg_prim_back** - Default is 90 - How much damage deal when hit with primary attack from behind
- **csgo_knives_dmg_prim_front1** - Default is 40 - How much damage deal when hit with primary attack in front or from side (value randomly being picked between *\_front1* and *\_front2*)
- **csgo_knives_dmg_prim_front2** - Default is 25 - How much damage deal when hit with primary attack in front or from side (value randomly being picked between *\_front1* and *\_front2*)

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