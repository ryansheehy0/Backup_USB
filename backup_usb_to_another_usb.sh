first_backup_usb=1

while [[ true ]]; do
  if [[ $first_backup_usb == 0 ]]; then
    prompt_suffix="nother"
  else
    prompt_suffix=""
  fi

  read -p "Do you want to create a${prompt_suffix} backup USB?
    Note: All the contents of this USB will be trashed.
    (y/n): " wants_backup_usb

  case "$wants_backup_usb" in
    [Yy])
      first_backup_usb=0

      read -ep "Please plug in this backup USB.
      What is the file path to this backup USB: " backup_usb
      if [ ! -d "$backup_usb" ]; then
          echo "Error: The provided path is not a directory."
          continue
      fi

      gio trash "$backup_usb"/* &&

      cp -r ~/Backup/* "$backup_usb"/ &&

      echo ""
      echo "Backup completed successfully to ${backup_usb}";;
      echo ""
    [Nn])
      break;;
    *)
      echo ""
      echo "Please use (y/n)."
      echo ""
      continue;;
  esac

done

