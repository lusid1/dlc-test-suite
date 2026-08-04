# About
This tools builds a test dataset for verify DLC loading functionality

# Setup
1. Run ./build.sh
2. copy the contents of the pspemu folder to the root of the PSP memory card or to the pspemu folder on vita

Test Matrix:
| Base game format | DLC Format |
| ---------------- | ---------- |
| UMD              | Encrypted  |
| UMD              | Decrypted  |
| ISO              | Encrypted  |
| ISO              | Decrypted  |
| EBOOT            | Encrypted  |
| EBOOT            | Decrypted  |

Test Case #1: Rockband Unplugged
1. boot game ISO
2. navigate to Quickplay mode
3. verify both "alive" and "3's and 7's" appear in the track list
4. test both tracks to verify the play
5. repeat for eboot, and if available, UMD

Test Case #2: LittleBigPlanet
1. boot the game ISO
2. Continue through the data/patch install process
3. Start the intro level
4. press square to open the menu
5. select customize character, press right to navigate to the head panel
6. Under 'head' verify that both the bunny hat and the santa's helper hat are available
7. complete the intro level and return to the world map
8. At the world map, navigate to purchase levels
9. verify the turbo level is available (0% complete)
10. repeat for eboot, and UMD
