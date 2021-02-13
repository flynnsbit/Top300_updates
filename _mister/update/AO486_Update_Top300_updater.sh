#!/bin/bash
set -e
ver="v.0.8"

# ======== BEGIN USER OPTIONS ========

# Specifies the Games/Programs subdirectory where core specific directories will be placed.
# games_subdir="" for letting the script choose between /media/fat and /media/fat/games when it exists,
# otherwise the subdir you prefer (i.e. games_subdir="/Programs").
games_subdir=""

# Base directory for all script’s tasks, "/media/fat" for SD root, "/media/usb0" for USB drive root.
base_path="/media/fat"

# ========= END USER OPTIONS =========

github_repo="flynnsbit/Top300_updates"
fastdoom_repo="viti95/FastDoom"
primary_disk_image="IDE 0-0 BOOT-DOS98.vhd"
secondary_disk_image="IDE 0-1 Top 300 DOS Games.vhd"
mount_dir=/tmp/dos_vhds
extract_dir=/tmp/dos_extract
fastdoom_dir=/tmp/fastdoom


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
# Can we grab the file names and insert them into a variable ex. FastDoom_0.7.zip so it is not hard coded in the execution part below
get_latest_release()
{
	local api_url="https://api.github.com/repos/${1}/releases/latest"
	local download_url

	read -r tag_name download_url < <(echo $(curl -k -s "${api_url}" | jq -r ".tag_name, .assets[0].browser_download_url"))
	echo Downloading "${tag_name}"...
	cd /tmp && { curl -k -L "${download_url}" -O ; cd -; }
}

# Arg $1: Path to image
# Arg $2: Partition number 
# Arg $3: Mount point
mount_simage()
{
	# Get next free loop device
	loop_dev_s=$(losetup -f)

	# Associate next free loop device with image
	losetup -f "${1}"

	# Mount the partition
	mount "${loop_dev_s}p${2}" "${3}"
}

mount_pimage()
{
	# Get next free loop device
	loop_dev_p=$(losetup -f)

	# Associate next free loop device with image
	losetup -f "${1}"

	# Mount the partition
	mount "${loop_dev_p}p${2}" "${3}"
}



# Arg $1: Secondary Mount point
unmount_simage()
{
	# Unmount partition
	sync
	umount "${1}"
	
	# Disassociate loop device
	losetup -d "${loop_dev_s}"
}

# Arg $1: Primary Mount point
unmount_pimage()
{
	# Unmount partition
	sync
	umount "${1}"
	
	# Disassociate loop device
	losetup -d "${loop_dev_p}"
}


find_secondary_disk_image()
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
	secondary_disk_image="${ao486_dir}/${secondary_disk_image}"
	
	if [ ! -f "${secondary_disk_image}" ]; then
		echo "Couldn't find disk image in \"${ao486_dir}\"."
		exit 1
	fi
}

find_primary_disk_image()
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
	primary_disk_image="${ao486_dir}/${primary_disk_image}"
	
	if [ ! -f "${primary_disk_image}" ]; then
		echo "Couldn't find disk image in \"${ao486_dir}\"."
		exit 1
	fi
}

#Cleaning up any bad updates or failed updates before running again
echo -en "\ec"
echo ""
echo -e "${blue}Cleaning up any previous failed updates, ignore any errors...${reset}"
echo ""
#get rid of this hacky cleanup or dont show users the error when the command could not complete
set +e
rm /tmp/update.zip 2>/dev/null
unmount_simage "${mount_dir}/E" 2>/dev/null
unmount_pimage "${mount_dir}/C" 2>/dev/null
rm -r "${mount_dir}" 2>/dev/null
rm -r "${extract_dir}" 2>/dev/null
echo ""
set -e


# Look for disk image in user's games directory
find_secondary_disk_image
echo ""
echo -e "${white}Disk image found at \"${secondary_disk_image}\".${reset}"
echo ""

find_primary_disk_image
echo ""
echo -e "${white}Disk image found at \"${primary_disk_image}\".${reset}"
echo ""

# Download latest release zip
get_latest_release "${fastdoom_repo}"
get_latest_release "${github_repo}"


# Mount partition 2 for secondary and 1 for primary in the disk image for C and E
mkdir "${mount_dir}"
mkdir "${extract_dir}"
mkdir "${mount_dir}/E"
mkdir "${mount_dir}/C"
echo "${secondary_disk_image}"
echo "${primary_disk_image}"
mount_simage "${secondary_disk_image}" 2 "${mount_dir}/E"
mount_pimage "${primary_disk_image}" 1 "${mount_dir}/C"
echo ""

# Extract updates from repos, rsync files to both vhds
unzip -o /tmp/update.zip -d "${extract_dir}/"
unzip -o /tmp/FastDoom_0.7.zip -d "${fastdoom_dir}/"

#Fast doom copy
rsync '/tmp/fastdoom/486/Doom/' /tmp/dos_vhds/E/games/DOOM1993/DOOM/  -r -I -v
rsync '/tmp/fastdoom/486/Doom 2/' /tmp/dos_vhds/E/games/DOOMII-H/DOOMII/ -r -I -v
rsync '/tmp/fastdoom/486/Ultimate Doom/' /tmp/dos_vhds/E/games/THEULTIM/UltDoom -r -I -v

#Rsync all the updates to the VHDs that are mounted
rsync -rIv "${extract_dir}"/ "${mount_dir}"/ 
echo ""

# Clean up everything
rm /tmp/update.zip
rm /tmp/FastDoom_0.7.zip
sync
unmount_simage "${mount_dir}/E"
unmount_pimage "${mount_dir}/C"
rm -r "${mount_dir}"
rm -r "${extract_dir}"
rm -r "${fastdoom_dir}"
echo ""
echo -e "${green}Successfully updated to ${tag_name}!${reset}"
