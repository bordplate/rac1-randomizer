# Ratchet & Clank 1 Randomizer

## [Download](https://github.com/bordplate/rac1-randomizer/releases/download/v1.2/randomizer.zip)

## [Discord community](https://discord.gg/EuQKGes33C)

## Supported platforms
The randomizer is currently only supported on PS3 with digital PAL copy of Ratchet & Clank 1. There are no plans to support emulator or NTSC at this point. 

## EmoTracker item tracker
Item tracker for EmoTracker is available, courtesy of Myth197 and DukeDragon28.  
[github.com/Myth197/RAC-Rando-Tracker](https://github.com/Myth197/RAC-Rando-Tracker)

## Installation
A homebrew enabled PS3 with WebMAN is required. Then use [RaCMAN](https://github.com/MichaelRelaxen/racman).  

When you have RacMAN working, attach it to the game, go to "Patches loader..." in the top-left menu, then choose "Add ZIP..." and find the randomizer.zip download. Then just enable it in the mod menu.  

You can enable the mod at any time and then start a new game, or start a new game and then enable the mod, both work just fine. If you collect any items with the mod on and you want to restart, you should disable the mod and enable it again. 

## Disabling the randomizer
To fully disable the randomizer you need to quit the game and start it up again. The mod doesn't fully clean up after itself when it's being unloaded yet. 

## Set seed
To make a set seed, make a text file named `seed.txt` in RaCMAN's root folder (the upper folder where `racman.exe` is). The text file can contain any type of text. Newlines count as a character, meaning `oiejfoiwjef` and `oiejfoiwjef` with a new line at the end are different seeds.  

Add `# graph: false` to the top of the `seed.txt` file to disable debug graph generation. By design, this changes the seed so a seed file with and without `# graph: false` are different, regardless of wether anything else in the file is the same. 

## What does it do?
- Infobots and weapons/items/gadgets are randomized.
	- You always get infobots where you get infobots, and always weapons/items/gadgets where you get those. So there are two randomized pools. 
- Randomizer makes sure to generate solvable paths
- Bolt denominations are increased to avoid excessive bolt grinding
  - 1 bolt -> 5 bolts
  - 5 bolt -> 21 bolts
  - 20 bolt -> 60 bolts
  - 50 bolt -> 200 bolts
