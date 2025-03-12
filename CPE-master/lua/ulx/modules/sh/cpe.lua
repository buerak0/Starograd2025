local command = ulx.command("Menus", "ulx cpe", function(ply)

	if !ply:IsValid() then return end
	
	ply:ConCommand ("cpe_menu")

end)

command:defaultAccess (ULib.ACCESS_ALL)
command:help ("Open the CPE Menu.")
