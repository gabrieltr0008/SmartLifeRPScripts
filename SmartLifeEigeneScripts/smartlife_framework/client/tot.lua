IsDead = false
local seconds = 150

function IsPedDeath()
    TriggerServerEvent('smartlife_framework:TotUpdate', IsDead)
    local player = GetEntityCoords(PlayerPedId())
	if seconds > 1 then 
        smartlife_framework.Draw3DTxt(player.x, player.y, player.z, 255, 255, 255, '~w~Du bist tot! Du kannst nach ~r~' .. seconds .. ' ~w~wiederbelebt werden')
	end
   	if seconds < 1 then 
        smartlife_framework.Draw3DTxt(player.x, player.y, player.z, 255, 255, 255, '~w~Drücke ~w~[~r~E~w~] um im Krankenhaus aufzuwachen')
    end 
    if IsControlJustReleased(1, 38) and seconds < 1 then 
        local playerPos = GetEntityCoords(GetPlayerPed(-1), true)
        IsDead = false
        DoScreenFadeOut(1500)
        Citizen.Wait(1500)
        NetworkResurrectLocalPlayer(playerPos, true, true, false)
        SetPlayerInvincible(GetPlayerPed(-1), false)
        ClearPedBloodDamage(GetPlayerPed(-1))
        SetEntityHealth(GetPlayerPed(-1), 200) 
        DoScreenFadeIn(1500)
        seconds = 150
        TriggerServerEvent('smartlife_framework:TotUpdate', IsDead)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if seconds > 0 and IsDead == true then 
            seconds = seconds -1
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local health = GetEntityHealth(GetPlayerPed(-1))
        if health < 2 then
            IsDead = true  
        end
        if IsDead == true then
            exports.spawnmanager:setAutoSpawn(false)                
            IsPedDeath()         
 	    end
	end
end)

RegisterNetEvent('smartlife_framework_Core:SpielerIstTot')
AddEventHandler('smartlife_framework_Core:SpielerIstTot', function()
    smartlife_framework.Notify('Du bist gestorben und warst danach ~r~offline~w~, bitte sende ein Dispatch an das LSMD mit der taste ~g~[G]~w~ an')
    SetEntityHealth(GetPlayerPed(-1), 0)
end)
