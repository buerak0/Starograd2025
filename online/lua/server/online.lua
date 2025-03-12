util.AddNetworkString("ServerInfoUpdate")
print("[ONLINE] !Start")
local function GetServerInfo()
    local info = {}
    info.name = GetHostName()
    info.playerCount = #player.GetAll()
    info.maxPlayers = game.MaxPlayers()
    info.passwordProtected = GetConVar("sv_password"):GetString() ~= ""
    return info
end

local function SendServerInfo()
    local info = GetServerInfo()
    local color = info.playerCount > 0 and Color(0, 255, 0) or Color(255, 0, 0)
    local status = info.passwordProtected and "🔐 " or ""
    status = status .. info.playerCount .. " из " .. info.maxPlayers

    local embed = {
        title = "",
        description = "",
        color = color:ToHex(),
        fields = {
            {
                name = "",
                value = "**" .. info.name .. "** \n- Онлайн: " .. status .. "\n- [IP: " .. game.GetIPAddress() .. "](https://octothorp.team/api/steam/connect/" .. game.GetIPAddress() .. ")",
                inline = true
            }
        },
        footer = {
            text = "Обновлено • МСК+0 • " .. os.date("%H:%M"),
            icon_url = "https://i.imgur.com/1roKYRq.png"
        },
        image = {
            url = "https://i.imgur.com/5LnwgR9.png"
        }
    }

    local webhook = {
        url = "https://discord.com/api/webhooks/1332416771541569567/lT6V2NOET4Ke91ow9OdWAc-e70_b5jpl20W2adsM8xjcfypts7kOzGUXtRnBllFVIHdL",
        username = "Орешник - Лето и арбалеты",
        id = "1332422926414250005",
        embeds = {embed}
    }

    http.Post(webhook.url, util.TableToJSON(webhook), function(result)
        print("Информация обновлена через вебхук")
    end, function(fail)
        print("Ошибка отправки вебхука: " .. fail)
    end)
end

hook.Add("Initialize", "StartServerInfoUpdate", function()
    timer.Create("ServerInfoUpdateTimer", 240, 0, SendServerInfo)
end)