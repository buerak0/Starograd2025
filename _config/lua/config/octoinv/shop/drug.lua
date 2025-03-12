--
-- CATEGORIES
--

octoinv.addShopCat('pharm', {
	name = L.pharm,
	icon = 'octoteam/icons/drug2.png',
	jobs = {'pharm', 'pharm2', 'paramedic'},
})

--
-- ITEMS
--

octoinv.addShopItem('drug_vitalex', { cat = 'pharm', price = 52 })
octoinv.addShopItem('drug_painkiller', { cat = 'pharm', price = 25 })
octoinv.addShopItem('drug_relaxant', { cat = 'pharm', price = 45 })
octoinv.addShopItem('drug_vampire', { cat = 'pharm', price = 75, jobs = {'pharm2'}})
octoinv.addShopItem('drug_dextradose', { cat = 'pharm', price = 60 })
octoinv.addShopItem('drug_roids', { cat = 'pharm', price = 45, jobs = {'pharm', 'pharm2'}})
octoinv.addShopItem('drug_bouncer', { cat = 'pharm', price = 135, jobs = {'pharm2'}})
octoinv.addShopItem('drug_antitoxin', { cat = 'pharm', price = 15 })
octoinv.addShopItem('drug_weed', { cat = 'pharm', price = 42 })
octoinv.addShopItem('drug_pingaz', { cat = 'pharm', price = 35 , jobs = {'pharm', 'pharm2'}})
octoinv.addShopItem('drug_preserver', { cat = 'pharm', price = 330, jobs = {'pharm2', 'paramedic'}})
-- octoinv.addShopItem('drug_meth', { cat = 'pharm', price = 100 })
