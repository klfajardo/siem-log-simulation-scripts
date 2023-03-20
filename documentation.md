# Splunk Log Simulation Scripts

## Overview

This project aims to provide our TSE team with a collection of tools and resources to generate realistic sample log scripts. These scripts will aid in testing and development purposes within our environment. This  documentation will guide you through the process of creating, uploading, and maintaining these scripts.



## Tools required:

- ChatGPT v4 (avoid using ChatGPT v3.5 when possible)

- Linux with Bash shell to test and run the script.

  

## Script Creation Template

Please follow the template provided below when generating a new bash script using ChatGPT:

```
Hello ChatGPT,

We need your help in creating a bash script to generate log samples for a specific service. The main idea of the script should be:

1. Every time the script is executed, generate a log entry with a specific format, following the syntax and the logic of the service.
2. Append the new log entry to a file in the specified path (using a variable to specify the log file path).
3. The script should accept an optional IP address as the first argument. If provided, the script should use this IP address; otherwise, it should generate a random one.
4. The script should accept an optional log file path as the second argument. If provided, the script should use this path; otherwise, it should use the default path.

Here's the information you'll need for this specific service:

- Service Name: [Service_Name] -> e.g "Apache"
- Log Type: [Log_Type] -> e.g "Apache Acess Error Log"
- Default Log File Path: [Default_Log_File_Path] -> the path where you want the log to be saved (this can be modified on the script later)
- Log Format: ***OPTIONAL***
- Log Format Explanation: ***OPTIONAL***
- Log Example: ***OPTIONAL***

Please provide a bash script that follows the structure and best practices described below:

1. Define variables at the beginning of the script for the default log file path and the optional IP address and log file path arguments.
2. Create functions for generating random elements of the log entry, such as IP addresses, log levels, and messages. Ensure the functions are reusable and easy to modify for different log types.
3. Use functions to generate the current date in the appropriate log format, taking into account the specific requirements of the service's log format.
4. Ensure the random IP address generation function follows network theory, generates valid public and private IP addresses, and adheres to the correct IP ranges and subnets.
5. Design the script to be modular and easy to modify for different log types and formats. This includes using separate functions for each random element, and keeping the main logic of the script simple and clear.
6. Provide clear comments for each function and major part of the script to explain the purpose and functionality.
7. Use double-quotes for variable expansion and prefer [[ ]] over [ ] for conditional expressions.
8. Always quote variables and use ${variable} notation to avoid ambiguity.

Thank you!
```



## Script #Comment Template

Please follow the comment template provided below for each script:

```bash
#!/bin/bash
# 
# Script Name: script_name.sh
# Description: Generates realistic sample logs for <service> server service, tailored for 
# testing and development purposes within Splunk environments.
# 
# Version: 1.0.0
# Created: 2023-03-19
# Last Modified: 2023-03-19
# 
# Maintainers:
# - John Doe (Creator)      	- john.doe@example.com
# - Jane Smith (no longer active) 	- jane.smith@example.com
# - Alex Johnson         	- alex.johnson@example.com
# 
# Copyright (C) 2023 
# GitHub Repository: https://github.com/yourusername/splunk-log-simulation-scripts
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
# along with this program. If not, see <https://www.gnu.org/licenses/>.
#
```



## Uploading Scripts

Please adhere to these rules when uploading scripts:

1. Upload the script within a directory named as the script.
2. Ensure the script name describes its function.
3. If the script's function/name is not self-explanatory, please provide a brief description for documentation purposes.
4. Update the script comments whenever significant changes are made to the code.



## Available Scripts

The following is a list of available scripts as of today. Each script is accompanied by a brief description of its purpose:

- generate_apache_access_error_log.sh - Generates log samples for Apache Access Error server service, tailored for testing and development purposes within Splunk environments.

  

Template:

- script_name_1.sh - Generates log samples for <service_1> server  service, tailored for testing and development purposes within Splunk  environments.