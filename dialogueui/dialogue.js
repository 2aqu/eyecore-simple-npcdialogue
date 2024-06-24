RegisterNUICallback('close_dialogue', function(data, cb) {
    isInteracting = false;
    SetNuiFocus(false, false);
    cb('ok');
});

RegisterNUICallback('npc_response', function(data, cb) {
    if (data.response == "yes") {
        TriggerServerEvent('npc:giveItem', interactingNPC.item, interactingNPC.itemCount);
    }
    isInteracting = false;
    SetNuiFocus(false, false);
    cb('ok');
});

function DisplayHelpText(text) {
    SetTextComponentFormat("STRING");
    AddTextComponentString(text);
    DisplayHelpTextFromStringLabel(0, 0, 1, -1);
}

function ShowNotification(text) {
    SetNotificationTextEntry("STRING");
    AddTextComponentSubstringPlayerName(text);
    DrawNotification(false, false);
}
