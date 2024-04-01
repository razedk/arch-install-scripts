# arch-install-scripts
Arch Install Scripts

####################################################################################################################
# Suspend wifi                                                                                                     #
# ------------                                                                                                     #
# On the Beelink the wifi driver hangs after system is suspended and started up again.                             #
# To fix this issue the drivers must be unloaded before suspend and reloaded when resuming                         #
####################################################################################################################
01) Copy the suspend-wifi.sh script to /usr/lib/system/system-sleep
02) Make sure the script has executable rights (chmod +x suspend-wifi.sh)
