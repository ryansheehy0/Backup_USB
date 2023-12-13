# Backup USB
A bash script which backs up a USBs into a folder called Backup in home(~/) and allows you to backup into other USBs.

## Commands
- If more than 1 usb plugged in then ask user to select which usb.
- If there is already a Backup folder in home then add number to end of it
  - Create a folder called Backup in home
- Copy all the contents of the selected USB into the backup folder


numberOfBackups=$(find ~ -maxdepth 1 -type d -name Backup* | wc -l)

if [[ ${numberOfBackups} == 0 ]]; then
  dirName="Backup"
else
  dirName="Backup${numberOfBackups}"
fi

mkdir ~/$dirName