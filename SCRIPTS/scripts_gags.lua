local Gags              = {}
local petGags           = {}
local creatureGags      = {}
local citizenGags       = {}
local trainerGags       = {}
local sparringGags      = {}
local channelGags       = {}
local promptGags        = {}
local sourceName		= "gags"


local petList = {
	"(\\w+) wanders around sniffing things"
    ,"(\\w+) stares piercingly at"
    ,"(\\w+) whickers softly"
    ,"(\\w+) looks for something to steal"
    ,"(\\w+) chases (her|his) tail"
    ,"(\\w+) snorts softly"
    ,"(\\w+) licks (her|his) (paw|tail)"
    ,"(\\w+) squeaks quietly"
    ,"(\\w+) idly chews some cud"
    ,"(\\w+) nibbles on some grass"
    ,"(\\w+) paws at the ground with a hoof"
    ,"(\\w+) looks for something to eat"
    ,"(\\w+) fluffs up (her|his) feathers"
    ,"(\\w+) pants\\."
    ,"(\\w+) hops around\\."
    ,"(\\w+) wags (her|his) tail"
    ,"(\\w+) squeaks to itself"
    ,"(\\w+) squeaks at"
    ,"(\\w+) (squeaks|rests)\\."
    ,"(\\w+) washes (her|him)self"
    ,"(\\w+) nuzzles"
    ,"(\\w+) springs around the area"
    ,"(\\w+) takes a bath"
    ,"(\\w+) trots about"
    ,"(\\w+) spits\\."
    ,"(\\w+) snorts and tosses"
    ,"(\\w+) sniffs the air"
    ,"(\\w+) stares intently at"
    ,"(\\w+) twitches (her|his) tail"
    ,"(\\w+) sleeps\\."
    ,"(\\w+) brays\\."
    ,"(\\w+) washes (her|his) face"
    ,"(\\w+) grooms (her|his) fur"
    ,"(\\w+) looks about cautiously"
    ,"(\\w+) looks around for some grass"
    ,"(\\w+) curls up with"
    ,"(\\w+) snorts\\."
    ,"(\\w+) rests lazily"
    ,"(\\w+) eyes (\\w+) as if calculating"
    ,"(\\w+) skulks about"
    ,"(\\w+) (pounces|jumps) on"
    ,"(\\w+) rubs up against"
    ,"(\\w+) preens (her|him)self"
    ,"(\\w+) digs\\."
    ,"(\\w+) sniffs around (for|where)"
    ,"(\\w+) brays obnoxiously"
    ,"(\\w+) chirrups"
    ,"(\\w+) snuffles around"
    ,"(\\w+) watches (\\w+)\\."
    ,"(\\w+) eyes (\\w+)\\."
    ,"(\\w+) preens (her|him)self"
    ,"(\\w+) helps (\\w+) dig"
    ,"(\\w+) wrestles with (\\w+)"
    ,"(\\w+) bites (\\w+)\\."
    ,"(\\w+) washes (\\w+)\\."
    ,"(\\w+) stands beside (\\w+)"
    ,"(\\w+) rolls around"
    ,"(\\w+) whistles softly"
    ,"(\\w+) exclaims, \\'hee-haw"

}

local channelList = {
    "None of the power"
    ,"A gossamer strand"
}


local creatureList = {
    "Zebra looks at"
    ,"Zebra watches"
    ,"Zebra looks around"
    ,"Zebra grazes"
    ,"Turtle rests"
    ,"Crab waves its pincers"
    ,"Crab scuttles about"
    ,"Crab scuttles back and"
    ,"Crab scavenges"
    ,"Crab (wiggles|cocks)"
    ,"Crab snaps" --combat?
    ,"Turtle looks around"
    ,"Zebra nibbles"
    ,"Turtle crawls ahead"
    ,"Elephant (flaps|forages|trumpets|tosses)"
    ,"(Cat|Rat) looks at"
    ,"Cat scratches"
    ,"Bat (flits|lets)"
    ,"Ostrich (squawks|pecks|nibbles|cranes|looks|eyes)"
    ,"Camel spits at"
    ,"Wolf watches"
    ,"Horse looks around"
    ,"Crow (exclaims|watches|caws)"
    ,"Turkey (exclaims|pecks)"
    ,"Owl scans"
    ,"Partridge preens"
    ,"Sparrow pecks"

}

