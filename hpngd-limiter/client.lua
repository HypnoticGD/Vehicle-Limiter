local QBCore = exports['qb-core']:GetCoreObject()
local useMPH = false -- Set to true for MPH, false for KMH
local speedMultiplier = useMPH and 2.236936 or 3.6 -- Conversion factors from m/s

-- Function to get and apply the vehicle speed limit
local function ApplySpeedLimit(vehicle)
    local vehicleModelHash = GetEntityModel(vehicle) -- Get vehicle model as a hash
    local vehicleModel = GetDisplayNameFromVehicleModel(vehicleModelHash) -- Convert the hash to a readable name
    
    -- Convert to lowercase since model names are usually in lowercase in QBCore.Shared.Vehicles
    vehicleModel = string.lower(vehicleModel)
    
    -- Get the speed limit from the server
    QBCore.Functions.TriggerCallback('getSpeedLimit', function(speedLimit)
        if speedLimit then
            local maxSpeed = speedLimit / speedMultiplier -- Convert to meters per second
            
            -- Set the maximum speed for the vehicle using the native function
            SetEntityMaxSpeed(vehicle, maxSpeed)
            
            -- Notify the player
            -- QBCore.Functions.Notify("Speed limit set to " .. speedLimit .. (useMPH and " MPH" or " KMH"))
        else
            -- QBCore.Functions.Notify("No speed limit for this vehicle category.", "error")
        end
    end, vehicleModel, useMPH)
end

-- Apply speed limit when entering a vehicle
RegisterNetEvent('vehicleEnter')
AddEventHandler('vehicleEnter', function(vehicle)
    if IsPedInAnyVehicle(PlayerPedId(), false) then
        ApplySpeedLimit(vehicle)
    end
end)

-- Event when the player enters a vehicle
CreateThread(function()
    while true do
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
            local vehicle = GetVehiclePedIsIn(ped, false)
            TriggerEvent('vehicleEnter', vehicle)
        end
        Citizen.Wait(1000) -- Check every 1 second
    end
end)
