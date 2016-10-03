------------------------------------------------------------
-- Copyright (c) 2016 tacigar. All rights reserved.
-- https://github.com/tacigar/siva
------------------------------------------------------------

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

-- table.append appends two tables.
function table.append(t1, t2)
	for _, v2 in ipairs(t2) do
		table.insert(t1, v2)
	end
	return t1
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
