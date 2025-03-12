--Thanks "LOyoujoLI" (https://steamcommunity.com/id/LOyoujoLI/) for sending me this

xAdmin.Utilities = xAdmin.Utilities or {}
 
function xAdmin.Utilities.cpeMenu(admin, args)
    admin:ConCommand("cpe_menu")
end
 
xAdmin.RegisterCommand("cpe", "CPE Menu", "Open CPE Menu.", "", "Utilities", xAdmin.Utilities.cpeMenu, {})