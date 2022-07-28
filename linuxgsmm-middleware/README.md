# LinuxGSM Master middleware scripts

Various scripts for extending linuxgsmm.

## linuxgsmm_mw_arma3server_mods..sh

Installs or updates the server mods dictated by a Steam Workshop collection. Automatically appends your configs with the mods and moves the .bikey -keys.

### How to setup

- LinuxGSM Master installed at ~/linuxgsmm/linuxgsmm.js
- Steam-workshop-collection-downloader installed at ~/linuxgsmm
- This script at ~/linuxgsmm
- Settings file ~/linuxgsmm/.linuxgsmm_mw_arma3server_mods. created, see the template below.
- Linuxgsmm needs to be build with a middleware parameter that points to linuxgsmm_mw_arma3server_mods..sh. I.e. `PATH_TO_MIDDLEWARE=/home/arma3server/linuxgsmm/linuxgsmm_mw_arma3server_mods.sh`
- Give execution permissions: `chmod +x ~/linuxgsmm/linuxgsmm_mw_arma3server_mods.sh`

*.linuxgsmm_mw_arma3server_mods*
```
Steam username
Steam password # Note that some passwords require escaping special letters, for example to escape ! you add \!
Collection id
Full path to swcd.sh (steam-workshop-collection-downloader)
Full path to arma3server.cfg (your server configuration .cfg, usually ~/lgsm/config-lgsm/arma3server/arma3server.cfg)
Static mods, if any, ending with ";". I.e. ws;gm;vn;
```

**The correct order of the items is crucial.**

### About using the script

Now when linuxgsmm is asked to update or start the server, the middleware to update the mods is executed.