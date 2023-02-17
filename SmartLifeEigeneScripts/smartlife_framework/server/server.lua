AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    local identifier

    for k, v in ipairs(identifiers) do 
        if string.match(v, Config.ID .. ':') then
            identifier = v
            break
        end
    end

    if not identifier then
        deferrals.done('Deine ID Konnte nicht erkannt werden. Bitte starte dein FiveM neu ansonsten komm in unseren Support: ' .. Config.DiscordEinladung)
    else
        deferrals.done()

        if Config.benutzeESX == false then 
            MySQL.Sync.fetchScalar('SELECT 1 FROM users WHERE identifier = @identifier', {
                ['@identifier'] = identifier
            }, function(result)
                if not result then
                    MySQL.Sync.execute('INSERT INTO users (identifier) VALUES (@identifier)', {
                        ['@identifier'] = identifier
                    })
                end
            end)
        elseif Config.benutzeESX == true then
            print("ESX Wird benutzt, user tabelle wird übersprungen")
        else
            print("In der Config ist benutzeESX entweder leer oder falsch, bitte überprüfe es nochmal. Dein wert: " .. Config.benutzeESX)
        end
    end
end)