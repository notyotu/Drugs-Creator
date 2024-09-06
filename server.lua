ESX = exports["es_extended"]:getSharedObject()

-- Registrar ítems configurables
for itemName, itemConfig in pairs(Config.Items) do
    ESX.RegisterUsableItem(itemName, function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        TriggerClientEvent('item:use', source, itemName)
        xPlayer.removeInventoryItem(itemName, 1)
    end)
end

