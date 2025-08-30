package.cpath = "/home/lousp/.nix-profile/lib/lua/5.2/?.so;" .. package.cpath
local luv = require("luv")

local sig = os.getenv("HYPRLAND_INSTANCE_SIGNATURE")
local socket_path = os.getenv("XDG_RUNTIME_DIR").."/hypr/"..sig.."/.socket2.sock"

local client = luv.new_pipe(false)

local function hypr(cmd)
    client:write(cmd.."\n")
end

client:connect(socket_path, function(err)
    if err then
        print("Erro ao conectar:", err)
        return
    end

    print("Conectado ao socket! Digite comandos Hyprland.")

    -- REPL só inicia depois do socket conectado
    local stdin = luv.new_tty(0, true)
    stdin:read_start(function(err, chunk)
        assert(not err, err)
        if chunk then
            local line = chunk:gsub("\n",""):match("^%s*(.-)%s*$")
            if line == "exit" then
                luv.stop()
                return
            end
            hypr(line)
            io.write("> ")
        end
    end)

    io.write("> ")
end)

client:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
        for line in chunk:gmatch("[^\r\n]+") do
            print("evento:", line)
        end
    end
end)

luv.run()
