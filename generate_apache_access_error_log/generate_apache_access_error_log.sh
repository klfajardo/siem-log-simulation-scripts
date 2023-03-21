#!/bin/bash
# 
# Script Name: generate_apache_access_error_log.sh
# Description: Generates realistic sample logs for Apache service, tailored for
# testing and development purposes within SIEM environments.
# 
# Version: 1.0.0
# Created: 2023-03-19
# Last Modified: 2023-03-19
# 
# Maintainers:
# - Sebastian Ruiz	- sebas0594999@gmail.com
# - Kevin Fajardo 	- kevinfajardosoto12@gmail.com
# 
# Copyright (C) 2023
# GitHub Repository: https://github.com/klfajardo/siem-log-simulation-scripts
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License v2.0 as published by
# the Free Software Foundation.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License v2.0 for more details.
# 
# You should have received a copy of the GNU General Public License v2.0
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

# Variables
DEFAULT_LOG_FILE_PATH="./error.log"
IP_ADDRESS="$1"
LOG_FILE_PATH="${2:-$DEFAULT_LOG_FILE_PATH}"

# Function to generate a random IP address
function random_ip() {
  # IP ranges: public and private
  IP_RANGES=(
    "1.0.0.1 126.255.255.254"
    "128.0.0.1 191.255.255.254"
    "192.0.2.1 192.0.2.254"
    "192.168.0.1 192.168.255.254"
    "172.16.0.1 172.31.255.254"
    "10.0.0.1 10.255.255.254"
  )
  
  RANGE="${IP_RANGES[$((${RANDOM}%${#IP_RANGES[@]}))]}"
  IFS=' ' read -ra RANGE_ARRAY <<< "${RANGE}"
  
  START=$(IFS=. ; set -- ${RANGE_ARRAY[0]} ; echo $(( ($1 << 24) + ($2 << 16) + ($3 << 8) + $4 )))
  END=$(IFS=. ; set -- ${RANGE_ARRAY[1]} ; echo $(( ($1 << 24) + ($2 << 16) + ($3 << 8) + $4 )))
  RANDOM_IP_NUM=$(( $START + (RANDOM % ($END - $START)) ))
  
  IP_ADDR=$(printf "%d.%d.%d.%d" $(($RANDOM_IP_NUM>>24)) $(($RANDOM_IP_NUM>>16&255)) $(($RANDOM_IP_NUM>>8&255)) $(($RANDOM_IP_NUM&255)))
  echo "${IP_ADDR}"
}

# Function to generate the current date in Apache log format
function current_date() {
  echo "$(date -u +"%a %b %d %H:%M:%S.%3N %Y")"
}

# Function to generate a random Apache error log level
function random_log_level() {
  LOG_LEVELS=("error" "warn" "notice" "info" "debug")
  echo "${LOG_LEVELS[$((${RANDOM}%${#LOG_LEVELS[@]}))]}"
}

# Function to generate a random message
function random_message() {
  MESSAGES=("File not found" "Client denied by server configuration" "AH00128: File does not exist" "AH01630: client denied by server configuration")
  echo "${MESSAGES[$((${RANDOM}%${#MESSAGES[@]}))]}"
}

# Function to generate a random Apache access error log entry
function generate_error_log() {
  if [[ -z "${IP_ADDRESS}" ]]; then
    IP_ADDRESS="$(random_ip)"
  fi
  echo "[$(current_date)] [$(random_log_level)] [client ${IP_ADDRESS}] $(random_message)"
}

# Generate the log entry and append it to the log file
echo "$(generate_error_log)" >> "${LOG_FILE_PATH}"
