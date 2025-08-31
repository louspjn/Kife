#! /usr/bin/env nix-shell
--[[
#! nix-shell -i lua -p lua
]]

local dotfiles = {
  "hypr",
  "nushell",
  "nvim",
  "waybar",
  "starship.toml",
  "kitty",
  "matugen",
  "waypaper",
  "alacritty",
  "ghostty"
}

local function alreadylinked(path)
    local result = os.execute("ls " .. path .. " > /dev/null 2>&1")
    return result
end

os.execute("ls .")

for _, dotfile in ipairs(dotfiles) do
  if alreadylinked("~/.config/" .. dotfile) then
    print("-> ~/Yalix/dotfiles/" .. dotfile .. " is already linked.")
  else
    print("-> Linking ~/Yalix/dotfiles/" .. dotfile .. " Configuration to ~/.config/" .. dotfile)
    os.execute("ln -sf ~/Yalix/dotfiles/" .. dotfile .. " ~/.config/" .. dotfile .. " > /dev/null 2>&1")
  end
end
