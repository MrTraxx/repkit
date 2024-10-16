
-- Register the repkit as a usable item
ESX.RegisterUsableItem('repkit', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        -- Trigger the repair event if the player is valid
        TriggerClientEvent('repairVehicle', source)
        xPlayer.showNotification('Du hast ein Reparaturkit benutzt.')
    else
        print('[^3WARNING^7] Failed to retrieve xPlayer in ESX.RegisterUsableItem for repkit.')
    end
end)
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Server-side event to remove the repair kit from the player's inventory
RegisterNetEvent('repkit:removeRepairKit')
AddEventHandler('repkit:removeRepairKit', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        local item = xPlayer.getInventoryItem('repkit')

        if item.count > 0 then
            xPlayer.removeInventoryItem('repkit', 1) -- Remove 1 repair kit
            xPlayer.showNotification('Reparaturkit wurde aus deinem Inventar entfernt.')
        else
            xPlayer.showNotification('Du hast kein Reparaturkit mehr.')
        end
    else
        print('[^3WARNING^7] Failed to retrieve xPlayer in repkit:removeRepairKit.')
    end
end)
