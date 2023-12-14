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

current_dir=$(dirname "$0")
"$current_dir"/backup_usb_to_another_usb.sh