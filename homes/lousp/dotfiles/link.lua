#! /usr/bin/env nix-shell
--[[
#! nix-shell -i lua -p lua
]]

local dotfiles_dir = os.getenv("HOME") .. "/Yalix/homes/lousp/dotfiles"
local config_dir = os.getenv("HOME") .. "/.config"

local dotfiles = {}
do
  local p = io.popen("ls -A " .. dotfiles_dir)
  for file in p:lines() do
    table.insert(dotfiles, file)
  end
  p:close()
end

local function alreadylinked(path)
  local result = os.execute("ls " .. path .. " > /dev/null 2>&1")
  return result
end

for _, dotfile in ipairs(dotfiles) do
  local src = dotfiles_dir .. "/" .. dotfile
  local dest
  if dotfile ~= "link.lua" then
    dest = config_dir .. "/" .. dotfile
  else
    dest = os.getenv("HOME") .. "/.local/bin/link"
  end

  if alreadylinked(dest) then
    print("-> " .. src .. " is already linked.")
  else
    print("-> Linking " .. src .. " to " .. dest)
    os.execute("ln -sf " .. src .. " " .. dest .. " > /dev/null 2>&1")
  end
end
