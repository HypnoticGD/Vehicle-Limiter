local QBCore = exports['qb-core']:GetCoreObject()

-- Speed limits configuration table
local SpeedLimits = {
     -- Model-specific limits (use vehicle model names, lowercase)
     ['adder'] = { limitKMH = 140, limitMPH = 85 }, -- Specific limit for Adder
     ['kuruma'] = { limitKMH = 140, limitMPH = 85 }, -- Specific limit for Kuruma
     ['sultan'] = { limitKMH = 160, limitMPH = 100 }, -- Specific limit for Sultan

    -- Category limits
     ['compacts'] = { limitKMH = 120, limitMPH = 75 },
     ['sports'] = { limitKMH = 150, limitMPH = 125 },
     ['super'] = { limitKMH = 150, limitMPH = 185 },
    -- Add more categories and models as needed
}

-- Function to get the speed limit based on vehicle model or category
local function GetSpeedLimit(vehicleModel, useMPH)
    -- Check for model-specific limit first
    local modelLimit = SpeedLimits[vehicleModel]
    if modelLimit then
        return useMPH and modelLimit.limitMPH or modelLimit.limitKMH
    end

    -- Fallback to category limit if no model-specific limit is found
    local vehicleData = QBCore.Shared.Vehicles[vehicleModel]
    if vehicleData then
        local category = vehicleData.category
        local categoryLimit = SpeedLimits[category]
        if categoryLimit then
            return useMPH and categoryLimit.limitMPH or categoryLimit.limitKMH
        end
    end
    return nil
end

-- Export this function for use in client-side scripts
QBCore.Functions.CreateCallback('getSpeedLimit', function(source, cb, vehicleModel, useMPH)
    local speedLimit = GetSpeedLimit(vehicleModel, useMPH)
    cb(speedLimit)
end)
