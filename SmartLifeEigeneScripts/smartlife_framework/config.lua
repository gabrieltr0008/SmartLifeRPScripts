Config = {} -- Nicht bearbeiten, das definiert die Config

Config.Version = '1.1' -- Nicht ändern
Config.Author = 'SmartLife RolePlay'

-- Das hier ändern
Config.benutzeESX = true -- true heißt du benutzt esx false heißt du benutzt kein esx
Config.DiscordEinladung = "https://discord.gg/Jv7AHnXa9F" -- Füge deine Discord Einladung ein
Config.ID = 'license' -- Soll dein Server license als identifier benutzen (rockstar games) oder steam (nicht empfohlen da man sonst leicht entbannt wird)

if Config.benutzeESX == true then -- Nicht ändern
    -- ändern
    Config.OldESX = false -- True heißt du benutzt ESX 1.1 oder essentialmode, false heißt Alles darüber, aktuell supporter bis ESX 1.9.1
end