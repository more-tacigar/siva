------------------------------------------------------------
-- Copyright (c) 2016 tacigar. All rights reserved.
-- https://github.com/tacigar/siva
------------------------------------------------------------

-- siva.registered_methods represents a table that contains
-- registered methods by siva.register_method function.
siva.registered_methods = {}

-- siva.register_method registers a new definition of digging method.
-- Its function must return a table.
function siva.register_method(method_name, def)
	siva.registered_methods[method_name] = def
end

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

-- siva.associate_node_with_method associates node with method (and arguments)
function siva.associate_node_with_method(nodename, method_name, arguments)
	local args = arguments or siva.registered_methods[method_name].default_arguments
	
	node_method_map[nodename] = {
		method_name = method_name,
		arguments = args,
	}
end

-- siva.default_settings set default siva settings.
function siva.default_settings()
	for nodename, nodedef in pairs(minetest.registered_nodes) do
		if nodedef.drawtype == "normal" then
			if minetest.get_item_group(nodename, "tree") > 0 then
				siva.associate_node_with_method(nodename, "siva:tree")
			elseif siva.util.is_dirt(nodename) then
				siva.associate_node_with_method(nodename, "siva:dirt")
			else
				siva.associate_node_with_method(nodename, "siva:basic")
			end
		end
	end
end

-- load a siva config file.
;(function()
	local worldpath = minetest.get_worldpath()
	local file = io.open(worldpath .. "/siva-config", "r")

	if file then
		local config = minetest.deserialize(file:read("*a"))
		
		is_activated = config.is_activated
		node_method_map = config.node_method_map

		file:close()
		return
	end

	minetest.after(0, function()
		siva.default_settings()	       
	end)
end) ()

-- save a sive config file when minetest is finalized.
minetest.register_on_shutdown(function()
	local worldpath = minetest.get_worldpath()
	local file = io.open(worldpath .. "/siva-config", "w")
	
	if file then
		local config = {
			is_activated = is_activated,
			node_method_map = node_method_map,
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

		local method_name = node_method_map[oldnode.name].method_name
		local method_func = siva.registered_methods[method_name].method_func
		local arguments = node_method_map[oldnode.name].arguments
		local targets = method_func(pos, oldnode, digger, arguments)
		local inv = digger:get_inventory()

		for _, target in ipairs(targets) do
			local node = minetest.get_node(target)
			local drops = minetest.get_node_drops(node.name)
			
			minetest.remove_node(target)

			for _, itemname in ipairs(drops) do
				local leftover = inv:add_item("main", ItemStack(itemname))
				minetest.add_item(pos, leftover)
			end
		end
	end)
end) ()

