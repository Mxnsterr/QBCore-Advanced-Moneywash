YourCore = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if YourCore == nil then
            TriggerEvent('YourCore:GetObject', function(obj) YourCore = obj end)
            Citizen.Wait(200)
        end
    end
end)

local timer = 0
local canCheck = true

Citizen.CreateThread(function()
	while true do 
        local ped = GetPlayerPed(-1)
		local inRange = false
        local pos = GetEntityCoords(GetPlayerPed(-1))
        

		if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Deur.x, Config.Deur.y, Config.Deur.z, true) < 5.0 then
			inRange = true
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Deur.x, Config.Deur.y, Config.Deur.z, true) < 1.5 then                                    
                DrawText3D(Config.Deur.x, Config.Deur.y, Config.Deur.z, "~g~E~w~ - Betreed wasserette")
                if IsControlJustReleased(1, Keys['E']) then
                    YourCore.Functions.TriggerCallback('YourCore:HasItem', function(result)
                        if result then
                            isCrafting = true
                            YourCore.Functions.Progressbar("card_swipe", "Kaart scannen...", (5000), false, true, {
                                TriggerServerEvent("police:server:SetHandcuffStatus", true),
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "anim@heists@keycard@",
                                anim = "exit",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                StopAnimTask(GetPlayerPed(-1), "anim@heists@keycard@", "exit", 1.0)

                                enter()

                                TriggerServerEvent("police:server:SetHandcuffStatus", false)
                                isCrafting = false
                            end, function() -- Cancel
                                StopAnimTask(GetPlayerPed(-1), "anim@heists@keycard@", "exit", 1.0)
                                YourCore.Functions.Notify("Geannuleerd!", "error")
                                isCrafting = false
                                TriggerServerEvent("police:server:SetHandcuffStatus", false)
                            end)
                        else
                        YourCore.Functions.Notify("Je hebt geen werknemerskaart!", "error")
                        end
                    end , Config.Kaartje)
                end
			end
        end

        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Wasserette.x, Config.Wasserette.y, Config.Wasserette.z, true) < 5.0 then
			inRange = true
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Wasserette.x, Config.Wasserette.y, Config.Wasserette.z, true) < 1.5 then      
                DrawText3D(Config.Wasserette.x, Config.Wasserette.y, Config.Wasserette.z, "~g~E~w~ - Verlaat wasserette")
                if IsControlJustReleased(1, Keys['E']) then
                    verlaat()
                end
			end
        end
        if not inRange then
            Citizen.Wait(1000)
        end
        Citizen.Wait(1)
	end
end)

function enter()
	local ped = GetPlayerPed(-1)
    DoScreenFadeOut(500)
    Citizen.Wait(1500)
    SetEntityCoords(ped, Config.Wasserette.x, Config.Wasserette.y, Config.Wasserette.z)
	DoScreenFadeIn(500)
	TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_close", 0.1)
end


function verlaat()
	local ped = GetPlayerPed(-1)
    DoScreenFadeOut(500)
    Citizen.Wait(1500)
    SetEntityCoords(ped, Config.Deur.x, Config.Deur.y, Config.Deur.z)
	DoScreenFadeIn(500)
	TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_close", 0.1)
end

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(GetPlayerPed(-1))        
        local inRange = false
        
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Machine.x, Config.Machine.y, Config.Machine.z, true) < 5.0 then
                inRange = true
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Machine.x, Config.Machine.y, Config.Machine.z, true) < 3.5 then
                    DrawText3D(Config.Machine.x, Config.Machine.y, Config.Machine.z, '~r~E~w~ - Geld wassen (per 500)')
                    if IsControlJustPressed(0, Keys["E"]) then
                        YourCore.Functions.TriggerCallback('YourCore:HasItem', function(result)
                            if result then
                                isCrafting = true
                                YourCore.Functions.Progressbar("money_wash", "Geld witwassen...", (30000), false, true, {
                                    TriggerServerEvent("police:server:SetHandcuffStatus", true),
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() -- Done
                                    StopAnimTask(GetPlayerPed(-1), "mini@repair", "fixing_a_player", 1.0)
                                    TriggerServerEvent("YourPrefix-witwas:server:washmoney")
                                    TriggerServerEvent("police:server:SetHandcuffStatus", false)
                                    isCrafting = false
                                end, function() -- Cancel
                                    StopAnimTask(GetPlayerPed(-1), "mini@repair", "fixing_a_player", 1.0)
                                    YourCore.Functions.Notify("Geannuleerd!", "error")
                                    isCrafting = false
                                    TriggerServerEvent("police:server:SetHandcuffStatus", false)
                                end)
                            else
                            YourCore.Functions.Notify("Je hebt geen zwart geld!", "error")
                            end
                        end , "zwartgeld")
                    end
                end
            end
         if not inRange then
         Citizen.Wait(1000)
         end
        Citizen.Wait(1)
    end
 end)

 Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(GetPlayerPed(-1))        
        local inRange = false
        
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.KaartLocatie.x, Config.KaartLocatie.y, Config.KaartLocatie.z, true) < 5.0 then
                inRange = true
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.KaartLocatie.x, Config.KaartLocatie.y, Config.KaartLocatie.z, true) < 3.5 then
                    DrawText3D(Config.KaartLocatie.x, Config.KaartLocatie.y, Config.KaartLocatie.z, '~r~E~w~ - Wasserette tik apparaat bekijken')
                    if IsControlJustPressed(0, Keys["E"]) then
                        if canCheck == true then
                                YourCore.Functions.Progressbar("money_wash", "Apparaat bekijken...", (3000), false, true, {
                                    TriggerServerEvent("police:server:SetHandcuffStatus", true),
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@safe_cracking",
                                    anim = "dial_turn_clock_normal",
                                    flags = 16,
                                }, {}, {}, function() -- Done
                                    StopAnimTask(GetPlayerPed(-1), "mini@safe_cracking", "dial_turn_clock_normal", 1.0)
                                    TriggerServerEvent("YourPrefix-witwas:server:bekijkTik")
                                    TriggerServerEvent("police:server:SetHandcuffStatus", false)
                                    canCheck = false
                                    timer = Config.Cooldown
                                end, function() -- Cancel
                                    StopAnimTask(GetPlayerPed(-1), "mini@safe_cracking", "dial_turn_clock_normal", 1.0)
                                    YourCore.Functions.Notify("Geannuleerd!", "error")
                                    canCheck = true
                                    TriggerServerEvent("police:server:SetHandcuffStatus", false)
                                end)
                            else
                                YourCore.Functions.Notify("Je hebt recent al gekeken, geen nieuwe werknemers ingeklokt", "error")
                                end
                            end
                        end
                    end
                if not inRange then
                Citizen.Wait(1000)
                end
                Citizen.Wait(1)
            end
        end)

 function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 41, 11, 41, 60)    
    ClearDrawOrigin()
end

-- Timeout om kaart te krijgen (timer op lijn 173 in seconden)
Citizen.CreateThread(function()
    while true do
        if canCheck == false then
            if timer < 0 then
                timer = 0
                canCheck = true
            else
                if timer == 0 then
                    canCheck = true
                else
                    timer = timer - 60
                end
            end
        end
        Citizen.Wait(10000)
    end
end)
