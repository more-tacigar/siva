------------------------------------------------------------
-- Copyright (c) 2016 tacigar. All rights reserved.
-- https://github.com/tacigar/siva
------------------------------------------------------------

-- siva.aux represents a table that contains auxiliary functions.
siva.aux = {}

-- siva.in_space reports whether pos2 is in space of pos1.
function siva.in_space(pos1, pos2, space)
	for _, coord = in pairs{'x', 'y', 'z'} do
		if math.abs(pos1[coord] - pos2[coord]) > space[coord] / 2 then
			return false
		end
	end
	return true
end
