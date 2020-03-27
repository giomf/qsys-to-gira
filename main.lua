local host = "192.168.70.150"
local path = "endpoints/call"
local base64 = ""

local headers = {["Authorization"] = "Basic " .. base64}
local query = {key = "", method = "", value = ""}

local methods = {set = "set", get = "get"}

local objects = {
    ["0_0_2"] = "CO@0_0_2", -- Lichtszene Preset 1-4
    ["2_0_4"] = "CO@2_0_4", -- Lichtvoute (Farbtemperatur)

    -- Leuchten
    ["2_4_1"] = "CO@2_4_1", -- Pendelleuchten Koferenztisch (direkt)
    ["2_4_2"] = "CO@2_4_2", -- Pendelleuchten Koferenztisch (indirekt)
    ["2_4_3"] = "CO@2_4_3", -- Downlights Holzwand
    ["2_4_4"] = "CO@2_4_4", -- Uplights Säulen Konferenzraum
    ["2_4_5"] = "CO@2_4_5", -- Lichtvoute (Dimmer)
    ["2_4_6"] = "CO@2_4_6", -- Uplights Säulen Lounge
    ["2_4_7"] = "CO@2_4_7", -- Wandleuchten Empore
    ["2_4_8"] = "CO@2_4_8", -- Stufenbeleuchtung Empore
    ["2_4_9"] = "CO@2_4_9", -- Stehleuchten Lounge

    -- Vorhänge Auf/Zu
    ["4_1_1"] = "CO@4_1_1", -- Vorhang 01 (Konferenz)
    ["4_1_2"] = "CO@4_1_2", -- Vorhang 02 (Konferenz)
    ["4_1_3"] = "CO@4_1_3", -- Vorhang 03 (Konferenz/Lounge)
    ["4_1_4"] = "CO@4_1_4", -- Vorhang 04 (Lounge)
    ["4_1_5"] = "CO@4_1_5", -- Vorhang 05 (Lounge)
    ["4_1_6"] = "CO@4_1_6", -- Vorhang 06 (Lounge)
    ["4_1_7"] = "CO@4_1_7", -- Vorhang 07 (Tür)

    -- Vorhänge Stop
    ["4_2_1"] = "CO@4_2_1", -- Vorhang 01 (Konferenz)
    ["4_2_2"] = "CO@4_2_2", -- Vorhang 02 (Konferenz)
    ["4_2_3"] = "CO@4_2_3", -- Vorhang 03 (Konferenz/Lounge)
    ["4_2_4"] = "CO@4_2_4", -- Vorhang 04 (Lounge)
    ["4_2_5"] = "CO@4_2_5", -- Vorhang 05 (Lounge)
    ["4_2_6"] = "CO@4_2_6", -- Vorhang 06 (Lounge)
    ["4_2_7"] = "CO@4_2_7" -- Vorhang 07 (Tür)
}

function createUrl(query)
    return HttpClient.CreateUrl({
        Host = host,
        Port = 80,
        Path = path,
        Query = query
    })
end

function call(url, handler)
    HttpClient.Download({Url = url, Headers = headers, EventHandler = handler})
end

function done(tbl, code, data, err, headers)
    print(string.format("HTTP response from '%s': Return Code=%i; Error=%s",
                        tbl.Url, code, err or "None"))
    print("Headers:")
    for hName, Val in pairs(headers) do
        print(string.format("\t%s = %s", hName, Val))
    end
    print("\rData: " .. data)
end

-- Preset 1-4
Controls.Inputs[1].EventHandler = function(object)
    query.key = objects["0_0_2"]
    query.method = methods.set
    query.value = object.String

    local url = createUrl(query)
    call(url, done)
end

----------------------------------------------------------------------------------
-- Voute Farbtemperatur
Controls.Inputs[2].EventHandler = function()
    query.key = objects["2_0_4"]
    query.method = methods.set
    query.value = 2

    local url = createUrl(query)
    call(url, done)
end

----------------------------------------------------------------------------------
-- Leuchten
-- Pendelleuchten Koferenztisch (direkt)
Controls.Inputs[3].EventHandler = function(object)
    query.key = objects["2_4_1"]
    query.method = methods.set
    query.value = object.Value

    local url = createUrl(query)
    call(url, done)
end

-- Pendelleuchten Koferenztisch (indirekt)
Controls.Inputs[4].EventHandler = function(object)
    query.key = objects["2_4_2"]
    query.method = methods.set
    query.value = object.Value

    local url = createUrl(query)
    call(url, done)
end

-- Downlights Holzwand
Controls.Inputs[5].EventHandler = function(object)
    query.key = objects["2_4_3"]
    query.method = methods.set
    query.value = object.Value

    local url = createUrl(query)
    call(url, done)
end

-- Uplights Säulen Konferenzraum
Controls.Inputs[6].EventHandler = function(object)
    query.key = objects["2_4_4"]
    query.method = methods.set
    query.value = object.Value

    local url = createUrl(query)
    call(url, done)
