--
-- CATEGORIES
--

octoinv.addShopCat('tool', {
	name = L.tools,
	icon = 'octoteam/icons/repair.png',
})

octoinv.addShopCat('build', {
	name = L.build,
	icon = 'octoteam/icons/cog.png',
})

octoinv.addShopCat('blueprint', {
	name = L.blueprint,
	icon = 'octoteam/icons/blueprint.png',
})

octoinv.addShopCat('parts', {
	name = L.parts,
	icon = 'octoteam/icons/cogs.png',
})

octoinv.addShopCat('prod', {
	name = L.prod,
	icon = 'octoteam/icons/robot_arm.png',
})

--
-- ITEMS
--

octoinv.addShopItem('tool_screwer', { cat = 'tool', price = 35 })
octoinv.addShopItem('tool_hammer', { cat = 'tool', price = 25 })
octoinv.addShopItem('tool_wrench', { cat = 'tool', price = 50 })
octoinv.addShopItem('tool_solder', { cat = 'tool', price = 85 })
octoinv.addShopItem('tool_ruler', { cat = 'tool', price = 5 })
octoinv.addShopItem('tool_caliper', { cat = 'tool', price = 45 })
octoinv.addShopItem('tool_pump', { cat = 'tool', price = 80 })
octoinv.addShopItem('tool_knife_stanley', { cat = 'tool', price = 10 })
octoinv.addShopItem('tool_drill', { cat = 'tool', price = 150 })
octoinv.addShopItem('tool_saw', { cat = 'tool', price = 35 })
octoinv.addShopItem('tool_craft', { cat = 'tool', price = 100 })
octoinv.addShopItem('tool_pen', { cat = 'everyday', price = 5 })
octoinv.addShopItem('tool_pencil', { cat = 'everyday', price = 2 })

octoinv.addShopItem('craft_screw', { cat = 'build', price = 4 })
octoinv.addShopItem('craft_screw2', { cat = 'build', price = 5 })
octoinv.addShopItem('craft_screwnut', { cat = 'build', price = 4 })
octoinv.addShopItem('craft_nail', { cat = 'build', price = 3 })
octoinv.addShopItem('craft_stick', { cat = 'build', price = 2 })
octoinv.addShopItem('craft_plank', { cat = 'build', price = 10 })
octoinv.addShopItem('craft_pallet', { cat = 'build', price = 15 })
octoinv.addShopItem('craft_sheet', { cat = 'build', price = 80 })
octoinv.addShopItem('craft_spring', { cat = 'build', price = 9 })
octoinv.addShopItem('craft_pulley', { cat = 'build', price = 15 })
octoinv.addShopItem('craft_cable', { cat = 'build', price = 5 })
octoinv.addShopItem('craft_plug', { cat = 'build', price = 5 })
octoinv.addShopItem('craft_socket', { cat = 'build', price = 6 })
octoinv.addShopItem('craft_piston', { cat = 'build', price = 18 })
octoinv.addShopItem('craft_engine', { cat = 'build', price = 50 })
octoinv.addShopItem('craft_bulb', { cat = 'build', price = 5 })
octoinv.addShopItem('craft_chip1', { cat = 'build', price = 10 })
octoinv.addShopItem('craft_chip2', { cat = 'build', price = 45 })
octoinv.addShopItem('craft_cnc', { cat = 'build', price = 30 })
octoinv.addShopItem('craft_relay', { cat = 'build', price = 3 })
octoinv.addShopItem('craft_resistor', { cat = 'build', price = 4 })
octoinv.addShopItem('craft_transistor', { cat = 'build', price = 3 })
octoinv.addShopItem('craft_solar', { cat = 'build', price = 80 })
octoinv.addShopItem('craft_gauge', { cat = 'build', price = 45 })
octoinv.addShopItem('craft_scotch', { cat = 'build', price = 5 })
octoinv.addShopItem('craft_glue', { cat = 'build', price = 4 })
octoinv.addShopItem('craft_paper', { cat = 'build', price = 2 })
octoinv.addShopItem('craft_ink', { cat = 'everyday', price = 65 })
octoinv.addShopItem('ing_water', { cat = 'everyday', price = 3 })
octoinv.addShopItem('craft_battery', { cat = 'everyday', price = 40 })
octoinv.addShopItem('craft_battery2', { cat = 'everyday', price = 5 })

octoinv.addShopItem('craft_fuel', { cat = 'prod', price = 10 })
octoinv.addShopItem('craft_gas', { cat = 'prod', price = 40 })
octoinv.addShopItem('saltpeter', { cat = 'prod', price = 200 })

octoinv.addShopItem('bp_stove', { cat = 'blueprint', price = 15 })
octoinv.addShopItem('bp_fridge', { cat = 'blueprint', price = 15 })
octoinv.addShopItem('bp_refinery', { cat = 'blueprint', price = 15 })
octoinv.addShopItem('bp_smelter', { cat = 'blueprint', price = 15 })
octoinv.addShopItem('bp_machine', { cat = 'blueprint', price = 15 })
octoinv.addShopItem('bp_workbench', { cat = 'blueprint', price = 15 })

octoinv.addShopItem('bpd_stove', { cat = 'parts', price = 650 })
octoinv.addShopItem('bpd_fridge', { cat = 'parts', price = 250 })
octoinv.addShopItem('bpd_refinery', { cat = 'parts', price = 750 })
octoinv.addShopItem('bpd_smelter', { cat = 'parts', price = 600 })
octoinv.addShopItem('bpd_machine', { cat = 'parts', price = 650 })
octoinv.addShopItem('bpd_workbench', { cat = 'parts', price = 350 })
