#!/bin/bash

# A script to fix the Fedora "Kernel panic: VFS unable to mount root fs" error
# Requires running as root from a Fedora Live USB environment.

# Exit immediately if a command exits with a non-zero status.
set -e

# --- 1. SCRIPT SETUP AND PARTITION DETECTION ---

echo "Starting Fedora boot repair script..."
echo "-------------------------------------"

# Find the Btrfs root partition with the 'fedora' label
ROOT_PARTITION=$(lsblk -o NAME,FSTYPE,LABEL | grep 'btrfs.*fedora' | awk '{print "/dev/"$1}')

# Find the Ext4 boot partition
BOOT_PARTITION=$(lsblk -o NAME,FSTYPE | grep 'ext4' | head -n 1 | awk '{print "/dev/"$1}')

if [ -z "$ROOT_PARTITION" ] || [ -z "$BOOT_PARTITION" ]; then
    echo "Error: Could not automatically detect root or boot partitions."
    echo "Please run 'lsblk -f' to find them manually and edit this script."
    exit 1
fi

echo "Detected Partitions:"
echo "Root Partition: $ROOT_PARTITION"
echo "Boot Partition: $BOOT_PARTITION"
read -p "Do these look correct? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborting. Please check the partitions and try again."
    exit 1
fi

# --- 2. MOUNTING THE PARTITIONS AND BIND-MOUNTS ---

echo "Mounting partitions..."

# Unmount any previous attempts
umount -R /mnt 2>/dev/null || true

# Mount the Btrfs root subvolume
mount -o subvol=root "$ROOT_PARTITION" /mnt

# Mount the separate boot partition
mkdir -p /mnt/boot
mount "$BOOT_PARTITION" /mnt/boot

# Perform bind mounts for chroot environment
mount --bind /dev /mnt/dev
mount --bind /sys /mnt/sys
mount --bind /proc /mnt/proc

echo "Partitions mounted successfully."

# --- 3. REBUILDING INITRAMFS AND GRUB ---

echo "Entering chroot to rebuild initramfs and GRUB..."

# Find the latest installed kernel version inside the mounted system
KERNEL_VERSION=$(ls /mnt/lib/modules | sort -V | tail -n 1)

if [ -z "$KERNEL_VERSION" ]; then
    echo "Error: Could not find a valid kernel version inside the mounted system."
    exit 1
fi

echo "Using kernel version: $KERNEL_VERSION"

# Chroot and execute commands
chroot /mnt /bin/bash <<EOF
echo "Rebuilding initramfs..."
dracut -f --kver $KERNEL_VERSION

echo "Updating GRUB configuration..."
grub2-mkconfig -o /boot/grub2/grub.cfg

echo "Fedora boot repair complete."
EOF

# --- 4. CLEAN UP AND REBOOT ---

echo "Exiting chroot and unmounting partitions..."
umount -R /mnt
echo "All done. Please reboot your system."
echo "If the problem persists, please check your /etc/fstab file."