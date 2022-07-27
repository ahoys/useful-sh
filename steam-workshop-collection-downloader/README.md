# Steam Workshop Collection Downloader

Used with LinuxGSM to automatically download all mods in a Steam Workshop collection.

### Requirements
- SteamCMD must be installed (included in LinuxGSM installation).

## Usage

1. Place in the LinuxGSM user root. I.e. /home/arma3server
2. Add privileges `chmod +x swcd.sh`
3. Run with `./swcd.sh <WS_COLLECTION_ID> <STEAM_USER> <STEAM_PASSWORD> <GAME_ID> <MANUAL_MODS_FILE>`

- **WS_COLLECTION_ID** Id of the Steam Workshop collection.
- **STEAM_USER**: Some servers require you to input Steam-credentials. This is the Steam-username. In some cases anonymous is a valid value.
- **STEAM_PASSWORD**: Steam-password, if required.
- **GAME_ID**: Id of the Steam game binaries. Note, not the server but the game itself. Steam Workshop collections are made against the game client, not server builds.
- **MANUAL_MODS_FILE (optional)**: If you want to input the mod ids manually, it's possible. Create this file and add one mod id/line.

### MANUAL_MODS_FILE example
*/home/arma3server/mymods*
```
123456
532344
346347
456356
```

## Possible issues & solutions

- SteamCMD requiring 2FA. If your steamcmd instance won't install anything, make sure you don't have a 2FA verification pending in your email.