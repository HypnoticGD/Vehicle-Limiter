-- Speed limits configuration table
local QBCore = exports['qb-core']:GetCoreObject()
local SpeedLimits = {
    ['compacts'] = { limitKMH = 120, limitMPH = 75 }, -- Example category limits
    ['sports'] = { limitKMH = 150, limitMPH = 125 },
    ['super'] = { limitKMH = 150, limitMPH = 185 },
    -- Add more categories and models as needed
}

-- Function to get the speed limit based on vehicle category
local function GetSpeedLimit(vehicleModel, useMPH)
    local vehicleData = QBCore.Shared.Vehicles[vehicleModel]

    -- Debugging: Check if the vehicle data exists and print the category
    if vehicleData then

        local category = vehicleData.category
        local limit = SpeedLimits[category]

        -- Debugging: Check if the category exists in SpeedLimits
        if limit then
            return useMPH and limit.limitMPH or limit.limitKMH
        end
    end
    return nil
end

-- Export this function for use in client-side scripts
QBCore.Functions.CreateCallback('getSpeedLimit', function(source, cb, vehicleModel, useMPH)
    local speedLimit = GetSpeedLimit(vehicleModel, useMPH)
    cb(speedLimit)
end)
