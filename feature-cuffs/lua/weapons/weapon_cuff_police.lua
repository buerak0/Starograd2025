--[[
Server Name: [#] Новый Доброград
Server IP:   46.174.50.64:27015
File Path:   addons/feature-cuffs/lua/weapons/weapon_cuff_police.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

AddCSLuaFile()

SWEP.Base = 'weapon_cuff_base'

SWEP.Category = 'Handcuffs'
SWEP.Instructions = 'ЛКМ - заковать'

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.AdminSpawnable = true

SWEP.PrintName = L.cuff_police

SWEP.CuffTime = 0.3
SWEP.CuffSound = Sound('buttons/lever7.wav')

SWEP.CuffMaterial = 'phoenix_storms/gear'
SWEP.CuffRope = 'cable/cable2'
SWEP.RopeLength = 25
SWEP.CuffReusable = true
SWEP.RemoveTime = 6

SWEP.CanBlind = false
SWEP.CanGag = false
