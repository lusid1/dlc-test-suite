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

