#!/bin/bash


#get_arch=`arch`

OS="$(uname)"
if [[ "${OS}" == "Darwin" ]]
then
echo "Support $OS"
ARCH="$(/usr/bin/uname -m)"

if [[ "${ARCH}" == "arm64" ]]
  then
    # M1, this script installs to /opt/homebrew only
    # For arm64 (Apple Silicon(M1)) Apple hardware:
    HOMEBREW_PREFIX="/opt/homebrew"
  else
    # i386, this script installs to /usr/local only
    # For x86_64 Apple hardware:
    HOMEBREW_PREFIX="/usr/local"
  fi
  echo "Exprot ENV"
  echo "
    PATH=\"${HOMEBREW_PREFIX}/opt/make/libexec/gnubin:\$PATH\"
    PATH=\"${HOMEBREW_PREFIX}/opt/gnu-getopt/bin:\$PATH\"
    PATH=\"${HOMEBREW_PREFIX}/opt/gettext/bin:\$PATH\"
    PATH=\"${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin:\$PATH\"
    PATH=\"${HOMEBREW_PREFIX}/opt/findutils/libexec/gnubin:\$PATH\"
    export PATH
  " > /Volumes/OpenWRT/env.sh
echo "Source ENV"
source /Volumes/OpenWRT/env.sh
echo "Done."
else
echo "unsupport $OS"
fi
