--[[
	© 2017 Thriving Ventures Limited do not share, re-distribute or modify

	without permission of its author (gustaf@thrivingventures.com).
]]

--- ## Shared
-- Provides support for languages through the use of phrases.
-- @module serverguard.phrase

serverguard.phrase = serverguard.phrase or {
	currentLanguage = "russian"
};

local languages = {};

--- Adds a language that phrases can use.
-- @string language The name of the language.
function serverguard.phrase:AddLanguage(language)
	languages[language] = {};
end;

--- Sets the language used for phrases.
-- @string language The name of the language.
function serverguard.phrase:SetLanguage(language)
	if (!languages[language]) then
		return;
	end;

	self.currentLanguage = language;
end;

--- Adds a phrase to the specified language. Supports string formatting with %s, etc.
-- @string language The name of the language.
-- @string unique The unique ID of the phrase.
-- @param format A string or table of strings/notify constants.
-- @usage serverguard.phrase:Add("english", "test_phrase", "This is a test.");
-- @usage serverguard.phrase:Add("english", "another_phrase", "This one has some %s formatting!");
-- @usage serverguard.phrase:Add("english", "test_phrase_three", {SERVERGUARD.NOTIFY.GREEN, "This", SERVERGUARD.NOTIFY.WHITE, " has some ", SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " formatting."});
function serverguard.phrase:Add(language, unique, format)
	if (!languages[language]) then
		return;
	end;

	languages[language][unique] = format;
end;

--- Adds languages and phrases specified in the table. See modules/sh_phrase.lua for an example table.
-- @table data Table of languages and phrases.
function serverguard.phrase:AddTable(data)
	for languageUnique, language in pairs(data) do
		if (!languages[language]) then
			self:AddLanguage(languageUnique);
		end;

		for phraseUnique, phrase in pairs(language) do
			self:Add(languageUnique, phraseUnique, phrase);
		end;
	end;
end;

--- Returns the text from a phrase.
-- @string unique The unique ID of the phrase.
-- @param ...[opt] Any parameters that the phrase may need.
-- @treturn string The text from the phrase.
function serverguard.phrase:Get(unique, ...)
	if (!languages[self.currentLanguage][unique]) then
		return "";
	end;

	local phrase = languages[self.currentLanguage][unique];
	local result = "";

	if (type(phrase) == "table") then
		for k, v in pairs(phrase) do
			if (type(v) == "string") then
				result = result .. v;
			end;
		end;
	else
		result = phrase;
	end;

	return string.format(result, ...);
end;

