# First delete net persistent rules

rm /etc/udev/rules.d/70-persistent-net.rules


# clone the existing VM (with out snapshots)
# go to VirtualBoxVms directory

vboxmanage clonevm <Name of VM> --name <New Name> --register


VBoxManage startvm Clone -type headless


VBoxManage guestproperty get Clone "/VirtualBox/GuestInfo/Net/0/V4/IP" | awk '{split($0,a," "); print a[2]}'
