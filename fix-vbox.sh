# A fix for a common issue found in virtual box
# https://forums.linuxmint.com/viewtopic.php?t=247850
# https://askubuntu.com/questions/1014172/virtualbox-unresponsive-area-on-desktop
#################################################################################
ps aux www |grep 'VBoxClient --draganddrop' | awk '{print $2}' | xargs kill
