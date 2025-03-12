-- please at least do not remove this comment
	-- by chelog

local cats = cats || {}
include "cats/shared.lua"

if SERVER then
	AddCSLuaFile "cats/client.lua"
	AddCSLuaFile "cats/shared.lua"
	include "cats/server.lua"
else
	include "cats/client.lua"
end

if SERVER then
	--cats:Log('Initialized.')
end
