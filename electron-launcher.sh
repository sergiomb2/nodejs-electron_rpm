#!/bin/bash

>&2 echo 'This build of Electron is provided by openSUSE built on COPR for Fedora and includes a few small modifications.'
>&2 echo 'Please report any issues at https://github.com/sergiomb2/nodejs-electron_rpm/issues instead of the upstream bug trackers.'


set -euo pipefail

name=electron
flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/${name}-flags.conf"

declare -a flags

if [[ -f "${flags_file}" ]]; then
    mapfile -t < "${flags_file}"
fi

for line in "${MAPFILE[@]}"; do
    if [[ ! "${line}" =~ ^[[:space:]]*#.* ]]; then
        flags+=("${line}")
    fi
done

exec XXXLIBDIRXXX/${name}/electron "$@" "${flags[@]}"
