# Description: Installs PHP 8.4 and common extensions

# Assumes the os-release info has been sourced by parent installer script.

# PHP 8.4 is available by default in Ubuntu 25.04 and later, so only add the PPA for Ubuntu 24.04 and 24.10
# Add PPA only for Ubuntu 24.04 and 24.10
if [ "$(echo "$VERSION_ID <= 24.10" | bc)" -eq 1 ] && [ "$(echo "$VERSION_ID >= 24.04" | bc)" -eq 1 ]; then
    # echo "Adding ondrej/php PPA for Ubuntu $VERSION_ID..."
    sudo add-apt-repository -y ppa:ondrej/php

    # Special fix for Ubuntu 24.10
    if [ "$VERSION_ID" == "24.10" ] && [ -f /etc/apt/sources.list.d/ondrej-ubuntu-php-oracular.sources ]; then
        sudo sed -i 's/oracular/noble/g' /etc/apt/sources.list.d/ondrej-ubuntu-php-oracular.sources
    fi
fi

sudo apt update
sudo apt -y install php8.4 php8.4-{curl,apcu,intl,mbstring,opcache,pgsql,mysql,sqlite3,redis,xml,zip,gd,bcmath,fpm}

# Install Composer
if ! command -v composer &> /dev/null; then
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    # Verify the installer SHA-384
    EXPECTED_CHECKSUM="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
    ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

    # Checksum mismatch so abort the install
    if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]; then
        echo "ERROR: Invalid composer installer checksum"
        rm composer-setup.php
        exit 1
    fi

    php composer-setup.php --quiet
    RESULT=$?
    rm composer-setup.php

    if [ $RESULT -eq 0 ]; then
        sudo mv composer.phar /usr/local/bin/composer
    else
        echo "ERROR: Composer installation failed"
        exit 1
    fi
fi