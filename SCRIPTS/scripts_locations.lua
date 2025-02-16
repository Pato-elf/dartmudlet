Locations                       = {}
local locationListGeneral       = {}
local locationTriggersGeneral   = {}
local locationTriggersHexes     = {}
local sourceName                = "locations"

local locationListHexes = {
    {"This is a large (open|wet) plain.", "HEX Plains.jpg", "HEX - Plains"}
    ,{"You are in the hills.", "HEX Hills.jpg", "HEX - Hills"}
    ,{"You are in a swamp.", "HEX Swamp.jpg", "HEX - Swamp"}
    ,{"You are in open farmland.", "HEX Farmland.jpg", "HEX - Farmland"}
    ,{"You are in the woods.", "HEX Woods.jpg", "HEX - Woods"}
    ,{"You are in fresh water.", "HEX Freshwater.jpg", "HEX - Fresh Water"}
    ,{"This is a large expanse of ocean.", "HEX Ocean.jpg", "HEX - Ocean"}
    ,{"You are on the side of a rocky mountain.", "HEX Mountains.jpg", "HEX - Mountains"}
    ,{"A barren and blasted plain covered with ash and rubble.", "HEX Wasteland.jpg", "HEX - Wasteland"}
}

--[[
local locationListGeneral = {
    {"OOC Entry Hall", "OOC Entry Hall.jpg"}
    ,{"OOC Area", "OOC Area.jpg"}
    ,{"Gilmore OOC Entrance", "OOC Entrance General.jpg"}
    ,{"Soriktos OOC Entrance", "OOC Entrance General.jpg"}
    ,{"The Chat Room", "The Chat Room.jpg"}
    ,{"Hall of Mortals", "Hall of Mortals.jpg"}
    ,{"Wooded Clearing", "Wooded Clearing.jfif"}
    ,{"South Field", "South Field.jpg"}
    ,{"North Field", "North Field.jpg"}
    ,{"East Field", "East Field.jpg"}
    ,{"West Field", "West Field.jpg"}
    ,{"Farm", "Farm.jpg"}
    ,{"Farmhouse", "Farmhouse.jpg"}
    ,{"Millhouse", "Millhouse.jpg"}
    ,{"Grove", "Grove.jpg"}
    ,{"Smithy", "Smithy.jpg"}
    ,{"Barn", "Barn.jpg"}
    ,{"Kitchen", "Kitchen.jpg"}
    ,{"Library", "Library.jpg"}
    ,{"Bedroom", "Bedroom.jpg"}
    ,{"Landing", "Landing.jpg"}
    ,{"Stable", "Stable.jpg"}
    ,{"Sawmill", "Sawmill.jpg"}
    ,{"Warehouse", "Warehouse.jpg"}
    ,{"Vault", "Vault.jpg"}
    ,{"Destroyed Wagon", "Destroyed Wagon.jpg"}
    ,{"Alcove", "Alcove.jpg"}
    ,{"Post Office", "Post Office.jpg"}
    ,{"Stableyard", "Stableyard.jpg"}
    ,{"Courtyard", "Courtyard.jpg"}
    ,{"Garden", "Garden.jpg"}
    ,{"Pen", "Pen.jpg"}
    ,{"Guild Chantry", "Guild Chantry.jpg"}
    ,{"Guild Office", "Guild Office.jpg"}
    ,{"Refectory", "Refectory.jpg"}
    ,{"Wine Cellar", "Wine Cellar.jpg"}
    ,{"Bindery", "Bindery.jpg"}
    ,{"Glassworks", "Glassworks.jpg"}
    ,{"Dormitory", "Dormitory.jpg"}
    ,{"Entry Hall", "Entry Hall.jpg"}
    ,{"Common Room", "Common Room.jpg"}
    ,{"Anteroom", "Anteroom.jpg"}
    ,{"Nexus", "Nexus.jpg"}
    ,{"Pool", "Pool.jpg"}
    ,{"Closet", "Closet.jpg"}
    ,{"Lobby", "Lobby.jpg"}
    ,{"Underwater", "Underwater.jpg"}
    ,{"Stall", "Stall.jpg"}
    ,{"Guild Road", "Guild Road.jpg"}
    ,{"Gavin Road", "Gavin Road.jpg"}
    ,{"Temple Road", "Temple Road.jpg"}
    ,{"Public Kitchen", "Public Kitchen.jpg"}
    ,{"Gilmore Town Hall", "Gilmore Town Hall.jpg"}
    ,{"Seaside Ruins", "Seaside Ruins.jpg"}
    ,{"Gilmore Bank", "Gilmore Bank.jpg"}
    ,{"Bait shop", "Bait shop.jpg"}
    ,{"The Boardwalk", "The Boardwalk.jpg"}
    ,{"Rocky Beach", "Rocky Beach.jpg"}
    ,{"Gilmore Docks", "Gilmore Docks.jpg"}
    ,{"The Inn at Gilmore Hallway", "The Inn at Gilmore Hallway.jpg"}
    ,{"Gilmore Construction Shop", "Gilmore Construction Shop.jpg"}
    ,{"Ix's Trading Post", "Ixs Trading Post.jpg"}
    ,{"Shaudra\\'s petshop", "Shaudras petshop.jpg"}
    ,{"Charlotte\\'s Kitchen", "Charlottes Kitchen.jpg"}
    ,{"Mountain Garden", "Mountain Garden.jpg"}
    ,{"Beside the Waterfall", "Beside the Waterfall.jpg"}
    ,{"Messenger Pigeon Service", "Messenger Pigeon Service.jpg"}
    ,{"Gerald\\'s General Store", "Geralds General Store.jpg"}
    ,{"Base of the tall mountain", "Base of the tall mountain.jpg"}
    ,{"Intersection of Dragon and Gavin roads", "Intersection of Dragon and Gavin roads.jpg"}
    ,{"Intersection of Dragon and Temple roads", "Intersection of Dragon and Temple roads.jpg"}
    ,{"Northern Portion of the Gilmore Market", "Northern Portion of the Gilmore Market.jpg"}
    ,{"Southern Portion of the Gilmore Market", "Southern Portion of the Gilmore Market.jpg"}
    ,{"Southeast Corner of the Gilmore Market", "Southeast Corner of the Gilmore Market.jpg"}
    ,{"Northeast Corner of the Gilmore Market", "Northeast Corner of the Gilmore Market.jpg"}
    ,{"Northwest Corner of the Gilmore Market", "Northwest Corner of the Gilmore Market.jpg"}
    ,{"Southwest Corner of the Gilmore Market", "Southwest Corner of the Gilmore Market.jpg"}
    ,{"Hamlet Square", "Hamlet Square.jpg"}
    ,{"Whitlow\\'s General Store", "Whitlows General Store.jpg"}
    ,{"Narrow Path", "Narrow Path.jpg"}
    ,{"Stockyard", "Stockyard.jpg"}
    ,{"Balcony", "Balcony.jfif"}
    ,{"Salon", "Salon.jpg"}
    ,{"Pottery", "Pottery.jpg"}
    ,{"The Souk", "The Souk.jpg"}
    ,{"Vestibule", "Vestibule.jpg"}
    ,{"Infirmary", "Infirmary.jpg"}
    ,{"Healer\\'s Hall", "Healers Hall.jpg"}
    ,{"Onyx Street", "Onyx Street.jpg"}
    ,{"Chalcedony Street", "Chalcedony Street.jpg"}
    ,{"Street of the Twisted Camel", "Street of the Twisted Camel.jpg"}
    ,{"Jacinth Street", "Jacinth Street.jpg"}
    ,{"Port Street", "Port Street.jpg"}
    ,{"Wharf Street", "Wharf Street.jpg"}
    ,{"Soriktos Kennel", "Soriktos Kennel.jpg"}
    ,{"Soriktos Dock", "Soriktos Dock.jpg"}
    ,{"Western Foregate", "Western Foregate.jpg"}
    ,{"Pauper\\'s Alleyway", "Paupers Alleyway.jpg"}
    ,{"Rabiye\\'s Curiosities", "Rabiyes Curiosities.jpg"}
    ,{"The Sultan\\'s Locksmith", "The Sultans Locksmith.jpg"}
    ,{"Anjum\\'s Jewels", "Anjums Jewels.jpg"}
    ,{"Marja\\'s Bakery", "Marjas Bakery.jpg"}
    ,{"Demetrios\\' Leathers", "Demetrios Leathers.jpg"}
    ,{"Azzam\\'s Fine Tobaccos", "Azzams Fine Tobaccos.jpg"}
    ,{"Al Ghali Metalworks and Armory", "Al Ghali Metalworks and Armory.jpg"}
    ,{"Kalidah\\'s Pottery Booth", "Kalidahs Pottery Booth.jpg"}
    ,{"Jayr\\'s Books and Stationary", "Jayrs Books and Stationary.jpg"}
    ,{"Fruit vendor\\'s booth", "Fruit vendors booth.jpg"}
    ,{"Meatseller\\'s Booth", "Meatsellers Booth.jpg"}
    ,{"Perfumer\\'s Booth", "Perfumers Booth.jpg"}
    ,{"Inseamus\\' Enchantments", "Inseamus Enchantments.jpg"}
    ,{"Greengrocer\\'s Booth", "Greengrocers Booth.jpg"}
    ,{"Nuri\\'s Fine Glassware and Porcelain", "Nuris Fine Glassware and Porcelain.jpg"}
    ,{"Sulis\\' Stationers and Sorcerous Supplies", "Sulis Stationers and Sorcerous Supplies.jpg"}
    ,{"River Jetty", "River Jetty.jpg"}
    ,{"Scrap Shop", "Scrap Shop.jpg"}
    ,{"Refuse Heap", "Refuse Heap.jpg"}
    ,{"A Vacant Lot", "A Vacant Lot.jpg"}
    ,{"Shipyard", "Shipyard.jpg"}
    ,{"Sandy Beach", "Sandy Beach.jpg"}
    ,{"Shipping Office", "Shipping Office.jpg"}
    ,{"Foreign Exchange Office", "Foreign Exchange Office.jpg"}
    ,{"Storeroom", "Storeroom.jpg"}
    ,{"Concierge Desk", "Concierge Desk.jpg"}
    ,{"Garden Courtyard", "Garden Courtyard.jpg"}
    ,{"The Blue Pearl", "The Blue Pearl.jpg"}
    ,{"Blind Alley", "Blind Alley.jpg"}
    ,{"Forecourt", "Forecourt.jpg"}
    ,{"Chantry", "Chantry.jpg"}
    ,{"Auditorium", "Auditorium.jpg"}
    ,{"Laboratory", "Laboratory.jpg"}
    ,{"Chamber of the Flame", "Chamber of the Flame.jpg"}
    ,{"Classroom", "Classroom.jpg"}
    ,{"Roof", "Roof.jpg"}
    ,{"Blue Pearl Hallway", "Blue Pearl Hallway.jpg"}
    ,{"Room One at The Blue Pearl", "Room at The Blue Pearl.jpg"}
    ,{"Room Two at The Blue Pearl", "Room at The Blue Pearl.jpg"}
    ,{"Room Three at The Blue Pearl", "Room at The Blue Pearl.jpg"}
    ,{"Room Four at The Blue Pearl", "Room at The Blue Pearl.jpg"}
    ,{"Room Five at The Blue Pearl", "Room at The Blue Pearl.jpg"}
    ,{"Room Six at The Blue Pearl", "Room at The Blue Pearl.jpg"}
    ,{"Room Seven at The Blue Pearl", "Room at The Blue Pearl.jpg"}
    ,{"Room Eight at The Blue Pearl", "Room at The Blue Pearl.jpg"}
    ,{"Room Nine at The Blue Pearl", "Room at The Blue Pearl.jpg"}
    ,{"Room Ten at The Blue Pearl", "Room at The Blue Pearl.jpg"}
    ,{"Room Eleven at The Blue Pearl", "Room at The Blue Pearl.jpg"}
    ,{"Room Twelve at The Blue Pearl", "Room at The Blue Pearl.jpg"}
}
]]--


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
		    tempRegexTrigger("^(?:> )*"..locationName[1].."$",
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


    if not file then
        cecho("<red>ERROR: Could not open file: "..args.."\n")
        return
    end

    for line in file:lines() do
        if string.sub(line, 1, 1) ~= "#" then
            columns = {}
            for value in string.gmatch(line, '([^,]+)') do
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
