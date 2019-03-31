# Linux Notes

#### Avahi daemon

Notes from [here](https://forum.manjaro.org/t/howto-properly-disable-avahi-systemd-service-as-you-cannot-remove-avahi-package-20180328/43380)

##### Disable services (reboot afterwards)

- sudo ln -sf /dev/null /etc/systemd/system/avahi-daemon.service
- sudo ln -sf /dev/null /etc/systemd/system/avahi-daemon.socket
- sudo ln -sf /dev/null /etc/systemd/system/dbus-org.freedesktop.Avahi.service

##### Remove desktop links

- sudo bash -c "echo 'NoDisplay=true' >> /usr/share/applications/avahi-discover.desktop"
- sudo bash -c "echo 'NoDisplay=true' >> /usr/share/applications/bssh.desktop"
- sudo bash -c "echo 'NoDisplay=true' >> /usr/share/applications/bvnc.desktop"
- sudo update-desktop-database

##### Re-enable services

- sudo rm /etc/systemd/system/avahi-daemon.{service,socket}
- sudo ln -sf /usr/lib/systemd/system/avahi-daemon.service /etc/systemd/system/dbus-org.freedesktop.Avahi.service
