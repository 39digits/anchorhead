# Description: Install rclone, a command line program to manage files on cloud storage

# Source: https://rclone.org/downloads/
if ! command -v rclone &> /dev/null; then
  sudo -v ; curl https://rclone.org/install.sh | sudo bash
fi