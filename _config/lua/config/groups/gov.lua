local suit = 'models/humans/modern/octo/suit1_sheet'

local models = octolib.table.mapSequential({
	{ 'models/humans/octo/male_01_01.mdl', 3},
	{ 'models/humans/octo/male_01_02.mdl', 3},
	{ 'models/humans/octo/male_01_03.mdl', 3},
	{ 'models/humans/octo/male_02_01.mdl', 2},
	{ 'models/humans/octo/male_02_02.mdl', 2},
	{ 'models/humans/octo/male_02_03.mdl', 2},
	{ 'models/humans/octo/male_03_01.mdl', 4},
	{ 'models/humans/octo/male_03_02.mdl', 4},
	{ 'models/humans/octo/male_03_03.mdl', 4},
	{ 'models/humans/octo/male_03_04.mdl', 4},
	{ 'models/humans/octo/male_03_05.mdl', 4},
	{ 'models/humans/octo/male_03_06.mdl', 4},
	{ 'models/humans/octo/male_03_07.mdl', 4},
	{ 'models/humans/octo/male_04_01.mdl', 4},
	{ 'models/humans/octo/male_04_02.mdl', 4},
	{ 'models/humans/octo/male_04_03.mdl', 4},
	{ 'models/humans/octo/male_04_04.mdl', 4},
	{ 'models/humans/octo/male_05_01.mdl', 4},
	{ 'models/humans/octo/male_05_02.mdl', 4},
	{ 'models/humans/octo/male_05_03.mdl', 4},
	{ 'models/humans/octo/male_05_04.mdl', 4},
	{ 'models/humans/octo/male_05_05.mdl', 4},
	{ 'models/humans/octo/male_06_01.mdl', 4},
	{ 'models/humans/octo/male_06_02.mdl', 4},
	{ 'models/humans/octo/male_06_03.mdl', 4},
	{ 'models/humans/octo/male_06_04.mdl', 4},
	{ 'models/humans/octo/male_06_05.mdl', 4},
	{ 'models/humans/octo/male_07_01.mdl', 4},
	{ 'models/humans/octo/male_07_02.mdl', 4},
	{ 'models/humans/octo/male_07_03.mdl', 4},
	{ 'models/humans/octo/male_07_04.mdl', 4},
	{ 'models/humans/octo/male_07_05.mdl', 4},
	{ 'models/humans/octo/male_07_06.mdl', 4},
	{ 'models/humans/octo/male_08_01.mdl', 0},
	{ 'models/humans/octo/male_08_02.mdl', 0},
	{ 'models/humans/octo/male_08_03.mdl', 0},
	{ 'models/humans/octo/male_08_04.mdl', 0},
	{ 'models/humans/octo/male_09_01.mdl', 2},
	{ 'models/humans/octo/male_09_02.mdl', 2},
	{ 'models/humans/octo/male_09_03.mdl', 2},
	{ 'models/humans/octo/male_09_04.mdl', 2},
}, function(v,i)
	return {
		name = 'Внешность ' .. i,
		male = true,
		model = v[1],
		requiredMats = { [v[2]] = suit },
	}
end)

simpleOrgs.addOrg('gov', {
	name = 'Мэрия',
	title = 'Работа в Мэрии',
	shortTitle = 'Работа в Мэрии',
	team = 'mayor',
	talkieFreq = 'gov',
    gov = true,
	rankOrder = { 'worker', 'mayor' },
	multirank = true,
	ranks = {
		worker = {
			shortName = 'Сотрудник',
			name = 'Сотрудник Мэрии',
			mdls = models,
			icon = octolib.icons.silk16('draw_star'),
		},
		mayor = {
			shortName = 'Мэр',
			name = 'Мэр',
			mdls = models,
			icon = octolib.icons.silk16('star'),
		},
	}
})
