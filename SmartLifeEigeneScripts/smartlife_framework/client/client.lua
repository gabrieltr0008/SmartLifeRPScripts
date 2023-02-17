-- Abwarten bis der spieler spawnt
AddEventHandler('playerSpawned', function()
    TriggerServerEvent('smartlife_framework:SpielerSpawnen')
end)

-- Spieler Position Einstellen
RegisterNetEvent('smartlife_framework:letztePosition')
AddEventHandler('smartlife_framework:letztePosition', function(PosX, PosY, PosZ)
    Citizen.Wait(1)

    local defaulModel = GetHashKey('mp_m_freemode_01')
    RequestModel(defaulModel)
    while not HasModelLoaded(defaulModel) do
        Citizen.Wait(1)
    end
    SetPlayerModel(PlayerId(), defaulModel)
    SetPedDefaultComponentVariation(PlayerPedId())
    SetModelAsNoLongerNeeded(defaulModel)

    SetEntityCoords(GetPlayerPed(-1), PosX, PosY, PosZ, 1, 0, 0, 1)
end)

-- Spieler Position aktualisieren
Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(5000)

        lastX, lastY, lastZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
        TriggerServerEvent('smartlife_framework:SpielerPositionSpeichern', lastX, lastY, lastZ)
    end
end)