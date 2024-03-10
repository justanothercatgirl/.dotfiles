#/bin/sh

set -e 

if [ $UID -ne 0 ]; then
	echo script must be run as root
	exit 1
fi

if [ $# -lt 2 ]; then
	CFG_PATH=/boot/efi/archlinux/x86_64-efi/grub/grub.cfg
else
	CFG_PATH="$1"
fi

echo -e '\x1b[91;1m WRITING CONFIG TO \x1b[96m'${CFG_PATH}'\x1b[91m!\x1b[0m'

if ! [ -f "${CFG_PATH}" ]; then
	echo "invalid path"
	exit 1
fi

echo substituting
sed -i 's/root=ZFS=/zfs=zfsroot/g' "${CFG_PATH}"
echo done
