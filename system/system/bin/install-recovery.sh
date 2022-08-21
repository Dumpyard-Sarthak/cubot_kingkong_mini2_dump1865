#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:50ab84f8018e1f37bc0a2ed06e81ee91e7742585; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:a40f075895a8e49b5cf172cab38db058afd809b5 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:50ab84f8018e1f37bc0a2ed06e81ee91e7742585 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