--- Returns the notify-formatted text from a phrase.
-- @string unique The unique ID of the phrase.
-- @param ...[opt] Any parameters that the phrase may need.
-- @treturn table A table formatted for use with serverguard.Notify().
-- @see SGPF
-- @see serverguard.Notify
function serverguard.phrase:GetFormatted(unique, ...)
	if (!languages[self.currentLanguage][unique]) then
		return {SERVERGUARD.NOTIFY.WHITE, ""};
	end;

	local phrase = languages[self.currentLanguage][unique];

	if (type(phrase) == "string") then
		return {SERVERGUARD.NOTIFY.WHITE, phrase};
	end;

	local arguments = {...};
	local currentArgument = 1;
	local result = {};

	for k, v in pairs(phrase) do
		if (type(v) != "string") then
			result[#result + 1] = v;
			continue;
		end;

		if (string.find(v, "%", 0, true)) then
			local argument = arguments[currentArgument];

			if (type(argument) == "table") then
				for k2, v2 in pairs(argument) do
					result[#result + 1] = v2;
				end;

				currentArgument = currentArgument + 1;
			else
				result[#result + 1] = string.format(v, arguments[currentArgument]);
				currentArgument = currentArgument + 1;
			end;

			continue;
		end;

		result[#result + 1] = v;
	end;

	return unpack(result);
end;

--- A shorthand function for serverguard.phrase:Get().
-- @string unique The unique ID of the phrase.
-- @param ...[opt] Any parameters that the phrase may need.
-- @see serverguard.phrase:Get
function SGP(unique, ...)
	return serverguard.phrase:Get(unique, ...);
end;

--- A shorthand function for serverguard.phrase:GetFormatted().
-- @string unique The unique ID of the phrase.
-- @param ...[opt] Any parameters that the phrase may need.
-- @see serverguard.phrase:GetFormatted
-- @usage serverguard.Notify(nil, SGFP("test_phrase_three", "awesome"));
function SGPF(unique, ...)
	return serverguard.phrase:GetFormatted(unique, ...);
end;

serverguard.phrase:AddTable({
	russian = {
		player_cant_find_suitable = {SERVERGUARD.NOTIFY.RED, "Не удалось применить команду на указанном игроке!"},
		player_found_multiple = {SERVERGUARD.NOTIFY.RED, "Найдено несколько игроков с ником \"%s\"!"},
		player_higher_immunity = {SERVERGUARD.NOTIFY.RED, "У этого игрока иммунитет выше твоего!"},
		cant_find_location = {SERVERGUARD.NOTIFY.RED, "Не удалось найти подходящее место"},
		cant_find_player_with_identifier = {SERVERGUARD.NOTIFY.RED, "Не удалось найти игроков с таким ником"},
		restricted = {SERVERGUARD.NOTIFY.RED, "Тебе запрещено пользоваться этой функцией еще %s"},

		exceed_short_duration = {SERVERGUARD.NOTIFY.RED, "Ты ввел длительность, которая тебе недоступна. Используй дни (d) или минуты (m)!"},
		exceed_max_length = {SERVERGUARD.NOTIFY.RED, "Нельзя указать срок более чем %s при выдаче данного вида наказания!"},

		-- Command phrases.
		command_ban_invalid_duration = {SERVERGUARD.NOTIFY.RED, "Неверно введена длительность! Попробуй ввести число и добавить к нему идентификатор длительности. Например, 1w2d12h - 1 неделя, 2 дня и 12 часов"},
		command_ban_exceed_banlimit = {SERVERGUARD.NOTIFY.RED, "Твой ранг не позволяет использовать выдавать такие долгие баны! Попробуй ввести число, меньшее чем %s"},
		command_ban_cannot_permaban = {SERVERGUARD.NOTIFY.RED, "У тебя нет доступа к перманентной блокировке!"},
		command_ban_clamped_duration = {SERVERGUARD.NOTIFY.RED, "Числовое значение длительности не может быть больше 99"},
		command_ban = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " забанил ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, " на ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, " Причина: %s"},
		command_ban_perma = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " забанил ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, ",", SERVERGUARD.NOTIFY.RED, " перманентно", SERVERGUARD.NOTIFY.WHITE, ". Причина: %s"},

		command_unban = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " разбанил ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_no_entry = {SERVERGUARD.NOTIFY.RED, "Этот игрок не заблокирован!"},

		command_rank = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " установил игроку ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, "%s ранг ", SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " на срок ", SERVERGUARD.NOTIFY.RED, "%s"},
		command_rank_invalid_immunity = {SERVERGUARD.NOTIFY.RED, "У ранга, который ты пытаешься установить, больший иммунитет, чем у твоего!"},
		command_rank_invalid_unique = {SERVERGUARD.NOTIFY.RED, "Ранга с идентификатором \"%s\" не существует"},
		command_rank_valid_list = {SERVERGUARD.NOTIFY.RED, "Существуют следующие ранги: %s"},
		command_rank_cannot_set_own = {SERVERGUARD.NOTIFY.RED, "Невозможно установить свой же ранг внутри игры!"},

		command_goto = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " телепортировался к ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_bring = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " телепортировал ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, " к себе"},

		command_send_player = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " телепортировал ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, " к ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_send = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " телепортировал ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, " к себе"},

		command_return = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " был возвращен на предыдущее место"},
		command_return_invalid = {SERVERGUARD.NOTIFY.RED, "Нельзя вернуть игрока, поскольку он никуда не телепортировался!"},

		command_admintalk = {SERVERGUARD.NOTIFY.WHITE, "Отправил сообщение в админ-чат"},
		command_admintalk_invalid = {SERVERGUARD.NOTIFY.WHITE, "Сейчас нет админов онлайн"},

		command_god = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " включил бессмертие ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_god_disable = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " отключил бессмертие ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE}, 

		command_ignite = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " поджег ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_extinguish = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " потушил ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},

		command_spectate = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " начал следить за ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_spectate_invalid = {SERVERGUARD.NOTIFY.RED, "Любишь быть в центре внимания?"},
		command_spectate_hint = {SERVERGUARD.NOTIFY.WHITE, "Нажми на клавишу приседания, чтобы выйти из наблюдения"},

		command_jail = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " поместил в джайл ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, " на ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_unjail = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " выпустил из джайла ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_jailtp = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " телепротировал и поместил в джайл ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, " на ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},

		command_kick = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " кикнул ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, ". Причина: %s"},
		command_maprestart = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " перезапускает карту через ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, " сек!"},
		command_freezeprops = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " зафризил все пропы на карте"},
		command_stripweapons = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " очистил все оружие у ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_respond_invalid = {SERVERGUARD.NOTIFY.RED, "Этот игрок не подавал запроса к администрации!"},
		command_slay = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " убил ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_giveweapon = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " выдал ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, " оружие ", SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_armor = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " установил броню ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, " на ", SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_hp = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " установил здоровье ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, " на ", SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_respawn = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " заспавнил ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_ammo = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " выдал ", SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " патронов ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_slap = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " пнул ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_npctarget = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " переключил NPC-таргетинг на игрока ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_cleardecals = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " очистил все декали на карте"},
		command_ragdoll = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " переключил режим рэгдолла игрока ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_mute = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " выдал бан чата ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, " на ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_mute_ooc = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " выдал бан OOC-чата ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, " на ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_mute_looc = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " выдал бан LOOC-чата ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, " на ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_mute_goo = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " отключил говорилку ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, " на ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_unmute = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " снял бан чата ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_unmute_ooc = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " снял бан OOC-чата ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_unmute_looc = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " снял бан LOOC-чата ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_unmute_goo = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " снял запрет на говорилку ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_invisible = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " переключил невидимость игрока ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_freeze = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " переключил фриз игрока ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_noclip = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " переключил полет игрока ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_gag = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " выдал бан войс-чата ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, " на ", SERVERGUARD.NOTIFY.RED, "%s"},
		command_ungag = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " снял бан войс-чата ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_restrict = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " запретил использование ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, "%s функций ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
		command_unrestrict = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " снял запрет на использование ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE, "%s функций"},

		command_nocollide = {SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, " переключил коллизию игрока ", SERVERGUARD.NOTIFY.RED, "%s", SERVERGUARD.NOTIFY.WHITE},
	}
});
