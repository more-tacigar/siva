------------------------------------------------------------
-- Copyright (c) 2016 tacigar. All rights reserved.
-- https://github.com/tacigar/siva
------------------------------------------------------------

local directions = {
	{ x =  0, y =  0, z = -1},
	{ x =  0, y =  0, z =  1},
	{ x = -1, y =  0, z =  0},
	{ x =  1, y =  0, z =  0},
	{ x =  0, y =  1, z =  0},
	{ x =  0, y =  1, z = -1},
	{ x =  0, y =  1, z =  1},
	{ x = -1, y =  1, z =  0},
	{ x =  1, y =  1, z =  0},
	{ x = -1, y =  1, z = -1},
	{ x = -1, y =  1, z =  1},
	{ x =  1, y =  1, z = -1},
	{ x =  1, y =  1, z =  1},
}

local function method_func(pos, node, digger)
	local res = {}
	local function method_func_impl(pos1)
		for _, direction in ipairs(directions) do
			local pos2 = vector.add(pos1, direction)
			local node2 = minetest.get_node(pos2)

			if node.name == node2.name and not table.find_vector(res, pos2) then
				table.insert(res, pos2)
				method_func_impl(pos2)
			end
		end
	end
	method_func_impl(pos)
	return res
end

siva.register_method("siva:tree", {
	description = "siva : tree method",
	default_arguments = nil,
	method_func = method_func,
})
