# Log for changes

### Kernel Parameters:

`/etc/default/grub`:
```
GRUB_CMDLINE_LINUX_DEFAULT='nowatchdog nvme_load=YES zswap.enabled=0 splash loglevel=3 acpi_osi=! idle=nomwait acpi_backlight=native amdgpu.dcdebugmask=0x10'
```

Apply changes:
```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

### Network:

`/etc/NetworkManager/conf.d/wifi-powersave.conf`:
```
[connection]
wifi.powersave = 2
```
`/etc/modprobe.d/iwlwifi.conf`:
```
options iwlwifi power_save=0 11n_disable=8
```

Apply changes:
```
sudo mkinitcpio -P
sudo reboot
```

### Battery Threshold:

`/etc/udev/rules.d/asus-battery-charge-threshold.rules`:
```
ACTION=="add", KERNEL=="asus-nb-wmi", RUN+="/bin/bash -c 'echo 60 > /sys/class/power_supply/BAT?/charge_control_end_threshold'"
```
