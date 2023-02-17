Config = {} -- Nicht bearbeiten, das definiert die Config

Config.Version = '1.1' -- Nicht ändern
Config.Author = 'SmartLife RolePlay'

-- Das hier ändern
Config.FahrzeugLoschenCommand = 'dv' -- Wie soll der command heißen womit man die Autos löscht? (ohne /)
Config.DiscordEinladung = "https://discord.gg/Jv7AHnXa9F" -- Füge deine Discord Einladung ein
Config.ID = 'license' -- Soll dein Server license als identifier benutzen (rockstar games) oder steam (nicht empfohlen da man sonst leicht entbannt wird)

-- BITTE EINFACH SO LASSEN, ESX WIRD NOCH NICHT UNTERSTÜTZT
Config.benutzeESX = nil -- true heißt du benutzt esx false heißt du benutzt kein esx, aktuell ist es auf nil gestellt da es noch nicht kompatibel ist
-- BITTE NOCH NICHT BENUTZEN, ESX WIRD NOCH NICHT UNTERSTÜTZT
if Config.benutzeESX == true then -- Nicht ändern
    -- ändern
    Config.OldESX = false -- True heißt du benutzt ESX 1.1 oder essentialmode, false heißt Alles darüber, aktuell supporter bis ESX 1.9.1
elseif Config.benutzeESX == nil then
    print("Falls du fehlermeldungen bekommst das dein ESX nicht eingestellt ist, ist es nicht schlimm, aktuell ist ESX noch nicht kompatibel mit unseren Framework")
    print("Solltest du jedoch Config.benutzeESX auf false oder true haben stelle es bitte auf nil, danke")
end