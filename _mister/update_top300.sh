#!/bin/bash
set -e

github_repo="flynnsbit/Top300_updates"
disk_image="IDE 0-1 Top 300 DOS Games.vhd"
mount_dir=./dos_games

# Arg $1: GitHub repo name, e.g. "username/repo"
get_latest_release()
{
    local api_url="https://api.github.com/repos/${1}/releases/latest"
    local download_url

    read -r tag_name download_url < <(echo $(curl -s "${api_url}" | jq -r ".tag_name, .assets[0].browser_download_url"))
    echo Downloading "${tag_name}"...
    curl -L "${download_url}" -o update.zip
}

# Arg $1: Path to image
# Arg $2: Partition number 
# Arg $3: Mount point
mount_image()
{
    # Get next free loop device
    loop_dev=$(losetup -f)

    # Associate next free loop device with image
    losetup -f "${1}"

    # Mount the partition
    mount "${loop_dev}p${2}" "${3}"
}

# Arg $1: Mount point
unmount_image()
{
    # Unmount partition
    umount "${1}"
    
    # Disassociate loop device
    losetup -d "${loop_dev}"
}

# Download latest release zip
get_latest_release "${github_repo}"

# Just mount partition 2 in the disk image
mkdir "${mount_dir}"
mount_image "${disk_image}" 2 "${mount_dir}"

# Extract update, overwriting existing files
unzip -u -o -d "${mount_dir}/games" update.zip

# Clean up
rm update.zip
unmount_image "${mount_dir}"
rmdir "${mount_dir}"

echo "Successfully updated to ${tag_name}!"
