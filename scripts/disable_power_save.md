```
sudo iw dev wlp3s0 set power_save off
```

Or disable it this way:
```
sudo nano /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf
```

Default value is:
```
[connection]
wifi.powersave = 3
```

Possible values for powersave:
```
NM_SETTING_WIRELESS_POWERSAVE_DEFAULT (0): use the default value
NM_SETTING_WIRELESS_POWERSAVE_IGNORE  (1): don't touch existing setting
NM_SETTING_WIRELESS_POWERSAVE_DISABLE (2): disable powersave
NM_SETTING_WIRELESS_POWERSAVE_ENABLE  (3): enable powersave
```

Then restart the service:
```
sudo systemctl restart NetworkManager
```
