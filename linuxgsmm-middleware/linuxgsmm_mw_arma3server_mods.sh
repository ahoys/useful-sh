#!/bin/bash
# Use this script as a LinuxGSM Master middleware.
# Remember to create ~/.linuxgsmm_mw_arma3server_mods file. Read the README.md.
shopt -s globstar
COMMAND="${1}"
USERNAME=""
PASSWORD=""
COLLECTION_ID=""
PATH_TO_SWCD=""
PATH_TO_CFG=""
STATIC_MODS=""
i=0
if [ $COMMAND != "start" ] && [ $COMMAND != "update" ]
then exit 0
fi
cat .linuxgsmm_mw_arma3server_mods | { while read line
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
    if [ $i == "00000" ]
    then PATH_TO_CFG=$line
    fi
    if [ $i == "000000" ]
    then STATIC_MODS=$line
    fi
    i="${i}0"
  done
  echo "Instructed to update mods.";
  # Download/verify the mods.
  ${PATH_TO_SWCD} ${COLLECTION_ID} ${USERNAME} ${PASSWORD} "107410"
  # Move the keys.
  mv ~/serverfiles/mods/**/*.bikey ~/serverfiles/keys
  # Update the linuxgsmm-config.
  mods=""
  skip=1
  test -e ~/.swcdtemp_ids || echo "You need to execute swcd.sh first."
  cat ~/.swcdtemp_ids | { while read line
    do
      if [ $skip == 0 ]
      then
        mods="${mods}mods/steamapps/workshop/content/107410/${line};"
      else
        skip=0
      fi
    done
    rm -rf "${PATH_TO_CFG}_temp"
    grep -v '^mods=' ${PATH_TO_CFG} >> "${PATH_TO_CFG}_temp"
    echo "mods=\"${STATIC_MODS}${mods}\"" >> "${PATH_TO_CFG}_temp"
    mv "${PATH_TO_CFG}_temp" ${PATH_TO_CFG}
    rm -rf "${PATH_TO_CFG}_temp"
  }
}
exit 0;