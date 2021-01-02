#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:34645292:08218f9c105d5e712eb9abaf74b6540e4c6a2142; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:22340904:190891ed28b61d5c92de550ee0c4522cf5b238d0 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:34645292:08218f9c105d5e712eb9abaf74b6540e4c6a2142 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
