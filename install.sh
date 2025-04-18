#!/usr/bin/env bash

# Any error after running `set -e` will trigger an EXIT signal and stop the script.
# Use set +e to allow the script to continue running even if an error occurs.
set -e
# Get absolute path to script directory regardless of how script was invoked.
# Uses BASH_SOURCE[0] which is more reliable than $0, especially in sourced scripts.
# This ensures we have the full path even if script was called from elsewhere.
PROJECT_ROOT=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

# Export these variables so all sourced scripts can use them
export PROJECT_ROOT

# Check the distribution name and version and abort if incompatible
source "$PROJECT_ROOT/install/check-version.sh"

# Desktop software and tweaks will only be installed if we're running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Ensure computer doesn't go to sleep or lock while installing
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0

  echo "Installing terminal and desktop tools..."

  # Install terminal tools
  source "$PROJECT_ROOT/install/terminal.sh"

  # Install desktop tools and tweaks
  source "$PROJECT_ROOT/install/desktop.sh"

  # Revert to normal idle and lock settings
  gsettings set org.gnome.desktop.screensaver lock-enabled true
  gsettings set org.gnome.desktop.session idle-delay 300
else
  echo "Only installing terminal tools..."
  source "$PROJECT_ROOT/install/terminal.sh"
fi