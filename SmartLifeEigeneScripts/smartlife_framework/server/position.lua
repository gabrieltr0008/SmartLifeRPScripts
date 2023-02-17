-- Spieler Spawnen
RegisterServerEvent('smartlife_framework:SpielerSpawnen')
AddEventHandler('smartlife_framework:SpielerSpawnen', function()
    local source = source
    MySQL.Sync.execute('SELECT * FROM users WHERE identifier = @identifier', {
        ['@identifier'] = GetPlayerIdentifier(source)
    }, function(result)
        local SpawnPos = json.decode(result[1].position)
        TriggerClientEvent('smartlife_framework:letztePosition', source, SpawnPos[1], SpawnPos[2], SpawnPos[3])
    end)
end)

-- Spieler Position speichern
RegisterServerEvent('smartlife_framework:SpielerPositionSpeichern')
AddEventHandler('smartlife_framework:SpielerPositionSpeichern', function(PosX, PosY, PosZ)
    local source = source
    MySQL.Sync.execute('UPDATE users SET position = @position WHERE identifier = @identifier', {
        ['@identifier'] = GetPlayerIdentifier(source),
        ['@position'] = '{ ' .. PosX  .. ', ' .. PosY .. ', ' .. PosZ .. '}'
    })
end)