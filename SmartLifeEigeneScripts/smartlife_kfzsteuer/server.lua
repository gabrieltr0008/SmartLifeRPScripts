local ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()

    while true do 

        for k, playerid in pairs (GetPlayers()) do 
            local xPlayer = ESX.GetPlayerFromId(playerid)
            
            if xPlayer ~= nil then -- Wenn der Spieler noch am laden ist, soll er nichts verlieren
                local vehicleCount = MySQL.Sync.fetchScalar("SELECT COUNT(plate) from owned_vehicles WHERE owner = @owner", 
                {
                    ['@owner'] = xPlayer.identifier,
                }
                )

                local preis = vehicleCount * 50
                xPlayer.removeAccountMoney('bank', preis)
                TriggerClientEvent('smartlife_kfzsteuer:picturemsg', xPlayer.source, 'CHAR_LS_CUSTOMS', 'Du hast ~g~' .. preis .. '$ ~w~ an die KFZ Steuern gezahlt für ' .. vehicleCount .. ' Fahrzeuge')
            end
        end

        Citizen.Wait(1 * 60000)
    end

end)