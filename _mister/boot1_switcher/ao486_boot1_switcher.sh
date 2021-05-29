#!/bin/bash
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

set -euo pipefail

# ========= OPTIONS ==================
SCRIPT_VERSION="0.1"
BASE_PATH="/media/fat/games/ao486"
ORIGINAL_ROM_FILENAME="boot1_orig.bin"
ORIGINAL_ROM_REMOTE="https://github.com/sethgregory/ao486_boot_switcher/raw/main/boot1-orig.bin"
TRIDENT_ROM_FILENAME="boot1_trident.bin"
TRIDENT_ROM_REMOTE="https://github.com/sethgregory/ao486_boot_switcher/raw/main/boot1-trident.bin"
COUNTDOWN_TIME=15
CURL_RETRY="--connect-timeout 15 --max-time 120 --retry 3 --retry-delay 5 --silent --show-error"
ALLOW_INSECURE_SSL="true"

if [[ "${ALLOW_INSECURE_SSL}" == "true" ]]
then
    SSL_SECURITY_OPTION="--insecure"
else
    echo "CA certificates need"
    echo "to be fixed for"
    echo "using SSL certificate"
    echo "verification."
    echo "Please fix them i.e."
    echo "using security_fixes.sh"
    exit 2
fi

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
BOLD_IN="$(tput bold)"
BOLD_OUT="$(tput sgr0)"

# Check to see if downloaded bin file already exists, otherwise download.
# Exits script if it does not exist and cannot download.
fetch_if_not_exists() { 
    local FILE_NAME="${1}"
    local FILE_PATH="${BASE_PATH}/${FILE_NAME}"
    local FILE_URL="${2}"
    
    if [ ! -f ${FILE_PATH} ] ; then
      echo "... ${FILE_NAME} not found.  Downloading..."
          if curl ${CURL_RETRY} --silent --show-error ${SSL_SECURITY_OPTION} --fail --location -o ${FILE_PATH} ${FILE_URL} ; then return ; fi
          echo "There was some network problem."
          echo
          echo "Following file couldn't be downloaded:"
          echo ${@: -1}
          echo
          echo "Please try again later."
          echo
          exit 1
    else
      echo "... ${FILE_NAME} found."
    fi
}


echo -en "\ec"
echo -e "${red_bg}${reset}"
echo -e "${BOLD_IN}AO486 core boot1 switcher script:${BOLD_OUT} This script swaps the AO486 core's ${green}boot1.rom${reset}"
echo -e "back and forth from the original to a Trident VGA rom to enable running games that"
echo -e "require a different video mode."
echo -e ""
echo -e "${green}Script version ${SCRIPT_VERSION}${reset}"
echo -e ""

# Make sure we have the two boot1 rom options
fetch_if_not_exists "${TRIDENT_ROM_FILENAME}" "${TRIDENT_ROM_REMOTE}"
fetch_if_not_exists "${ORIGINAL_ROM_FILENAME}" "${ORIGINAL_ROM_REMOTE}"
echo
echo
echo " ${BOLD_IN}* ${BOLD_OUT}Press <${BOLD_IN}UP${BOLD_OUT}>, to use the Trident boot1.rom bios."
echo -n " ${BOLD_IN}* ${BOLD_OUT}Press <${BOLD_IN}DOWN${BOLD_OUT}>, to use the original boot1.rom bios."

COUNTDOWN_SELECTION="original"

set +e
echo -e '\e[3A\e[K'
for (( i=0; i <= COUNTDOWN_TIME ; i++)); do
    SECONDS=$(( COUNTDOWN_TIME - i ))
    if (( SECONDS < 10 )) ; then
        SECONDS=" ${SECONDS}"
    fi
    printf "\rDefaulting to original ao486 boot1.rom in ${SECONDS} seconds."
    for (( j=0; j < i; j++)); do
        printf "."
    done
    read -r -s -N 1 -t 1 key
    if [[ "${key}" == "A" ]]; then
            COUNTDOWN_SELECTION="trident"
            break
    elif [[ "${key}" == "B" ]]; then
            COUNTDOWN_SELECTION="original"
            break
    fi
done
set -e
echo -e '\e[2B\e[K'
echo
if [[ "${COUNTDOWN_SELECTION}" == "trident" ]] ; then
    cp "${BASE_PATH}/${TRIDENT_ROM_FILENAME}" "${BASE_PATH}/boot1.rom"
    echo "... Replaced contents of boot1.rom with ${TRIDENT_ROM_FILENAME}"   
elif [[ "${COUNTDOWN_SELECTION}" == "original" ]] ; then
    cp "${BASE_PATH}/${ORIGINAL_ROM_FILENAME}" "${BASE_PATH}/boot1.rom" 
    echo "... Replaced contents of boot1.rom with ${ORIGINAL_ROM_FILENAME}"   
fi

echo
echo
