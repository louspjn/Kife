local config = {
  font_family = "JetBrains Mono Nerd Font",
  font_size = 11,

  -- shell_integration = "no-rc",

  background_opacity = 1.000000,
  cursor_trail = 4,
  cursor_trail_start_threshold = 0,
  window_padding_width = 10,

  include = "./colors.conf"
}

local function kitty(settings)
  local output = {}

  for opt, value in pairs(settings) do
    if type(value) == "string" then
      table.insert(output, opt .. " " .. value)
    else
      table.insert(output, opt .. " " .. tostring(value))
    end
  end

  return output
end

local file = io.open("/home/lousp/Yalix/dotfiles/kitty/kitty.conf", "w")
if file then
  file:write(table.concat(kitty(config), "\n"))
  file:close()
  print("-> Done.")
else
  print("-> Error.")
end
