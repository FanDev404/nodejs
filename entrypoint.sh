#!/bin/bash
cd /home/container || exit 1

# Configure colors
PANTEX0='\033[0;35m'
PANTEX1='\033[0;36m'
PANTEX2='\033[0;31m'
PANTEX3='\033[0;32m'
PANTEX4='\033[1;33m'
PANTEX5='\033[0;34m'
PANTEX6='\033[1;34m'
PANTEX7='\033[1;36m'
RESET_COLOR='\033[0m'

# Configure date
DATE=$(date +%F)

# Make internal Docker IP address available to processes.
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Default the IMAGE_PROMPT environment variable to something nice
IMAGE_PROMPT=${IMAGE_PROMPT:-$'\033[1m\033[33mcontainer@pterodactyl~ \033[0m'}
export IMAGE_PROMPT

# Replace Startup Variables
MODIFIED_STARTUP=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | eval echo "$(cat -)")
#echo -e "${CYAN} /home/container:${RESET_COLOR} ${MODIFIED_STARTUP}"
echo -e "${PANTEX0}===============${RESET_COLOR}${PANTEX7}[ ${RESET_COLOR}${PANTEX1}S${PANTEX2}E${PANTEX3}R${PANTEX4}V${PANTEX5}E ${PANTEX6}I${PANTEX5}N${PANTEX4}F${PANTEX1}O ${RESET_COLOR}${PANTEX7}]${RESET_COLOR}${PANTEX0}==============="
echo -e "- ${PANTEX1}NAME ${RESET_COLOR}: Dcker Images"
echo -e "- ${PANTEX2}VPS IP ${RESET_COLOR}: ${INTERNAL_IP}"
echo -e "- ${PANTEX3}CREATOR ${RESET_COLOR}: Fan Dev"
echo -e "- ${PANTEX4}DATE ${RESET_COLOR}: ${DATE}"
echo -e "- ${PANTEX5}VERSION APT ${RESET_COLOR}: $(apt -v)"
echo -e "- ${PANTEX6}VERSION NPM ${RESET_COLOR}: $(npm -v)"
echo -e "- ${PANTEX7}VERSION NODE ${RESET_COLOR}: $(node -v)"
echo -e "${PANTEX0}==========================================="

# Run the Server
exec env ${MODIFIED_STARTUP}
