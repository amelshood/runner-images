#!/bin/bash

# Clone the repo
git clone https://github.com/actions/runner-images.git

# Define the HELPER_SCRIPTS variable
HELPER_SCRIPTS_PATH="$(pwd)/runner-images/images/linux/scripts/helpers"

# Navigate to Ubuntu 20.04 installers directory
cd runner-images/images/linux/scripts/installers

# Execute .sh scripts
for script in *.sh; do
    echo "Executing $script..."

    # Substitute $HELPER_SCRIPTS with actual path
    sed -i "s|\$HELPER_SCRIPTS|$HELPER_SCRIPTS_PATH|g" "$script"

    bash "$script"
done

# Check if pwsh is available
if command -v pwsh > /dev/null 2>&1; then
    # Execute .ps1 scripts
    for script in *.ps1; do
        echo "Executing $script..."

        # Substitute $HELPER_SCRIPTS with actual path
        sed -i "s|\$HELPER_SCRIPTS|$HELPER_SCRIPTS_PATH|g" "$script"

        pwsh -File "$script"
    done
else
    echo "PowerShell Core (pwsh) is not available. Skipping .ps1 scripts."
fi

echo "All scripts executed!"


chmod +x setup_ubuntu_20_04.sh
./setup_ubuntu_20_04.sh
