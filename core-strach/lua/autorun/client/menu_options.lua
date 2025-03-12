local function PopulateSBXToolMenu(pnl)
    pnl:CheckBox("Suppression Enabled", "suppression_enabled")
    pnl:ControlHelp("Enable or disable the suppression entierly.")

    pnl:CheckBox("Viewpunch Enabled", "suppression_viewpunch")
    pnl:ControlHelp("Enable or disable the viewpunch.")

    pnl:CheckBox("Suppression Cover Enabled", "suppression_enable_cover")
    pnl:ControlHelp("Enable or disable the suppression behind cover.")

    pnl:CheckBox("Sharpen Enabled", "suppression_sharpen")
    pnl:ControlHelp("Enable or disable the sharpen.")

    pnl:CheckBox("Explosion Supression Enabled", "suppression_viewpunch_explosion")
    pnl:ControlHelp("Enable or disable suppression caused by explosions (happens above 30 damage).")

    pnl:CheckBox("Blur Enabled", "suppression_blur")
    pnl:ControlHelp("Enable or disable the blur.")

    pnl:CheckBox("Bloom Enabled", "suppression_bloom")
    pnl:ControlHelp("Enable or disable the bloom.")

    pnl:CheckBox("Gasp Enabled", "suppression_gasp_enabled")
    pnl:ControlHelp("Enable or disable the gasp.")

    pnl:CheckBox("Work in Vehicles Enabled", "suppression_enable_vehicle")
    pnl:ControlHelp("Enable or disable suppression in vehicles.")

    pnl:CheckBox("Sound muffle", "suppression_muffle")
    pnl:ControlHelp("Enable or disable muffling the sound on 70% suppression state.")

    pnl:NumSlider("Suppression Buildup", "suppression_buildupspeed", 0, 3, 1)
    pnl:ControlHelp("Suppression effect buildup speed intensity value")

    pnl:NumSlider("Suppression Volume", "suppression_sound_volume", 0, 2, 1)
    pnl:ControlHelp("Determines the volume of bullet snap sounds and gasping.")

    pnl:NumSlider("Suppression Vignette Size", "suppression_vignette_size", 0, 3, 1)
    pnl:ControlHelp("Suppression vignette size mult")
    
    pnl:NumSlider("Blur Intensity", "suppression_blur_intensity", 0, 3, 1)
    pnl:ControlHelp("Suppression blur intensity value")
    
    pnl:NumSlider("Viewpunch Intensity", "suppression_viewpunch_intensity", 0, 3, 1)
    pnl:ControlHelp("Suppression viewpunch effect intensity value")

    pnl:NumSlider("Sharpen Intensity", "suppression_sharpen_intensity", 0, 3, 1)
    pnl:ControlHelp("Suppression sharpen effect intensity value")

    pnl:NumSlider("Bloom Intensity", "suppression_bloom_intensity", 0, 3, 1)
    pnl:ControlHelp("Suppression bloom effect intensity value")
end

if engine.ActiveGamemode() == "sandbox" or engine.ActiveGamemode() == "darkrp" then
    hook.Add("AddToolMenuCategories", "SupressionMenuAdd", function() 
        spawnmenu.AddToolCategory("Options", "Suppression", "Suppression")
    end)

    hook.Add("PopulateToolMenu", "SupressionMenu", function() 
        spawnmenu.AddToolMenuOption("Options", "Suppression", "SuppressionSettings", "Settings", "", "", function(pnl)
            pnl:ClearControls()
            PopulateSBXToolMenu(pnl)
        end)
    end)
end