#!/bin/bash
# Use this script as a LinuxGSM Master middleware.
# Remember to create ~/.linuxgmm_mw_arma3server_mods file. Read the README.md.

COMMAND="${1}"
USERNAME=""
PASSWORD=""
COLLECTION_ID=""
PATH_TO_SWCD=""
i=0
if [ $COMMAND != "start" ] && [ $COMMAND != "update" ]
then exit 0
fi
cat .linuxgmm_mw_arma3server_mods | { while read line
  do
    if [ $i == "0" ]
    then USERNAME=$line
    fi
    if [ $i == "00" ]
    then PASSWORD=$line
    fi
    if [ $i == "000" ]
    then COLLECTION_ID=$line
    fi
    if [ $i == "0000" ]
    then PATH_TO_SWCD=$line
    fi
    i="${i}0"
  done
  echo "Instructed to update mods.";
  ${PATH_TO_SWCD} ${COLLECTION_ID} ${USERNAME} ${PASSWORD} "107410"
}
exit 0;