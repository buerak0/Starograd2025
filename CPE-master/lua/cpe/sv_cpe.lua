--[[-------------------------------------------------------------------------
                        CPE Public Version.


Status: Work in progress. (I try my best to fix bugs)

TODO: SERVERSIDE: -Optimize whitelist.
                  -Finish Net Firewall (I'm so lazyy.. don't think you'll see that coming unless i'm bored af)
                  -Tostring the exploitable list --> DONE
                  -Check whitelist for bypass check --> DONE
      
      CLIENTSIDE: -Finish Net Firewall (I'm so lazyy.. don't think you'll see that coming unless i'm bored af)

---------------------------------------------------------------------------]]

local g = table.Copy(_G)
local CPE = {}
CPE.RequestLogs = {}
CPE.NetLogs = {}
CPE.DetectionTable = {}
CPE.WhitelistTable = {}
CPE.SavedNets = {}
CPE.DetourTable = {}
CPE.SpoofID = {}
CPE.RunIDBlacklist = {
    ["lua_error"] = true,
    ["SDATA"] = true,
    ["0xFFFFFFFF"] = true
}
CPE.URLBlacklist = {".cz", ".cf", ".000webhost"}
CPE.SaveFile = "cpe_whitelist.txt"
CPE.Reason = "[CPE] Tried to use a backdoored net."
CPE.LogCode = true

