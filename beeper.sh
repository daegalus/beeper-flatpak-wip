#!/bin/sh

set -oue pipefail

EXTRA_ARGS=()

declare -i BEEPER_USE_WAYLAND="${BEEPER_USE_WAYLAND:-0}"

# Additional args for enabling Wayland
if [[ "${BEEPER_USE_WAYLAND}" -eq 1 && "${XDG_SESSION_TYPE}" == "wayland" ]]; then
    echo "BEEPER_USE_WAYLAND set, adding --ozone-platform=wayland to launch options"
    EXTRA_ARGS+=(
        "--enable-features=UseOzonePlatform"
        "--ozone-platform-hint=auto"
        "--ozone-platform=wayland"
    )
fi

export FLATPAK_ID="${FLATPAK_ID:-com.beeper.Beeper}"
export TMPDIR="${XDG_RUNTIME_DIR}/app/${FLATPAK_ID}"

exec zypak-wrapper /app/beeper/beeper $@