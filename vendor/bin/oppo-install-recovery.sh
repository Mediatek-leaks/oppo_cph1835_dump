#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:4f2bdc9e732c6ff1f664e91a3aeaec6d12b95f27; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/spmfw:49008:6071dbb2bf10dcfc3ccb11f3bd673c765c5c445c \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:4f2bdc9e732c6ff1f664e91a3aeaec6d12b95f27 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
