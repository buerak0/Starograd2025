-- ][\/][ //-\ ][_) ]E   ][3 ``//   << ][-][ ]E ][_ [[]] ((6

if true then return end -- мне интересно какой умник вообще додумался добавить на сервер net-spam, эта же хуйня никогда не работала, она обходится за пять секунд

timer.Create("LFI:NETSpamProtection", 1, 0, function()
    for _, ply in ipairs(player.GetHumans()) do
        ply.NETsPerSecond = 0
    end
end)

local MaxNETsPerSecond = 100

local ignoreNets = {
    ["NetStreamDS"] = true,
    ["editvariable"] = true, 
    ["simfphys_mousesteer"] = true, 
    ["simfphys_request_ppdata"] = true,
    ["octoweapons.bend"] = true,
    ["car.steer"] = true
}

local cvar = CreateConVar("gmlfi_net_log", "0", FCVAR_NONE, "Log all nets", 0, 1)

net.Incoming = function(len, ply)
    if ply.KickForNETSpam then return end 

    local name = util.NetworkIDToString(net.ReadHeader())
    if not name or not ignoreNets[name] then
        ply.NETsPerSecond = ply.NETsPerSecond ~= nil and ply.NETsPerSecond + 1 or 1
        if cvar:GetBool() and name and not ignoreNets[name] then print(string.format("[NETLOG] %s [%s] - %s", ply:Name(), ply:IPAddress(), name)) end
        if ply.NETsPerSecond >= MaxNETsPerSecond then
            print(string.format("[DETECT] Kicked %s [%s] for NET spamming%s", ply:Name(), ply:SteamID(), name and string.format(" [%s]", name) or ""))
            ply.KickForNETSpam = true
            ply:Kick("exploits") 
            return
        end
    end
    
    if not name then return end

    local func = net.Receivers[string.lower(name)]
    if not func then return end

    len = len - 16
    if type(func) == "function" then
        func(len, ply)
    end
end

hook.Add("PlayerInitialSpawn", "LFI:NETSpamProtection", function(ply)
    ply.NETsPerSecond = 0
    ply.KickForNETSpam = false
end)