--Thanks SNTE
CPE.exploitable = {
    ["vj_testentity_runtextsd"]                 = true,
    ["ARMORY_RetrieveWeapon"]                   = true,
    ["RP_Fine_Player"]                          = true,
    ["SCP-294Sv"]                               = true,
    ["_nonDBVMVote"]                            = true,
    ["reports.submit"]                          = true,
    ["ply_pick_shit"]                           = true,
    ["D3A_CreateOrg"]                           = true,
    ["textstickers_entdata"]                    = true,
    ["ATS_WARP_FROM_CLIENT"]                    = true,
    ["ViralsScoreboardAdmin"]                   = true,
    ["DarkRP_Defib_ForceSpawn"]                 = true,
    ["duelrequestguiYes"]                       = true,
    ["DL_StartReport"]                          = true,
    ["TalkIconChat"]                            = true,
    ["gBan.BanBuffer"]                          = true,
    ["cab_cd_testdrive"]                        = true,
    ["GiveSCP294Cup"]                           = true,
    ["AcceptBailOffer"]                         = true,
    ["pac_submit"]                              = true,
    ["drugs_ignite"]                            = true,
    ["DeployMask"]                              = true,
    ["1942_Fuhrer_SubmitCandidacy"]             = true,
    ["ATS_WARP_REMOVE_CLIENT"]                  = true,
    ["MONEY_SYSTEM_GetWeapons"]                 = true,
    ["SwapFilter"]                              = true,
    ["nCTieUpStart"]                            = true,
    ["SendSteamID"]                             = true,
    ["shopguild_buyitem"]                       = true,
    ["hsend"]                                   = true,
    ["PurchaseWeed"]                            = true,
    ["pac_to_contraption"]                      = true,
    ["redirectMsg"]                             = true,
    ["BM2.Command.Eject"]                       = true,
    ["ncpstoredoact"]                           = true,
    ["sellitem"]                                = true,
    ["lockpick_sound"]                          = true,
    ["RXCAR_Shop_Store_C2S"]                    = true,
    ["PCDelAll"]                                = true,
    ["UseMedkit"]                               = true,
    ["dlib.getinfo.replicate"]                  = true,
    ["pogcp_report_submitReport"]               = true,
    ["rpi_trade_end"]                           = true,
    ["uPLYWarning"]                             = true,
    ["GMBG:PickupItem"]                         = true,
    ["updateLaws"]                              = true,
    ["Hopping_Test"]                            = true,
    ["Warn_CreateWarn"]                         = true,
    ["tickbookpayfine"]                         = true,
    ["DL_Answering"]                            = true,
    ["plyWarning"]                              = true,
    ["atlaschat.rqclrcfg"]                      = true,
    ["DL_ReportPlayer"]                         = true,
    ["ActivatePC"]                              = true,
    ["drugseffect_hpremove"]                    = true,
    ["SendMoney"]                               = true,
    ["unarrestPerson"]                          = true,
    ["BuyCar"]                                  = true,
    ["buyinghealth"]                            = true,
    ["bringNfreeze"]                            = true,
    ["drugs_money"]                             = true,
    ["AcceptRequest"]                           = true,
    ["DailyLoginClaim"]                         = true,
    ["LAWYER.GetBailOut"]                       = true,
    ["LB_AddBan"]                               = true,
    ["userAcceptPrestige"]                      = true,
    ["GiveHealthNPC"]                           = true,
    ["TakeBetMoney"]                            = true,
    ["TCBBuyAmmo"]                              = true,
    ["giveArrestReason"]                        = true,
    ["FIRE_CreateFireTruck"]                    = true,
    ["WriteQuery"]                              = true,
    ["pplay_addrow"]                            = true,
    ["UpdateAdvBoneSettings"]                   = true,
    ["RemoveTag"]                               = true,
    ["ckit_roul_bet"]                           = true,
    ["TowTruck_CreateTowTruck"]                 = true,
    ["hoverboardpurchase"]                      = true,
    ["start_wd_hack"]                           = true,
    ["Kun_SellDrug"]                            = true,
    ["fp_as_doorHandler"]                       = true,
    ["wyozimc_playply"]                         = true,
    ["phone"]                                   = true,
    ["dronesrewrite_controldr"]                 = true,
    ["NLR_SPAWN"]                               = true,
    ["DataSend"]                                = true,
    ["desktopPrinter_Withdraw"]                 = true,
    ["CreateCase"]                              = true,
    ["SetTableTarget"]                          = true,
    ["JB_Votekick"]                             = true,
    ["DestroyTable"]                            = true,
    ["Morpheus.StaffTracker"]                   = true,
    ["gMining.sellMineral"]                     = true,
    ["CpForm_Answers"]                          = true,
    ["misswd_accept"]                           = true,
    ["money_clicker_withdraw"]                  = true,
    ["customprinter_get"]                       = true,
    ["WithdrewBMoney"]                          = true,
    ["UpdateRPUModelSQL"]                       = true,
    ["NewReport"]                               = true,
    ["SpawnProtection"]                         = true,
    ["vj_npcspawner_sv_create"]                 = true,
    ["Gb_gasstation_BuyGas"]                    = true,
    ["GiveWeapon"]                              = true,
    ["levelup_useperk"]                         = true,
    ["bitcoins_request_turn_on"]                = true,
    ["withdrawp"]                               = true,
    ["minigun_drones_switch"]                   = true,
    ["DL_AskLogsList"]                          = true,
    ["SyncRemoveAction"]                        = true,
    ["DepositMoney"]                            = true,
    ["Gb_gasstation_BuyJerrycan"]               = true,
    ["LAWYER.BailFelonOut"]                     = true,
    ["Kun_SellOil"]                             = true,
    ["deposit"]                                 = true,
    ["ClickerForceSave"]                        = true,
    ["donatorshop_itemtobuy"]                   = true,
    ["DuelRequestClient"]                       = true,
    ["IS_GetReward_C2S"]                        = true,
    ["Chess Top10"]                             = true,
    ["D3A_Message"]                             = true,
    ["CW20_PRESET_LOAD"]                        = true,
    ["FacCreate"]                               = true,
    ["AbilityUse"]                              = true,
    ["JoinFirstSS"]                             = true,
    ["ORG_NewOrg"]                              = true,
    ["GET_Admin_MSGS"]                          = true,
    ["SyncPrinterButtons76561198056171650"]     = true,
    ["hitcomplete"]                             = true,
    ["75_plus_win"]                             = true,
    ["SBP_addtime"]                             = true,
    ["NLR.ActionPlayer"]                        = true,
    ["WipeMask"]                                = true,
    ["AttemptSellCar"]                          = true,
    ["LawsToServer"]                            = true,
    ["CRAFTINGMOD_SHOP"]                        = true,
    ["TOW_SubmitWarning"]                       = true,
    ["SRequest"]                                = true,
    ["BuyKey"]                                  = true,
    ["banleaver"]                               = true,
    ["SellMinerals"]                            = true,
    ["BeginSpin"]                               = true,
    ["VehicleUnderglow"]                        = true,
    ["drugs_text"]                              = true,
    ["TransferReport"]                          = true,
    ["CFRemoveGame"]                            = true,
    ["dLogsGetCommand"]                         = true,
    ["PermwepsNPCSellWeapon"]                   = true,
    ["NetData"]                                 = true,
    ["BuilderXToggleKill"]                      = true,
    ["HV_AmmoBuy"]                              = true,
    ["casinokit_chipexchange"]                  = true,
    ["SendMail"]                                = true,
    ["rprotect_terminal_settings"]              = true,
    ["TMC_NET_FirePlayer"]                      = true,
    ["DarkRP_preferredjobmodel"]                = true,
    ["IveBeenRDMed"]                            = true,
    ["thiefnpc"]                                = true,
    ["bitcoins_request_withdraw"]               = true,
    ["PlayerUseItem"]                           = true,
    ["OPEN_ADMIN_CHAT"]                         = true,
    ["BuyCrate"]                                = true,
    ["Selldatride"]                             = true,
    ["DaHit"]                                   = true,
    ["NewRPNameSQL"]                            = true,
    ["CreateOrganization"]                      = true,
    ["revival_revive_accept"]                   = true,
    ["gPrinters.openUpgrades"]                  = true,
    ["gMining.registerAchievement"]             = true,
    ["EZS_PlayerTag"]                           = true,
    ["RDMReason_Explain"]                       = true,
    ["ts_buytitle"]                             = true,
    ["ClickerAddToPoints"]                      = true,
    ["TCBDealerSpawn"]                          = true,
    ["SpecDM_SendLoadout"]                      = true,
    ["FarmingmodSellItems"]                     = true,
    ["PoliceJoin"]                              = true,
    ["TCBDealerStore"]                          = true,
    ["STLoanToServer"]                          = true,
    ["RecKickAFKer"]                            = true,
    ["withdrawMoney"]                           = true,
    ["showDisguiseHUD"]                         = true,
    ["PowerRoundsForcePR"]                      = true,
    ["DisbandOrganization"]                     = true,
    ["BailOut"]                                 = true,
    ["ItemStoreDrop"]                           = true,
    ["RXCAR_SellINVCar_C2S"]                    = true,
    ["MG2.Request.GangRankings"]                = true,
    ["DoDealerDeliver"]                         = true,
    ["VoteKickNO"]                              = true,
    ["CREATE_REPORT"]                           = true,
    ["changeToPhysgun"]                         = true,
    ["tickbooksendfine"]                        = true,
    ["InformPlayer"]                            = true,
    ["deathrag_takeitem"]                       = true,
    ["REPPurchase"]                             = true,
    ["blueatm"]                                 = true,
    ["BTTTStartVotekick"]                       = true,
    ["Resupply"]                                = true,
    ["NET_SS_DoBuyTakeoff"]                     = true,
    ["ban_rdm"]                                 = true,
    ["FiremanLeave"]                            = true,
    ["DarkRP_Kun_ForceSpawn"]                   = true,
    ["gportal_rpname_change"]                   = true,
    ["passmayorexam"]                           = true,
    ["NLRKick"]                                 = true,
    ["drugseffect_remove"]                      = true,
    ["CreateEntity"]                            = true,
    ["egg"]                                     = true,
    ["VoteBanNO"]                               = true,
    ["BuyFirstTovar"]                           = true,
    ["FIGHTCLUB_StartFight"]                    = true,
    ["netOrgVoteInvite_Server"]                 = true,
    ["DemotePlayer"]                            = true,
    ["REPAdminChangeLVL"]                       = true,
    ["BuyUpgradesStuff"]                        = true,
    ["SquadGiveWeapon"]                         = true,
    ["soundArrestCommit"]                       = true,
    ["TMC_NET_MakePlayerWanted"]                = true,
    ["sw_gokart"]                               = true,
    ["drugs_effect"]                            = true,
    ["IGS.GetPaymentURL"]                       = true,
    ["Chess ClientWager"]                       = true,
    ["gPrinters.retrieveMoney"]                 = true,
    ["NGII_TakeMoney"]                          = true,
    ["opr_withdraw"]                            = true,
    ["NET_DoPrinterAction"]                     = true,
    ["drugs_give"]                              = true,
    ["chname"]                                  = true,
    ["RHC_jail_player"]                         = true,
    ["Chatbox_PlayerChat"]                      = true,
    ["ZED_SpawnCar"]                            = true,
    ["gPrinters.sendID"]                        = true,
    ["SyncPrinterButtons16690"]                 = true,
    ["FinishContract"]                          = true,
    ["whk_setart"]                              = true,
    ["services_accept"]                         = true,
    ["NET_BailPlayer"]                          = true,
    ["NET_AM_MakePotion"]                       = true,
    ["HealButton"]                              = true,
    ["ArmorButton"]                             = true,
    ["textscreens_download"]                    = true,
    ["SprintSpeedset"]                          = true,
    ["pac.net.TouchFlexes.ClientNotify"]        = true,
    ["AskPickupItemInv"]                        = true,
    ["Client_To_Server_OpenEditor"]             = true,
    ["Shop_buy"]                                = true,
    ["guncraft_removeWorkbench"]                = true,
    ["give_me_weapon"]                          = true,
    ["vj_fireplace_turnon2"]                    = true,
    ["InviteMember"]                            = true,
    ["net_PSUnBoxServer"]                       = true,
    ["CraftSomething"]                          = true,
    ["newTerritory"]                            = true,
    ["Taxi_Add"]                                = true,
    ["ChangeOrgName"]                           = true,
    ["NET_CR_TakeStoredMoney"]                  = true,
    ["IS_SubmitSID_C2S"]                        = true,
    ["CP_Test_Results"]                         = true,
    ["JB_SelectWarden"]                         = true,
    ["LawyerOfferBail"]                         = true,
    ["ats_send_toServer"]                       = true,
    ["BM2.Command.SellBitcoins"]                = true,
    ["FIGHTCLUB_KickPlayer"]                    = true,
    ["NC_GetNameChange"]                        = true,
    ["OpenGates"]                               = true,
    ["pplay_sendtable"]                         = true,
    ["NET_EcSetTax"]                            = true,
    ["CFEndGame"]                               = true,
    ["requestmoneyforvk"]                       = true,
    ["JB_GiveCubics"]                           = true,
    ["disguise"]                                = true,
    ["br_send_pm"]                              = true,
    ["GovStation_SpawnVehicle"]                 = true,
    ["optarrest"]                               = true,
    ["FactionInviteConsole"]                    = true,
    ["ATM_DepositMoney_C2S"]                    = true,
    ["simfphys_gasspill"]                       = true,
    ["DarkRP_SS_Gamble"]                        = true,
    ["soez"]                                    = true,
    ["join_disconnect"]                         = true,
    ["MDE_RemoveStuff_C2S"]                     = true,
    ["SyncPrinterButtons76561198027292625"]     = true,
    ["CFJoinGame"]                              = true,
    ["Upgrade"]                                 = true,
    ["JoinOrg"]                                 = true,
    ["AirDrops_StartPlacement"]                 = true,
    ["buy_bundle"]                              = true,
    ["sv_saveweapons"]                          = true,
    ["IDInv_RequestBank"]                       = true,
    ["sendtable"]                               = true,
    ["Letthisdudeout"]                          = true,
    ["SetPermaKnife"]                           = true,
    ["RequestMAPSize"]                          = true,
    ["RevivePlayer"]                            = true,
    ["createFaction"]                           = true,
    ["PCAdd"]                                   = true,
    ["pplay_deleterow"]                         = true,
    ["MCon_Demote_ToServer"]                    = true,
    ["viv_hl2rp_disp_message"]                  = true,
    ["SetPlayerModel"]                          = true,
    ["ATMDepositMoney"]                         = true,
    ["ItemStoreUse"]                            = true,
    ["sphys_dupe"]                              = true,
    ["wordenns"]                                = true,
    ["FARMINGMOD_DROPITEM"]                     = true,
    ["EnterpriseWithdraw"]                      = true,
    ["bodyman_model_change"]                    = true,
    ["NPCShop_BuyItem"]                         = true,
    ["ORG_VaultDonate"]                         = true,
    ["StackGhost"]                              = true,
    ["hhh_request"]                             = true,
    ["fg_printer_money"]                        = true,
    ["NDES_SelectedEmblem"]                     = true,
    ["timebombDefuse"]                          = true,
    ["cab_sendmessage"]                         = true,
    ["TFA_Attachment_RequestAll"]               = true,
    ["kart_sell"]                               = true,
    ["ATS_WARP_VIEWOWNER"]                      = true,
    ["SlotsRemoved"]                            = true,
    ["ScannerMenu"]                             = true,
    ["GiveArmor100"]                            = true,
    ["RemoveMask"]                              = true,
    ["bitcoins_request_turn_off"]               = true,
    ["DuelMessageReturn"]                       = true,
    ["FIRE_RemoveFireTruck"]                    = true,
    ["MineServer"]                              = true,
    ["TOW_PayTheFine"]                          = true,
    ["ReSpawn"]                                 = true,
    ["race_accept"]                             = true,
    ["RP_Accept_Fine"]                          = true,
    ["BuySecondTovar"]                          = true,
    ["sendDuelInfo"]                            = true,
    ["SimplicityAC_aysent"]                     = true,
    ["LotteryMenu"]                             = true,
    ["start_wd_emp"]                            = true,
    ["inviteToOrganization"]                    = true,
    ["Kun_ZiptieStruggle"]                      = true,
    ["GrabMoney"]                               = true,
    ["steamid2"]                                = true,
    ["data_check"]                              = true,
    ["CubeRiot CaptureZone Update"]             = true,
    ["nox_addpremadepunishment"]                = true
}

