local licenses = {} -- Временное хранилище лицензий, использовать базу данных для реального приложения

-- Функция для сохранения лицензии
local function save_license(player)
    local player_id = player:SteamID() -- Используйте уникальный идентификатор игрока
    licenses[player_id] = true
    -- Сохранение в файл или базу данных
    file.Write("licenses/" .. player_id .. ".txt", "true")
end
