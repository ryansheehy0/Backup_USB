#!/bin/bash

read -ep "File path to the USB you want to backup: " usb_path
if [ ! -d "$usb_path" ]; then
    echo "Error: The provided path is not a directory."
    exit 1
fi

if [[ -d "~/Backup" ]]; then
  gio trash ~/Backup/
fi

mkdir ~/Backup &&

cp -r "${usb_path}"/* ~/Backup/ &&

echo "Backup completed successfully to ~/Backup"

# Do you want to create a backup USB. Note: All the contents of this USB will be deleted. (y/n)
  # Please plug in this backup USB. What is the file path to this backup USB:
  # 
