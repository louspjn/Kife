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
  "kitty"
}

local function alreadylinked(path)
    local result = os.execute("ls " .. path)
    return result
end

for _, dotfile in ipairs(dotfiles) do
  if alreadylinked("~/.config/" .. dotfile) then
    print("-> ~/Yalix/dotfiles/" .. dotfile .. " is already linked.")
  else
    os.execute("ln -sf ~/Yalix/dotfiles/" .. dotfile .. " ~/.config/" .. dotfile)
    print("-> Linking ~/Yalix/dotfiles/" .. dotfile .. " Configuration to ~/.config/" .. dotfile)
  end
end
