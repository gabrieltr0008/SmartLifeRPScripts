smartlife_framework = {} -- Nicht bearbeiten


smartlife_framework.DisplayText3D = function(text)  
    SetTextComponentFormat('STRING')
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


smartlife_framework.Draw3DTxt = function(x, y, z, r, g, b, text)  
    SetTextScale(0.4, 0.4)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry('STRING')
    SetTextCentre(1)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end


smartlife_framework.Notify = function(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(true, true)
end


smartlife_framework.LoadModel = function(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(10)
    end
end


smartlife_framework.GetClosestPlayer = function()
    local players = GetPlayers()
    local Distance = -1
    local Player = -1
    local plyCoords = GetEntityCoords(GetPlayerPed(-1), 0)
    
    for _, ped in ipairs(players) do
        local target = GetPlayerPed(ped)
        if(target ~= GetPlayerPed(-1)) then
            local othCoords = GetEntityCoords(GetPlayerPed(ped), 0)
            local PlyToPly = Vdist(othCoords["x"], othCoords["y"], othCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
            if(PlyToPly == -1 or Distance > PlyToPly) then
                Player = ped
                Distance = PlyToPly
            end
        end
    end
    
    return Player, Distance
end  
  
function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

RegisterNetEvent('smartlife_framework_Core:DisplayText3D')
AddEventHandler('smartlife_framework_Core:DisplayText3D', function(text)  
    smartlife_framework.DisplayText3D(text)
end)

RegisterNetEvent('smartlife_framework_Core:Draw3DTxt')
AddEventHandler('smartlife_framework_Core:Draw3DTxt', function(x, y, z, r, g, b, text)  
    smartlife_framework.Draw3DTxt(x, y, z, r, g, b, text)
end)

RegisterNetEvent('smartlife_framework_Core:Notify')
AddEventHandler('smartlife_framework_Core:Notify', function(text)  
    smartlife_framework.Notify(text)
end)