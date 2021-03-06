------------------------------------------------------------
-- Copyright (c) 2016 tacigar. All rights reserved.
-- https://github.com/tacigar/siva
------------------------------------------------------------

siva = {}

siva.modname = "siva"
siva.modpath = minetest.get_modpath(siva.modname)

dofile(siva.modpath .. "/util.lua")
dofile(siva.modpath .. "/api.lua")
dofile(siva.modpath .. "/methods/basic.lua")
dofile(siva.modpath .. "/methods/tree.lua")
dofile(siva.modpath .. "/methods/dirt.lua")
dofile(siva.modpath .. "/commands.lua")
