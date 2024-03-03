# Update daddy Pacman
# Install dependencies used for the setup
sudo pacman -S --noconfirm curl wget

# Make home directories
mkdir -p $HOME/Downloads $HOME/Documents $HOME/Pictures $HOME/Music $HOME/Videos $HOME/.local/bin

# Setup git
sudo pacman -S --noconfirm git
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

# Terminal setup
sudo pacman -S --noconfirm alacritty
mkdir -p $HOME/.config/alacritty/themes && git clone https://github.com/alacritty/alacritty-theme $HOME/.config/alacritty/themes
ln -s $HOME/.dotfiles/alacritty.toml $HOME/.config/alacritty/alacritty.toml
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# HOME directory setup
rm $HOME/.bashrc $HOME/.bash_aliases $HOME/.bash_profile
ln -s $HOME/.dotfiles/.bashrc $HOME/.bashrc
ln -s $HOME/.dotfiles/.bash_aliases $HOME/.bash_aliases
ln -s $HOME/.dotfiles/.bash_profile $HOME/.bash_profile

# Install compilers and build tools
sudo pacman -S --noconfirm nodejs npm rust gcc go

# Install zig
wget https://ziglang.org/builds/zig-linux-x86_64-0.12.0-dev.3002+9d7082972.tar.xz -O $HOME/zig.tar.xz
tar -xf zig.tar.xz
mv zig-linux-x86_64* $HOME/.local/bin/zig
rm $HOME/zig.tar.xz

# Install NeoVim dependencies
sudo pacman -S --noconfirm neovim xclip ripgrep fzf tidy fd jq

# Install & configure NeoVim
ln -s $HOME/.dotfiles/config/nvim $HOME/.config/nvim

# Install LSPs
sudo npm i -g bash-language-server vscode-langservers-extracted sql-language-server typescript typescript-language-server @tailwindcss/language-server
cargo install htmx-lsp 
go install golang.org/x/tools/gopls@latest
sudo pacman -S --noconfirm rust-analyzer lua-language-server zls

# Install & configure Tmux
sudo pacman -S --noconfirm tmux
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
ln -s $HOME/.dotfiles/config/tmux/.tmux.conf $HOME/.tmux.conf

# Other Pacman packages
sudo pacman -S --noconfirm neofetch btop nmap \
  net-tools less tree unzip zip awk grep cmake \
  make dolphin dpkg man-db postgresql ufw openssh

# Setup UFW
sudo ufw enable
sudo ufw default deny
sudo ufw allow ssh

# Install nerdfonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip -O $HOME/Hack.zip
sudo unzip $HOME/Hack.zip -d /usr/share/fonts
rm $HOME/Hack.zip
