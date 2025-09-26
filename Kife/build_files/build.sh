#!/bin/bash
set -ouex pipefail

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

cp /ctx/usr/libexec/* /usr/libexec/
chmod +x /usr/libexec/installextrapkgs

# cp -r /ctx/usr/share/fonts/* /usr/share/fonts/
# cp -r /ctx/usr/share/icons/* /usr/share/icons/

cp -r /ctx/usr/share/* /usr/share/
cp /ctx/usr/lib/systemd/system/* /usr/lib/systemd/system/

dnfcoprs=(
	"dturner/eza"
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
	"waybar"
	"swww"
	"wget"
	"eza"
	"fontconfig"
)

for copr in "${dnfcoprs[@]}"; do
	dnf copr enable -y $copr
done

dnf install -y --allowerasing "${dnfpkgs[@]}"

fc-cache -f -v

systemctl enable activeswap
systemctl enable podman.socket
systemctl enable extraapps.service