local citizenemotes = "blinks|bows|chuckles|flees|frowns|giggles|glares|grins|nods|peers|ponders|screams|shakes|smiles|smirks|stares|whistles|yawns"
local citizenspeaks = "asks|exclaims|says"
local citizenList   = {
    "(\\w+) incants some mystic phrases but"
    ,"Selah barks"
    ,"Lumum (says|nods)"
    ,"Manaine straightens"
    ,"(Lulpox|Torcas) (stares|nudges|grins|chuckles|whispers|points)"

    ,"(Aiko|Alberea|Aluysio|Andrea|Arizzo|Ascelina) ("..citizenemotes..")"
    ,"(Aiko|Alberea|Aluysio|Andrea|Arizzo|Ascelina) ("..citizenspeaks..")"
    ,"(Bucello) ("..citizenemotes..")"
    ,"(Bucello) ("..citizenspeaks..")"
    ,"(Colette) ("..citizenemotes..")"
    ,"(Colette) ("..citizenspeaks..")"
    ,"(Dyonisius) ("..citizenemotes..")"
    ,"(Dyonisius) ("..citizenspeaks..")"
    ,"(Federico|Fiora|Flaminio|Flos) ("..citizenemotes..")"
    ,"(Federico|Fiora|Flaminio|Flos) ("..citizenspeaks..")"
    ,"(Gerolimo|Girout) ("..citizenemotes..")"
    ,"(Gerolimo|Girout) ("..citizenspeaks..")"
    ,"(Hecelina|Helloysis) ("..citizenemotes..")"
    ,"(Hecelina|Helloysis) ("..citizenspeaks..")"
    ,"(Luciana) ("..citizenemotes..")"
    ,"(Luciana) ("..citizenspeaks..")"
    ,"(Mirabae) ("..citizenemotes..")"
    ,"(Mirabae) ("..citizenspeaks..")"
    ,"(Nasih) ("..citizenemotes..")"
    ,"(Nasih) ("..citizenspeaks..")"
    ,"(Pasqualina) ("..citizenemotes..")"
    ,"(Pasqualina) ("..citizenspeaks..")"
    ,"(Rigi|Romano) ("..citizenemotes..")"
    ,"(Rigi|Romano) ("..citizenspeaks..")"
    ,"(Sedilia) ("..citizenemotes..")"
    ,"(Sedilia) ("..citizenspeaks..")"
    ,"(Thadeo|Thalia|Tuscus) ("..citizenemotes..")"
    ,"(Thadeo|Thalia|Tuscus) ("..citizenspeaks..")"

}


local trainerList = {
    "Ambrosius yawns"
    ,"Nazir (scowls|yawns|grunts|slouches)"
    ,"Nazir exclaims"

}


local sparringList = {
    "(\\w+) stamps a hoof"
    ,"(\\w+) lashes out"
    ,"(\\w+) neighs loudly"
    ,"(\\w+) rears back"
    ,"(\\w+) attempts to trample"
    ,"(Aegnor|Aloysius) (listens|peers|hums|leans)"
    ,"Pell (spins|reverses)"
    ,"(\\w+) picks (her|his) nose"
    ,"(\\w+) tosses (her|his) head"
    ,"(\\w+) (spits|sneers|kicks) at"
    ,"(\\w+) snarls"
    ,"(\\w+) grins arrogantly"
    ,"(\\w+) taunts you"
    ,"(\\w+) exclaims, \\'hee-haw"
    ,"(\\w+) says in southern, \\'I\\'m going to enjoy killing"
    ,"Sparrow (swoops|tries)"
}



