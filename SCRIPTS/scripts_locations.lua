Locations                       = {}
local locationListGeneral       = {}
local locationTriggersGeneral   = {}
local locationTriggersHexes     = {}
local sourceName                = "locations"

local locationListHexes = {
    {"This is a large (open|wet) plain", "HEX Plains.jpg", "HEX - Plains"}
    ,{"vast plains\\.", "HEX Plains.jpg", "HEX - Plains"}

    ,{"You are in the hills", "HEX Hills.jpg", "HEX - Hills"}
    ,{"hills\\.", "HEX Hills.jpg", "HEX - Hills"}

    ,{"You are in a swamp", "HEX Swamp.jpg", "HEX - Swamp"}
    ,{"swamp\\.", "HEX Swamp.jpg", "HEX - Swamp"}

    ,{"You are in open farmland", "HEX Farmland.jpg", "HEX - Farmland"}
    ,{"farmland\\.", "HEX Farmland.jpg", "HEX - Farmland"}

    ,{"You are in the woods", "HEX Woods.jpg", "HEX - Woods"}
    ,{"woods\\.", "HEX Woods.jpg", "HEX - Woods"}

    ,{"You are in fresh water", "HEX Freshwater.jpg", "HEX - Fresh Water"}
    ,{"lake\\.", "HEX Freshwater.jpg", "HEX - Fresh Water"}

    ,{"This is a large expanse of ocean", "HEX Ocean.jpg", "HEX - Ocean"}
    ,{"ocean\\.", "HEX Ocean.jpg", "HEX - Ocean"}

    ,{"You are on the side of a (frigid|rocky) mountain", "HEX Mountains.jpg", "HEX - Mountains"}
    ,{"tall mountains\\.", "HEX Mountains.jpg", "HEX - Mountains"}

    ,{"A barren and blasted plain covered with ash and rubble", "HEX Wasteland.jpg", "HEX - Wasteland"}
    ,{"wasteland\\.", "HEX Wasteland.jpg", "HEX - Wasteland"}

    ,{"You are in a dry desert", "HEX Desert.jpg", "HEX - Desert"}
    ,{"desert\\.", "HEX Desert.jpg", "HEX - Desert"}

    ,{"It is pitch black\\.", "Pitch Black.jpg", "Pitch Black"}
}



-- build regex triggers
-----------------------------------------------------------
local function loadTriggers(args)
    local locationType          = args["detail"]
    local fontSize              = 12
    local locationPath          = ""
    local backgroundStyle       = ""
    local locationNameFormat    = ""
    local locationDisplayLine   = ""


    if (locationType == 'general') then
	    for i,locationName in ipairs(locationListGeneral) do

            locationNameFormat  = locationName[1]
            locationPath        = packageFolder.."MEDIA/LOCATIONS/"..locationName[2]
            backgroundStyle     = "border-image: url(" .. locationPath .. ");"
            fontSize            = scaleFontSize(GUI.containerLocationBox:get_width(), GUI.containerLocationBox:get_height(), 12)
            locationDisplayLine = "<center><div style='width: 100%; background-color: rgba(0, 0, 0, "
            locationDisplayLine = locationDisplayLine..Status.backgroundFade.."); font-size: "..fontSize.."pt;'>"
            locationDisplayLine = locationDisplayLine.."<b>"..locationNameFormat.."</b></div></center>"

    		locationTriggersGeneral[i] =
		    tempRegexTrigger("^(?:> )*("..locationName[1].."$|"..locationName[1]..":[\\s\\S]*)",
			    [[
                    GUI.containerLocationBox:setStyleSheet"]]..backgroundStyle..[["
                    echo("LocationBox", "]]..locationDisplayLine..[[")
			    ]])
	    end
    elseif (locationType == 'hexes') then
        for i,locationName in ipairs(locationListHexes) do

            locationNameFormat  = locationName[3]
            locationPath        = packageFolder.."MEDIA/LOCATIONS/"..locationName[2]
            backgroundStyle     = "border-image: url(" .. locationPath .. ");"
            fontSize            = scaleFontSize(GUI.containerLocationBox:get_width(), GUI.containerLocationBox:get_height(), 12)
            locationDisplayLine = "<center><div style='width: 100%; background-color: rgba(0, 0, 0, "
            locationDisplayLine = locationDisplayLine..Status.backgroundFade.."); font-size: "..fontSize.."pt;'>"
            locationDisplayLine = locationDisplayLine.."<b>"..locationNameFormat.."</b></div></center>"

    		locationTriggersHexes[i] =
		    tempRegexTrigger("^(?:> )*"..locationName[1].."[\\s\\S]*",
			    [[
                    GUI.containerLocationBox:setStyleSheet"]]..backgroundStyle..[["
                    echo("LocationBox", "]]..locationDisplayLine..[[")
			    ]])
	    end
    end

end



-- remove regex triggers
-----------------------------------------------------------
local function killTriggers(args)
    local locationType = args["detail"]

    if (locationType == 'general') then
        for _,v in pairs(locationTriggersGeneral) do
            killTrigger(v)
        end
        locationTriggersGeneral = {}
    elseif (locationType == 'hexes') then
        for _,v in pairs(locationTriggersHexes) do
            killTrigger(v)
        end
        locationTriggersHexes = {}
    end
end



-- load a text file into a location table
-----------------------------------------------------------
local function loadFileToTable(args)
    local lines     = {}
    local columns   = {}
    local linenum   = 1
    local file      = io.open(args, "r")


    systemMessage("Load LOCATIONS file")

    if not file then
        cecho("<red>ERROR: Could not open file: "..args.."\n")
        return
    end

    for line in file:lines() do
        if string.sub(line, 1, 1) ~= "#" then
            columns = {}
            for value in string.gmatch(line, '([^#]+)') do
                table.insert(columns, value)
            end
            lines[linenum]  = columns
            linenum         = linenum + 1
        end
    end

    file:close()
    return lines
end



-- setup/unsetup
-----------------------------------------------------------
local function setup(args)
    locationListGeneral = loadFileToTable(packageFolder.."MEDIA/"..Status.locationFile1) or {}
    loadTriggers({detail = "general"})
    loadTriggers({detail = "hexes"})
end

local function unsetup(args)
    killTriggers({detail = "general"})
    killTriggers({detail = "hexes"})
end

local function resetup(args)
	unsetup(args)
	setup(args)
end

Locations =
{
	setup = setup,
	unsetup = unsetup,
	resetup = resetup
}

return Locations
