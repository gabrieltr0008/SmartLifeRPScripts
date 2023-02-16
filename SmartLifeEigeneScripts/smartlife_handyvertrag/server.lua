local ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()

    while true do 

        for k, playerid in pairs(GetPlayers()) do 
            local xPlayer = ESX.GetPlayerFromId(playerid)
            if xPlayer.getInventoryItem('phone') ~= nil then 
                local phoneCount = xPlayer.getInventoryItem('phone').count
                if phoneCount > 0 then 
                    local price = 50
                    xPlayer.removeAccountMoney('bank', price)
                    TriggerClientEvent('smartlife_handyvertrag:picturemsg', xPlayer.source, 'CHAR_CHAT_CALL', 'Du hast ~g~' .. price .. '$ ~w~für dein Handyvertrag bezahlt.', 'Handyrechnung', 'Handyvertrag bezahlt')
                end
            end 
        end

        Citizen.Wait(1 * 60000)
    end

end)