-- build regex triggers
-----------------------------------------------------------
local function loadTriggers(args)
    local gagset = args["detail"]


    if (gagset == 'gagPets') then
	    for i,v in ipairs(petList) do
    		petGags[i] =
		    tempRegexTrigger("^(?:> )*"..v.."[\\s\\S]*",
			    [[
                    deleteLine()
			    ]])
	    end

    elseif (gagset == 'gagChannels') then
        for i,v in ipairs(channelList) do
            channelGags[i] =
            tempRegexTrigger("^(?:> )*"..v.."[\\s\\S]*",
                [[
                    deleteLine()
                ]])
        end

    elseif (gagset == 'gagCreatures') then
        for i,v in ipairs(creatureList) do
            creatureGags[i] =
            tempRegexTrigger("^(?:> )*"..v.."[\\s\\S]*",
                [[
                    deleteLine()
                ]])
        end

    elseif (gagset == 'gagCitizens') then
        for i,v in ipairs(citizenList) do
            citizenGags[i] =
            tempRegexTrigger("^(?:> )*"..v.."[\\s\\S]*",
                [[
                    deleteLine()
                ]])
        end

    elseif (gagset == 'gagTrainers') then
        for i,v in ipairs(trainerList) do
            trainerGags[i] =
            tempRegexTrigger("^(?:> )*"..v.."[\\s\\S]*",
                [[
                    deleteLine()
                ]])
        end

    elseif (gagset == 'gagSparring') then
        for i,v in ipairs(sparringList) do
            sparringGags[i] =
            tempRegexTrigger("^(?:> )*"..v.."[\\s\\S]*",
                [[
                    deleteLine()
                ]])
        end

    elseif (gagset == 'gagPrompts') then
        promptGags =
        tempRegexTrigger("^(?:> )*$",
            [[
                local detail = matches[1]
                arguments = {detail = detail}
                Events.raiseEvent("emptylineEvent", arguments)
            ]])
    end

end



-- remove regex triggers
-----------------------------------------------------------
local function killTriggers(args)
    local gagset = args["detail"]


    if (gagset == 'gagPets') then
        for i,v in pairs(petGags) do
            killTrigger(v)
        end

    elseif (gagset == 'gagChannels') then
        for i,v in pairs(channelGags) do
            killTrigger(v)
        end

    elseif (gagset == 'gagCreatures') then
        for i,v in pairs(creatureGags) do
            killTrigger(v)
        end

    elseif (gagset == 'gagCitizens') then
        for i,v in pairs(citizenGags) do
            killTrigger(v)
        end

    elseif (gagset == 'gagTrainers') then
        for i,v in pairs(trainerGags) do
            killTrigger(v)
        end

    elseif (gagset == 'gagSparring') then
        for i,v in pairs(sparringGags) do
            killTrigger(v)
        end

    elseif (gagset == 'gagPrompts') then
        killTrigger(promptGags)
    end

end



-- toggle gagPrompts on|off
-----------------------------------------------------------
local function setGagPrompts(args)

    if Status.gagPrompts then
        Status.gagPrompts = false
        dba.execute('UPDATE gags SET gagPrompts = false')
        killTriggers({detail = "gagPrompts"})
        GUI.buttonGags1:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags1", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
        systemMessage("Gag prompts Off")
    else
        Status.gagPrompts = true
        dba.execute('UPDATE gags SET gagPrompts = true')
        loadTriggers({detail = "gagPrompts"})
        GUI.buttonGags1:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags1", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
        systemMessage("Gag prompts On")
    end
end



-- toggle gagPets on|off
-----------------------------------------------------------
local function setGagPets(args)

    if Status.gagPets then
        Status.gagPets = false
        dba.execute('UPDATE gags SET gagPets = false')
        killTriggers({detail = "gagPets"})
        GUI.buttonGags2:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags2", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
        systemMessage("Gag pets Off")
    else
        Status.gagPets = true
        dba.execute('UPDATE gags SET gagPets = true')
        loadTriggers({detail = "gagPets"})
        GUI.buttonGags2:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags2", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
        systemMessage("Gag pets On")
    end
end



-- toggle gagCreatures on|off
-----------------------------------------------------------
local function setGagCreatures(args)

    if Status.gagCreatures then
        Status.gagCreatures = false
        dba.execute('UPDATE gags SET gagCreatures = false')
        killTriggers({detail = "gagCreatures"})
        GUI.buttonGags3:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags3", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
        systemMessage("Gag creatures Off")
    else
        Status.gagCreatures = true
        dba.execute('UPDATE gags SET gagCreatures = true')
        loadTriggers({detail = "gagCreatures"})
        GUI.buttonGags3:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags3", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
        systemMessage("Gag creatures On")
    end
