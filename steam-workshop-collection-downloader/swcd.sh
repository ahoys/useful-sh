#!/bin/bash
# Do not edit manually. Instead, use startup arguments.
# See the possibilities below.

# Startup arguments
WS_COLLECTION_ID="${1}" # Steam Workshop collection id.
STEAM_USER="${2}" # Steam username.
STEAM_PASSWORD="${3}" # Steam password.
GAME_ID="${4}" # Game's id (not server build but game, the mods are for the game).
MANUAL_MODS_FILE="${5}" # Instead of a collection, input the mod-ids manually. One line, one id.
DIR_MODS=~/serverfiles/mods
TEMP_COLLECTION=~/.swcdtemp_collection
TEMP_IDS=~/.swcdtemp_ids
# Clear previous temp-files.
test -e "${TEMP_COLLECTION}" && rm -rf "${TEMP_COLLECTION}"
test -e "${TEMP_IDS}" && rm -rf "${TEMP_IDS}"
# Fetch mod ids.
test -e "${MANUAL_MODS_FILE}" || curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "collectioncount=1&publishedfileids[0]=${WS_COLLECTION_ID}" -d @req.json https://api.steampowered.com/ISteamRemoteStorage/GetCollectionDetails/v1/ >> "${TEMP_COLLECTION}"
test -e "${MANUAL_MODS_FILE}" || echo "$(grep -Po '(?<=").[0-9]+(?=")' ${TEMP_COLLECTION})" >> "${TEMP_IDS}"
# Install mods from Steam Workshop
sourceFile="${TEMP_IDS}"
test -e "${MANUAL_MODS_FILE}" && sourceFile="${MANUAL_MODS_FILE}"
modline=""
skip=1
test -e "${MANUAL_MODS_FILE}" && skip=0
cat "${sourceFile}" | { while read modid
  do
    if [ $skip == 0 ]
    then
      newline=" +workshop_download_item ${GAME_ID} ${modid} validate"
      modline="${modline}${newline}"
    else
      skip=0
    fi
  done
  steamcmd +force_install_dir ${DIR_MODS} +login ${STEAM_USER} ${STEAM_PASSWORD}${modline} +quit
}
