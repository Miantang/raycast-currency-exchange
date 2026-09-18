#!/bin/zsh

set -euo pipefail

EXTENSION_NAME="currency-exchange-cny"
SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
INSTALL_DIR="${HOME}/Library/Application Support/Raycast Extensions/${EXTENSION_NAME}"
LOG_FILE="${TMPDIR:-/tmp}/${EXTENSION_NAME}-install.log"
DEV_PID=""
TAIL_PID=""

pause_before_exit() {
  printf "\nPress Enter to close this window..."
  read -r _
}

fail() {
  printf "\nInstallation failed: %s\n" "$1" >&2
  pause_before_exit
  exit 1
}

cleanup() {
  if [[ -n "${TAIL_PID}" ]] && kill -0 "${TAIL_PID}" 2>/dev/null; then
    kill "${TAIL_PID}" 2>/dev/null || true
  fi
  if [[ -n "${DEV_PID}" ]] && kill -0 "${DEV_PID}" 2>/dev/null; then
    kill -INT "${DEV_PID}" 2>/dev/null || true
  fi
}

trap cleanup EXIT INT TERM

printf "Raycast Currency Exchange personal installer\n\n"

if ! /usr/bin/open -Ra "Raycast" >/dev/null 2>&1; then
  fail "Raycast is not installed. Install it from https://www.raycast.com first."
fi

if ! command -v node >/dev/null 2>&1 || ! command -v npm >/dev/null 2>&1; then
  fail "Node.js 22.14 or newer is required. Install it from https://nodejs.org first."
fi

NODE_MAJOR="$(node -p 'process.versions.node.split(".")[0]')"
NODE_MINOR="$(node -p 'process.versions.node.split(".")[1]')"
if (( NODE_MAJOR < 22 || (NODE_MAJOR == 22 && NODE_MINOR < 14) )); then
  fail "Node.js 22.14 or newer is required. Current version: $(node --version)."
fi

printf "Installing files in:\n  %s\n\n" "${INSTALL_DIR}"
/bin/mkdir -p "$(dirname "${INSTALL_DIR}")"

if [[ "${SOURCE_DIR}" != "${INSTALL_DIR}" ]]; then
  /usr/bin/ditto --noqtn "${SOURCE_DIR}" "${INSTALL_DIR}"
fi

cd "${INSTALL_DIR}"

printf "Installing dependencies...\n"
npm ci || fail "npm ci did not complete successfully."

printf "\nOpening Raycast...\n"
/usr/bin/open -a "Raycast"
/bin/sleep 3

printf "Importing the extension into Raycast...\n"
: > "${LOG_FILE}"
./node_modules/.bin/ray develop > "${LOG_FILE}" 2>&1 &
DEV_PID="$!"
/usr/bin/tail -n 0 -f "${LOG_FILE}" &
TAIL_PID="$!"

INSTALLED=false
for _ in {1..180}; do
  if /usr/bin/grep -q "built extension successfully" "${LOG_FILE}"; then
    INSTALLED=true
    break
  fi

  if ! kill -0 "${DEV_PID}" 2>/dev/null; then
    break
  fi

  /bin/sleep 1
done

if [[ "${INSTALLED}" != "true" ]]; then
  cleanup
  DEV_PID=""
  TAIL_PID=""
  printf "\nInstaller log:\n"
  /bin/cat "${LOG_FILE}"
  fail "Raycast did not confirm a successful extension build. Make sure Raycast is running and signed in."
fi

# Give Raycast enough time to receive the successful-build notification before
# stopping development mode. Raycast keeps the imported extension afterwards.
/bin/sleep 3
kill -INT "${DEV_PID}" 2>/dev/null || true
wait "${DEV_PID}" 2>/dev/null || true
DEV_PID=""

if kill -0 "${TAIL_PID}" 2>/dev/null; then
  kill "${TAIL_PID}" 2>/dev/null || true
fi
TAIL_PID=""
trap - EXIT INT TERM

printf "\nInstallation completed.\n"
printf "Search Raycast for: Currency Exchange for Yuan\n"
printf "You do not need to keep npm run dev running.\n"
printf "To install an update, download the newest package and run install.command again.\n"
pause_before_exit
