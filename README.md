# About
This tool builds a test dataset to verify DLC loading functionality

# Setup
1. Run ./build.sh
2. copy the contents of the pspemu folder to the root of the PSP memory card or to the pspemu folder on vita

Test Case #1: Rockband Unplugged
1. boot game
2. navigate to Quickplay mode
3. verify both "alive" and "3's and 7's" appear in the track list
4. test both tracks to verify the play

Test Case #2: LittleBigPlanet
1. boot the game
2. Continue through the data/patch install process
3. Start the intro level
4. press square to open the menu
5. select customize character, press right to navigate to the head panel
6. Under 'head' verify that both the bunny hat and the santa's helper hat are available
7. complete the intro level and return to the world map
8. At the world map, navigate to purchase levels
9. verify the turbo level is available (0% complete)

Notes:
- Subsequent launches will go faster because the patch is installed and the mandatory intro level has been completed.
- Pressing circle skips the intro video
- You can also check the DLC by launching the Turbo level.


Test Case #3: Buzz! Quiz World
1. launch game
2. create profile if required
3. on the main menu, select quiz packs
4. verify both the rock idols quiz and videogames packs are listed

Notes:
- there is no UMD version of this title
- You can play test the quiz packs by selecting Quiz packs from the single player game menu

Test Case #4: Patapon
1. launch game
2. Play through the intro level until you get to the cavernous hideout
3. Use the master obelisk to access the world map
4. You should get "Download quest world map found" when accessing the obelisk
5. Continue to "Download Quest" on the world map
6. To the right, verify you have "Field of Angry Giants" 
7. further to the right, verify you have "Snow Field of Sullied Tears"

Notes:
- This title take a long time to test until you create your first save.

Test Case 5: TG16 titles
1. launch each title individually and make sure they go in game.  

Note:
- These games use DLC mechanics to load their roms.  So if DLC loading fails they will hang at the loading screen.

