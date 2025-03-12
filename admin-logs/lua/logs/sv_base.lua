
local json = util.TableToJSON
local http
if pcall(require, 'chttp') and _G.CHTTP ~= nil then
    http = _G.CHTTP 
else
    return
end

stlogs = stlogs or {}

stlogs.WH_NAME = "Starograd"

stlogs.SERVER = "https://discord.com/api/webhooks/1325824413337387028/WcCSDZ3CNClFMeflNmVe5Z2LAnF78_RQ1GjQpfbKdyc4LziojkoLWwxNafR5gAYA5NR5" --

stlogs.CAT_OTHER = ""
stlogs.CAT_ADMIN = ""
stlogs.CAT_DONATE = ""
stlogs.CAT_BUILD = ""
stlogs.CAT_DAMAGE = ""
stlogs.CAT_INVENTORY = ""
stlogs.CAT_SHOP = ""
stlogs.CAT_POLICE = ""
stlogs.CAT_PROPERTY = ""
stlogs.CAT_LOCKPICK = ""
stlogs.CAT_CUFF = ""
stlogs.CAT_KARMA = "h"
stlogs.CAT_GMPANEL = ""
stlogs.CAT_VEHICLE = ""
stlogs.CAT_TICKETS = ""
stlogs.CAT_CHEATS = ""
stlogs.CAT_CHAT = ""
stlogs.CAT_PLAYERS = "https://discord.com/api/webhooks/1325824413337387028/WcCSDZ3CNClFMeflNmVe5Z2LAnF78_RQ1GjQpfbKdyc4LziojkoLWwxNafR5gAYA5NR5"
stlogs.CAT_JOB = ""
stlogs.CAT_ATM = ""

local PM = FindMetaTable'Player'
function PM:GetURL()
    return not self:IsBot() and ('https://steamcommunity.com/profiles/%s'):format(self:SteamID64()) or 'bot'
end

local function send(data, webhook)
    webhook = stlogs.SERVER
    http({
        url = webhook,
        type = "application/json",
        method = 'POST',
        headers = {
            ['User-Agent'] = 'curl/7.54',
        },
        body = json(data),
    })
end

function log(data, webhook)
    local _text = {
        username = stlogs.WH_NAME,
        embeds = {{
            title = data.title,
            description = data.text,
            color = data.color,
            footer = {
                text = data.tags,
            }
        }}
    }
    send(_text, webhook)
end

function log_json(text)
    http({
        url = WEBHOOK_URL,
        type = "application/json",
        method = 'POST',
        headers = {
            ['User-Agent'] = 'curl/7.54',
        },
        body = text
    })
end
