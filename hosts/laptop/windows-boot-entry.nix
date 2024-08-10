''
     menuentry 'Windows Boot Manager (on /dev/nvme0n1p1)' --class windows --class os $menuentry_id_option 'osprober-efi-BC1E-B7A7' {
      insmod part_gpt
      insmod fat
      search --no-floppy --fs-uuid --set=root BC1E-B7A7
      chainloader /EFI/Microsoft/Boot/bootmgfw.efi
     }
'' 