end

-- Lichtvoute (Dimmer)
Controls.Inputs[7].EventHandler = function(object)
    query.key = objects["2_4_5"]
    query.method = methods.set
    query.value = object.Value

    local url = createUrl(query)
    call(url, done)
end

-- Uplights Säulen Lounge
Controls.Inputs[8].EventHandler = function(object)
    query.key = objects["2_4_6"]
    query.method = methods.set
    query.value = object.Value

    local url = createUrl(query)
    call(url, done)
end

-- Wandleuchten Empore
Controls.Inputs[9].EventHandler = function(object)
    query.key = objects["2_4_7"]
    query.method = methods.set
    query.value = object.Value

    local url = createUrl(query)
    call(url, done)
end

-- Stufenbeleuchtung Empore
Controls.Inputs[10].EventHandler = function(object)
    query.key = objects["2_4_8"]
    query.method = methods.set
    query.value = object.Value

    local url = createUrl(query)
    call(url, done)
end

-- Stehleuchten Lounge
Controls.Inputs[11].EventHandler = function(object)
    query.key = objects["2_4_9"]
    query.method = methods.set
    query.value = object.Value

    local url = createUrl(query)
    call(url, done)
end

----------------------------------------------------------------------------------
-- Vorhänge
-- Vorhang 01
Controls.Inputs[12].EventHandler = function(object)

    local cmd = object.String
    local openCloseKey = objects["4_1_1"]
    local stopKey = objects["4_2_1"]
    query.method = methods.set

    if cmd == "open" then
        query.key = openCloseKey
        query.value = 0
    elseif cmd == "stop" then
        query.key = stopKey
    elseif cmd == "close" then
        query.key = openCloseKey
        query.value = 1
    end

    local url = createUrl(query)
    call(url, done)
end

-- Vorhang 02
Controls.Inputs[13].EventHandler = function(object)

    local cmd = object.String
    local openCloseKey = objects["4_1_2"]
    local stopKey = objects["4_2_2"]
    query.method = methods.set

    if cmd == "open" then
        query.key = openCloseKey
        query.value = 0
    elseif cmd == "stop" then
        query.key = stopKey
    elseif cmd == "close" then
        query.key = openCloseKey
        query.value = 1
    end

    local url = createUrl(query)
    call(url, done)
end

-- Vorhang 03
Controls.Inputs[14].EventHandler = function(object)

    local cmd = object.String
    local openCloseKey = objects["4_1_3"]
    local stopKey = objects["4_2_3"]
    query.method = methods.set

    if cmd == "open" then
        query.key = openCloseKey
        query.value = 0
    elseif cmd == "stop" then
        query.key = stopKey
    elseif cmd == "close" then
        query.key = openCloseKey
        query.value = 1
    end

    local url = createUrl(query)
    call(url, done)
end

-- Vorhang 04
Controls.Inputs[15].EventHandler = function(object)

    local cmd = object.String
    local openCloseKey = objects["4_1_4"]
    local stopKey = objects["4_2_4"]
    query.method = methods.set

    if cmd == "open" then
        query.key = openCloseKey
        query.value = 0
    elseif cmd == "stop" then
        query.key = stopKey
    elseif cmd == "close" then
        query.key = openCloseKey
        query.value = 1
    end

    local url = createUrl(query)
    call(url, done)
end

-- Vorhang 05
Controls.Inputs[16].EventHandler = function(object)

    local cmd = object.String
    local openCloseKey = objects["4_1_5"]
    local stopKey = objects["4_2_5"]
    query.method = methods.set

    if cmd == "open" then
        query.key = openCloseKey
        query.value = 0
    elseif cmd == "stop" then
        query.key = stopKey
    elseif cmd == "close" then
        query.key = openCloseKey
        query.value = 1
    end

    local url = createUrl(query)
    call(url, done)
end

-- Vorhang 06
Controls.Inputs[17].EventHandler = function(object)

    local cmd = object.String
    local openCloseKey = objects["4_1_6"]
    local stopKey = objects["4_2_6"]
    query.method = methods.set

    if cmd == "open" then
        query.key = openCloseKey
        query.value = 0
    elseif cmd == "stop" then
        query.key = stopKey
    elseif cmd == "close" then
        query.key = openCloseKey
        query.value = 1
    end

    local url = createUrl(query)
    call(url, done)
end

-- Vorhang 07
Controls.Inputs[18].EventHandler = function(object)

    local cmd = object.String
    local openCloseKey = objects["4_1_7"]
    local stopKey = objects["4_2_7"]
    query.method = methods.set

    if cmd == "open" then
        query.key = openCloseKey
        query.value = 0
    elseif cmd == "stop" then
        query.key = stopKey
    elseif cmd == "close" then
        query.key = openCloseKey
        query.value = 1
    end

    local url = createUrl(query)
    call(url, done)
end