end



-- toggle gagCitizens on|off
-----------------------------------------------------------
local function setGagCitizens(args)

    if Status.gagCitizens then
        Status.gagCitizens = false
        dba.execute('UPDATE gags SET gagCitizens = false')
        killTriggers({detail = "gagCitizens"})
        GUI.buttonGags4:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags4", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
        systemMessage("Gag citizens Off")
    else
        Status.gagCitizens = true
        dba.execute('UPDATE gags SET gagCitizens = true')
        loadTriggers({detail = "gagCitizens"})
        GUI.buttonGags4:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags4", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
        systemMessage("Gag citizens On")
    end
end



-- toggle gagTrainers on|off
-----------------------------------------------------------
local function setGagTrainers(args)

    if Status.gagTrainers then
        Status.gagTrainers = false
        dba.execute('UPDATE gags SET gagTrainers = false')
        killTriggers({detail = "gagTrainers"})
        GUI.buttonGags5:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags5", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
        systemMessage("Gag trainers Off")
    else
        Status.gagTrainers = true
        dba.execute('UPDATE gags SET gagTrainers = true')
        loadTriggers({detail = "gagTrainers"})
        GUI.buttonGags5:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags5", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
        systemMessage("Gag trainers On")
    end
end



-- toggle gagSparring on|off
-----------------------------------------------------------
local function setGagSparring(args)

    if Status.gagSparring then
        Status.gagSparring = false
        dba.execute('UPDATE gags SET gagSparring = false')
        killTriggers({detail = "gagSparring"})
        GUI.buttonGags6:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags6", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
        systemMessage("Gag sparring Off")
    else
        Status.gagSparring = true
        dba.execute('UPDATE gags SET gagSparring = true')
        loadTriggers({detail = "gagSparring"})
        GUI.buttonGags6:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags6", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
        systemMessage("Gag sparring On")
    end
end



-- toggle gagChannels on|off
-----------------------------------------------------------
local function setGagChannels(args)

    if Status.gagChannels then
        Status.gagChannels = false
        dba.execute('UPDATE gags SET gagChannels = false')
        killTriggers({detail = "gagChannels"})
        GUI.buttonGags7:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags7", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
        systemMessage("Gag channels Off")
    else
        Status.gagChannels = true
        dba.execute('UPDATE gags SET gagChannels = true')
        loadTriggers({detail = "gagChannels"})
        GUI.buttonGags7:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags7", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
        systemMessage("Gag channels On")
    end
end



-- toggle antiSpam on|off
-----------------------------------------------------------
local function setAntiSpamButton(args)

    if (Status.statusAntiSpam == 'on') then
        Events.raiseEvent("antiSpamOffEvent")
        GUI.buttonGags8:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags8", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    else
        Events.raiseEvent("antiSpamOnEvent")
        GUI.buttonGags8:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags8", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    end
end



-- update all gag buttons
-----------------------------------------------------------
local function showGagButtons(args)

    if Status.gagPrompts then
        GUI.buttonGags1:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags1", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonGags1:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags1", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

    if Status.gagPets then
        GUI.buttonGags2:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags2", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonGags2:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags2", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

    if Status.gagCreatures then
        GUI.buttonGags3:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags3", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonGags3:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags3", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

    if Status.gagCitizens then
        GUI.buttonGags4:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags4", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonGags4:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags4", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

    if Status.gagTrainers then
        GUI.buttonGags5:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags5", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonGags5:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags5", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

    if Status.gagSparring then
        GUI.buttonGags6:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags6", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonGags6:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags6", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

    if Status.gagChannels then
        GUI.buttonGags7:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags7", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonGags7:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags7", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end

    if (Status.statusAntiSpam == 'on') then
        GUI.buttonGags8:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
        echo("buttonGags8", "<center><span style='font-size: 12pt; color: green;'>&#10004;</span></center>")
    else
        GUI.buttonGags8:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
        echo("buttonGags8", "<center><span style='font-size: 12pt; color: green;'>&nbsp;</span></center>")
    end
end



