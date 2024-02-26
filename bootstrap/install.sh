# Update daddy Pacman
sudo pacman -Syu --noconfirm

# Install dependencies used for the setup
sudo pamcan -S --noconfirm curl

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
sudo pacman -S --noconfirm go nodejs npm rust gcc zig

# Install NeoVim dependencies
sudo pacman -S --noconfirm neovim xclip ripgrep fzf tidy fd jq

# Install & configure NeoVim
ln -s $HOME/.dotfiles/config/nvim $HOME/.config/nvim

# Install LSPs
sudo npm i -g bash-language-server vscode-langservers-extracted sql-language-server typescript typescript-language-server
cargo install htmx-lsp 
go install golang.org/x/tools/gopls@latest
sudo pacman -S --noconfirm rust-analyzer lua-language-server
git clone https://github.com/zigtools/zls $HOME/zls && cd zls && zig build -Doptimize=ReleaseSafe

# Install & configure Tmux
sudo pacman -S --noconfirm tmux
ln -s $HOME/.dotfiles/config/tmux/.tmux.conf $HOME/.tmux.conf

# Other Pacman packages
sudo pacman -S --noconfirm neofetch btop nmap \
  net-tools less tree unzip zip awk grep cmake \
  make dolphin dpkg man-db postgresql ufw

# Setup UFW
sudo ufw enable
sudo ufw default deny
sudo ufw allow ssh
