# Description: Install libraries for terminal development

sudo apt install -y \
  build-essential pkg-config autoconf bison clang \
  fzf ripgrep fd-find jq tree \
  tldr \
  curl git unzip wget dnsutils \
  gpg \
  redis-tools sqlite3 libsqlite3-0 libmysqlclient-dev libpq-dev postgresql-client postgresql-client-common
#  libssl-dev libreadline-dev zlib1g-dev libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev libjemalloc2 \
#  libvips imagemagick libmagickwand-dev mupdf mupdf-tools gir1.2-gtop-2.0 gir1.2-clutter-1.0

# TBD
#sudo apt install -y bat eza zoxide plocate apache2-utils