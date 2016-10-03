------------------------------------------------------------
-- Copyright (c) 2016 tacigar. All rights reserved.
-- https://github.com/tacigar/siva
------------------------------------------------------------

minetest.register_chatcommand("siva:activate", {
	params = "",			      
	description = "Activate the siva system.",
	func = function(name, param)
		siva.activate()
		return true, "Siva is acivated."
	end,
})

minetest.register_chatcommand("siva:deactivate", {
	params = "",
	description = "Deactivate the siva system.",
	func = function(name, param)
		siva.deactivate()
		return true, "Siva is deactivated."
	end,
})
