------------------------------------------------------------
-- Copyright (c) 2016 tacigar. All rights reserved.
-- https://github.com/tacigar/siva
------------------------------------------------------------

local directions = {
	{ x =  0, y =  0, z = -1 },
	{ x =  0, y =  0, z =  1 },
	{ x =  0, y = -1, z =  0 },
	{ x =  0, y =  1, z =  0 },
	{ x = -1, y =  0, z =  0 },
	{ x =  1, y =  0, z =  0 },
}

local function method_func(pos, node, space)
	local res = {}

	for _, direction in ipairs(directions) do
		local pos2 = vector.add(pos, direction)
		local node2 = minetest.get_node(pos2)

		if node.name == node2.name and siva.aux.in_space(pos, pos2, space) then
			table.insert(res, pos2)
			method_func(pos2, node2)
		end
	end
end

siva.register_method("siva:basic", {
	description = "siva : basic method",
	default_arguments = {x = 5, y = 5, z = 5},
	method_func = method_func,
})
