RegisterServerEvent('smartlife_framework:TotUpdate')
AddEventHandler('smartlife_framework:TotUpdate', function(IsDead)
    local source = source
    if type(IsDead) == 'boolean' then
        MySQL.Sync.execute('UPDATE users SET isdead = @isdead WHERE identifier = @identifier', {
            ['@identifier'] = GetPlayerIdentifier(source),
            ['@isdead'] = IsDead,
        })
    else 
        print("Es gibt ein datenbank fehler bei der Death Ladung, Fehler = Death ist kein Boolean")
    end
end)

RegisterServerEvent('smartlife_framework:checkeTot')
AddEventHandler('smartlife_framework:checkeTot', function()
    local source = source
    MySQL.Sync.Scalar('SELECT isdead FROM users WHERE identifier = @identifier', {
        ['@identifier'] = GetPlayerIdentifier(source),
    }, function(dead)
        if dead == 1 then
            TriggerClientEvent('smartlife_framework:SpielerIstTot', source)
        end
    end)
end)