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

# Do you want to create a backup USB. Note: All the contents of this USB will be trashed. (y/n):
  # Please plug in this backup USB. What is the file path to this backup USB:
  # gio trash contents of backup usb
  # cp contents of ~/Backup into backup usb
# Do you want to create another backup USB. Note: All the contents fo this USB will be trashed: (y/n):


while [[ true ]]; do
  first_backup_usb=1

  if [[ $first_backup_usb == 0 ]]; then
    prompt_suffix="nother"
  else
    prompt_suffix=""
  fi

  read -p "Do you want to create a${prompt_suffix} backup USB?
    Note: All the contents of this USB will be trashed.
    (y/n): " wants_backup_usb

  case $wants_backup_usb in
    [Yy])
      first_backup_usb=0;;
      # more code
    [Nn])
      break;;
    *)
      echo "Please use (y/n)."
      continue;;
  esac

done

