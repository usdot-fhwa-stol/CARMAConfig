#!/bin/bash

#  Copyright (C) 2018-2020 LEIDOS.
# 
#  Licensed under the Apache License, Version 2.0 (the "License"); you may not
#  use this file except in compliance with the License. You may obtain a copy of
#  the License at
# 
#  http://www.apache.org/licenses/LICENSE-2.0
# 
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#  License for the specific language governing permissions and limitations under
#  the License.

# This script takes a system release name and version number as arguments, and 
# updates version dependencies in docker-compose.yml and docker-compose-background.yml
# files accordingly.

# The -u | --unprompted option can be used to skip the interactive prompts, and
# provide arguments directly from the commandline.

if [[ $# -eq 0 ]]; then
    echo "Enter the system release name:"
    read RELEASE_NAME
    echo "Enter the system release version number:"
    read RELEASE_VERSION
else
    while [[ $# -gt 0 ]]; do
    arg="$1"
    case $arg in
        -u|--unprompted)
            RELEASE_NAME=$2
            RELEASE_VERSION=$3
            shift
            shift
            shift
        ;;
    esac
done
fi

./chrysler_pacifica_ehybrid_s_2019/system_release.sh -u $RELEASE_NAME $RELEASE_VERSION
./ford_fusion_sehybrid_2019/system_release.sh -u $RELEASE_NAME $RELEASE_VERSION
./freightliner_cascadia_2012/system_release.sh -u $RELEASE_NAME $RELEASE_VERSION
./lexus_rx_450h_2019/system_release.sh -u $RELEASE_NAME $RELEASE_VERSION
