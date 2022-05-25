# Configs

### Current Setup
![2022-05-25-08:33:19-screenshot](https://user-images.githubusercontent.com/56120837/170171058-21ce9ca1-1ac7-4c30-8ad4-43d5a83ac3b0.png)

### Focused window title and Alacritty (gruvboxdark-soft theme)
![2022-05-25-08:33:35-screenshot](https://user-images.githubusercontent.com/56120837/170171070-5a951644-02d7-4911-b891-e224725d1c98.png)

### i3wm

#### Install these packages
- i3-gaps - tiling window manager
- rofi - application menu
- nitrogen - desktop background manager
- i3blocks - i3status bar (v >= 1.5.0)
- Alacritty - A fast, cross-platform, OpenGL terminal emulator
- autorandr - manage config for docked setup
- pamac - package manager GUI


### Install i3blocks (v 1.5.0)

#### Debian:
```bash
apt cache search dh-autoreconf
apt install dh-autoreconf
apt install make
git clone https://github.com/vivien/i3blocks
cd i3blocks
chmod +x autogen.sh
./autogen.sh
./configure
make
make install
```

#### Arch:
```bash
pacman -Sy i3blocks
```

### Install Alacritty

#### Debian:
```bash
git clone https://github.com/alacritty/alacritty.git
cd alacritty
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
cargo build --release
infocmp alacritty
sudo cp target/release/alacritty /usr/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
mkdir -p ~/.bash_completion.d
cp extra/completions/alacritty.bash ~/.bash_completion.d/alacritty
echo "source ~/.bash_completion.d/alacritty" >> ~/.bashrc
```

#### Arch:
```bash
pacman -Sy alacritty
```

### Install vim-plug for neovim
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### Xrandr docked
```bash
xrandr --output HDMI-1 --primary --mode 1920x1080 --rate 75.00 --output eDP-1 --off
autorandr --save docked
xrandr --output eDP-1 --primary --mode 1920x1090 --rate 60.00 --output HDMI-1 --off
autorandr --save naive
```

### Install pamac
```bash
yay -S pamac-aur
downgrade archlinux-appstream-data
```
Choose 2019 version and save this to the ignore list

### Install starship prompt
```bash
curl -sS https://starship.rs/install.sh | sh
```

### Themes
- [Arc-Darkest-3.38](https://www.xfce-look.org/p/1317409) - Endeavour OS
- [Nordic](https://www.xfce-look.org/p/1267246)

### Icons
- [Qogir](https://www.xfce-look.org/p/1296407/) - Endeavour OS
- [Tela-nord](https://www.xfce-look.org/p/1279924)


### Cursors
- [WhiteSur](https://www.xfce-look.org/p/1411743)

### Fonts
```bash
touch fonts.txt
echo "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf" > fonts.txt
echo "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Bold/complete/Fira%20Code%20Bold%20Nerd%20Font%20Complete.ttf" >> fonts.txt
echo "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/SemiBold/complete/Fira%20Code%20SemiBold%20Nerd%20Font%20Complete.ttf" >> fonts.txt
wget -P /usr/share/fonts/TTF/ -i fonts.txt
```
- [FiraCode Nerd font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode/Regular/complete) (Regular, SemiBold, Bold)
