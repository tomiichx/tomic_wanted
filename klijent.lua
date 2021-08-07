ESX = nil
local PlayerLoaded = false
wanted = false

Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent(
                "esx:getSharedObject",
                function(obj)
                    ESX = obj
                end
            )
            Citizen.Wait(0)
        end

        PlayerLoaded = true
        ESX.PlayerData = ESX.GetPlayerData()
    end
)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler(
    "esx:playerLoaded",
    function(xPlayer)
        ESX.PlayerData = xPlayer
        PlayerLoaded = true
    end
)

AddEventHandler(
    "playerSpawned",
    function()
        wanted = false
        ESX.TriggerServerCallback(
            "horizon_wanted:getajWantedLevel",
            function(wanted)
                if wanted then
                    while not PlayerLoaded do
                        Citizen.Wait(1000)
                    end
                    ESX.ShowNotification("Još uvijek ste na listi traženih, pazite se!")
                end
            end
        )
    end
)

function postaviWantedLevelClient()
    TriggerServerEvent("horizon_wanted:postaviWantedLevel", true)
    wanted = true
end

function skiniWantedLevel()
    TriggerServerEvent("horizon_wanted:postaviWantedLevel", false)
    wanted = false
end

RegisterNetEvent("horizon_wanted:postaviWantedLevelClient")
AddEventHandler(
    "horizon_wanted:postaviWantedLevelClient",
    function()
        postaviWantedLevelClient()
    end
)

RegisterNetEvent("horizon_wanted:skiniWantedLevel")
AddEventHandler(
    "horizon_wanted:skiniWantedLevel",
    function()
        skiniWantedLevel()
    end
)
