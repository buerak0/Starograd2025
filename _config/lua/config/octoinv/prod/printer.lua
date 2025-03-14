 octoinv.registerProd('printer', {
 	name = L.printer,
 	icon = 'octoteam/icons/atm.png',
 	destruct = {
		{'craft_screw2', 20},
 		{'craft_screwnut', 20},
 	},
 	fuel = {
		printer = {craft_battery = 30 * 60},
 	},
 	sounds = {
 		loop = 'octoinv.prod16',
 		work = 'octoinv.prod17',
	},
 	explode = {80, 100},
 	health = 60,
 })

 octoinv.registerProcess('printer', {
 	time = 90,
	ins = {printer = {{'craft_paper2', 2}}, printer_cart = {{'craft_ink', 1}}},
 	out = {printer = {{'money', 1500}}},
 })
