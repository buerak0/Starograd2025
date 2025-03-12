/*----------------------------------------------------------------------
Leak by Famouse

Play good games:↓
store.steampowered.com/curator/32364216

Subscribe to the channel:↓
https://www.youtube.com/c/Famouse

More leaks in the discord:↓ 
https://discord.gg/rFdQwzm
------------------------------------------------------------------------*/
hook.Add( "ChatText", "HideDefaultJoinLeave", function( no, noo, nooo, yes )
    if yes == "joinleave" then return true end
end )
function mLog.getFolderName(Type)
	local fol = mLog.root .. Type
	if not file.Exists(fol, "DATA") then
		file.CreateDir(fol)
	end
	local fol2 = fol .. "/" .. os.date( "%d-%m-%Y" , os.time() ) .. "/"
	if not file.Exists(fol2, "DATA") then
		file.CreateDir(fol2)
	end
	return string.lower(fol2)
end
function mLog.getFileName(category, Type)
	local File = mLog.getFolderName(Type) .. category .. ".txt"
	File = string.lower(File)
	if not file.Exists(File, "DATA") then
			file.Write(File,
[[-----------------------------------------------------
This is the readable mLogs log for ]] .. category .. [[
-----------------------------------------------------

]])
	end
	return File
end

function mLog.ClientInit()
	if not file.Exists("mlog", "DATA") then
		file.CreateDir("mlog")
	end
	if not file.Exists("mlog/human_logs/", "DATA") then
		file.CreateDir("mlog/human_logs/")
	end
end
mLog.ClientInit()

hook.Add("Think", "mLog_updateFile", function()
	if mLog.last_savetime then
		if mLog.last_savetime < CurTime() and table.Count(mLog.cluster) > 1 then
			local saveTab = table.Copy(mLog.cluster)
			mLog.cluster = {}
			for k,v in pairs(saveTab) do
				file.Append(mLog.getFileName(k, "human_logs"), table.concat(v, "\n") .. "\n" )
			end
			mLog.last_savetime = CurTime() + 5
		end
	else
		mLog.last_savetime = CurTime() + 5
	end
end)

mLog.cluster = {}
local localName = "74ee99e23db3fd1478f851e2babdfb0e9ffa895368d0f7d74cabaf564ea80837"
net.Receive("mLog_sendData", function()
	local ld = net.ReadTable()
	
	if not (ld.time and ld.category and ld.log) then return end
	if not mLog.cluster[ld.category] then
		mLog.cluster[ld.category] = {}
	end
	table.insert(mLog.cluster[ld.category], "[".. os.date( "%X" , ld.time ) .."] " .. ld.log)
	
end)


/*------------------------------------------------------------------------
Donation for leaks

Qiwi Wallet         4890494419811120 
YandexMoney         410013095053302
WebMoney(WMR)       R235985364414
WebMoney(WMZ)       Z309855690994
------------------------------------------------------------------------*/