
mLog.blacklist = mLog.blacklist or {}

--[[
	This file allows you to set certain blacklists for certain hooks.
	
	Each Hook below has a tag next to it with the following meaning:
	
	Entity: the CLASS name of the entity e.g. prop_physics
	Tool: the tool name of the tool gun e.g. precision
	Model: a model path e.g. models/hula.mdl
--]]

// Tool Gun -Tool
mLog.blacklist.tool_gun = {
	// "precision"
}

// Entity Damage - Entity
mLog.blacklist.damage = {
	// "lightsaber"
}

// Props
mLog.blacklist.prop = {
	// "models/hula.mdl"
}