CPE.ASCII = [[
   ______  ____    ______
  / ____/ / __ \  / ____/
 / /     / /_/ / / __/   
/ /____ / ____/ / /____  
\____(_)_/   (_)_____(_)

]]

g.MsgC(Color( 255, 0, 0 ), "\n" .. CPE.ASCII .. "\n\n")

g.util.AddNetworkString("cpe_gate")

if(!g.file.IsDir("cpe","DATA")) then g.file.CreateDir("cpe") end

for k, e in pairs(file.Find("cpe/*", "DATA"),1) do
    if(e[1] != "[") then
        file.Rename("cpe/"..e, "cpe/".."[OLD]_"..e)
    end
end

function CPE.print(str)
    g.MsgC(g.Color(255,0,0), " [CPE] ", g.Color(255,255,255), str .. "\n")
end

function CPE.SaveWhitelist()
    local f = g.file.Open( CPE.SaveFile, "wb", "DATA" )
    if ( f ) then 
        f:Write( g.util.TableToJSON(CPE.WhitelistTable) )
        f:Close()
    end
end

if(g.file.Exists(CPE.SaveFile, "DATA")) then
    local data = g.file.Read(CPE.SaveFile, "DATA")
    if(!data) then return end
    tab = g.util.JSONToTable(data)
    if(g.istable(tab)) then
        CPE.WhitelistTable = tab
        CPE.print("Loaded " .. g.tostring(#CPE.WhitelistTable) .. " whitelisted file(s).")
    end
else
    CPE.SaveWhitelist()
end

function CPE.SendData(reboot)
    for k, e in g.pairs(player.GetAll()) do
        if(!IsValid(e) or e:IsBot()) then continue end
        if(!e:IsAdmin() and !e:IsSuperAdmin()) then continue end
        net.Start("cpe_gate")
            net.WriteTable(CPE.DetectionTable)
            net.WriteTable(CPE.WhitelistTable)
        if(isnumber(reboot)) then
            net.WriteFloat(reboot)
        end
        net.Send(e)
    end
end

function CPE.GetValidSource(level)
    local i = -1
    while true do
        i = i + 1
        local info = g.debug.getinfo(level + i)
        if(!info) then 
            break
        end
        if(info.short_src != g.debug.getinfo(1).short_src and g.file.Exists(info.short_src, "GAME") and info.short_src != "") then
            return info
        end
    end
    return {short_src = "Not found.", linedefined = 0, lastlinedefined = 0}
end

function CPE.AddDetection(tab)
    for k, e in pairs(CPE.DetectionTable) do
        if(e.path == tab.path) then 
            tab.code = nil
            CPE.DetectionTable[k] = tab
            CPE.SendData()
            return
        end
    end
    if(CPE.LogCode and tab.code) then
        CPE.print("Saving backdoor: " .. tab.path)
        local filename =  "cpe/" .. g.util.CRC(tab.code) .. ".txt"
        CPE.print("Filename: " .. filename)
        local f = g.file.Open( filename, "wb", "DATA" )
        if ( f ) then
            f:Write( "Detected from file: " .. tab.path .. "\n ID: " .. tostring(#CPE.DetectionTable + 1) .. "\n\n\n" .. tab.code )
            f:Close()
        end
        tab.code = nil
    end
    g.table.insert(CPE.DetectionTable, tab)
    CPE.SendData()
end

function CPE.IsValidURL(url)
    for k, e in g.pairs(CPE.URLBlacklist) do
        local spos, epos = g.string.find(url, e)
        if(spos and epos and url[spos] == ".") then
            local source = CPE.GetValidSource(3)
            local dump = {}
            dump.check = "URL-Check"
            dump.path = source.short_src
            dump.lines = {source.linedefined, source.lastlinedefined}
            dump.url = g.tostring(url)
            dump.badword = e
            dump.type = "HTTP Request"
            dump.title = "Backdoor"
            CPE.AddDetection(dump)
            return false
        end
    end
    return true
end

function CPE.IsValidString(str, id)
    if(!str or !g.isstring(str)) then return true end
    local source = CPE.GetValidSource(4)
    local state = true
    if(id) then
        if(CPE.RunIDBlacklist[id]) then 
            local dump = {}
            dump.check = "Id-Check"
            dump.path = source.short_src
            dump.lines = {source.linedefined, source.lastlinedefined}
            dump.runid = g.tostring(id)
            dump.type = "Code Injection"
            dump.title = "Backdoor"
            dump.code = str
            CPE.AddDetection(dump)
            state =  false
        end
    end
    if(CPE.NetLogs[source.short_src]) then
        local dump = {}
        dump.check = "Net-Source-Check"
        dump.path = source.short_src
        dump.lines = {source.linedefined, source.lastlinedefined}
        dump.netid = g.tostring(CPE.NetLogs[source.short_src])
        dump.type = "Code Injection"
        dump.title = "Backdoor"
        dump.code = str
        CPE.AddDetection(dump)
        return false
    end
    if(CPE.RequestLogs[source.short_src]) then
        local dump = {}
        dump.check = "HTTP-Source-Check"
        dump.path = source.short_src
        dump.lines = {source.linedefined, source.lastlinedefined}
        dump.url = g.tostring(CPE.RequestLogs[source.short_src].url)
        dump.type = "Code Injection"
        dump.title = "Backdoor"
        dump.code = str
        CPE.AddDetection(dump)
        return false
    end
    for k, e in g.pairs(CPE.RequestLogs) do
        if(str and e.response) then 
            if(str == e.response or g.string.find(str, e.response) or g.string.find(e.response, str)) then
                local dump = {}
                dump.check = "HTTP-Content-Check"
                dump.path = source.short_src
                dump.lines = {source.linedefined, source.lastlinedefined}
                dump.url = g.tostring(e.url)
                dump.type = "Code Injection"
                dump.title = "Backdoor"
                dump.code = str
                CPE.AddDetection(dump)
                return false
            end
        end
    end
    return true
end

function CPE.IsValidFunction(func, scan, rqtab)
    if(!func) then return true end
    local rq = istable(rqtab)
    local source
    if(scan) then
        source = g.debug.getinfo(func)
    else
        source = CPE.GetValidSource(4)
    end
    local badfunc = {
        [RunString] = "RunString",
        [RunStringEx] = "RunStringEx",
        [CompileString] = "CompileString",
        [CompileFile] = "CompileFile"
    }
    for k, e in g.pairs(badfunc) do
        if(k == func) then
            local dump = {}
            dump.check = "IsValidFunction-Check"
            dump.path = source.short_src
            dump.lines = {source.linedefined, source.lastlinedefined}
            dump.func = {e}
            dump.title = "Backdoor"
            if(rq) then
                dump.url = CPE.RequestLogs[rqtab.source.short_src].url
                dump.type = "HTTP Request"
                dump.code = rqtab.code
            else
                dump.netid = CPE.NetLogs[source.short_src]
                dump.type = "Net"
            end
            CPE.AddDetection(dump)
            return false
        end
    end
    local badfuncstr = {
        RunString = true,
        RunStringEx = true,
        CompileString = true,
        CompileFile = true,
    }
    if(rq) then
        badfuncstr["net"] = true
        badfuncstr["BroascastLua"] = true
        badfuncstr["SendLua"] = true
    end
    if(g.debug.getinfo(func).what != "C") then
        local funcs = {}
        local i = 0
        while true do
            i = i + 1
            local info = g.jit.util.funck(func, -i)
            if(!info) then break end
            if(badfuncstr[info] or (!rq and info == "SetUserGroup")) then
                if(!table.HasValue(funcs, info)) then
                    g.table.insert(funcs, info)
                end
            end
        end
        if(#funcs != 0) then
            local dump = {}
            dump.check = "IsValidFunction-Check"
            dump.func = funcs
            dump.title = "Backdoor"
            if(rq) then
                dump.path = rqtab.source.short_src
                dump.code = rqtab.code
                dump.lines = {rqtab.source.linedefined, rqtab.source.lastlinedefined}
                dump.url = CPE.RequestLogs[rqtab.source.short_src].url
                dump.type = "HTTP Request"
            else
                dump.path = source.short_src
                dump.lines = {source.linedefined, source.lastlinedefined}
                dump.netid = CPE.NetLogs[source.short_src]
                dump.type = "Net"
            end
            CPE.AddDetection(dump)
            return false
        end
    end
    return true
end

function CPE.BanFromNet(len, ply)
    if(g.istable(ULib) and g.isfunction(ULib.ban)) then
        ULib.ban(ply, 0, CPE.Reason)
    else
        ply:Ban(0, false)
        ply:Kick(CPE.Reason)
    end
end

function CPE.Reboot()
    if(g.timer.Exists("cpe_reboot")) then return end
    g.timer.Create("cpe_reboot", 30, 1, function()
        CPE.print("Rebooting...")
        g.RunConsoleCommand("map", g.game.GetMap() )
    end)
end

function CPE.ScanNets()
    for k, e in pairs(net.Receivers) do
        local source = g.debug.getinfo(e)
        if(source.short_src == g.debug.getinfo(1).short_src) then continue end
        if(file.Exists(source.short_src, "GAME")) then
            CPE.NetLogs[source.short_src] = k
            if(CPE.exploitable[k]) then
                local dump = {}
                dump.check = "Data-Compare (SNTE)"
                dump.path = source.short_src
                dump.lines = {source.linedefined, source.lastlinedefined}
                dump.title = "Exploit"
                dump.netid = k
                dump.type = "Net"
                CPE.AddDetection(dump)
            end
            if(!g.table.HasValue(CPE.WhitelistTable, source.short_src)) then
                if(!CPE.IsValidFunction(e, true)) then 
                    net.Receivers[k] = CPE.BanFromNet 
                end
            end
        end
    end
end

function CPE.AddDetour(new, old)
    CPE.DetourTable[new] = old
end

http.Fetch = function(url, succ, fail, headers)
    local source = CPE.GetValidSource(3)
    local new = succ
    if(!g.table.HasValue(CPE.WhitelistTable, source.short_src)) then
        CPE.RequestLogs[source.short_src] = {url = url}
        if(!CPE.IsValidURL(url)) then return end
        new = function(body, len, head, code)
            if(body) then
                CPE.RequestLogs[source.short_src].result = body
            end
            if(succ and isfunction(succ)) then
                if(CPE.IsValidFunction(succ, false,{code = body, source = source})) then
                    succ(body, len, head, code)
                end
            end
        end
    end
    return g.http.Fetch(url, new, fail, headers)
end

CPE.AddDetour(http.Fetch, g.http.Fetch)

http.Post = function(url, param, succ, fail, headers)
    local source = CPE.GetValidSource(3)
    local new = succ
    if(!g.table.HasValue(CPE.WhitelistTable, source.short_src)) then
        CPE.RequestLogs[source.short_src] = {url = url}
        if(!CPE.IsValidURL(url)) then return end
        new = function(body, len, head, code)
            if(body) then
                CPE.RequestLogs[source.short_src].result = body
            end
            if(succ and isfunction(succ)) then
                if(CPE.IsValidFunction(succ, false,{code = body, source = source})) then
                    succ(body, len, head, code)
                end
            end
        end
    end
    return g.http.Post(url, param, new, fail, headers)
end

CPE.AddDetour(http.Post, g.http.Post)

HTTP = function(request)
    local source = CPE.GetValidSource(3)
    if(!istable(request) or !isstring(request.url)) then return end
    local succ = request.success 
    if(!g.table.HasValue(CPE.WhitelistTable, source.short_src)) then
        CPE.RequestLogs[source.short_src] = {url = request.url}
        if(!CPE.IsValidURL(request.url)) then return end
        request.success = function(code, body, head)
            if(body) then
                CPE.RequestLogs[source.short_src].result = body
            end
            if(succ and isfunction(succ)) then
                if(CPE.IsValidFunction(succ, false, {code = body, source = source})) then
                    succ(code, body, head)
                end
            end
        end
    end
    return g.HTTP(request)
end

CPE.AddDetour(HTTP, g.HTTP)

net.Receive = function(id, fn)
    local source = CPE.GetValidSource(3)
    if(!g.table.HasValue(CPE.WhitelistTable, source.short_src)) then
        if(id == "cpe_gate") then
            if(CPE.IsValidFunction(fn)) then
                local dump = {}
                dump.check = "Bypass-Check"
                dump.path = source.short_src
                dump.lines = {source.linedefined, source.lastlinedefined}
                dump.title = "Backdoor"
                CPE.AddDetection(dump)
            end
            return
        end
        CPE.NetLogs[source.short_src] = id
        if(!CPE.IsValidFunction(fn)) then 
            fn = CPE.BanFromNet 
        end
    end
    return g.net.Receive(id, fn)
end

CPE.AddDetour(net.Receive, g.net.Receive)

CompileFile = function(path)
    local source = CPE.GetValidSource(3).short_src
    local func = g.CompileFile(path)
    if(!g.table.HasValue(CPE.WhitelistTable, source)) then
        if(g.file.Exists(path, "LUA")) then
            if(!CPE.IsValidString(g.tostring(file.Read(path, "LUA")))) then return function() end end
            if(!CPE.IsValidFunction(func)) then return function() end end
        end
    end
    return func
end

CPE.AddDetour(CompileFile, g.CompileFile)

CompileString = function(str, id, bool)
    local source = CPE.GetValidSource(3).short_src
    local func = g.CompileString(str, source, bool)
    CPE.SpoofID[source] = id
    if(!g.table.HasValue(CPE.WhitelistTable, source)) then
        if(!CPE.IsValidString(g.tostring(str), id)) then return function() end end
        if(!CPE.IsValidFunction(func)) then return function() end end
    end
    return func
end

CPE.AddDetour(CompileString, g.CompileString)

RunString = function(str, id, bool)
    local source = CPE.GetValidSource(3).short_src
    CPE.SpoofID[source] = id
    if(!g.table.HasValue(CPE.WhitelistTable, source)) then
        if(!CPE.IsValidString(g.tostring(str), id)) then return end
    end
    return g.RunString(str, source, bool)
end

CPE.AddDetour(RunString, g.RunString)

RunStringEx = function(str, id, bool)
    local source = CPE.GetValidSource(3).short_src
    CPE.SpoofID[source] = id
    if(!g.table.HasValue(CPE.WhitelistTable, source)) then
        if(!CPE.IsValidString(g.tostring(str), id)) then return end
    end
    return g.RunStringEx(str, source, bool)
end

CPE.AddDetour(RunStringEx, g.RunStringEx)

timer.Create = function(id, delay, loop, func)
    local source = CPE.GetValidSource(3).short_src
    if(!g.table.HasValue(CPE.WhitelistTable, source)) then
        if(!CPE.IsValidFunction(func)) then return function() end end
    end
    return g.timer.Create(id, delay, loop, func)
end

CPE.AddDetour(timer.Create, g.timer.Create)

timer.Simple = function(delay, func)
    local source = CPE.GetValidSource(3).short_src
    if(!g.table.HasValue(CPE.WhitelistTable, source)) then
        if(!CPE.IsValidFunction(func)) then return function() end end
    end
    return g.timer.Simple(delay, func)
end

CPE.AddDetour(timer.Simple, g.timer.Simple)

file.Open = function(name, mode, path)
    if(name == CPE.SaveFile) then return end
    return g.file.Open(name, mode, path)
end

CPE.AddDetour(file.Open, g.file.Open)

hook.Remove = function(event, name)
    if(name == "cpe_scan" or name == "cpe_datasend") then return end
    return g.hook.Remove(event, name)
end

CPE.AddDetour(hook.Remove, g.hook.Remove)

debug.getinfo = function(fn, focus)
    local infos = g.debug.getinfo(!isnumber(fn) and fn or fn+1, focus)
    if(!infos) then return end
    if(infos and infos.short_src and CPE.SpoofID[infos.short_src]) then
        infos.source = "@" .. CPE.SpoofID[infos.short_src]
        infos.short_src = CPE.SpoofID[infos.short_src]
    end
    if(CPE.DetourTable[fn]) then return g.debug.getinfo(CPE.DetourTable[fn], focus) end
    return infos
end

CPE.AddDetour(debug.getinfo, g.debug.getinfo)

jit.util.funcinfo = function(fn, focus)
    local infos = g.jit.util.funcinfo(fn, focus)
    if(!infos) then return end
    if(infos.source and CPE.SpoofID[infos.source]) then
        infos.loc = string.Replace(string.Right(infos.loc, #infos.loc-1), infos.source, CPE.SpoofID[infos.source])
        infos.source = "@" .. CPE.SpoofID[string.Right(infos.source, #infos.source-1)]
    end
    if(CPE.DetourTable[fn]) then return g.jit.util.funcinfo(CPE.DetourTable[fn], focus) end
    return infos
end

CPE.AddDetour(jit.util.funcinfo, g.jit.util.funcinfo)

tostring = function(var)
    if(CPE.DetourTable[var]) then return g.tostring(CPE.DetourTable[var]) end
    return g.tostring(var)
end

CPE.AddDetour(tostring, g.tostring)

function CPE.FixNet()
    g.net.Receive("cpe_gate", function(len, ply)
        if(!ply:IsAdmin() and !ply:IsSuperAdmin()) then return end
        local action = net.ReadFloat()
        if(!action) then return end
        if(action == 1) then 
            local num = net.ReadFloat()
            if(!num or !CPE.DetectionTable[num]) then return end
            local path = CPE.DetectionTable[num].path
            if(path and path != "Not found.") then
                CPE.print("Authorized: " .. path)
                g.table.insert(CPE.WhitelistTable, path)
                g.table.remove(CPE.DetectionTable, num)
                CPE.SendData(2)
                CPE.SaveWhitelist()
                CPE.Reboot()
            end
        elseif (action == 2) then
            local num = net.ReadFloat()
            if(!num or !CPE.WhitelistTable[num]) then return end
            CPE.print("Blocked: " .. CPE.WhitelistTable[num])
            g.table.remove(CPE.WhitelistTable, num)
            CPE.SendData(2)
            CPE.SaveWhitelist()
            CPE.Reboot()
        elseif (action == 3) then
            if(!g.timer.Exists("cpe_reboot")) then return end
            g.timer.Remove("cpe_reboot")
            CPE.SendData(1)
        elseif (action == 4) then
            CPE.SendData()
        end
    end)
end

CPE.FixNet()

g.hook.Add("Think", "cpe_scan", function()
    if(table.Count(CPE.SavedNets) != table.Count(net.Receivers)) then
        CPE.ScanNets()
        CPE.SavedNets = g.table.Copy(net.Receivers)
    end
    if(g.debug.getinfo(net.Receivers["cpe_gate"]).short_src != g.debug.getinfo(1).short_src) then 
        local source = g.debug.getinfo(net.Receivers["cpe_gate"])
        if(!g.table.HasValue(CPE.WhitelistTable, source.short_src)) then
            if(CPE.IsValidFunction(net.Receivers["cpe_gate"]) and file.Exists(source.short_src, "GAME")) then
                local dump = {}
                dump.check = "Bypass-Check"
                dump.path = source.short_src
                dump.lines = {source.linedefined, source.lastlinedefined}
                dump.title = "Backdoor"
                CPE.AddDetection(dump)
            end
        end
        CPE.FixNet()
    end
end)

g.hook.Add( "PlayerInitialSpawn", "cpe_datasend", function(ply)
    CPE.SendData()
end)