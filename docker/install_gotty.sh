#!/bin/bash
# This script is intended for use from the docker builds.

set -e -x

GOTTY_VERSION="2.0.0-alpha.3"
GOTTY_VERSION_DIRECTORY="v${GOTTY_VERSION}"
GOTTY_NAME="gotty_${GOTTY_VERSION}_linux_amd64"

pushd /opt
wget -q "https://github.com/yudai/gotty/releases/download/${GOTTY_VERSION_DIRECTORY}/${GOTTY_NAME}.tar.gz" && tar zxpf "${GOTTY_NAME}.tar.gz" && mv "gotty" /usr/bin/gotty && rm "${GOTTY_NAME}.tar.gz"
popd