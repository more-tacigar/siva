------------------------------------------------------------
-- Copyright (c) 2016 tacigar. All rights reserved.
-- https://github.com/tacigar/maidroid
------------------------------------------------------------

-- is_activated represents whether siva system is activated.
local is_activated = true

-- siva.activate activates the siva system.
function siva.activate()
	is_activated = true
end

-- siva.deactivate deactivates the siva system.
function siva.deactivate()
	is_activated = false
end

-- node_method_map represents a table that maps nodename and dig method.
local node_method_map = {}

-- load a siva config file.
;(function()
	local worldpath = minetest.get_worldpath()
	local file = io.open(worldpath .. "/siva-config", "r")

	if file then
		config = minetest.deserialize(file:read("*a"))

		is_activated = config.is_activated
		
		file:close()
		return
	end

	minetest.after(0, function()
			       
	end)
end) ()

-- save a sive config file when minetest is finalized.
minetest.register_on_shutdown(function()
	local worldpath = minetest.get_worldpath()
	local file = io.open(worldpath .. "/siva-config", "w")
	
	if file then
		local config = {
			is_activated = is_activated,
		}
		file:write(minetest.serialize(config))
		file:close()
	end
end)

-- register on dignode
;(function()
	minetest.register_on_dignode(function(pos, oldnode, digger)
		if (not is_activated) or (not node_method_map[oldnode.name]) then
			return
		end
	end)
end) ()
