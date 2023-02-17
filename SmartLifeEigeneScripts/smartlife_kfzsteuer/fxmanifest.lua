fx_version 'cerulean'
game 'gta5'
author 'Gabriel - SmartLife'
description 'KFZ Steuer Script'

client_scripts {
    'client.lua',
    'config.lua'
}

server_scripts {
    'server.lua',
    '@mysql-async/lib/MySQL.lua' -- MySQL Support wurde hinzugefügt für die Abfragen
}
