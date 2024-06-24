local interactingNPC = nil -- Etkileşimde olduğumuz NPC
local isInteracting = false -- Etkileşim durumu

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for _, npc in ipairs(Config.NPCs) do
            local npcCoords = vector3(npc.coords.x, npc.coords.y, npc.coords.z)
            local distance = #(playerCoords - npcCoords)

            if distance < 2.0 then
                DisplayHelpText("Press E to talk to the NPC")

                if IsControlJustReleased(1, 51) then -- E tuşuna basıldığında
                    interactingNPC = npc
                    isInteracting = true
                    OpenDialogueUI(interactingNPC)
                    break
                end
            end
        end
    end
end)

function OpenDialogueUI(npc)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "open_dialogue",
        npcModel = npc.model,
        npcDialogs = npc.dialog
    })
end

RegisterNUICallback('close_dialogue', function(data, cb)
    isInteracting = false
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('npc_response', function(data, cb)
    if data.response == "yes" then
        TriggerServerEvent('npc:giveItem', interactingNPC.item, interactingNPC.itemCount)
    end
    isInteracting = false
    SetNuiFocus(false, false)
    cb('ok')
end)

function DisplayHelpText(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawNotification(false, false)
end
