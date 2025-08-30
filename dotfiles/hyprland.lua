local function hyprctl(command)
  os.execute("hyprctl " .. command)
end

local function onStartUp(table)
  for _, cmd in ipairs(table) do
    os.execute(cmd)
  end
end

local function set(key, value)
  hyprctl("keyword " .. key .. " " .. value)
end

local function decoration(field, opts)
  if opts["enabled"] ~= nil then
    set("decoration:" .. field .. ":enabled", opts["enabled"])
  end
end

local function animation(enabled, table)
  set("animations:enabled", tostring(enabled))
  for _, value in ipairs(table) do
    set("animation", "\"" .. value .. "\"")
  end
end

local function bezier(table)
  for _, value in ipairs(table) do
    set("bezier", "\"" .. value .. "\"")
  end
end

local function binde(table)
  for _, value in ipairs(table) do
    set("binde", "\"" .. value .. "\"")
  end
end

local function bindm(table)
  for _, value in ipairs(table) do
    set("bindm", "\"" .. value .. "\"")
  end
end

local function windowrule(table)
  for _, value in ipairs(table) do
    set("windowrule", "\"" .. value .. "\"")
  end
end

local function bind(table)
  for _, value in ipairs(table) do
    set("bind", "\"" .. value .. "\"")
  end
end

onStartUp({
  "waypaper --folder ~/Yalix/assets/wallpapers/ --restore",
  "pkill waybar; waybar &"
})

bind({
  "Super, R, exec, hyprctl reload",
  "Super, Q, killactive",
  "Super, P, pseudo",
  "Super, F, togglefloating",
  ", Print, exec, mkdir ~/Images/Screenshots; grimblast copysave area ~/Images/Screenshots/$(date +%Y-%m-%d_%H-%M-%S)",
  "Super, Return, exec, kitty",
  "Super, E, exec, nautilus",
  "Super, B, exec, waypaper",
  "Super, Space, exec, wofi --show drun",
  "Super, T, exec, hyprlock",

  "Super, H, movefocus, l",
  "Super, J, movefocus, d",
  "Super, K, movefocus, u",
  "Super, L, movefocus, r",

  "Super, code:10, workspace, 1",
  "Super, code:11, workspace, 2",
  "Super, code:12, workspace, 3",
  "Super, code:13, workspace, 4",
  "Super, code:14, workspace, 5",
  "Super, code:15, workspace, 6",
  "Super, code:16, workspace, 7",
  "Super, code:17, workspace, 8",
  "Super, code:18, workspace, 9",

  "Super Shift, code:10, movetoworkspace, 1",
  "Super Shift, code:11, movetoworkspace, 2",
  "Super Shift, code:12, movetoworkspace, 3",
  "Super Shift, code:13, movetoworkspace, 4",
  "Super Shift, code:14, movetoworkspace, 5",
  "Super Shift, code:15, movetoworkspace, 6",
  "Super Shift, code:16, movetoworkspace, 7",
  "Super Shift, code:17, movetoworkspace, 8",
  "Super Shift, code:18, movetoworkspace, 9"
})

decoration("blur", {
  "enabled", "true",
  "passes", "2",
  "size", "5"
})

bezier({
  "easeOutQuint, 0.23, 1, 0.32, 1",
  "linear, 0, 0, 1, 1",
  "smoothElastic, 1, -0.3, 0.3, 1.2"
})

animation(true, {
  "windows, 1, 1.38, easeOutQuint",
  "windowsIn, 1, 3.1, easeOutQuint, gnomed",
  "windowsOut, 1, 1.49, easeOutQuint, gnomed",
  "layersIn, 1, 4, easeOutQuint, gnomed",
  "layersOut, 1, 1.5, linear, gnomed",
  "workspacesIn, 1, 3, smoothElastic, slide",
  "workspacesOut, 1, 3, smoothElastic, slide"
})

binde({
  "Alt, H, resizeactive, -20 0",
  "Alt, J, resizeactive, 0 20",
  "Alt, K, resizeactive, 0 -20",
  "Alt, L, resizeactive, 20 0"
})

bindm({
  "Super, mouse:272, movewindow",
  "Super, mouse:273, resizewindow",
})

windowrule({"float, title:Waypaper"})
