# first need to install dependencies:
sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

# then need to git clone the neovim repo:
git clone --depth 1 https://github.com/neovim/neovim.git

# then need to build and install neovim
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install

# verify installation
nvim --version
