# Description: Install terminal applications and programming languages

# PROJECT_ROOT is expected to be set by calling install script.

# Install required pre-requisites
echo "Installing pre-requisites..."
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip wget

# Run terminal installers
for installer in "$PROJECT_ROOT"/install/terminal/*.sh; do
    source "$installer"
done
# Run programming language installers
for installer in "$PROJECT_ROOT"/install/terminal/languages/*.sh; do
    source "$installer"
done
# Run database installers
for installer in "$PROJECT_ROOT"/install/terminal/databases/*.sh; do
    source "$installer"
done
# Run any steps that have dependencies on previous steps completing
for installer in "$PROJECT_ROOT"/install/terminal/finally/*.sh; do
    source "$installer"
done