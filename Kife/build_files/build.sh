#!/bin/bash
set -ouex pipefail

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

cp /ctx/usr/libexec/* /usr/libexec/
chmod +x /usr/libexec/installextrapkgs

cp /ctx/usr/lib/systemd/system/* /usr/lib/systemd/system/

dnfcoprs=(
	"lihaohong/yazi"
	"solopasha/hyprland"
	"scottames/ghostty"
	"chronoscrat/starship"
)

dnfpkgs=(
	"nu"
	"fastfetch"
	"zoxide"
	"cmatrix"
	"cava"
	"btop"
	"bat"
	"lua"
	"ripgrep"
	"fzf"
	"ghostty"
	"helix"
	"cargo"
	"firefox"
	"yazi"
	"starship"
	"hyprland"
	"hyprlock"
	"hypridle"
	"hyprcursor"
	"papirus-icon-theme"
	"wget"
)

for copr in "${dnfcoprs[@]}"; do
	dnf copr enable -y $copr
done

dnf install -y --allowerasing "${dnfpkgs[@]}"

IDKWHERE=$(pwd)

cd /tmp
wget https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata-Original-Amber.tar.xz
tar -xf Bibata-Original-Amber.tar.xz
mv Bibata-Original-Amber /usr/share/icons/

cd $IDKWHERE

systemctl enable activeswap
systemctl enable podman.socket
systemctl enable extraapps.service
