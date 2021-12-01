#!/bin/bash

 

echo "====== Updating Certificate Transparency ======"

 

set -e

set -x 

 

if [ "${CONFIGURATION}" == "Debug" ] || [ "${CONFIGURATION}" == "Release-Beta" ] || [ "${CONFIGURATION}" == "Ad-Hoc" ]

then

    /usr/libexec/PlistBuddy -c "Set :NSAppTransportSecurity:NSExceptionDomains:google.com:NSRequiresCertificateTransparency true" "${TARGET_BUILD_DIR}/${INFOPLIST_PATH}"

    /usr/libexec/PlistBuddy -c "Set :NSAppTransportSecurity:NSExceptionDomains:twitter.com:NSRequiresCertificateTransparency true" "${TARGET_BUILD_DIR}/${INFOPLIST_PATH}"

fi