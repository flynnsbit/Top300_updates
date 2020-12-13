#!/bin/bash
set -e

# ======== BEGIN USER OPTIONS ========

# Specifies the Games/Programs subdirectory where core specific directories will be placed.
# games_subdir="" for letting the script choose between /media/fat and /media/fat/games when it exists,
# otherwise the subdir you prefer (i.e. games_subdir="/Programs").
games_subdir=""

# Base directory for all script’s tasks, "/media/fat" for SD root, "/media/usb0" for USB drive root.
base_path="/media/fat"

# ========= END USER OPTIONS =========

github_repo="flynnsbit/Top300_updates"
disk_image="IDE 0-1 Top 300 DOS Games.vhd"
mount_dir=/tmp/dos_games

# Ansi color code variables
red="\e[0;91m"
blue="\e[0;94m"
expand_bg="\e[K"
blue_bg="\e[0;104m${expand_bg}"
red_bg="\e[0;101m${expand_bg}"
green_bg="\e[0;102m${expand_bg}"
green="\e[0;92m"
white="\e[0;97m"
bold="\e[1m"
uline="\e[4m"
reset="\e[0m"

# Arg $1: GitHub repo name, e.g. "username/repo"
get_latest_release()
{
	local api_url="https://api.github.com/repos/${1}/releases/latest"
	local download_url

	read -r tag_name download_url < <(echo $(curl -k -s "${api_url}" | jq -r ".tag_name, .assets[0].browser_download_url"))
	echo Downloading "${tag_name}"...
	curl -k -L "${download_url}" -o /tmp/update.zip
}
function pause(){
 echo -en "\ec"
 echo -e "${red_bg}${reset}"
 echo -e "This script updates the ${green}(flynnsbit AO486 - Top 300 DOS Games pack)${reset} VHD to fix games and add features that were not included in the original version.  This script directly mounts and modifies the VHD in one step." 
 echo -e "${red}Please backup any changes you have made to the pack before running this update.${reset}"
 echo -e ""
 read -s -n 1 -p "Press any key to continue . . ."
 echo ""
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

find_disk_image()
{
	# Similar logic to MiSTer update.sh script
	if [ "${games_subdir}" == "" ]; then
		if [ "$(find ${base_path}/games -type f -print -quit 2> /dev/null)" == "" ] && [ "$(find ${base_path}/AO486 -type f -print -quit 2> /dev/null)" != "" ]; then
			games_subdir="${base_path}"
		else
			games_subdir="${base_path}/games"
		fi
	fi

	ao486_dir="${games_subdir}/AO486"
	disk_image="${ao486_dir}/${disk_image}"
	
	if [ ! -f "${disk_image}" ]; then
		echo "Couldn't find disk image in \"${ao486_dir}\"."
		exit 1
	fi
}
#pause for user
pause

# Look for disk image in user's games directory
find_disk_image
echo ""
echo -e "${white}Disk image found at \"${disk_image}\".${reset}"
echo ""
# Download latest release zip
get_latest_release "${github_repo}"


# Just mount partition 2 in the disk image
mkdir "${mount_dir}"
mount_image "${disk_image}" 2 "${mount_dir}"
echo ""
# Extract update, overwriting existing files
unzip -o -d "${mount_dir}/" /tmp/update.zip
echo ""
# Clean up
rm /tmp/update.zip
unmount_image "${mount_dir}"
rmdir "${mount_dir}"
echo ""
echo -e "${green}Successfully updated to ${tag_name}!${reset}"
