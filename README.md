# Ratchet & Clank 1 Randomizer

## [Download](https://github.com/bordplate/rac1-randomizer/releases/tag/v1)

## Supported platforms
The randomizer is currently only supported on PS3 with digital PAL copy of Ratchet & Clank 1. There are no plans to support emulator or NTSC at this point. 

## EmoTracker item tracker
Item tracker for EmoTracker is available, courtesy of Myth197 and DukeDragon28.  
[github.com/Myth197/RAC-Rando-Tracker](https://github.com/Myth197/RAC-Rando-Tracker)

## Installation
A homebrew enabled PS3 with WebMAN is required. Then use [RaCMAN](https://github.com/MichaelRelaxen/racman).  

When you have RacMAN working, attach it to the game, go to "Patches loader..." in the top-left menu, then choose "Add ZIP..." and find the randomizer.zip download. Then just enable it in the mod menu.

## Set seed
To make a set seed, make a text file named `seed.txt` in RaCMAN's root folder (the upper folder where `racman.exe` is). The text file can contain any type of text. Newlines count as a character, meaning `oiejfoiwjef` and `oiejfoiwjef` with a new line at the end are different seeds. 

## What does it do?
- Infobots and items/gadgets are randomized.
	- You always get infobots where you get infobots, and always items/gadgets where you get those. So there are two randomized pools. 
	- Weapons are not randomized
- Randomizer makes sure to generate solvable paths
- Bolt denominations are increased to avoid excessive bolt grinding
  - 1 bolt -> 5 bolts
  - 5 bolt -> 21 bolts
  - 20 bolt -> 60 bolts
  - 50 bolt -> 200 bolts
