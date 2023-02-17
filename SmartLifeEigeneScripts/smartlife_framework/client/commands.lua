-- Fahrzeug löschen command
RegisterCommand(Config.FahrzeugLoschenCommand, function()
    local ped = GetPlayerPed(-1)

    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then 
        local pos = GetEntityCoords(ped)

        if (IsPedSittingInAnyVehicle(ped)) then 
            local vehicle = GetVehiclePedIsIn(ped, false)

            if (GetPedInVehicleSeat(vehicle, -1) == ped) then 
                local plate = GetVehicleNumberPlateText(vehicle)
                TriggerServerEvent('smartlife_framework:UpdateVehicleStatu', plate)
                DeleteEntity(vehicle)
                smartlife_framework.Notify("Das Fahrzeug wurde ~g~erfolgreich~s~ Gelöscht!")
            else 
                smartlife_framework.Notify("Du ~r~musst~s~ auf dem Fahrersitz sitzen!")
            end
        else
            smartlife_framework.Notify("Du ~r~musst~s~ im Auto sitzen!")
        end 
    end
end, false)