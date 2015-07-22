# steam-server-cookbooks

Chef Cookbooks for provisioning Steam dedicated servers on Amazon AWS OpsWorks

## Provisioning Servers

Use Amazon AWS OpsWorks to provision servers. See [doc/ops_works.md](./doc/ops_works.md) for instructions.

## Notes

- SteamCMD Documentation: https://developer.valvesoftware.com/wiki/SteamCMD
- CSGO Server Docs: https://developer.valvesoftware.com/wiki/Counter-Strike:_Global_Offensive_Dedicated_Servers
- Chef Cookbook for SteamCMD: https://github.com/odcinek/steamcmd
- CSGO Server Launcher for Ubuntu: https://github.com/crazy-max/csgo-server-launcher/blob/master/csgo-server-launcher.sh
- RedHat Init Script Docs: https://fedoraproject.org/wiki/Packaging:SysVInitScript
- Best Practices for Linux Services: http://stackoverflow.com/questions/394984/best-practice-to-run-linux-service-as-a-different-user
- IPTables Rules: http://ksloan.net/how-to-set-up-your-own-csgo-dedicated-server-in-less-than-5-minutes-linux/

## systemd

- https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/System_Administrators_Guide/part-Basic_System_Configuration.html
- https://wiki.archlinux.org/index.php/Systemd/User
- http://forums.srcds.com/viewtopic/22385

## Sysvinit

- http://forums.srcds.com/viewtopic/5835