QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('npc:giveItem')
AddEventHandler('npc:giveItem', function(item, count)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player then
        Player.Functions.AddItem(item, count)
        TriggerClientEvent('QBCore:Notify', src, 'You received ' .. count .. ' ' .. item, 'success')
    end
end)
