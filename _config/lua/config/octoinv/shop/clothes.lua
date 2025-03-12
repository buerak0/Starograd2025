octoinv.addShopCat('clothes', {
	name = 'Одежда',
	icon = 'octoteam/icons/clothes_tshirt.png',
})

octoinv.addShopCat('accessories', {
	name = 'Аксессуары',
	icon = 'octoteam/icons/clothes_cap.png',
})

local clothes = {
	-- common
    { 900, 'models/humans/male/group01/sweater151', 'octoteam/icons/clothes_jumper.png', 'Стильные Найк oldmoney', 'если вы стилист то эти найк вам подойдут' },
    { 700, 'models/humans/male/group01/clothes5comp/nikebelch', 'octoteam/icons/clothes_jumper.png', 'Найк красная и белая', 'супер пупер красная белая найк йоунига.' },
    { 800, 'models/humans/male/group01/clothes5comp/adidas1belch', 'octoteam/icons/clothes_jumper.png', 'Белая Кофта аддидас', 'ставь лайк если мама тебе такое покупала' },
    { 900, 'models/humans/male/group01/clothes5comp/5compxskirt', 'octoteam/icons/clothes_jumper.png', 'Красный свитер', 'для босса мафии это вообще отпад' },
    { 1100, 'models/humans/modern/octo/winter9_sheet', 'octoteam/icons/clothes_warm.png', 'Красная Донатная Куртка', 'Супер пупер классная куртка для человека который любит краймить!' },
    { 1200, 'models/humans/modern/octo/winter23_sheet', 'octoteam/icons/clothes_warm.png', 'Стонайлед зимняя куртка', 'если вы болеете аутизмом, и если вы любите огромные яички то это для вас!' },
    { 1100, 'models/humans/modern/octo/winter11_sheet', 'octoteam/icons/clothes_warm.png', 'Зимняя курта донат', 'Стильная одежда из доброграда украсит ваш стиль как игрока белогорска' },
    { 1300, 'benn1seater/evangelion', 'octoteam/icons/clothes_jumper.png', 'Кофта с Эвангилионом', 'Если любишь аниме то это для тебя' },
    { 1200, 'models/humans/modern/octo/halloween3_sheet', 'octoteam/icons/clothes_jumper.png', 'Рубашка красная для мужчин', 'Красная рубашка для мужчин будет указывать на ваш стиль' },
    { 1900, 'models/humans/male/group01/jimmy_clothes_belch', 'octoteam/icons/clothes_jumper.png', 'Кофта с Соником', 'Жесткий краймер с Соником - это отдельный вид искусства' },
    { 2000, 'benn1seater/randombomber', 'octoteam/icons/clothes_shirt.png', 'Черная весенняя куртка-бомбер', 'Черный бомбер' },
    { 1500, 'models/humans/modern/octo/ghetto08_sheet', 'octoteam/icons/clothes_shirt.png', 'Гангстерская Одежда MenAlfha', 'Прекрасная одежда для нигера или лучшего игрока, которая находится в донате' },
    { 1700, 'models/humans/modern/octo/ghetto05_sheet', 'octoteam/icons/clothes_shirt.png', 'Гангстерская Одежда ManDelta', 'Прекрасная одежда для нигера или лучшего  игрока, которая находится в донате' },
    { 1700, 'models/humans/modern/octo/ghetto06_sheet', 'octoteam/icons/clothes_shirt.png', 'Гангстерская одежда Manfarse', 'Прекрасная одежда для нигера или лучшего игрока, которая находится в донате' },
    { 1600, 'models/humans/modern/octo/ghetto02_sheet', 'octoteam/icons/clothes_shirt.png', 'Гангстерская ManForse', 'Прекрасная одежда для нигера или лучшего игрока, которая находится в донате' },
    { 1500, 'models/humans/modern/octo/ghetto01_sheet', 'octoteam/icons/clothes_shirt.png', 'Гангстерская ManVorse', 'Прекрасная одежда для нигера или лучшего игрока, которая находится в донате' },
    { 1700, 'models/humans/modern/octo/gentlemen_sheet_6', 'octoteam/icons/clothes_coat.png', 'Джентльменская Одежда Красная', 'Красивая джентльменская одежда, которая покорит сердца женщин!' },
    { 1700, 'models/humans/modern/octo/gentlemen_sheet_5', 'octoteam/icons/clothes_coat.png', 'Джентльменская Одежда Рубашка', 'Красивая джентльменская одежда, которая покорит сердца женщин!' },
    { 1700, 'models/humans/modern/octo/gentlemen_sheet_4', 'octoteam/icons/clothes_coat.png', 'Джентльменская Одежда Синяя', 'Красивая джентльменская одежда, которая покорит сердца женщин!' },
    { 1700, 'models/humans/modern/octo/gentlemen_sheet_3', 'octoteam/icons/clothes_coat.png', 'Джентльменская Одежда Красная', 'Красивая джентльменская одежда, которая покорит сердца женщин!' },
    { 1700, 'models/humans/modern/octo/gentlemen_sheet_1', 'octoteam/icons/clothes_coat.png', 'Джентльменская Одежда Серая', 'Красивая джентльменская одежда, которая покорит сердца женщин!' },
    { 1700, 'models/humans/modern/octo/gentlemen_sheet_2', 'octoteam/icons/clothes_coat.png', 'Джентльменская Одежда', 'Красивая джентльменская одежда, которая покорит сердца женщин!' },
    { 1800, 'models/humans/male/group01/rigocchitailcoat', 'octoteam/icons/clothes_coat.png', 'Костюм Официанта', 'Костюм официанта, создан для официантов, лучше чем просить админов?' },
    { 1700, 'models/humans/male/group01/rigocchiuniform', 'octoteam/icons/clothes_tshirt.png', 'Черный Элегантный', 'Прекрасный костюм для таких как вы, чёрный смокинг, который описывает вас' },
    { 1600, 'models/humans/male/group01/vincenzosuit', 'octoteam/icons/clothes_tshirt.png', 'Белый Аристократ', 'То чувство, когда пришёл на экзамен и ты самый крутой в городе' },
    { 1800, 'models/humans/male/group01/american_tommy_vercetti_underlord', 'octoteam/icons/clothes_jacket.png', 'Костюм Версетти', 'Синяя рубашка главного героя ГТА Вайс Сити' },
	{ 1900, 'models/humans/modern/octo/standart1_sheet', 'octoteam/icons/clothes_jacket.png', 'Костюм "Gotu"', 'Бордовая куртка с белой футболкой, черные джинсы, белые кроссовки с синими полосами по бокам' },
	{ 2000, 'models/humans/modern/octo/standart2_sheet', 'octoteam/icons/clothes_jacket.png', 'Костюм "Edward"', 'Коричневая куртка с черным свитером и белой футболкой, темно-синие джинсы с кожаным ремнем и черными ботинками' },
	{ 2450, 'models/humans/modern/octo/standart3_sheet', 'octoteam/icons/clothes_shirt.png', 'Костюм "Gentleman"', 'Синее полупальто с белой футболкой, черные штаны, коричневые ботинки' },
	{ 2300, 'models/humans/modern/octo/standart4_sheet', 'octoteam/icons/clothes_shirt.png', 'Костюм "Frant"', 'Черный пиджак с серым свитером, серые джинсы, черные туфли' },
	{ 1450, 'models/humans/modern/octo/standart5_sheet', 'octoteam/icons/clothes_jumper.png', 'Зеленая рубашка', 'Зеленая рубашка с белой футболкой с длинным рукавом, серые штаны, коричневые ботинки' },
	{ 2000, 'models/humans/modern/octo/standart6_sheet', 'octoteam/icons/clothes_jacket.png', 'Кожанка "Belić"', 'Коричневая кожаная куртка с бежевой футболкой и бело-желтой олимпийкой, полуперчатки, синие штаны, белые кроссовки с синими полосками по бокам' },
	{ 2000, 'models/humans/modern/octo/standart7_sheet', 'octoteam/icons/clothes_jacket.png', 'Кожанка "Niko"', 'Черная кожаная куртка с синей рубашкой и бежевой футболкой, черные штаны, черные ботинки' },
	{ 1600, 'models/humans/modern/octo/standart8_sheet', 'octoteam/icons/clothes_jumper.png', 'Костюм "Bro3s"', 'Серая кофта с белой футболкой, штаны в раскраске "камо", коричневые ботинки' },
	{ 1750, 'models/humans/modern/octo/standart9_sheet', 'octoteam/icons/clothes_jacket.png', 'Голубая клетчатая рубашка', 'Клетчатая рубашка в голубых тонах с серой футболкой с длинными рукавами, бежевые джинсы, черные кроссовки с белым ободом ' },
	{ 1750, 'models/humans/modern/octo/standart10_sheet', 'octoteam/icons/clothes_jacket.png', 'Красная клетчатая рубашка', 'Клетчатая красная рубашка с зеленой футболкой с длинными рукавами, голубые джинсы, коричневые ботинки с белым ободом' },
	{ 2650, 'models/humans/modern/octo/standart11_sheet', 'octoteam/icons/clothes_jacket.png', 'Байкер "Wolf"', 'Коричневая куртка с белой футболкой, полуперчатки, серые джинсы, коричневые ботинки' },
	{ 2850, 'models/humans/modern/octo/standart12_sheet', 'octoteam/icons/clothes_jacket.png', 'Классический байкер', 'Черная кожаная куртка с белыми полосами, полуперчатки, синими джинсами и белыми кроссовками' },
	{ 2350, 'models/humans/modern/octo/standart13_sheet', 'octoteam/icons/clothes_jacket.png', 'Сельский байкер', 'Красная клетчатая рубашка с оранжевым жилетом и белой футболкой, серые джинсы, черные ботинки' },
	{ 2350, 'models/humans/modern/octo/standart14_sheet', 'octoteam/icons/clothes_jumper.png', 'Степной байкер', 'Зеленая клетчатая рубашка с черно-бежевым жилетом и черной футболкой, черные джинсы, коричневые ботинки' },
	{ 2050, 'models/humans/modern/octo/standart15_sheet', 'octoteam/icons/clothes_jacket.png', 'Костюм "Arlo"', 'Желтая кофта с черным жилетом, голубые джинсы, черные ботинки' },
	{ 1950, 'models/humans/modern/octo/standart16_sheet', 'octoteam/icons/clothes_jumper.png', 'Джинсовый костюм', 'Джинсовая куртка с белой футболкой, голубые джинсы, коричневые ботинки' },
	{ 2250, 'models/humans/modern/octo/standart17_sheet', 'octoteam/icons/clothes_jacket.png', 'Костюм "CityLife"', 'Джинсовая куртка, серый худи, синие джинсы, белые кроссовки' },
	{ 1750, 'models/humans/modern/octo/standart18_sheet', 'octoteam/icons/clothes_jacket.png', 'Костюм "Dandy"', 'Клетчатая рубашка в синих тонах с серой футболкой с принтом, голубые джинсы, черные кроссовки' },
	{ 2600, 'models/humans/modern/octo/standart19_sheet', 'octoteam/icons/clothes_jacket.png', 'Костюм "Tommy"', 'Темно-синяя толстовка с белой футболкой, синие джинсы, черные кроссовки' },
	{ 1750, 'models/humans/modern/octo/standart20_sheet', 'octoteam/icons/clothes_jacket.png', 'Голубая поло', 'Голубая рубашка поло, черные джинсы, черные ботинки' },
	{ 2100, 'models/humans/modern/octo/standart21_sheet', 'octoteam/icons/clothes_jacket.png', 'Костюм "Retro"', 'Бирюзовая олимпийка с зеленой рубашкой поло, голубые джинсы, черные ботинки' },
	{ 2050, 'models/humans/modern/octo/standart22_sheet', 'octoteam/icons/clothes_jacket.png', 'Худи "Polo"', 'Серая толстовка с принтом, черные джинсы, коричневые ботинки' },
	{ 2000, 'models/humans/modern/octo/standart23_sheet', 'octoteam/icons/clothes_jumper.png', 'Худи "Nike SB"', 'Черный худи с принтом, синие джинсы, черные кроссовки' },
	{ 1750, 'models/humans/modern/octo/sport1_sheet', 'octoteam/icons/clothes_jumper.png', 'Худи "In The Hood"', 'Черная кофта с белой футболкой, черные штаны, черные кроссовки' },
	{ 2000, 'models/humans/modern/octo/sport2_sheet', 'octoteam/icons/clothes_tshirt.png', 'Зеленый спортивный костюм', 'Черно-зеленая куртка с белой футболкой, черные штаны, черные кроссовки' },
	{ 2150, 'models/humans/modern/octo/sport3_sheet', 'octoteam/icons/clothes_tshirt.png', 'Красный спортивный костюм', 'Черно-оранжевая куртка с белой футболкой, голубые джинсы, белые кроссовки' },
	{ 1550, 'models/humans/modern/octo/sport4_sheet', 'octoteam/icons/clothes_tshirt.png', 'Костюм "Jordan"', 'Белая кофта с символикой Jordan в центре и черной футболкой, темные брюки, оранжевые кроссовки' },
	{ 1850, 'models/humans/modern/octo/sport5_sheet', 'octoteam/icons/clothes_jumper.png', 'Худи "Banana"', 'Голубая кофта с изображением банана в центре и белой футболкой, коричневые штаны, белые кроссовки' },
	{ 2350, 'models/humans/modern/octo/sport6_sheet', 'octoteam/icons/clothes_tshirt.png', 'Черный спортивный костюм', 'Черная куртка с белыми полосами на руках и белой футболкой, черные штаны, черные кроссовки' },
	{ 2250, 'models/humans/modern/octo/sport7_sheet', 'octoteam/icons/clothes_tshirt.png', 'Синий спортивный костюм', 'Голубая куртка с белой футболкой, голубые штаны, черные кроссовки' },
	{ 2050, 'models/humans/modern/octo/sport8_sheet', 'octoteam/icons/clothes_jumper.png', 'Костюм "Marce"', 'Серая толстовка с белой футболкой, черные брюки, черные кроссовки' },
	{ 2200, 'models/humans/modern/octo/sport9_sheet', 'octoteam/icons/clothes_tshirt.png', 'Синий костюм Adidas', 'Сине-голубая куртка с белой футболкой, темно-синие штаны, белые кроссовки' },
	{ 2400, 'models/humans/modern/octo/sport10_sheet', 'octoteam/icons/clothes_tshirt.png', 'Зеленый костюм Adidas', 'Черно-зеленая куртка с белой футболкой, черные штаны, белые кроссовки' },
	{ 1900, 'models/humans/modern/octo/sport11_sheet', 'octoteam/icons/clothes_tshirt.png', 'Красный костюм Adidas', 'Красный спортивный костюм, белые кроссовки' },
	{ 2000, 'models/humans/modern/octo/sport12_sheet', 'octoteam/icons/clothes_tshirt.png', 'Костюм "Kappa"', 'Черный спортивный костюм с принтами по бокам, белые кроссовки' },
	{ 2350, 'models/humans/modern/octo/sport13_sheet', 'octoteam/icons/clothes_tshirt.png', 'Зеленый костюм Nike', 'Зелено-серая куртка, белая футболка с принтом, зеленые штаны, белые кроссовки' },
	{ 2500, 'models/humans/modern/octo/sport14_sheet', 'octoteam/icons/clothes_tshirt.png', 'Черный костюм Nike', 'Черно-серая куртка, черная футболка с принтом, черные штаны, белые кроссовки' },
	{ 7000, 'models/humans/modern/octo/suit1_sheet', 'octoteam/icons/clothes_coat.png', 'Костюм "D\'Anglere"', 'Синий деловой костюм в полосочку с белой рубашкой, красным галстуком и черными туфлями' },
	{ 6000, 'models/humans/modern/octo/suit2_sheet', 'octoteam/icons/clothes_coat.png', 'Черный деловой костюм', 'Черный деловой костюм с белой рубашкой, черным галстуком и черными туфлями' },
	{ 8000, 'models/humans/modern/octo/suit3_sheet', 'octoteam/icons/clothes_coat.png', 'Белый деловой костюм', 'Белый деловой костюм с черной рубашкой, желтым галстуком и черными туфлями' },
	{ 6500, 'models/humans/modern/octo/suit4_sheet', 'octoteam/icons/clothes_coat.png', 'Серый деловой костюм', 'Серый деловой костюм с голубой рубашкой, желтым галстуком и серыми туфлями' },
	{ 7500, 'models/humans/modern/octo/suit5_sheet', 'octoteam/icons/clothes_coat.png', 'Зеленый деловой костюм', 'Зеленый деловой костюм с белой рубашкой, зеленым галстуком и черными туфлями' },
	{ 7200, 'models/humans/modern/octo/suit6_sheet', 'octoteam/icons/clothes_coat.png', 'Голубой деловой костюм', 'Голубой деловой костюм с красной рубашкой, синим галстуком и коричневыми туфлями' },
	{ 4500, 'models/humans/modern/octo/suit7_sheet', 'octoteam/icons/clothes_coat.png', 'Черный пиджак', 'Черный пиджак с белой рубашкой, черные брюки и черные туфли' },
	{ 4700, 'models/humans/modern/octo/suit8_sheet', 'octoteam/icons/clothes_coat.png', 'Синий пиджак', 'Синий пиджак с белой рубашкой, синие брюки и черные туфли' },
}

for i, data in ipairs(clothes) do
	local price, mat, icon, name, desc = unpack(data)
	octoinv.addShopItem('clothes' .. i, {
		cat = 'clothes',
		name = name,
		desc = desc,
		plyMat = mat,
		icon = icon,
		item = 'clothes_custom',
		price = price,
		data = {
			name = name,
			desc = desc,
			icon = icon,
			mat = mat,
			mass = 1.5,
			volume = 5,
		},
	})
end

for class, data in pairs(CFG.masks) do
	if not data.price then continue end
	octoinv.addShopItem(class, {
		cat = 'accessories',
		name = data.name,
		desc = data.desc,
		skin = data.skin,
		item = 'h_mask',
		icon = data.icon,
		price = data.price,
		data = {
			name = data.name,
			icon = data.icon,
			model = data.mdl,
			mask = class,
			mass = 0.3,
			volume = 0.3,
		},
	})
end

local forbiddenSubmats = {}
for _, data in ipairs(clothes) do forbiddenSubmats[data[2]] = true end
hook.Add('submaterial.canUseOnPlayer', 'dbg-clothes', function(ply, target, mat)
	if forbiddenSubmats[mat] and not ply:IsAdmin() then return false end
end)
