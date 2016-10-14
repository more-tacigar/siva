------------------------------------------------------------
-- Copyright (c) 2016 tacigar. All rights reserved.
-- https://github.com/tacigar/siva
------------------------------------------------------------

-- table.find reports whether does a table t have a value v.
function table.find(t, v)
	for _, v2 in ipairs(t) do
		if v == v2 then
			return true
		end
	end
	return false
end

-- table.find_vector reports whether does a table t have a vector v.
function table.find_vector(t, v)
	for _, v2 in ipairs(t) do
		if v.x == v2.x and v.y == v2.y and v.z == v2.z then
			return true
		end
	end
	return false
end

-- table.append appends two tables.
function table.append(t1, t2)
	for _, v2 in ipairs(t2) do
		table.insert(t1, v2)
	end
	return t1
end

-- siva.aux represents a table that contains auxiliary functions.
siva.aux = {}

-- siva.aux.in_space reports whether pos2 is in space of pos1.
function siva.aux.in_space(pos1, pos2, space)
	for _, coord in pairs{'x', 'y', 'z'} do
		if math.abs(pos1[coord] - pos2[coord]) > space[coord] / 2 then
			return false
		end
	end
	return true
end

local dirt_nodes = {
	"default:dirt",
	"default:dirt_with_grass",
	"default:dirt_with_grass_footsteps",
	"default:dirt_with_dry_grass",
	"default:dirt_with_snow"
}

-- siva.aux.is_dirt reports whether is nodename dirt node name.
function siva.aux.is_dirt(nodename)
	return table.find(dirt_nodes, nodename)
end
