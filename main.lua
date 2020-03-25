local host = "192.168.70.150"
local path = "endpoints/call"
local base64 = ""

local headers = {Authorization = "Basic " + base64}
local query = {key = "", method = "", value = ""}

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
        query = query
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

