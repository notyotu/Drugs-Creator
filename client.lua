ESX = exports["es_extended"]:getSharedObject()

-- Función para crear el objeto cigarro o similar
function AttachItem(itemName)
    local playerPed = PlayerPedId()
    local cigaretteModel = "prop_amb_ciggy_01" -- Modelo de cigarro como ejemplo

    RequestModel(cigaretteModel)
    while not HasModelLoaded(cigaretteModel) do
        Citizen.Wait(100)
    end

    local cigaretteObject = CreateObject(GetHashKey(cigaretteModel), 0, 0, 0, true, true, true)
    AttachEntityToEntity(cigaretteObject, playerPed, GetPedBoneIndex(playerPed, 28422), 0.015, 0.0, 0.0, 0.0, 0.0, 180.0, true, true, false, true, 1, true)

    return cigaretteObject
end

-- Aplicar efectos visuales
function ApplyVisualEffect(effect, duration)
    if effect then
        StartScreenEffect(effect, 0, false) -- Iniciar el efecto visual
        Citizen.Wait(duration) -- Esperar la duración del efecto
        StopScreenEffect(effect) -- Detener el efecto visual
    end
end

-- Evento genérico para usar ítems
RegisterNetEvent('item:use')
AddEventHandler('item:use', function(itemName)
    local playerPed = PlayerPedId()
    local itemConfig = Config.Items[itemName]

    -- Cargar la animación
    RequestAnimDict(itemConfig.animationDict)
    while not HasAnimDictLoaded(itemConfig.animationDict) do
        Citizen.Wait(100)
    end

    -- Crear y adjuntar el ítem (cigarro o lo que sea)
    local itemObject = AttachItem(itemName)

    -- Reproducir la animación solo una vez y detenerla después del tiempo definido
    TaskPlayAnim(playerPed, itemConfig.animationDict, itemConfig.animationName, 8.0, -8.0, itemConfig.animationDuration, 49, 0, false, false, false)

    Citizen.Wait(itemConfig.animationDuration)

    -- Detener la animación una vez que termina el tiempo
    ClearPedTasks(playerPed)

    -- Aplicar efectos al jugador
    local currentHealth = GetEntityHealth(playerPed)
    local newHealth = math.min(currentHealth + itemConfig.healthBoost, 200)
    SetEntityHealth(playerPed, newHealth)

    local currentArmor = GetPedArmour(playerPed)
    local newArmor = math.min(currentArmor + itemConfig.armorBoost, 100)
    SetPedArmour(playerPed, newArmor)

    -- Reducir hambre y sed
    TriggerEvent('esx_status:remove', 'hunger', itemConfig.hungerReduction)
    TriggerEvent('esx_status:remove', 'thirst', itemConfig.thirstReduction)

    -- Aplicar el efecto visual si está configurado
    if itemConfig.visualEffect then
        ApplyVisualEffect(itemConfig.visualEffect, itemConfig.effectDuration)
    end

    -- Eliminar el ítem después de un tiempo adicional
    Citizen.Wait(5000)
    DeleteObject(itemObject)
end)




