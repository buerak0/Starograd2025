-- Функция для загрузки лицензии
local function load_license(player)
    local player_id = player:SteamID()
    -- Чтение из файла или базы данных
    local license = file.Read("licenses/" .. player_id .. ".txt", "DATA")
    if license then
        licenses[player_id] = true
    end
    licenses[player_id] = true -- Восстанавливаем из временного хранилища для примера
end
