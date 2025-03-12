--[[
Server Name: [#] Новый Доброград
Server IP:   46.174.50.64:27015
File Path:   addons/feature-cuffs/lua/weapons/weapon_cuff_rope.lua
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
SWEP.Instructions = 'ЛКМ - завязать руки'

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.AdminSpawnable = true

SWEP.PrintName = L.cuff_rope

SWEP.CuffTime = 2
SWEP.CuffSound = Sound('buttons/lever7.wav')

SWEP.CuffMaterial = 'models/props_foliage/tree_deciduous_01a_trunk'
SWEP.CuffRope = 'cable/rope'
SWEP.RopeLength = 100
SWEP.CuffReusable = false
SWEP.ScareRequired = true

SWEP.CanBlind = true
SWEP.CanGag = true
