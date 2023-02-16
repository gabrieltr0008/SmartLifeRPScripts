local ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('smartlife_handyvertrag:picturemsg')
AddEventHandler('smartlife_handyvertrag:picturemsg', function(icon, msg, title, subtitle)
    showPictureNotification(icon, msg, title, subtitle)
end)

function showPictureNotification(icon, msg, title, subtitle)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg);
    SetNotificationMessage(icon, icon, true, 1, title, subtitle);
    DrawNotification(false, true);
end