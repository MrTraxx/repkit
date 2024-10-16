-- Event for vehicle repair
RegisterNetEvent('repairVehicle')
AddEventHandler('repairVehicle', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    print("PlayerPedId: ", playerPed)
    print("Vehicle: ", vehicle)
    
    -- Check if the player is in a vehicle and in the driver's seat
    if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == playerPed then
        print("Vehicle is not 0 and player is in driver's seat")
        
        -- Play the repair animation
        local animDict = "mini@repair"
        local anim = "fixing_a_player"
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Citizen.Wait(100)
        end
        TaskPlayAnim(playerPed, animDict, anim, 8.0, -8.0, -1, 49, 0, false, false, false)
        
        -- Show progress message
        TriggerEvent('chat:addMessage', { args = { '^3Fahrzeug wird repariert...' } })
        -- Disable player controls while repairing
        DisableControlAction(0, 24, true) -- Attack
        DisableControlAction(0, 25, true) -- Aim
        DisableControlAction(0, 30, true) -- Move left/right
        DisableControlAction(0, 31, true) -- Move up/down
        DisableControlAction(0, 36, true) -- Crouch
        DisableControlAction(0, 44, true) -- Cover
        DisableControlAction(0, 140, true) -- Melee attack light
        DisableControlAction(0, 141, true) -- Melee attack heavy
        DisableControlAction(0, 142, true) -- Melee attack alternate
        DisableControlAction(0, 143, true) -- Melee block
        DisableControlAction(0, 75, true) -- Exit vehicle
        -- Wait for the repair duration (10 seconds)
        Citizen.Wait(10000)
        
        -- Stop the animation
        ClearPedTasks(playerPed)
        
        -- Repair the vehicle after the animation
        SetVehicleFixed(vehicle)
        SetVehicleDeformationFixed(vehicle)
        SetVehicleUndriveable(vehicle, false)
        SetVehicleEngineOn(vehicle, true, true, false)

        -- Notify the player of the successful repair
        TriggerEvent('chat:addMessage', { args = { '^2Fahrzeug wurde erfolgreich repariert!' } })

        -- Remove the repair kit from the inventory
        TriggerServerEvent('repkit:removeRepairKit')
    else
        -- Notify if the player is not in a vehicle
        TriggerEvent('chat:addMessage', { args = { '^1Du musst in einem Fahrzeug sitzen, um es zu reparieren!' } })
    end
end)
