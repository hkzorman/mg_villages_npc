-- NPCs for mg_villages
-- Implemented using advanced_npc mod

local path = minetest.get_modpath("mg_villages_npcs")
dofile(path .. "/data/dialogues_data.lua")
dofile(path .. "/data/gift_items_data.lua")
dofile(path .. "/data/names_data.lua")
dofile(path .. "/data/occupations/default.lua")
dofile(path .. "/data/occupations/default_farmer.lua")
dofile(path .. "/data/occupations/default_priest.lua")

-- Register spawn egg
npc.spawner.register_spawn_egg("mg_villages_npcs:npc")

npc.spawner.set_mg_villages_entity_name("mg_villages_npcs:npc")

-- Register NPC entity
mobs:register_mob("mg_villages_npcs:npc", {
	type = "npc",
	passive = false,
	damage = 3,
	attack_type = "dogfight",
	attacks_monsters = true,
	-- Added group attack
	group_attack = true,
	-- Pathfinder = 2 to make NPCs more smart when attacking
	pathfinding = 2,
	hp_min = 10,
	hp_max = 20,
	armor = 100,
	collisionbox = {-0.20,0,-0.20, 0.20,1.8,0.20},
	--collisionbox = {-0.20,-1.0,-0.20, 0.20,0.8,0.20},
	--collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "character.b3d",
	drawtype = "front",
	textures = {
		{"npc_male1.png"},
		-- {"npc_male2.png"},
		-- {"npc_male3.png"},
		-- {"npc_male4.png"},
		-- {"npc_male5.png"},
		-- {"npc_male6.png"},c
		-- {"npc_male7.png"},
		-- {"npc_male8.png"},
		-- {"npc_male9.png"},
		-- {"npc_male10.png"},
		-- {"npc_male11.png"},
		-- {"npc_male12.png"},
		-- {"npc_male13.png"},
		-- {"npc_male14.png"},
		-- {"npc_female1.png"}, -- female by nuttmeg20
		-- {"npc_female2.png"},
		-- {"npc_female3.png"},
		-- {"npc_female4.png"},
		-- {"npc_female5.png"},
		-- {"npc_female6.png"},
		-- {"npc_female7.png"},
		-- {"npc_female8.png"},
		-- {"npc_female9.png"},
		-- {"npc_female10.png"},
		-- {"npc_female11.png"},
	},
	child_texture = {
		{"npc_child_male1.png"},
		{"npc_child_female1.png"},
	},
	makes_footstep_sound = true,
	sounds = {},
	-- Added walk chance
	walk_chance = 20,
	-- Added stepheight
	stepheight = 0.6,
	walk_velocity = 1,
	run_velocity = 3,
	jump = false,
	drops = {
		{name = "default:wood", chance = 1, min = 1, max = 3},
		{name = "default:apple", chance = 2, min = 1, max = 2},
		{name = "default:axe_stone", chance = 5, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	--follow = {"farming:bread", "mobs:meat", "default:diamond"},
	view_range = 15,
	owner = "",
	order = "follow",
	--order = "stand",
	fear_height = 3,
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219,
	},
	after_activate = function(self, staticdata, def, dtime)
		npc.after_activate(self)
	end,
	on_punch = function(self, clicker) 
		self.state = "attack"
	end,
	on_rightclick = function(self, clicker)
		-- Check if right-click interaction is enabled
		if self.enable_rightclick_interaction == true then
			npc.rightclick_interaction(self, clicker)
		end
	end,
	do_custom = function(self, dtime)
		return npc.step(self, dtime)
	end
})