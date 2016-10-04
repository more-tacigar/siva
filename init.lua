------------------------------------------------------------
-- Copyright (c) 2016 tacigar. All rights reserved.
-- https://github.com/tacigar/siva
------------------------------------------------------------

print("loading siva ... ")

siva = {}

siva.modname = "siva"
siva.modpath = minetest.get_modpath(siva.modname)

dofile(siva.modpath .. "/api.lua")
dofile(siva.modpath .. "/methods/aux.lua")
dofile(siva.modpath .. "/methods/basic.lua")
dofile(siva.modpath .. "/methods/tree.lua")
dofile(siva.modpath .. "/commands.lua")