-- build or update the table during setup
-----------------------------------------------------------
local function checkGagsTable(args)

	dba.execute([[CREATE TABLE IF NOT EXISTS gags (
		id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        gagChannels BOOLEAN DEFAULT false,
        gagCitizens BOOLEAN DEFAULT false,
        gagCreatures BOOLEAN DEFAULT false,
        gagPets BOOLEAN DEFAULT false,
        gagPrompts BOOLEAN DEFAULT true,
        gagSparring BOOLEAN DEFAULT false,
        gagTrainers BOOLEAN DEFAULT false
	);]])

	local results = dba.query('SELECT id FROM gags')
	if results.count() == 0 then
        systemMessage("Create GAGS table")
		dba.execute('INSERT INTO gags DEFAULT VALUES')
	end

end



-- build or update the table during setup
-----------------------------------------------------------
local function load()
	local result = {}


    systemMessage("Load GAGS table")
	result = dba.query('SELECT * FROM gags')[1]
    Status.gagChannels      = (result.gagChannels == 1)
    Status.gagCitizens      = (result.gagCitizens == 1)
    Status.gagCreatures     = (result.gagCreatures == 1)
    Status.gagPets          = (result.gagPets == 1)
    Status.gagPrompts       = (result.gagPrompts == 1)
    Status.gagSparring      = (result.gagSparring == 1)
    Status.gagTrainers      = (result.gagTrainers == 1)

    if Status.gagChannels then loadTriggers({detail = "gagChannels"}) end
    if Status.gagCitizens then loadTriggers({detail = "gagCitizens"}) end
    if Status.gagCreatures then loadTriggers({detail = "gagCreatures"}) end
    if Status.gagPets then loadTriggers({detail = "gagPets"}) end
    if Status.gagPrompts then loadTriggers({detail = "gagPrompts"}) end
    if Status.gagSparring then loadTriggers({detail = "gagSparring"}) end
    if Status.gagTrainers then loadTriggers({detail = "gagTrainers"}) end

end



local function setup(args)
	checkGagsTable()
	Events.addListener("setGagPromptsEvent", sourceName, setGagPrompts)
	Events.addListener("setGagPetsEvent", sourceName, setGagPets)
    Events.addListener("setGagCreaturesEvent", sourceName, setGagCreatures)
    Events.addListener("setGagCitizensEvent", sourceName, setGagCitizens)
    Events.addListener("setGagTrainersEvent", sourceName, setGagTrainers)
    Events.addListener("setGagSparringEvent", sourceName, setGagSparring)
    Events.addListener("setGagChannelsEvent", sourceName, setGagChannels)
    Events.addListener("setAntiSpamButtonEvent", sourceName, setAntiSpamButton)
    Events.addListener("showGagButtonsEvent", sourceName, showGagButtons)
end



local function save()

end



local function unsetup(args)

    if Status.gagChannels then killTriggers({detail = "gagChannels"}) end
    if Status.gagCitizens then killTriggers({detail = "gagCitizens"}) end
    if Status.gagCreatures then killTriggers({detail = "gagCreatures"}) end
    if Status.gagPets then killTriggers({detail = "gagPets"}) end
    if Status.gagPrompts then killTriggers({detail = "gagPrompts"}) end
    if Status.gagSparring then killTriggers({detail = "gagSparring"}) end
    if Status.gagTrainers then killTriggers({detail = "gagTrainers"}) end

    Events.removeListener("setGagPromptsEvent", sourceName)
    Events.removeListener("setGagPetsEvent", sourceName)
    Events.removeListener("setGagCreaturesEvent", sourceName)
    Events.removeListener("setGagCitizensEvent", sourceName)
    Events.removeListener("setGagTrainersEvent", sourceName)
    Events.removeListener("setGagSparringEvent", sourceName)
    Events.removeListener("setGagChannelsEvent", sourceName)
    Events.removeListener("setAntiSpamButtonEvent", sourceName)
    Events.removeListener("showGagButtonsEvent", sourceName)
end



local function resetup(args)
	unsetup(args)
	setup(args)
end



Gags = {
	setup   = setup,
	unsetup = unsetup,
	resetup = resetup,
    load    = load,
    save    = save
}

return Gags