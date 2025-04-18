# Run desktop installers
for installer in "$PROJECT_ROOT"/install/desktop/*.sh; do
    # echo "Installing $(basename "$installer" .sh)..."
    source "$installer"
done
