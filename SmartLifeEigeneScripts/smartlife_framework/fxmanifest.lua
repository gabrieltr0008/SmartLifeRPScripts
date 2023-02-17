-- Credits gehen raus an den Developer von RageUI und an paar YT Tutorials
fx_version 'cerulean'
games {'gta5'}
author 'Gabriel - SmartLife'
description 'Das ist das SmartLife Framework was teilweise kompatibel ist mit anderen Frameworks.'
version '1.0.1'

server_scripts {
    'server/server.lua',
    'server/position.lua',
    'server/tot.lua',
    '@mysql-async/lib/MySQL.lua'
}

client_scripts {
    'client/client.lua',
    'client/functions.lua',
    'client/tot.lua',
    'client/commands.lua',
    

    -- RageUI
    'RageUI/src/RMenu.lua',
    'RageUI/src/menu/RageUI.lua',
    'RageUI/src/menu/Menu.lua',
    'RageUI/src/menu/MenuController.lua',

    'RageUI/src/components/*.lua',

    'RageUI/src/menu/elements/*.lua',

    'RageUI/src/menu/items/*.lua',

    'RageUI/src/menu/panels/*.lua',

    'RageUI/src/menu/panels/*.lua',
    'RageUI/src/menu/windows/*.lua'
}

shared_scripts {
    'config.lua'
}

dependencies {
    'oxmysql',
}
